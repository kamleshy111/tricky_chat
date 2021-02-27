<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Blacklist;
use Validator;
use Illuminate\Validation\Rule;

class BlacklistController extends Controller
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
        $blacklists = Blacklist::all()->sortByDesc("id");
        return view('backend.blacklist.list',compact('blacklists'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
		if( ! $request->ajax()){
		   return view('backend.blacklist.create');
		}else{
           return view('backend.blacklist.modal.create');
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
			'domain_name' => 'required|max:191',
		'url' => 'required'
		]);
		
		if ($validator->fails()) {
			if($request->ajax()){ 
			    return response()->json(['result'=>'error','message'=>$validator->errors()->all()]);
			}else{
				return redirect('blacklists/create')
							->withErrors($validator)
							->withInput();
			}			
		}
			
	    
		
        $blacklist= new Blacklist();
	    $blacklist->domain_name = $request->input('domain_name');
	$blacklist->url = $request->input('url');
	
        $blacklist->save();
        
		if(! $request->ajax()){
           return redirect('blacklists/create')->with('success', _lang('Information has been added sucessfully'));
        }else{
		   return response()->json(['result'=>'success','action'=>'store','message'=>_lang('Information has been added sucessfully'),'data'=>$blacklist]);
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
        $blacklist = Blacklist::find($id);
		if(! $request->ajax()){
		    return view('backend.blacklist.view',compact('blacklist','id'));
		}else{
			return view('backend.blacklist.modal.view',compact('blacklist','id'));
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
        $blacklist = Blacklist::find($id);
		if(! $request->ajax()){
		   return view('backend.blacklist.edit',compact('blacklist','id'));
		}else{
           return view('backend.blacklist.modal.edit',compact('blacklist','id'));
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
			'domain_name' => 'required|max:191',
		'url' => 'required'
		]);
		
		if ($validator->fails()) {
			if($request->ajax()){ 
			    return response()->json(['result'=>'error','message'=>$validator->errors()->all()]);
			}else{
				return redirect()->route('blacklists.edit', $id)
							->withErrors($validator)
							->withInput();
			}			
		}
	
        	
		
        $blacklist = Blacklist::find($id);
		$blacklist->domain_name = $request->input('domain_name');
	$blacklist->url = $request->input('url');
	
        $blacklist->save();
		
		if(! $request->ajax()){
           return redirect('blacklists')->with('success', _lang('Information has been updated sucessfully'));
        }else{
		   return response()->json(['result'=>'success','action'=>'update', 'message'=>_lang('Information has been updated sucessfully'),'data'=>$blacklist]);
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
        $blacklist = Blacklist::find($id);
        $blacklist->delete();
        return redirect('blacklists')->with('success',_lang('Information has been deleted sucessfully'));
    }
}
