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

INSERT INTO canned_messages VALUES('1','How can help','How can i help you?','2018-10-24 07:27:00','2018-11-08 13:42:21');



DROP TABLE IF EXISTS chat_requests;

CREATE TABLE `chat_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guest_id` int(11) NOT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `guest_is_typing` int(11) NOT NULL DEFAULT '0',
  `operator_is_typing` int(11) NOT NULL DEFAULT '0',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO chat_requests VALUES('1','1','','0','0','chat_request','2018-10-23 12:52:55','2018-10-23 12:52:55');
INSERT INTO chat_requests VALUES('2','2','1','0','0','chat_end','2018-10-24 02:14:06','2018-10-24 02:22:27');
INSERT INTO chat_requests VALUES('3','3','1','0','0','chat_end','2018-10-24 02:24:13','2018-10-24 02:25:31');
INSERT INTO chat_requests VALUES('4','4','','0','0','chat_end','2018-10-24 02:28:44','2018-10-24 02:28:49');
INSERT INTO chat_requests VALUES('5','5','1','0','0','chat_end','2018-10-24 02:32:06','2018-10-24 02:32:19');
INSERT INTO chat_requests VALUES('6','6','','0','0','chat_end','2018-10-24 02:33:33','2018-10-24 02:33:37');
INSERT INTO chat_requests VALUES('7','7','1','0','0','chat_end','2018-10-24 02:39:28','2018-10-24 02:40:13');
INSERT INTO chat_requests VALUES('8','8','','0','0','chat_end','2018-10-24 02:41:28','2018-10-24 02:41:34');
INSERT INTO chat_requests VALUES('9','9','','0','0','chat_end','2018-10-24 02:42:52','2018-10-24 02:43:13');
INSERT INTO chat_requests VALUES('10','10','1','0','0','chat_start','2018-10-24 03:12:37','2018-10-24 03:14:34');
INSERT INTO chat_requests VALUES('11','11','1','0','0','chat_start','2018-10-25 01:02:12','2018-10-25 01:02:23');
INSERT INTO chat_requests VALUES('12','12','1','0','0','chat_end','2018-11-08 07:45:35','2018-11-08 07:46:42');
INSERT INTO chat_requests VALUES('13','13','1','0','0','chat_start','2018-11-24 04:12:48','2018-11-24 04:12:53');
INSERT INTO chat_requests VALUES('14','14','1','0','0','chat_start','2018-11-24 09:55:52','2018-11-24 09:55:57');
INSERT INTO chat_requests VALUES('15','15','','0','0','chat_end','2019-02-15 10:22:12','2019-02-15 10:23:30');
INSERT INTO chat_requests VALUES('16','16','1','1','0','chat_start','2019-02-15 10:36:45','2019-02-15 11:58:28');
INSERT INTO chat_requests VALUES('17','17','1','0','0','chat_start','2019-02-17 00:45:09','2019-02-17 01:29:14');
INSERT INTO chat_requests VALUES('18','18','1','0','0','chat_start','2019-02-17 08:24:21','2019-02-17 10:53:12');



DROP TABLE IF EXISTS departments;

CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `department` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO departments VALUES('1','General','','2018-10-25 05:59:41','2018-10-25 05:59:41');
INSERT INTO departments VALUES('2','Sales','Sales Department','2019-02-15 16:24:28','2019-02-15 16:24:28');



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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO guests VALUES('1','Smith','smith@gmail.com','','0','http://localhost/tricky_chat/widget_preview','::1','male_guest.png','2018-10-23 13:49:46','2018-10-23 12:52:55','2018-10-23 13:49:46');
INSERT INTO guests VALUES('2','sdfdsf','sdfsdf@sfsdf.sdfds','','0','http://localhost/tricky_chat/widget_preview','::1','male_guest.png','2018-10-24 02:22:24','2018-10-24 02:14:06','2018-10-24 02:22:24');
INSERT INTO guests VALUES('3','Jony','jony@gmail.com','','0','http://localhost/tricky_chat/widget_preview','::1','male_guest.png','2018-10-24 02:25:28','2018-10-24 02:24:13','2018-10-24 02:25:28');
INSERT INTO guests VALUES('4','sdfdsf','sdfasdsa@sdfds.com','','0','http://localhost/tricky_chat/widget_preview','::1','male_guest.png','2018-10-24 02:28:44','2018-10-24 02:28:44','2018-10-24 02:28:44');
INSERT INTO guests VALUES('5','asdsa','asdsad@asdfsdf.com','','0','http://localhost/tricky_chat/widget_preview','::1','male_guest.png','2018-10-24 02:32:16','2018-10-24 02:32:06','2018-10-24 02:32:16');
INSERT INTO guests VALUES('6','asdsaads','asdasdsa@sdfdsf.com','','0','http://localhost/tricky_chat/widget_preview','::1','male_guest.png','2018-10-24 02:33:33','2018-10-24 02:33:33','2018-10-24 02:33:33');
INSERT INTO guests VALUES('7','asdsad','asdsad@sdfds.casdf','','0','http://localhost/tricky_chat/widget_preview','::1','male_guest.png','2018-10-24 02:40:08','2018-10-24 02:39:28','2018-10-24 02:40:08');
INSERT INTO guests VALUES('8','sdfds','sdfdsf@sdfds.com','','0','http://localhost/tricky_chat/widget_preview','::1','male_guest.png','2018-10-24 02:41:28','2018-10-24 02:41:28','2018-10-24 02:41:28');
INSERT INTO guests VALUES('9','asdfs','sdfds@sdfsdf.com','','0','http://localhost/tricky_chat/widget_preview','::1','male_guest.png','2018-10-24 02:43:13','2018-10-24 02:42:52','2018-10-24 02:43:13');
INSERT INTO guests VALUES('10','Smith','smith@gmail.com','','0','http://localhost/tricky_chat/widget_preview','::1','male_guest.png','2018-10-24 03:15:29','2018-10-24 03:12:37','2018-10-24 03:15:29');
INSERT INTO guests VALUES('11','Smith','smith@gmail.com','','0','http://localhost/tricky_chat/widget_preview','::1','male_guest.png','2018-10-25 01:17:54','2018-10-25 01:02:12','2018-10-25 01:17:54');
INSERT INTO guests VALUES('12','Jhon','jhon@gmail.com','','0','file:///C:/Users/Francis/Desktop/VENUS/index.html','::1','male_guest.png','2018-11-08 07:46:40','2018-11-08 07:45:35','2018-11-08 07:46:40');
INSERT INTO guests VALUES('13','Smith','smith@gmail.com','','0','http://localhost/tricky_chat/widget_preview','::1','male_guest.png','2018-11-24 04:16:36','2018-11-24 04:12:48','2018-11-24 04:16:36');
INSERT INTO guests VALUES('14','sdf','sdfds@sdfdsf.com','','0','http://localhost/tricky_chat/widget_preview','::1','male_guest.png','2018-11-24 10:57:02','2018-11-24 09:55:52','2018-11-24 10:57:02');
INSERT INTO guests VALUES('15','Jackob','jackob@gmail.com','','0','http://localhost/tricky_chat/widget_preview','::1','male_guest.png','2019-02-15 10:23:27','2019-02-15 10:22:12','2019-02-15 10:23:27');
INSERT INTO guests VALUES('16','Jackob','jackob@gmail.com','+016848486','1','http://localhost/tricky_chat/widget_preview','::1','male_guest.png','2019-02-15 12:05:53','2019-02-15 10:36:45','2019-02-15 12:05:53');
INSERT INTO guests VALUES('17','Hillol','hillol@gmail.com','+21-212-122','2','http://localhost/tricky_chat/widget_preview','::1','male_guest.png','2019-02-17 01:29:24','2019-02-17 00:45:09','2019-02-17 01:29:24');
INSERT INTO guests VALUES('18','Pollerd','pollerd@gmail.com','+965-475-4545','0','http://localhost/tricky_chat/widget_preview','::1','male_guest.png','2019-02-17 10:53:28','2019-02-17 08:24:21','2019-02-17 10:53:28');



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
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO messages VALUES('1','1','Smith has started chat conversation','0','guest','operator','2018-10-23 12:52:55','2018-10-23 12:52:55');
INSERT INTO messages VALUES('2','2','sdfdsf has started chat conversation','1','guest','operator','2018-10-24 02:14:06','2018-10-24 07:23:59');
INSERT INTO messages VALUES('3','2','<span class=\'chat_ended\'><i class=\'fa fa-sign-out\'></i> admin has ended chat session.</span>','1','operator','guest','2018-10-24 02:22:27','2018-10-24 07:23:59');
INSERT INTO messages VALUES('4','3','Jony has started chat conversation','1','guest','operator','2018-10-24 02:24:13','2018-10-24 07:26:09');
INSERT INTO messages VALUES('5','3','Hi','1','guest','operator','2018-10-24 02:24:51','2018-10-24 07:26:09');
INSERT INTO messages VALUES('6','3','sdfds','1','operator','guest','2018-10-24 02:25:19','2018-10-24 07:26:09');
INSERT INTO messages VALUES('7','3','<span class=\'chat_ended\'><i class=\'fa fa-sign-out\'></i> admin has ended chat session.</span>','1','operator','guest','2018-10-24 02:25:31','2018-10-24 07:26:09');
INSERT INTO messages VALUES('8','4','sdfdsf has started chat conversation','0','guest','operator','2018-10-24 02:28:44','2018-10-24 02:28:44');
INSERT INTO messages VALUES('9','4','ghgfhfgh','0','guest','operator','2018-10-24 02:28:46','2018-10-24 02:28:46');
INSERT INTO messages VALUES('10','4','<span class=\'chat_ended\'><i class=\'fa fa-sign-out\'></i> sdfdsf has ended chat session.</span>','0','guest','operator','2018-10-24 02:28:49','2018-10-24 02:28:49');
INSERT INTO messages VALUES('11','5','asdsa has started chat conversation','1','guest','operator','2018-10-24 02:32:06','2018-10-24 07:40:04');
INSERT INTO messages VALUES('12','5','asdsad','1','guest','operator','2018-10-24 02:32:08','2018-10-24 07:40:04');
INSERT INTO messages VALUES('13','5','asdsad','1','operator','guest','2018-10-24 02:32:14','2018-10-24 07:40:04');
INSERT INTO messages VALUES('14','5','<span class=\'chat_ended\'><i class=\'fa fa-sign-out\'></i> asdsa has ended chat session.</span>','1','guest','operator','2018-10-24 02:32:19','2018-10-24 07:40:04');
INSERT INTO messages VALUES('15','6','asdsaads has started chat conversation','0','guest','operator','2018-10-24 02:33:33','2018-10-24 02:33:33');
INSERT INTO messages VALUES('16','6','<span class=\'chat_ended\'><i class=\'fa fa-sign-out\'></i> asdsaads has ended chat session.</span>','0','guest','operator','2018-10-24 02:33:37','2018-10-24 02:33:37');
INSERT INTO messages VALUES('17','7','asdsad has started chat conversation','1','guest','operator','2018-10-24 02:39:28','2018-10-24 07:42:54');
INSERT INTO messages VALUES('18','7','Hi','1','guest','operator','2018-10-24 02:40:02','2018-10-24 07:42:54');
INSERT INTO messages VALUES('19','7','<span class=\'chat_ended\'><i class=\'fa fa-sign-out\'></i> admin has ended chat session.</span>','1','operator','guest','2018-10-24 02:40:10','2018-10-24 07:42:54');
INSERT INTO messages VALUES('20','7','<span class=\'chat_ended\'><i class=\'fa fa-sign-out\'></i> asdsad has ended chat session.</span>','1','guest','operator','2018-10-24 02:40:13','2018-10-24 07:42:54');
INSERT INTO messages VALUES('21','8','sdfds has started chat conversation','0','guest','operator','2018-10-24 02:41:28','2018-10-24 02:41:28');
INSERT INTO messages VALUES('22','8','adssd','0','guest','operator','2018-10-24 02:41:31','2018-10-24 02:41:31');
INSERT INTO messages VALUES('23','8','<span class=\'chat_ended\'><i class=\'fa fa-sign-out\'></i> sdfds has ended chat session.</span>','0','guest','operator','2018-10-24 02:41:34','2018-10-24 02:41:34');
INSERT INTO messages VALUES('24','9','asdfs has started chat conversation','0','guest','operator','2018-10-24 02:42:52','2018-10-24 02:42:52');
INSERT INTO messages VALUES('25','9','Hi','0','guest','operator','2018-10-24 02:43:03','2018-10-24 02:43:03');
INSERT INTO messages VALUES('26','9','<span class=\'chat_ended\'><i class=\'fa fa-sign-out\'></i> asdfs has ended chat session.</span>','0','guest','operator','2018-10-24 02:43:13','2018-10-24 02:43:13');
INSERT INTO messages VALUES('27','10','Smith has started chat conversation','1','guest','operator','2018-10-24 03:12:37','2018-10-24 08:14:45');
INSERT INTO messages VALUES('28','11','Smith has started chat conversation','1','guest','operator','2018-10-25 01:02:12','2018-10-25 06:17:56');
INSERT INTO messages VALUES('29','11','admin has joined to chat conversation','1','operator','guest','2018-10-25 01:02:23','2018-10-25 06:17:56');
INSERT INTO messages VALUES('30','12','Jhon has started chat conversation','1','guest','operator','2018-11-08 07:45:35','2018-11-08 13:46:53');
INSERT INTO messages VALUES('31','12','admin has joined to chat conversation','1','operator','guest','2018-11-08 07:45:48','2018-11-08 13:46:53');
INSERT INTO messages VALUES('32','12','Hi','1','operator','guest','2018-11-08 07:45:55','2018-11-08 13:46:53');
INSERT INTO messages VALUES('33','12','Hello','1','guest','operator','2018-11-08 07:46:04','2018-11-08 13:46:53');
INSERT INTO messages VALUES('34','12','How can i help you?','1','operator','guest','2018-11-08 07:46:19','2018-11-08 13:46:53');
INSERT INTO messages VALUES('35','12','<img class=\"s-emboji\" src=\"http://localhost/tricky_chat/public/emboji/1_happy.png\">','1','guest','operator','2018-11-08 07:46:29','2018-11-08 13:46:53');
INSERT INTO messages VALUES('36','12','<span class=\'chat_ended\'><i class=\'fa fa-sign-out\'></i> Jhon has ended chat session.</span>','1','guest','operator','2018-11-08 07:46:42','2018-11-08 13:46:53');
INSERT INTO messages VALUES('37','13','Smith Has Started Chat Conversation','1','guest','operator','2018-11-24 04:12:48','2018-11-24 10:16:37');
INSERT INTO messages VALUES('38','13','admin has joined to chat conversation','1','operator','guest','2018-11-24 04:12:53','2018-11-24 10:16:37');
INSERT INTO messages VALUES('39','13','<a target=\'_blank\' href=\'http://localhost/tricky_chat/public/uploads/chat_files/Attachment_1543054584.png\'>Attachment_1543054584.png</a>','1','guest','operator','2018-11-24 04:16:24','2018-11-24 10:16:37');
INSERT INTO messages VALUES('40','14','sdf Has Started Chat Conversation','1','guest','operator','2018-11-24 09:55:52','2018-11-24 15:59:44');
INSERT INTO messages VALUES('41','14','admin has joined to chat conversation','1','operator','guest','2018-11-24 09:55:57','2018-11-24 15:59:44');
INSERT INTO messages VALUES('42','14','<img class=\"s-emboji\" src=\"http://localhost/tricky_chat/public/emboji/1_happy.png\">','1','guest','operator','2018-11-24 09:56:03','2018-11-24 15:59:44');
INSERT INTO messages VALUES('43','14','<img class=\"s-emboji\" src=\"http://localhost/tricky_chat/public/emboji/2_surprised.png\">','1','guest','operator','2018-11-24 09:56:11','2018-11-24 15:59:44');
INSERT INTO messages VALUES('44','14','<img class=\"s-emboji\" src=\"http://localhost/tricky_chat/public/emboji/quiet.png\">','1','guest','operator','2018-11-24 09:56:22','2018-11-24 15:59:44');
INSERT INTO messages VALUES('45','14','<img class=\"s-emboji\" src=\"http://localhost/tricky_chat/public/emboji/nerd.png\"><img class=\"s-emboji\" src=\"http://localhost/tricky_chat/public/emboji/unhappy.png\"><img class=\"s-emboji\" src=\"http://localhost/tricky_chat/public/emboji/smart.png\">','1','guest','operator','2018-11-24 09:58:57','2018-11-24 15:59:44');
INSERT INTO messages VALUES('46','14','<img class=\"s-emboji\" src=\"http://localhost/tricky_chat/public/emboji/smart.png\">&nbsp;<img class=\"s-emboji\" src=\"http://localhost/tricky_chat/public/emboji/unhappy.png\">&nbsp;<img class=\"s-emboji\" src=\"http://localhost/tricky_chat/public/emboji/crying.png\">','1','guest','operator','2018-11-24 09:59:08','2018-11-24 15:59:44');
INSERT INTO messages VALUES('47','14','jklkjl','0','guest','operator','2018-11-24 10:51:22','2018-11-24 10:51:22');
INSERT INTO messages VALUES('48','14','vbnvbghj','0','guest','operator','2018-11-24 10:51:26','2018-11-24 10:51:26');
INSERT INTO messages VALUES('49','14','<img class=\"s-emboji\" src=\"http://localhost/tricky_chat/public/emboji/3_sad.png\">','0','guest','operator','2018-11-24 10:51:29','2018-11-24 10:51:29');
INSERT INTO messages VALUES('50','15','Jackob Has Started Chat Conversation','0','guest','operator','2019-02-15 10:22:12','2019-02-15 10:22:12');
INSERT INTO messages VALUES('51','15','<span class=\'chat_ended\'><i class=\'fa fa-sign-out\'></i> Jackob Has Ended Chat Session.</span>','0','guest','operator','2019-02-15 10:23:30','2019-02-15 10:23:30');
INSERT INTO messages VALUES('52','16','Jackob Has Started Chat Conversation','1','guest','operator','2019-02-15 10:36:45','2019-02-15 18:06:03');
INSERT INTO messages VALUES('53','16','admin has joined to chat conversation','1','operator','guest','2019-02-15 10:45:19','2019-02-15 18:06:03');
INSERT INTO messages VALUES('54','16','How can i help you?','1','operator','guest','2019-02-15 10:45:29','2019-02-15 18:06:03');
INSERT INTO messages VALUES('55','16','Test Help','1','guest','operator','2019-02-15 10:45:40','2019-02-15 18:06:03');
INSERT INTO messages VALUES('56','16','sdfsdf','1','operator','guest','2019-02-15 10:57:16','2019-02-15 18:06:03');
INSERT INTO messages VALUES('57','16','dgdfg','1','operator','guest','2019-02-15 11:32:04','2019-02-15 18:06:03');
INSERT INTO messages VALUES('58','16','<img class=\"s-emboji\" src=\"http://localhost/tricky_chat/public/emboji/nerd.png\">','1','guest','operator','2019-02-15 11:32:33','2019-02-15 18:06:03');
INSERT INTO messages VALUES('59','16','dfgfdg','1','guest','operator','2019-02-15 11:45:01','2019-02-15 18:06:03');
INSERT INTO messages VALUES('60','16','OK','1','operator','guest','2019-02-15 11:45:51','2019-02-15 18:06:03');
INSERT INTO messages VALUES('61','16','Hwllo','1','guest','operator','2019-02-15 12:04:56','2019-02-15 18:06:03');
INSERT INTO messages VALUES('62','16','&nbsp;dfgfdg','1','guest','operator','2019-02-15 12:05:20','2019-02-15 18:06:03');
INSERT INTO messages VALUES('63','17','Hillol Has Started Chat Conversation','1','guest','operator','2019-02-17 00:45:09','2019-02-17 07:29:34');
INSERT INTO messages VALUES('64','17','Hello','1','guest','operator','2019-02-17 00:47:17','2019-02-17 07:29:34');
INSERT INTO messages VALUES('65','17','admin has joined to chat conversation','1','operator','guest','2019-02-17 00:51:47','2019-02-17 07:29:34');
INSERT INTO messages VALUES('66','17','Hello, How are you?','1','operator','guest','2019-02-17 01:23:14','2019-02-17 07:29:34');
INSERT INTO messages VALUES('67','17','I am fine. How are you?','1','guest','operator','2019-02-17 01:23:53','2019-02-17 07:29:34');
INSERT INTO messages VALUES('68','17','Hi,asd asdas asd','1','guest','operator','2019-02-17 01:26:31','2019-02-17 07:29:34');
INSERT INTO messages VALUES('69','17','asd asdhggb asd ighh asdsaasd iiuhg&nbsp; asdiuh iuh','1','operator','guest','2019-02-17 01:27:04','2019-02-17 07:29:34');
INSERT INTO messages VALUES('70','17','sd jkljkj sdflkj&nbsp; dsf lkjjksdf lklkj sdf lkjk dsfkljlk sdf','1','operator','guest','2019-02-17 01:28:28','2019-02-17 07:29:34');
INSERT INTO messages VALUES('71','17','df dfgdfgljn lkjn dfgkjn dfg dfkjkj jkl','1','operator','guest','2019-02-17 01:29:11','2019-02-17 07:29:34');
INSERT INTO messages VALUES('72','17','sdsdfdsfsdfsd sdf sdfsdf sdsdf fjdfj&nbsp;','1','guest','operator','2019-02-17 01:29:15','2019-02-17 07:29:34');
INSERT INTO messages VALUES('73','18','Pollerd Has Started Chat Conversation','1','guest','operator','2019-02-17 08:24:21','2019-02-17 16:53:29');
INSERT INTO messages VALUES('74','18','admin has joined to chat conversation','1','operator','guest','2019-02-17 08:24:33','2019-02-17 16:53:29');
INSERT INTO messages VALUES('75','18','How can i help you?','1','operator','guest','2019-02-17 08:28:39','2019-02-17 16:53:29');
INSERT INTO messages VALUES('76','18','asd asd asd','1','guest','operator','2019-02-17 08:28:43','2019-02-17 16:53:29');
INSERT INTO messages VALUES('77','18','Ok let me transfer this chat to general department.','1','operator','guest','2019-02-17 08:29:07','2019-02-17 16:53:29');
INSERT INTO messages VALUES('78','18','admin has transfered chat to jony','1','operator','guest','2019-02-17 15:20:13','2019-02-17 16:53:29');
INSERT INTO messages VALUES('79','18','jony has transfered chat to admin','1','operator','guest','2019-02-17 15:20:55','2019-02-17 16:53:29');
INSERT INTO messages VALUES('80','18','admin has transfered chat to jony','1','operator','guest','2019-02-17 15:22:20','2019-02-17 16:53:29');
INSERT INTO messages VALUES('81','18','sdf sdf','1','operator','guest','2019-02-17 09:22:29','2019-02-17 16:53:29');
INSERT INTO messages VALUES('82','18','jony has transfered chat to admin','1','operator','guest','2019-02-17 15:23:05','2019-02-17 16:53:29');
INSERT INTO messages VALUES('83','18','dfgdfg','1','operator','guest','2019-02-17 09:26:29','2019-02-17 16:53:29');
INSERT INTO messages VALUES('84','18','admin has transfered chat to jony','1','operator','guest','2019-02-17 15:26:38','2019-02-17 16:53:29');
INSERT INTO messages VALUES('85','18','jony has transfered chat to admin','1','operator','guest','2019-02-17 15:27:27','2019-02-17 16:53:29');
INSERT INTO messages VALUES('86','18','admin has joined to chat conversation','1','operator','guest','2019-02-17 10:46:13','2019-02-17 16:53:29');
INSERT INTO messages VALUES('87','18','admin has joined to chat conversation','1','operator','guest','2019-02-17 10:49:38','2019-02-17 16:53:29');
INSERT INTO messages VALUES('88','18','admin has transfered chat to jony','1','operator','guest','2019-02-17 16:49:43','2019-02-17 16:53:29');
INSERT INTO messages VALUES('89','18','jony has joined to chat conversation','1','operator','guest','2019-02-17 10:50:20','2019-02-17 16:53:29');
INSERT INTO messages VALUES('90','18','Hi, How can i help You?<br>','1','operator','guest','2019-02-17 10:50:36','2019-02-17 16:53:29');
INSERT INTO messages VALUES('91','18','jony has joined to chat conversation','1','operator','guest','2019-02-17 10:52:54','2019-02-17 16:53:29');
INSERT INTO messages VALUES('92','18','jony has transfered chat to admin','1','operator','guest','2019-02-17 16:53:02','2019-02-17 16:53:29');
INSERT INTO messages VALUES('93','18','admin has joined to chat conversation','1','operator','guest','2019-02-17 10:53:12','2019-02-17 16:53:29');



