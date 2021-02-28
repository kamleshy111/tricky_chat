<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Mail\OfflineMessage;
use App\Guest;
use App\ChatRequest;
use App\Message;
use App\Blacklist;
use App\OfflineMessage as OfflineMsg;
use Validator;
use App\Utilities\Overrider;

class GuestController extends Controller
{

    public function show_chat_widget(){
		$style = get_option('widget_style','modern');
		return view("widgets/$style/widget-init");	
	}	
	
	public function widget_content(Request $request){
		$style = get_option('widget_style','modern');
		
		$blacklist = Blacklist::all();
		$url = $request->url;
		
		foreach($blacklist as $list){
			if(substr($list->url, -1) == "*"){
				if(startsWith($url,substr_replace($list->url, "", -1))){
					return view('widgets/classic/blacklist');
				}
			}else{
				if($url == $list->url){
					return view('widgets/classic/blacklist');
				}
			}
		}

		return view("widgets/$style/widget");
	}
  
    public function store_guest_user(Request $request)
    {	
	    date_default_timezone_set(get_option('timezone'));
        $name = $request->input('name');
		$email = $request->input('email');
		$mobile = $request->input('mobile') !="" ? $request->input('mobile') : '';
		$department_id = $request->input('department') !="" ? $request->input('department') : 0;
        $requestUrl = $request->input('url');
        $guest_id = store_guest_user($name, $email, $department_id, $mobile, $requestUrl);
		
		//Store Chat Request
		$chat_request = new ChatRequest();
		$chat_request->guest_id = $guest_id;
		$chat_request->operator_id = NULL;
		$chat_request->status = "chat_request";  //chat_request - chat_start - chat_end
		$chat_request->save();
		
		//Send Message
		$message = new Message();
	    $message->chat_request_id = $chat_request->id;
	    $message->message = $name." "._lang('has started chat conversation');
	    $message->status = 0;
	    $message->sender = "guest";
	    $message->receiver = "operator";
	    $message->save();
		
		//Set Session
		$request->session()->put('guest_id', $guest_id);
		$request->session()->put('chat_request_id', $chat_request->id);
		$request->session()->put('guest_name', $name);
        
		return redirect($_SERVER['HTTP_REFERER']);       
   }
   
   public function send_message(Request $request){
	   date_default_timezone_set(get_option('timezone'));
	   $message = new Message();
	   $message->chat_request_id = $request->session()->get('chat_request_id');
	   
	   //If message is an emoji or a link
	   if (strpos($request->message, '<img') !== false || strpos($request->message, '<a') !== false) {   
		   $message->message = strip_tags($request->message,"<a><img><div><br>");
	       //Remove inline Style
		   $message->message = preg_replace('/(<[^>]*) style=("[^"]+"|\'[^\']+\')([^>]*>)/i', '$1$3', $message->message);
	   }else{
		   $url = '@(http)?(s)?(://)?(([a-zA-Z])([-\w]+\.)+([^\s\.]+[^\s]*)+[^,.\s])@';
		   $msg_string = preg_replace($url, '<a href="http$2://$4" target="_blank" title="$0">$0</a>', $request->message);
		   $message->message = strip_tags($msg_string,"<a><img><div><br>");
	       //Remove inline Style
		   $message->message = preg_replace('/(<[^>]*) style=("[^"]+"|\'[^\']+\')([^>]*>)/i', '$1$3', $message->message);
	   }
	   
	   $message->status = 0;
	   $message->sender = "guest";
	   $message->receiver = "operator";
	   $message->save();
	   echo json_encode(array('result'=>'send','message'=>$message->message));
   }
   
    public function get_messages(Request $request,$last_id=0){
      \DB::beginTransaction();
	   $messages = Message::where("chat_request_id",$request->session()->get('chat_request_id'))
	                       ->where("id",">",$last_id)->get();
	
       $operator = \App\ChatRequest::join("users","chat_requests.operator_id","users.id")
	                               ->select("users.name")
                                   ->where("chat_requests.id",$request->session()->get('chat_request_id'))->first();	   
						   
	   echo json_encode(array("messages"=>$messages,"operator"=>$operator));
	   \DB::commit();
	}
	

	public function update_user_activity(Request $request){
		date_default_timezone_set(get_option('timezone'));

		if( $request->session()->get('guest_id') !="" ){	    		
			$guest_id = $request->session()->get('guest_id');
		    //$guest_name = $request->session()->get('guest_name');

			$chat_request = ChatRequest::find($request->session()->get('chat_request_id'));
			
			if($chat_request->status == "chat_end"){
				$request->session()->forget('guest_id');
				$request->session()->forget('chat_request_id');
				$request->session()->forget('guest_name');
				echo json_encode(array("status"=>"chat_end"));
			}else{	
				$chat_request->guest_is_typing = $request->typing;
				$chat_request->save();
				
				$guest = Guest::find($guest_id);
				$guest->last_activity = date("Y-m-d H:i:s");
				$guest->save();

				echo json_encode(array("status"=>"activity_updated","chat_request"=>$chat_request));
			}
		}
	}
	
