<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      
	  @if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') 
	     <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests" />
	  @endif

	  <!-- CSRF Token -->
      <meta name="csrf-token" content="{{ csrf_token() }}">

      <!-- Fonts -->
      <link href='https://fonts.googleapis.com/css?family=Raleway:400,300,700' rel='stylesheet' type='text/css'>
      <!-- Bootstrap -->
      <link href="{{ asset('public/css/bootstrap.css') }}" rel="stylesheet">
      <!-- Include roboto.css to use the Roboto web font, material.css to include the theme and ripples.css to style the ripple effect -->
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"> 
      <link href="{{ asset('public/css/style.css') }}" rel="stylesheet">
      <link href="{{ asset('public/css/widget.css?v='.time()) }}" rel="stylesheet">

	<script type="text/javascript">
	  var _url = "{{ asset('/') }}";
	  var u_s = "{{ get_option('max_upload_size') }}";
	</script>
	
	<style type="text/css">
	    .panel-default>.panel-heading,.btn-success{
		   background-color: {{ get_option('secondary_color','#263238') }} !important;
		   color: {{ get_option('label_color','#FFFFFF') }};
	    }
		.btn-emboji, .btn-fileupload{
			color: {{ get_option('secondary_color','#263238') }} !important; 
		}
	    .btn-primary{
		   background-color: {{ get_option('primary_color','#007bff') }} !important;
		   color: {{ get_option('label_color','#FFFFFF') }};
	       border: none;
		   border-radius:0px;
	    }
	    .chat-expand{
			color: {{ get_option('label_color','#FFFFFF') }};
		}
		.panel{
			border: 1px solid {{ get_option('secondary_color','#263238') }};
		}
		.modern-widget .chat-input-box:empty:before {
			content: '{{ _lang('Compose your message') }}';
			display: block; /* For Firefox */
			color: {{ get_option('secondary_color','#263238') }};
		}
		.offline-bnt {
		    position: absolute;
		    top: -5px;
		    right: -5px;
		    width: 16px;
		    height: 16px;
		    background: url("http://localhost/tricky_chat/public/images/offline.png") no-repeat;
		}
		.online-bnt {
		    position: absolute;
		    top: -5px;
		    right: -5px;
		    width: 16px;
		    height: 16px;
		    background: url("http://localhost/tricky_chat/public/images/online.png") no-repeat;
		}
				@if(\Session::get("guest_id") != '')
			.modern-widget{
				display: block;
			}
			#chat-icon{
				display: none;
			}
		@endif
		@if(get_option('widget_direction') == "left")
			#chat-icon{
				left: 15px;
			}
		@endif	
	</style>
   </head>
   <body>
    <!--Widget Icon-->
	<div id="chat-icon" >
		<img src="http://localhost/tricky_chat/public/images/chaticon.png">
	</div>
    <!--Start Widget-->
	<div class="panel panel-default tricky_chat_widget modern-widget">
		<div class="panel-heading">
			<span id="operator_status" class="offline-bnt"></span>
		    <i class="far fa-comment"></i>&nbsp; {!! get_option('heading_text',_lang('Live Chat')) !!}
		    <a href="#" class="pull-right chat-expand"><i class="far fa-times-circle"></i></a>
			
			<div class="dropdown pull-right">
			  <button class="widget-chat-settings dropdown-toggle" type="button" data-toggle="dropdown"><i class="fas fa-cog"></i></button>
			  <ul class="dropdown-menu widget-menu">
				<!--<li><a href="#" id="chat_fullscreen"><i class="fas fa-expand"></i>&nbsp;&nbsp;{{ _lang('Toggle Full Screen') }}</a></li>-->
				<li><a href="#" id="chat_mute_sound"><i class="far fa-bell-slash"></i>&nbsp;&nbsp;{{ _lang('Mute Sound') }}</a></li>
				<li><a href="#" id="chat_end"><i class="fas fa-sign-out-alt"></i>&nbsp;&nbsp;{{ _lang('End Chat') }}</a></li>
			  </ul>
			</div>
		</div>
		<div class="panel-body">
		   @if(\Session::get("guest_id") == '')
			   
		    <!--if Offline mode is enabled -->
		    @if(get_option('offline_mode','no') == 'yes')
			   <div id="widget-offline-area">
				  <div class="col-md-12">
				    <div class="alert alert-danger text-center">
					   <p>{{ get_option('offline_text') }}</p>
					</div>
					@if (\Session::has('success'))
					  <div class="alert alert-success text-center">
				        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<p>{{ \Session::get('success') }}</p>
					  </div>
					@endif
					
					 @if ($errors->any())
						 <div class="alert alert-danger">
							 <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
							 @foreach ($errors->all() as $error)
								 <p>{{$error}}</p>
							 @endforeach
						 </div>
					 @endif
					
					
					<form id="send_offline_message" method="POST" action="{{ url('guest/send_offline_message') }}" autocomplete="off" novalidate>
					  {{ csrf_field() }}
					  <div class="form-group">
						<label for="name">{{ _lang('Name') }}</label>
						<input type="text" name="name" class="form-control" id="name" required>
					  </div>
					  <input type="hidden" name="url" value="{{ $_GET['url'] }}">
					  
					  @if(get_option('mobile_field') == 'yes')
						  <div class="form-group">
							<label for="email">{{ _lang('Mobile') }}</label>
							<input type="text" name="mobile" class="form-control" id="mobile" required>
						  </div>
					  @endif
					  
					  <div class="form-group">
						<label for="email">{{ _lang('Email') }}</label>
						<input type="email" name="email" class="form-control" id="email" required>
					  </div>
					  
					  <div class="form-group">
						<label for="email">{{ _lang('Message') }}</label>
						<textarea name="message" class="form-control" id="message" required></textarea>
					  </div>
					  
					  <button type="submit" class="btn btn-success btn-start-chat btn-block">{{ _lang('Send Message') }}</button>
					</form>
				  </div>
			   </div>
		    
			@else
				<div id="chat-login-area">
				  <div class="col-md-12">
					<form id="guest-login-form" method="POST" action="{{ url('guest/store_guest_user') }}" autocomplete="off" novalidate>
					  {{ csrf_field() }}
					  @if(get_option('allow_department') == "yes")
						  <div class="form-group">
							<label for="name">{{ _lang('Department') }}</label>
							<select class="form-control select2" name="department" id="department" required>
							   <option value="">{{ _lang('- Select -') }}</option>
							   {{ create_option('departments','id','department') }}
							</select>
						  </div>
					  @endif
					  <div class="form-group">
						<label for="name">{{ _lang('Name') }}</label>
						<input type="text" name="name" class="form-control" id="name" required>
					  </div>
					  <input type="hidden" name="url" value="{{ $_GET['url'] }}">
					  
					  @if(get_option('mobile_field') == 'yes')
						  <div class="form-group">
							<label for="email">{{ _lang('Mobile') }}</label>
							<input type="text" name="mobile" class="form-control" id="mobile" required>
						  </div>
					  @endif
					  
					  <div class="form-group">
						<label for="email">{{ _lang('Email') }}</label>
						<input type="email" name="email" class="form-control" id="email" required>
					  </div>
					  <button type="submit" class="btn btn-success btn-start-chat btn-block">{{ _lang('Start Chat') }}</button>
					</form>
				  </div>
			   </div>
			@endif
		   
			   
		   @else
			   <div id="tricky-chat-box">
				   <!--new_message_head-->
				   <div class="chat">
					  <div class="chat_area">
						  <ul class="chat-history">
  
						  </ul>
						  <p class="typing-status" style="display:none"><b>{{ _lang('typing') }} ...</b></p>
						</div>
				   </div>
				   <!--chat_area-->
				   <div class="message_write">
					  <div class="chat-input-box" contentEditable="true"></div>
					  <div class="chat_buttons">
						 <input type="hidden" name="l_id" id="l_id">
						 <input type="hidden" name="name" id="name" value="{{ \Session::get('guest_name') }}">
						 
						 @if(get_option("file_sharing") == "yes")
							<input type="file" name="file" id="file" style="display:none">
							<a href="#" class="btn-fileupload pull-right upload_btn"><i class="fas fa-folder-plus"></i></a>
					     @endif
						 <a href="#" class="btn-emboji pull-right"><i class="far fa-laugh-beam"></i></a>
					  </div>
					  
					  <div class="clearfix"></div>
					  <div class="emboji-container">
						{!! load_emboji() !!}
					  </div>
				   </div>
			   </div>
		   @endif
		   <p class="text-center powered-by">{{ get_option('powered_by','Powered By TrickyCode') }}</p>
		</div>
	 </div>
	 <!--End Widget-->


<script src="{{ asset('public/js/jquery.min.js') }}"></script>
<script src="{{ asset('public/js/bootstrap.min.js') }}"></script>
<script src="{{ asset('public/js/moment.min.js') }}"></script>
<script src="{{ asset('public/js/toastr.js') }}"></script>
<script src="{{ asset('public/js/widget-modern.js?v='.time()) }}"></script>
<script type="text/javascript">	
	updateMessage();
	
	setInterval(function(){ 
		updateUserActivity('{{ csrf_token() }}');
	}, {{ get_option('user_tracking_refresh_rate') }}000);
	
	setInterval(function(){ 
		updateMessage();
	}, {{ get_option('chatting_refresh_rate') }}000);
	
	function playSound(){
		if(localStorage.getItem("mute") !="yes"){
			var file = $(this).find(':selected').data("audio");
			var audio = document.createElement('audio');
			  audio.style.display = "none";
			  audio.src = "{{ asset('public/sounds/'.get_option('message_sound')) }}"
			  audio.autoplay = true;
			  audio.onended = function(){
			  audio.remove();
			};
			document.body.appendChild(audio);
		}
	}
</script>

</body>
</html>