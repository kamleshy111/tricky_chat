DROP TABLE IF EXISTS blacklists;

CREATE TABLE `blacklists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS canned_messages;

CREATE TABLE `canned_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO canned_messages VALUES('1','test','test message','2021-02-09 09:27:39','2021-02-09 09:27:39');



DROP TABLE IF EXISTS chat_requests;

CREATE TABLE `chat_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guest_id` int(11) NOT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `guest_is_typing` int(11) NOT NULL DEFAULT 0,
  `operator_is_typing` int(11) NOT NULL DEFAULT 0,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO chat_requests VALUES('1','1','1','0','0','chat_end','2021-02-09 18:53:18','2021-02-09 22:20:54');
INSERT INTO chat_requests VALUES('2','2','1','0','0','chat_start','2021-02-09 19:16:14','2021-02-09 19:17:00');
INSERT INTO chat_requests VALUES('3','3','','0','0','chat_end','2021-02-09 22:21:25','2021-02-09 22:53:58');
INSERT INTO chat_requests VALUES('4','4','','0','0','chat_request','2021-02-09 23:24:24','2021-02-09 23:24:24');



DROP TABLE IF EXISTS departments;

CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `department` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO departments VALUES('1','Development','','2021-02-09 09:27:16','2021-02-09 09:27:16');



DROP TABLE IF EXISTS guests;

CREATE TABLE `guests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_picture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO guests VALUES('1','gaurav','gaurav@example.com','','0','http://localhost/stylopop/','::1','male_guest.png','2021-02-09 22:20:47','2021-02-09 18:53:18','2021-02-09 22:20:47');
INSERT INTO guests VALUES('2','kamlesh','kamleshy111111@gm.com','','0','http://localhost/stylopop/','::1','male_guest.png','2021-02-09 19:17:11','2021-02-09 19:16:14','2021-02-09 19:17:11');
INSERT INTO guests VALUES('3','rahul','rahul@g.com','','0','http://localhost/tricky_chat/widget_preview','::1','male_guest.png','2021-02-09 22:53:57','2021-02-09 22:21:25','2021-02-09 22:53:57');
INSERT INTO guests VALUES('4','hello','hello@helloc.com','','0','http://localhost/tricky_chat/widget_preview','::1','male_guest.png','2021-02-10 02:38:09','2021-02-09 23:24:24','2021-02-10 02:38:09');



DROP TABLE IF EXISTS messages;

CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chat_request_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `sender` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO messages VALUES('1','1','gaurav Has Started Chat Conversation','1','guest','operator','2021-02-09 18:53:18','2021-02-09 10:14:00');
INSERT INTO messages VALUES('2','1','admin Has Joined To Chat Conversation','1','operator','guest','2021-02-09 18:53:31','2021-02-09 10:14:00');
INSERT INTO messages VALUES('3','1','hello','1','operator','guest','2021-02-09 18:53:39','2021-02-09 10:14:00');
INSERT INTO messages VALUES('4','2','kamlesh Has Started Chat Conversation','1','guest','operator','2021-02-09 19:16:14','2021-02-09 10:17:19');
INSERT INTO messages VALUES('5','2','admin Has Joined To Chat Conversation','1','operator','guest','2021-02-09 19:17:00','2021-02-09 10:17:19');
INSERT INTO messages VALUES('6','2','hello','1','operator','guest','2021-02-09 19:17:06','2021-02-09 10:17:19');
INSERT INTO messages VALUES('7','1','<span class=\'chat_ended\'><i class=\'fa fa-sign-out\'></i> gaurav Has Ended Chat Session.</span>','0','guest','operator','2021-02-09 22:20:54','2021-02-09 22:20:54');
INSERT INTO messages VALUES('8','3','rahul Has Started Chat Conversation','0','guest','operator','2021-02-09 22:21:25','2021-02-09 22:21:25');
INSERT INTO messages VALUES('9','3','<span class=\'chat_ended\'><i class=\'fa fa-sign-out\'></i> rahul Has Ended Chat Session.</span>','0','guest','operator','2021-02-09 22:53:58','2021-02-09 22:53:58');
INSERT INTO messages VALUES('10','4','hello Has Started Chat Conversation','0','guest','operator','2021-02-09 23:24:24','2021-02-09 23:24:24');



DROP TABLE IF EXISTS migrations;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES('1','2014_10_12_000000_create_users_table','1');
INSERT INTO migrations VALUES('2','2014_10_12_100000_create_password_resets_table','1');
INSERT INTO migrations VALUES('3','2018_06_01_080940_create_settings_table','1');
INSERT INTO migrations VALUES('4','2018_09_25_071732_create_departments_table','1');
INSERT INTO migrations VALUES('5','2018_09_25_071811_create_canned_messages_table','1');
INSERT INTO migrations VALUES('6','2018_10_18_082257_create_guests_table','1');
INSERT INTO migrations VALUES('7','2018_10_20_113010_create_chat_requests_table','1');
INSERT INTO migrations VALUES('8','2018_10_20_122018_create_messages_table','1');
INSERT INTO migrations VALUES('9','2018_10_22_160146_create_blacklists_table','1');
INSERT INTO migrations VALUES('10','2019_02_25_041857_create_offline_messages_table','1');



DROP TABLE IF EXISTS offline_messages;

CREATE TABLE `offline_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS password_resets;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS settings;

CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO settings VALUES('1','timezone','Asia/Dili','','2021-02-09 09:24:54');
INSERT INTO settings VALUES('2','mail_type','mail','','');
INSERT INTO settings VALUES('3','backend_direction','ltr','','');
INSERT INTO settings VALUES('4','widget_direction','right','','2021-02-26 10:07:21');
INSERT INTO settings VALUES('5','mobile_version_breakpoint','768','','2021-02-26 10:07:21');
INSERT INTO settings VALUES('6','chatting_refresh_rate','5','','');
INSERT INTO settings VALUES('7','user_tracking_refresh_rate','8','','');
INSERT INTO settings VALUES('8','message_sound','default.mp3','','');
INSERT INTO settings VALUES('9','max_upload_size','2','','');
INSERT INTO settings VALUES('10','file_sharing','yes','','');
INSERT INTO settings VALUES('11','file_type_supported','doc,jpg,jpeg,png,pdf,docx,zip','','');
INSERT INTO settings VALUES('12','allow_department','yes','','2021-02-26 10:07:21');
INSERT INTO settings VALUES('13','company_name','jskrta','2021-02-09 09:24:54','2021-02-09 09:24:54');
INSERT INTO settings VALUES('14','site_title','chat','2021-02-09 09:24:54','2021-02-09 09:24:54');
INSERT INTO settings VALUES('15','phone','9602848948','2021-02-09 09:24:54','2021-02-09 09:24:54');
INSERT INTO settings VALUES('16','email','kamleshy111@gmail.com','2021-02-09 09:24:54','2021-02-09 09:24:54');
INSERT INTO settings VALUES('17','offline_mode','yes','','2021-02-09 16:40:14');
INSERT INTO settings VALUES('18','primary_color','000000','2021-02-26 10:01:03','2021-02-26 10:07:21');
INSERT INTO settings VALUES('19','secondary_color','000000','2021-02-26 10:01:03','2021-02-26 10:07:21');
INSERT INTO settings VALUES('20','label_color','eba4eb','2021-02-26 10:01:03','2021-02-26 10:07:21');
INSERT INTO settings VALUES('21','heading_text','Online chating system','2021-02-26 10:01:03','2021-02-26 10:07:21');
INSERT INTO settings VALUES('22','offline_text','it now offline','2021-02-26 10:01:03','2021-02-26 10:07:21');
INSERT INTO settings VALUES('23','widget_style','modern','2021-02-26 10:01:03','2021-02-26 10:07:21');
INSERT INTO settings VALUES('24','mobile_field','no','2021-02-26 10:01:03','2021-02-26 10:07:21');
INSERT INTO settings VALUES('25','powered_by','','2021-02-26 10:01:03','2021-02-26 10:07:21');



DROP TABLE IF EXISTS users;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `profile_picture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES('1','admin','kamleshy111@gmail.com','$2y$10$lc8pof4cT.e4vwdXiyxyhOTMqGb62hKL.4391x/ruRzp3E8g4RwG2','admin','','','2021-02-26 19:11:30','tWXB2DyEF1q959UOjXuGWE1VWyQV5qn8ferq0qlpKLAcpBtXts0DDH92ZxWM','2021-02-09 09:23:43','2021-02-26 19:11:30');
INSERT INTO users VALUES('2','operator1','operator1@g.com','$2y$10$5UDZ8f79SVxrzyyrIAnLxOjZ79KXdJuujbCtQwGsruc7wOi7YOm8O','operator','1','','','','2021-02-10 09:44:38','2021-02-10 09:44:38');



