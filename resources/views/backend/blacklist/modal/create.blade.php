<form method="post" class="ajax-submit" autocomplete="off" action="{{route('blacklists.store')}}" enctype="multipart/form-data">
	{{ csrf_field() }}
	
	<div class="col-md-12">
	  <div class="form-group">
		<label class="control-label">{{ _lang('Domain Name') }}</label>						
		<input type="text" class="form-control" name="domain_name" value="{{ old('domain_name') }}" required>
	  </div>
	</div>

	<div class="col-md-12">
	  <div class="form-group">
		<label class="control-label">{{ _lang('URL') }}</label>						
		<input type="text" class="form-control" name="url" value="{{ old('url') }}" placeholder="http://www.example.com/*" required>
	  </div>
	</div>

				
	<div class="col-md-12">
	  <div class="form-group">
	    <button type="reset" class="btn btn-danger">{{ _lang('Reset') }}</button>
		<button type="submit" class="btn btn-primary">{{ _lang('Save') }}</button>
	  </div>
	</div>
</form>
