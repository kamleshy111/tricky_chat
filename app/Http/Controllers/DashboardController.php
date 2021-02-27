<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Guest;
use App\ChatRequest;
use App\User;

class DashboardController extends Controller
{

    public function __construct()
    {
        $this->middleware('admin')->except('index');
    }
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $total_visiter = ChatRequest::join("guests","guests.id","chat_requests.guest_id")
                                       ->leftJoin("users","users.id","chat_requests.operator_id")->get()->count();
         $total_visiter_list = ChatRequest::join("guests","guests.id","chat_requests.guest_id")->select("guests.*")
                                       ->leftJoin("users","users.id","chat_requests.operator_id")->get();
                                        
        $total_online_visiter = online_guest_count();
        $total_leads = ChatRequest::join("guests","guests.id","chat_requests.guest_id")
                                       ->leftJoin("users","users.id","chat_requests.operator_id")->get()->count();                                                              
        return view('backend/dashboard', compact('total_visiter', 'total_online_visiter', 'total_leads', 'total_visiter_list'));
    }

    public function meeting()
    {
         return view('backend/meeting');
    }
	
	public function widget_preview()
    {
        $style = get_option('widget_style','modern');
		return view("widgets/$style/widget-preview");	
    }
	
	public function widget_code()
    {
       return '<pre><textarea class="form-control" style="resize: none; text-align:center;" readOnly="true"><script src="'.url('chat_widget.js').'"></script></textarea></pre>';
    }
	
}