	public function end_chat(Request $request){
	   date_default_timezone_set(get_option('timezone'));
	   $chat_request_id = $request->session()->get('chat_request_id');
	   $guest_name = $request->session()->get('guest_name');
	   
	   ChatRequest::where('id',$chat_request_id)->update(['status' => 'chat_end']);
	   $message = new Message();
	   $message->chat_request_id = $chat_request_id;
	   $message->message = "<span class='chat_ended'><i class='fa fa-sign-out'></i> ".$guest_name." "._lang('has ended chat session.')."</span>";
	   $message->status = 0;
	   $message->sender = "guest";
	   $message->receiver = "operator";
	   $message->save();
		
	   $request->session()->forget('guest_id');
	   $request->session()->forget('guest_name');
	   $request->session()->forget('chat_request_id');
	   echo $message->message;
	}
	
	public function upload_file(Request $request){
		$max_size = get_option('max_upload_size')*1024;
		$supported_file_types = get_option('file_type_supported');
		
		$validator = Validator::make($request->all(), [
			'file' => "required|max:$max_size|mimes:$supported_file_types",
		]);
		
		if ($validator->fails()) {
			return response()->json(['result'=>'error','message'=>$validator->errors()->all()]);				
		}
		
		$file = $request->file('file');
		$file_name = "Attachment_".time().'.'.$file->getClientOriginalExtension();
		$file->move(base_path('public/uploads/chat_files/'),$file_name);
		
		$msg_text = "<a target='_blank' href='".asset("public/uploads/chat_files/$file_name")."'>$file_name</a>";
		
		date_default_timezone_set(get_option('timezone'));
		$message = new Message();
	    $message->chat_request_id = $request->session()->get('chat_request_id');
	    $message->message = $msg_text;
	    $message->status = 0;
	    $message->sender = "guest";
	    $message->receiver = "operator";
	    $message->save();
		
		return response()->json(['result'=>'success','file'=>$file_name,'file_path'=>asset("public/uploads/chat_files/$file_name"),'message'=>'Uploaded Sucessfully']);
	    
	}
	
	
	public function send_offline_message(Request $request){
	    date_default_timezone_set(get_option('timezone'));
		@ini_set('max_execution_time', 0);
		@set_time_limit(0);
		Overrider::load("Settings");
		
		//Send Email
		$name = $request->input("name");
		$email = $request->input("email");
		$mobile = $request->input("mobile")!="" ? $request->input("mobile") : 'N/A';
		$subject = get_option('company_name')." Offline Message";
		$message = $request->input("message");
		
		//Save to database first
		$validator = Validator::make($request->all(), [
			'name' => 'required',
			'email' => 'required',
			'message' => 'required'
		]);
		
		if ($validator->fails()) {
			if($request->ajax()){ 
			    return response()->json(['result'=>'error','message'=>$validator->errors()->all()]);
			}else{
				return redirect()->back()
				            ->withErrors($validator)
							->withInput();
			}			
		}

        $offlinemessage= new OfflineMsg();
	    $offlinemessage->name = $request->input('name');
		$offlinemessage->email = $request->input('email');
		$offlinemessage->mobile = $request->input('mobile');
		$offlinemessage->message = $request->input('message');
	
        $offlinemessage->save();
		
		
		$mail  = new \stdClass();
		$mail->name = $name;
		$mail->email = $email;
		$mail->mobile = $mobile;
		$mail->subject = $subject;
		$mail->message = $message;
		//Mail::to(get_option('email'))->send(new OfflineMessage($mail));   
        
		return redirect()->back()->with('success', _lang('Your Message Send Sucessfully'));	
	}

	/*
	* get the status base on operator id and department id
	*/

	public function get_operator_status(Request $request, $operator_id=0, $department_id=0, $guest_name="", $guest_email="")
	{
		$userId = $operator_id;
		$department = $department_id;
		$guest_activity_check = $request->session()->get('guest_activity_check');

		//update guest/user activity
		if (!empty($guest_name) && !empty($guest_email) && (empty($guest_activity_check) || $guest_activity_check != $guest_name)) {
			store_guest_user($guest_name, $guest_email, $department_id);
		}
		
		$result = get_operator_status($userId, $department);

		return response()->json(['result'=>'success', 'data'=>$result]);

	}
	
}
