<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\CannedMessage;
use Validator;
use Illuminate\Validation\Rule;

class CannedMessageController extends Controller
{
	
	public function __construct()
    {
        $this->middleware('admin');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cannedmessages = CannedMessage::all()->sortByDesc("id");
        return view('backend.canned_message.list',compact('cannedmessages'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
		if( ! $request->ajax()){
		   return view('backend.canned_message.create');
		}else{
           return view('backend.canned_message.modal.create');
		}
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {	
		$validator = Validator::make($request->all(), [
			'name' => 'required|max:191',
			'message' => 'required'
		]);
		
		if ($validator->fails()) {
			if($request->ajax()){ 
			    return response()->json(['result'=>'error','message'=>$validator->errors()->all()]);
			}else{
				return redirect('canned_messages/create')
							->withErrors($validator)
							->withInput();
			}			
		}
			
	    
		
        $cannedmessage= new CannedMessage();
	    $cannedmessage->name = $request->input('name');
		$cannedmessage->message = $request->input('message');
	
        $cannedmessage->save();
        
		if(! $request->ajax()){
           return redirect('canned_messages/create')->with('success', _lang('Information has been added sucessfully'));
        }else{
		   return response()->json(['result'=>'success','action'=>'store','message'=>_lang('Information has been added sucessfully'),'data'=>$cannedmessage]);
		}
        
   }
	

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request,$id)
    {
        $cannedmessage = CannedMessage::find($id);
		if(! $request->ajax()){
		    return view('backend.canned_message.view',compact('cannedmessage','id'));
		}else{
			return view('backend.canned_message.modal.view',compact('cannedmessage','id'));
		} 
        
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request,$id)
    {
        $cannedmessage = CannedMessage::find($id);
		if(! $request->ajax()){
		   return view('backend.canned_message.edit',compact('cannedmessage','id'));
		}else{
           return view('backend.canned_message.modal.edit',compact('cannedmessage','id'));
		}  
        
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
		$validator = Validator::make($request->all(), [
			'name' => 'required|max:191',
			'message' => 'required'
		]);
		
		if ($validator->fails()) {
			if($request->ajax()){ 
			    return response()->json(['result'=>'error','message'=>$validator->errors()->all()]);
			}else{
				return redirect()->route('canned_messages.edit', $id)
							->withErrors($validator)
							->withInput();
			}			
		}
	
        	
		
        $cannedmessage = CannedMessage::find($id);
		$cannedmessage->name = $request->input('name');
		$cannedmessage->message = $request->input('message');
	
        $cannedmessage->save();
		
		if(! $request->ajax()){
           return redirect('canned_messages')->with('success', _lang('Information has been updated sucessfully'));
        }else{
		   return response()->json(['result'=>'success','action'=>'update', 'message'=>_lang('Information has been updated sucessfully'),'data'=>$cannedmessage]);
		}
	    
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $cannedmessage = CannedMessage::find($id);
        $cannedmessage->delete();
        return redirect('canned_messages')->with('success',_lang('Information has been deleted sucessfully'));
    }
}
