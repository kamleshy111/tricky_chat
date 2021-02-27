@extends('layouts.app')

@section('content')
<div class="row">
	<div class="col-md-12">
	<div class="panel panel-default">
	<div class="panel-heading">{{ _lang('View Blacklist') }}</div>

	<div class="panel-body">
	  <table class="table table-bordered">
		<tr><td>{{ _lang('Domain Name') }}</td><td>{{ $blacklist->domain_name }}</td></tr>
			<tr><td>{{ _lang('Url') }}</td><td>{{ $blacklist->url }}</td></tr>
			
	  </table>
	</div>
  </div>
 </div>
</div>
@endsection


