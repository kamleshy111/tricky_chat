@extends('layouts.iframe')

@section('content')
<div class="row">
	<!-- widget box -->
	<div class="col-md-12">
		<iframe src="https://wowmeet.wowfairs.com/app/panel/meetings/" width="100%" style="min-height: 475px;"></iframe>
	</div>
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
