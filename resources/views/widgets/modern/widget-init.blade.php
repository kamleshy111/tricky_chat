jQuery( document ).ready(function( $ ) {
	url = parent.document.URL;
    var iframe = document.createElement('iframe');
	iframe.setAttribute('id', 'customer-chatbox');
	iframe.setAttribute("src", "{{ url('widget_content') }}?url="+url);
    iframe.style.width        = "370px";
    iframe.style.height       = "500px";  //Orginal Size 500
	iframe.style.position     = 'fixed';
	iframe.style.overflow     = 'hidden';
    iframe.style.zIndex       = 999999;
	
	@if(get_option('widget_direction') == "left")
		iframe.style.left     = 0;
		iframe.style.marginLeft  = '5px';
	@else
		iframe.style.right    = 0;
		iframe.style.marginRight  = '5px';
	@endif
	
	//iframe.style.marginBottom  = '-374px';
	iframe.style.bottom       = 0;
	iframe.border             = 0;
    iframe.marginwidth        = 0;
    iframe.marginWidth        = 0;
    iframe.marginheight       = 0;
    iframe.marginHeight       = 0;
    iframe.frameBorder        = 0;

    document.body.appendChild(iframe);

	var responsive_width = "{{ get_option('mobile_version_breakpoint',768) }}";

	
	$(window).on('load resize', function(e) {
		if($(window).width() <= responsive_width){
			var x = document.getElementById("customer-chatbox");
			$(x).css("width","100%");
			$(x).css("height","100%");
			$(x).css("margin-right","0px");
			x.contentWindow.postMessage('responsive', '*');
		}else{
			var x = document.getElementById("customer-chatbox");
			$(x).css("width","370px");
			$(x).css("margin-right","5px");
			$(x).css("height","500px");
			x.contentWindow.postMessage('desktop', '*');
		}
	});
	
	
});