DROP TABLE IF EXISTS migrations;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES('1','2014_10_12_000000_create_users_table','1');
INSERT INTO migrations VALUES('2','2014_10_12_100000_create_password_resets_table','1');
INSERT INTO migrations VALUES('3','2018_06_01_080940_create_settings_table','1');
INSERT INTO migrations VALUES('4','2018_09_25_071732_create_departments_table','1');
INSERT INTO migrations VALUES('5','2018_09_25_071811_create_canned_messages_table','1');
INSERT INTO migrations VALUES('6','2018_10_18_082257_create_guests_table','1');
INSERT INTO migrations VALUES('7','2018_10_20_113010_create_chat_requests_table','1');
INSERT INTO migrations VALUES('8','2018_10_20_122018_create_messages_table','1');
INSERT INTO migrations VALUES('9','2018_10_22_160146_create_blacklists_table','1');



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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO settings VALUES('1','timezone','America/Mexico_City','','2019-02-17 07:25:45');
INSERT INTO settings VALUES('2','mail_type','mail','','');
INSERT INTO settings VALUES('3','backend_direction','ltr','','2019-02-17 07:25:45');
INSERT INTO settings VALUES('4','widget_direction','right','','2019-02-15 16:36:26');
INSERT INTO settings VALUES('5','mobile_version_breakpoint','768','','2019-02-15 16:36:26');
INSERT INTO settings VALUES('6','chatting_refresh_rate','5','','2019-02-17 07:25:45');
INSERT INTO settings VALUES('7','user_tracking_refresh_rate','5','','2019-02-17 07:25:45');
INSERT INTO settings VALUES('8','message_sound','default.mp3','','2019-02-17 07:25:45');
INSERT INTO settings VALUES('9','max_upload_size','2','','2019-02-17 07:25:45');
INSERT INTO settings VALUES('10','file_sharing','yes','','2019-02-17 07:25:45');
INSERT INTO settings VALUES('11','file_type_supported','doc,jpg,jpeg,png,pdf,docx,zip','','2019-02-17 07:25:45');
INSERT INTO settings VALUES('12','allow_department','yes','','2019-02-17 07:25:45');
INSERT INTO settings VALUES('13','company_name','TrickyCode','2018-10-23 17:00:45','2019-02-17 07:25:45');
INSERT INTO settings VALUES('14','site_title','Tricky Chat','2018-10-23 17:00:45','2019-02-17 07:25:45');
INSERT INTO settings VALUES('15','phone','+65454554646','2018-10-23 17:00:45','2018-10-23 17:00:45');
INSERT INTO settings VALUES('16','email','trickycode93@gmial.com','2018-10-23 17:00:45','2019-02-17 07:25:45');
INSERT INTO settings VALUES('17','primary_color','#007bff','2018-10-23 17:54:38','2019-02-15 16:36:26');
INSERT INTO settings VALUES('18','secondary_color','#2ecc70','2018-10-23 17:54:38','2019-02-15 16:36:26');
INSERT INTO settings VALUES('19','label_color','#ffffff','2018-10-23 17:54:38','2019-02-15 16:36:26');
INSERT INTO settings VALUES('20','heading_text','Live Chat','2018-10-23 17:54:38','2019-02-15 16:36:26');
INSERT INTO settings VALUES('21','language','English','2019-02-15 16:24:02','2019-02-17 07:25:45');
INSERT INTO settings VALUES('22','mobile_field','yes','2019-02-15 16:36:26','2019-02-15 16:36:26');



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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES('1','admin','admin@demo.com','$2y$10$e7GCjcqL79uRbRKYCFJfoObkcJ8Xb32u71AtY7xYccMb2mWFu8gee','admin','','','2019-02-18 00:31:19','jUUhz14IMZBnJC7G8iWFoXmw3MaudY82xkEpPJYQvgfBr0boUNU4wL1acza3','2018-10-23 16:59:54','2019-02-18 00:31:19');
INSERT INTO users VALUES('2','jony','jony@gmail.com','$2y$10$utVO.MPOZeXb1pzP295qaen70QuOuerLFBiIvApimmD0K7il83SIm','operator','1','','2019-02-17 10:53:27','','2018-10-25 06:01:41','2019-02-17 10:53:27');
INSERT INTO users VALUES('3','Ripon','ripon@gmail.com','$2y$10$EQw8mAB4lpc7sV/2fhpzYeY4g3PPUwf2eucjkF.eW7EbJooGBhbzS','operator','2','','','','2019-02-17 06:45:51','2019-02-17 06:45:51');



