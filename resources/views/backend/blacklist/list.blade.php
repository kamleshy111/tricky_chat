@extends('layouts.app')

@section('content')

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default no-export">
			<div class="panel-heading"><span class="panel-title">{{ _lang('List Blacklist') }}</span>
			<a class="btn btn-primary btn-sm pull-right ajax-modal" data-title="{{ _lang('Add Blacklist') }}" href="{{route('blacklists.create')}}">{{ _lang('Add New') }}</a>
			</div>

			<div class="panel-body">
			 @if (\Session::has('success'))
			  <div class="alert alert-success">
				<p>{{ \Session::get('success') }}</p>
			  </div>
			  <br />
			 @endif
			<table class="table table-bordered data-table">
			<thead>
			  <tr>
				<th>{{ _lang('Domain Name') }}</th>
				<th>{{ _lang('URL') }}</th>
				<th>{{ _lang('Action') }}</th>
			  </tr>
			</thead>
			<tbody>
			  
			  @foreach($blacklists as $blacklist)
			  <tr id="row_{{ $blacklist->id }}">
				<td class='domain_name'>{{ $blacklist->domain_name }}</td>
				<td class='url'>{{ $blacklist->url }}</td>
				<td>
				  <form action="{{action('BlacklistController@destroy', $blacklist['id'])}}" method="post">
					<a href="{{action('BlacklistController@edit', $blacklist['id'])}}" data-title="{{ _lang('Update Blacklist') }}" class="btn btn-warning btn-sm ajax-modal">{{ _lang('Edit') }}</a>
					<a href="{{action('BlacklistController@show', $blacklist['id'])}}" data-title="{{ _lang('View Blacklist') }}" class="btn btn-info btn-sm ajax-modal">{{ _lang('View') }}</a>
					{{ csrf_field() }}
					<input name="_method" type="hidden" value="DELETE">
					<button class="btn btn-danger btn-sm btn-remove" type="submit">{{ _lang('Delete') }}</button>
				  </form>
				</td>
			  </tr>
			  @endforeach
			</tbody>
		  </table>
			</div>
		</div>
	</div>
</div>

@endsection


