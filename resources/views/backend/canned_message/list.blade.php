@extends('layouts.app')

@section('content')

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default no-export">
			<div class="panel-heading"><span class="panel-title">{{ _lang('List Canned Message') }}</span>
			<a class="btn btn-primary btn-sm pull-right ajax-modal" data-title="{{ _lang('Add Canned Message') }}" href="{{route('canned_messages.create')}}">{{ _lang('Add New') }}</a>
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
				<th>{{ _lang('Name') }}</th>
				<th>{{ _lang('Message') }}</th>
				<th style="width:250px">{{ _lang('Action') }}</th>
			  </tr>
			</thead>
			<tbody>
			  
			  @foreach($cannedmessages as $cannedmessage)
			  <tr id="row_{{ $cannedmessage->id }}">
				<td class='name'>{{ $cannedmessage->name }}</td>
				<td class='message'>{{ $cannedmessage->message }}</td>
				<td>
				  <form action="{{action('CannedMessageController@destroy', $cannedmessage['id'])}}" method="post">
					<a href="{{action('CannedMessageController@edit', $cannedmessage['id'])}}" data-title="{{ _lang('Update Canned Message') }}" class="btn btn-warning btn-sm ajax-modal">{{ _lang('Edit') }}</a>
					<a href="{{action('CannedMessageController@show', $cannedmessage['id'])}}" data-title="{{ _lang('View Canned Message') }}" class="btn btn-info btn-sm ajax-modal">{{ _lang('View') }}</a>
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


