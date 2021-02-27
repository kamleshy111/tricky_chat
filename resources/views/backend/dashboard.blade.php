@extends('layouts.app')

@section('content')
<div class="row">
	<!-- widget box -->
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-4">
                <div class="card pull-up" style="height: 150px; width: 100%;margin: 15px;">
                     <div class="card-content">
                        <div class="card-content">
                           <div class="card-body">
                              <div class="media d-flex">
                                 <div class="media-body text-left">
                                    <h3 class="warning">{{ $total_visiter }}</h3>
                                    <h6>Total Visitor</h6>
                                 </div>
                                 <div>
                                    <i class="icon-user-follow warning font-large-2 float-right"></i>
                                 </div>
                              </div>
                              <div class="progress progress-sm mt-1 mb-0 box-shadow-2">
                                 <div class="progress-bar bg-gradient-x-warning" role="progressbar" style="width: 65%" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
            </div>
            <div class="col-md-3">
            	<div class="card pull-up" style="height: 150px; width: 100%;margin: 15px;">
                     <div class="card-content">
                        <div class="card-content">
                           <div class="card-body">
                              <div class="media d-flex">
                                 <div class="media-body text-left">
                                    <h3 class="success">{{ $total_online_visiter }}</h3>
                                    <h6>Online Visitors</h6>
                                 </div>
                                 <div>
                                    <i class="icon-product-hunt font-large-2 float-right"></i>
                                 </div>
                              </div>
                              <div class="progress progress-sm mt-1 mb-0 box-shadow-2">
                                 <div class="progress-bar bg-gradient-x-success" role="progressbar" style="width: 65%" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
            </div>
            <div class="col-md-4">
               <div class="card pull-up" style="height: 150px; width: 100%; margin: 15px;">
                     <div class="card-content">
                        <div class="card-content">
                           <div class="card-body">
                              <div class="media d-flex">
                                 <div class="media-body text-left">
                                    <h3 class="success">{{ $total_leads }}</h3>
                                    <h6>Leads</h6>
                                 </div>
                                 <div>
                                    <i class="icon-user-follow success font-large-2 float-right"></i>
                                 </div>
                              </div>
                              <div class="progress progress-sm mt-1 mb-0 box-shadow-2">
                                 <div class="progress-bar bg-gradient-x-success" role="progressbar" style="width: 65%" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
            </div>
        </div>
            
	</div>	

  <!--Online User List-->
  <div class="col-md-4">
	  <!-- Panel 1 -->
	  <div class="col-md-12">
	     <ul class="nav nav-tabs">
		  <li class="active"><a data-toggle="pill" href="#online_users">{{ _lang('Online Visitors') }}</a></li>
		  <li><a data-toggle="pill" href="#transfer_users">{{ _lang('Transfer Chat Users') }} <span id="transfer-request">0</span></a></li>
		</ul>
		
		<div class="tab-content">
			<div id="online_users" class="tab-pane fade in active"> 
				<div class="panel panel-default dashboard-panel">
					<div class="panel-body">
					   <ul class="online_user_list" id="online_user">

					   </ul>
					</div>
				</div>
			</div> 
			
			<div id="transfer_users" class="tab-pane fade"> 
				<div class="panel panel-default dashboard-panel">
					<div class="panel-body">
					   <ul class="online_user_list" id="transfer_user_list">

					   </ul>
					</div>
				</div>
			</div>
		</div><!--End Tab Content--> 
	  </div>
	  <!-- End Panel 1 -->
	  <!-- Panel 2 -->
	  <div class="col-md-12">
		 <div class="panel panel-primary dashboard-panel">
			<div class="panel-heading">{{ _lang('Online Operator') }}</div>
			<div class="panel-border-bottom"></div>
			<div class="panel-body">
			   <ul class="online_user_list" id="online_operator">

			   </ul>
			</div>
		 </div>
	  </div>
	  <!-- End Panel 2 -->
  </div>
  
  <!--Chat Window-->
  <div class="col-md-8">
     <div class="panel panel-default">
		<div class="panel-body default-border">
		   <!--new_message_head-->
		   <div class="chat">
		      <div class="chat-header clearfix">
				<img src="{{ asset('public/uploads/profile/male_guest.png') }}" alt="avatar">
				
				<div class="chat-about">
				  <div class="chat-with">{{ _lang('Chat with') }} <span id="guest_name">{{ _lang('N/A') }}</span></div>
				  <div class="chat-num-messages">{{ _lang('Guest URL') }}: <a href="" id="guest_url">{{ _lang('N/A') }}</a></div>
				</div>
				
				<div class="dropdown pull-right" id="chat_action" style="display:none;">
				  <button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-toggle="dropdown">{{ _lang('Chat Action') }}
				  <span class="caret"></span></button>
				  <ul class="dropdown-menu">
					<li><a class="ajax-modal" data-title="{{ _lang('Transfer Chat') }}" href="{{ url('chat/transfer_window') }}">{{ _lang('Transfer Chat') }}</a></li>
					<li><a href="#" class="end_chat_session">{{ _lang('End Chat') }}</a></li>
				  </ul>
				</div>
				
			  </div>
			  <div class="chat_area">
				    <ul class="chat-history">
					</ul>
					<p class="typing-status" style="display:none"><b>{{ _lang('typing') }} ...</b></p>
				</div>
		   </div>
		   <!--chat_area-->
		   <div class="message_write">
			  <div class="chat-input-box" contentEditable="true"></div>
			  <div class="clearfix"></div>
			  <div class="emboji-container">
			   {!! load_emboji() !!}
			  </div>
			  <div class="chat_buttons">
			     <a href="#" class="btn-send pull-left btn btn-success btn-sm">{{ _lang('Send') }}</a>
			     <a href="#" class="btn-emboji pull-right btn btn-primary btn-sm">{{ _lang('Emoji') }}</a>
				 <input type="hidden" name="chat_request_id" id="chat_request_id">
				 <input type="hidden" name="guest_id" id="guest_id">
				 <input type="hidden" name="l_id" id="l_id">
				 @if(get_option("file_sharing") == "yes")
					<input type="file" name="file" id="file" style="display:none">
					<a href="#" class="btn-fileupload pull-right btn btn-info btn-sm"><i class="fa fa-cloud-upload" aria-hidden="true"></i> {{ _lang('Add File') }}</a>
				 @endif
			  </div>
			   <!--Canned Message-->
				<div class="dropup canned_message">
				  <button class="btn btn-primary btn-sm"><i class="fa fa-envelope-o"></i> {{ _lang('Canned Messages') }}</button>
				  <div class="dropup-content">
					@foreach (get_table('canned_messages') as $msg)
					<a href="#" data-message="{{ $msg->message }}"><i class="fa fa-angle-double-right"></i> {{ $msg->name }}</a>
					@endforeach
				  </div>
				</div>
			   <!--End Canned Message-->
		   </div>
		</div>
	 </div>
  </div>
  <!-- Panel 2 -->
  <div class="col-md-12">
	 <div class="panel panel-primary dashboard-panel">
		<div class="panel-heading">{{ _lang('Total Visitors') }}</div>
		<div class="panel-border-bottom"></div>
		<div class="panel-body">
		<table class="table table-bordered">
			<thead>
			<tr>
				<th>{{ _lang('Name') }}</th>
				<th>{{ _lang('Email') }}</th>
				<th>{{ _lang('Last Activity') }}</th>
			</tr>
			</thead>
			<tbody>
			 @foreach($total_visiter_list as $user)
			    <tr id="row_{{ $user->id }}">
					<td class='name'>{{ $user->name }}</td>
					<td class='email'>{{ $user->email }}</td>
					<td class='last_activity'> {{ date('d-m-Y H:s:i', strtotime($user->last_activity)) }}</td>
				</tr>
			@endforeach		
			</tbody>
			</table>
		   <ul class="online_user_list" id="online_operator">

		   </ul>
		</div>
	 </div>
  </div>
  <!-- End Panel 2 -->	
</div>

@endsection
<div id="popover" class="pop-over"></div>
<audio id="chatSound">
  <source src="{{ asset('public/sounds/'.get_option('message_sound')) }}" type="audio/mpeg">
</audio>

@section('js-script')
<script>
$(window).load(function() {
   $(".chat_area").stop().animate({ scrollTop: $(".chat_area")[0].scrollHeight}, 500);
});
</script>
@endsection
