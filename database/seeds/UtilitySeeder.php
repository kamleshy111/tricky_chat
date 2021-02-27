<?php

use Illuminate\Database\Seeder;

class UtilitySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
		//Default Settings
		DB::table('settings')->insert([
			[
			  'name' => 'timezone',
			  'value' => 'Canada/Pacific'
			],
			[
			  'name' => 'mail_type',
			  'value' => 'mail'
			],
			[
			  'name' => 'backend_direction',
			  'value' => 'ltr'
			],
			[
			  'name' => 'widget_direction',
			  'value' => 'right'
			],
			[
			  'name' => 'mobile_version_breakpoint',
			  'value' => '768'
			],
			[
			  'name' => 'chatting_refresh_rate',
			  'value' => '5'
			],
		  	[
			  'name' => 'user_tracking_refresh_rate',
			  'value' => '8'
			],
			[
			  'name' => 'message_sound',
			  'value' => 'default.mp3'
			],
			[
			  'name' => 'max_upload_size',
			  'value' => '2'
			],
			[
			  'name' => 'file_sharing',
			  'value' => 'yes'
			],
			[
			  'name' => 'file_type_supported',
			  'value' => 'doc,jpg,jpeg,png,pdf,docx,zip'
			],
			[
			  'name' => 'allow_department',
			  'value' => 'no'
			],			
		]);
		
    }
}
