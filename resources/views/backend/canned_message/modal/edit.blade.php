<form method="post" class="ajax-submit" autocomplete="off" action="{{action('CannedMessageController@update', $id)}}" enctype="multipart/form-data">
	{{ csrf_field()}}
	<input name="_method" type="hidden" value="PATCH">				
	
	<div class="col-md-12">
	 <div class="form-group">
		<label class="control-label">{{ _lang('Name') }}</label>						
		<input type="text" class="form-control" name="name" value="{{ $cannedmessage->name }}" required>
	 </div>
	</div>

	<div class="col-md-12">
	 <div class="form-group">
		<label class="control-label">{{ _lang('Message') }}</label>						
		<textarea class="form-control" name="message" required>{{ $cannedmessage->message }}</textarea>
	 </div>
	</div>

				
	<div class="form-group">
	  <div class="col-md-12">
		<button type="submit" class="btn btn-primary">{{ _lang('Update') }}</button>
	  </div>
	</div>
</form>

