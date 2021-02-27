<form method="post" class="ajax-submit" autocomplete="off" action="{{action('BlacklistController@update', $id)}}" enctype="multipart/form-data">
	{{ csrf_field()}}
	<input name="_method" type="hidden" value="PATCH">				
	
	<div class="col-md-12">
	 <div class="form-group">
		<label class="control-label">{{ _lang('Domain Name') }}</label>						
		<input type="text" class="form-control" name="domain_name" value="{{ $blacklist->domain_name }}" required>
	 </div>
	</div>

	<div class="col-md-12">
	 <div class="form-group">
		<label class="control-label">{{ _lang('URL') }}</label>						
		<input type="text" class="form-control" name="url" value="{{ $blacklist->url }}" required>
	 </div>
	</div>

				
	<div class="form-group">
	  <div class="col-md-12">
		<button type="submit" class="btn btn-primary">{{ _lang('Update') }}</button>
	  </div>
	</div>
</form>

