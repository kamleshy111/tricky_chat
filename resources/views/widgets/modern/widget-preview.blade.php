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
   </head>
   <body>
	
	<script src="{{ asset('public/js/jquery.min.js') }}"></script>
	<script src="{{ asset('public/js/bootstrap.min.js') }}"></script>
	<script src="{{ url('chat_widget.js') }}"></script>

</body>
</html>