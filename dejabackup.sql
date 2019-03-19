BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `django_session` (
	`session_key`	varchar ( 40 ) NOT NULL,
	`session_data`	text NOT NULL,
	`expire_date`	datetime NOT NULL,
	PRIMARY KEY(`session_key`)
);
INSERT INTO `django_session` VALUES ('1s9dzgmijdxsrwwjwg60ecw4lnh1mtik','NDMzNzZmZmU0N2I4NzI0NzEwNDJhZTg5ZWRlZjNmOGQ1OThmMWEzNDqABJVCBwAAAAAAAH2UKIwNX2F1dGhfdXNlcl9pZJSMATGUjBJfYXV0aF91c2VyX2JhY2tlbmSUjClkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZJSMD19hdXRoX3VzZXJfaGFzaJSMKGU3MjkzMTI4Y2U2ZGM1YWEwNmZkMmRkZWJlY2I0ZGJmMWEyMWM5NWaUjAdjcmVkaXRzlH2UKIwIaGVhZHNob3SUjFhodHRwczovL20ubWVkaWEtYW1hem9uLmNvbS9pbWFnZXMvTS9NVjVCTVRrNU9ETTROelUxTlY1Qk1sNUJhbkJuWGtGdFpUY3dNVFF3TnpRek1nQEAuanBnlIwLbW9zdF9yZWNlbnSUXZQofZQojARsaW5rlIwkaHR0cDovL3d3dy5pbWRiLmNvbS90aXRsZS90dDQwNjMwOTIvlIwFdGl0bGWUjAppbWRiLk1vdmlllIwFTW92aWWUk5QpgZR9lCiMBGRhdGGUfZQoaBCMHkJ1dHRlcmZseSBpbiB0aGUgVHlwZXdyaXRlciAoKZSMBGtpbmSUjAVtb3ZpZZSMBnN0YXR1c5SMDnByZS1wcm9kdWN0aW9ulHWMBG15SUSUTowFbm90ZXOUjBMoKSBKb2huIERld2V5IFRvb2xllIwKdGl0bGVzUmVmc5R9lIwJbmFtZXNSZWZzlH2UjA5jaGFyYWN0ZXJzUmVmc5R9lIwIbW9kRnVuY3SUTowMY3VycmVudF9pbmZvlF2UjAxpbmZvc2V0MmtleXOUfZSMC2tleTJpbmZvc2V0lH2UjBBfQ29udGFpbmVyX19yb2xllE6MB21vdmllSUSUjAc0MDYzMDkylIwHbXlUaXRsZZSMAJSMDGFjY2Vzc1N5c3RlbZSMBGh0dHCUjA1rZXlzX3RvbW9kaWZ5lH2UKIwEcGxvdJROjAZ0cml2aWGUTowSYWx0ZXJuYXRlIHZlcnNpb25zlE6MBWdvb2ZzlE6MBnF1b3Rlc5ROjANkdmSUTowJbGFzZXJkaXNjlE6MBG5ld3OUTowKc291bmR0cmFja5ROjA1jcmF6eSBjcmVkaXRzlE6MCGJ1c2luZXNzlE6MC3N1cHBsZW1lbnRzlE6MDHZpZGVvIHJldmlld5ROjARmYXFzlE51jA1fcm9sZUlzUGVyc29ulImMCl9yb2xlQ2xhc3OUjA5pbWRiLkNoYXJhY3RlcpSMCUNoYXJhY3RlcpSTlHVidX2UKGgOjCRodHRwOi8vd3d3LmltZGIuY29tL3RpdGxlL3R0MTUwNzAwMi+UaBBoEymBlH2UKGgWfZQoaBCMBVN0YW5vlGgZaBqMBHllYXKUTeMHaBuMCWNvbXBsZXRlZJR1aB1OaB6MEygpIE9mZmljZXIgTG9uZXJnYW6UaCB9lGgifZRoJH2UaCZOaCddlGgpfZRoK32UaC1OaC6MBzE1MDcwMDKUaDBoMWgyaDNoNH2UKGg2Tmg3Tmg4Tmg5Tmg6Tmg7Tmg8Tmg9Tmg+Tmg/TmhATmhBTmhCTmhDTnVoRIloRWhIdWJ1fZQoaA6MJGh0dHA6Ly93d3cuaW1kYi5jb20vdGl0bGUvdHQzODY0MDU2L5RoEGgTKYGUfZQoaBZ9lChoEIwNVGhlIEdvbGRmaW5jaJRoGWgaaE9N4wdoG4wJY29tcGxldGVklHVoHU5oHowPKCkgTHVjaXVzIFJlZXZllGggfZRoIn2UaCR9lGgmTmgnXZRoKX2UaCt9lGgtTmgujAczODY0MDU2lGgwaDFoMmgzaDR9lChoNk5oN05oOE5oOU5oOk5oO05oPE5oPU5oPk5oP05oQE5oQU5oQk5oQ051aESJaEVoSHVidX2UKGgOjCRodHRwOi8vd3d3LmltZGIuY29tL3RpdGxlL3R0NzA3ODY1OC+UaBBoEymBlH2UKGgWfZQoaBCMElRoZSBEYXkgU2hhbGwgQ29tZZRoGWgaaE9N4wd1aB1OaB6MBEFuZHmUaCB9lGgifZRoJH2UaCZOaCddlGgpfZRoK32UaC1OaC6MBzcwNzg2NTiUaDBoMWgyaDNoNH2UKGg2Tmg3Tmg4Tmg5Tmg6Tmg7Tmg8Tmg9Tmg+Tmg/TmhATmhBTmhCTmhDTnVoRIloRWhIdWJ1fZQoaA6MJGh0dHA6Ly93d3cuaW1kYi5jb20vdGl0bGUvdHQ2MTA3NTQ4L5RoEGgTKYGUfZQoaBZ9lChoEIwKTGF0ZSBOaWdodJRoGWgaaE9N4wd1aB1OaB5oMWggfZRoIn2UaCR9lGgmTmgnXZRoKX2UaCt9lGgtTmgujAc2MTA3NTQ4lGgwaDFoMmgzaDR9lChoNk5oN05oOE5oOU5oOk5oO05oPE5oPU5oPk5oP05oQE5oQU5oQk5oQ051aESJaEVoSHVidWWMCmNlbGViX25hbWWUjAxEZW5pcyBPJ0hhcmWUjAdjZWxlYklElIwHMDY0MTM1NJR1dS4=','2019-04-02 16:36:10.742190');
CREATE TABLE IF NOT EXISTS `django_migrations` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`app`	varchar ( 255 ) NOT NULL,
	`name`	varchar ( 255 ) NOT NULL,
	`applied`	datetime NOT NULL
);
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-03-14 16:51:09.119288');
INSERT INTO `django_migrations` VALUES (2,'auth','0001_initial','2019-03-14 16:51:09.284787');
INSERT INTO `django_migrations` VALUES (3,'admin','0001_initial','2019-03-14 16:51:09.430929');
INSERT INTO `django_migrations` VALUES (4,'admin','0002_logentry_remove_auto_add','2019-03-14 16:51:09.552595');
INSERT INTO `django_migrations` VALUES (5,'admin','0003_logentry_add_action_flag_choices','2019-03-14 16:51:09.666011');
INSERT INTO `django_migrations` VALUES (6,'contenttypes','0002_remove_content_type_name','2019-03-14 16:51:09.778998');
INSERT INTO `django_migrations` VALUES (7,'auth','0002_alter_permission_name_max_length','2019-03-14 16:51:09.868051');
INSERT INTO `django_migrations` VALUES (8,'auth','0003_alter_user_email_max_length','2019-03-14 16:51:09.936105');
INSERT INTO `django_migrations` VALUES (9,'auth','0004_alter_user_username_opts','2019-03-14 16:51:10.006627');
INSERT INTO `django_migrations` VALUES (10,'auth','0005_alter_user_last_login_null','2019-03-14 16:51:10.102258');
INSERT INTO `django_migrations` VALUES (11,'auth','0006_require_contenttypes_0002','2019-03-14 16:51:10.124988');
INSERT INTO `django_migrations` VALUES (12,'auth','0007_alter_validators_add_error_messages','2019-03-14 16:51:10.212693');
INSERT INTO `django_migrations` VALUES (13,'auth','0008_alter_user_username_max_length','2019-03-14 16:51:10.318878');
INSERT INTO `django_migrations` VALUES (14,'auth','0009_alter_user_last_name_max_length','2019-03-14 16:51:10.403723');
INSERT INTO `django_migrations` VALUES (15,'deja','0001_initial','2019-03-14 16:51:10.557621');
INSERT INTO `django_migrations` VALUES (16,'sessions','0001_initial','2019-03-14 16:51:10.615586');
CREATE TABLE IF NOT EXISTS `django_content_type` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`app_label`	varchar ( 100 ) NOT NULL,
	`model`	varchar ( 100 ) NOT NULL
);
INSERT INTO `django_content_type` VALUES (1,'admin','logentry');
INSERT INTO `django_content_type` VALUES (2,'auth','permission');
INSERT INTO `django_content_type` VALUES (3,'auth','group');
INSERT INTO `django_content_type` VALUES (4,'auth','user');
INSERT INTO `django_content_type` VALUES (5,'contenttypes','contenttype');
INSERT INTO `django_content_type` VALUES (6,'sessions','session');
INSERT INTO `django_content_type` VALUES (7,'deja','deja');
INSERT INTO `django_content_type` VALUES (8,'deja','note');
INSERT INTO `django_content_type` VALUES (9,'deja','queue');
INSERT INTO `django_content_type` VALUES (10,'deja','result');
CREATE TABLE IF NOT EXISTS `django_admin_log` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`action_time`	datetime NOT NULL,
	`object_id`	text,
	`object_repr`	varchar ( 200 ) NOT NULL,
	`change_message`	text NOT NULL,
	`content_type_id`	integer,
	`user_id`	integer NOT NULL,
	`action_flag`	smallint unsigned NOT NULL,
	FOREIGN KEY(`content_type_id`) REFERENCES `django_content_type`(`id`) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`) DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS `deja_result` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar ( 100 ) NOT NULL,
	`probability`	real NOT NULL,
	`deja_id`	integer NOT NULL,
	FOREIGN KEY(`deja_id`) REFERENCES `deja_deja`(`id`) DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO `deja_result` VALUES (26,'Meryl Streep',0.99,7);
INSERT INTO `deja_result` VALUES (27,'Susan Blommaert',0.17,7);
INSERT INTO `deja_result` VALUES (28,'Emily Fitzroy',0.15,7);
INSERT INTO `deja_result` VALUES (29,'Virginia McKenna',0.12,7);
INSERT INTO `deja_result` VALUES (30,'Gretchen Wyler',0.11,7);
INSERT INTO `deja_result` VALUES (31,'Gal Gadot',0.4,8);
INSERT INTO `deja_result` VALUES (32,'Ashley Frangipane',0.1,8);
INSERT INTO `deja_result` VALUES (33,'Vina Morales',0.07,8);
INSERT INTO `deja_result` VALUES (34,'Phoebe Cates',0.06,8);
INSERT INTO `deja_result` VALUES (35,'Weronika Rosati',0.04,8);
INSERT INTO `deja_result` VALUES (60,'Lexi Johnson',0.15,26);
INSERT INTO `deja_result` VALUES (61,'Kasia Smutniak',0.11,26);
INSERT INTO `deja_result` VALUES (62,'Yelle',0.05,26);
INSERT INTO `deja_result` VALUES (63,'Reagan Pasternak',0.05,26);
INSERT INTO `deja_result` VALUES (64,'Vanessa Demouy',0.03,26);
INSERT INTO `deja_result` VALUES (70,'Ann Dowd',0.81,45);
INSERT INTO `deja_result` VALUES (71,'Emma Dunn',0.2,45);
INSERT INTO `deja_result` VALUES (72,'Jessica Hynes',0.13,45);
INSERT INTO `deja_result` VALUES (73,'Jeanette Nolan',0.11,45);
INSERT INTO `deja_result` VALUES (74,'Lalita Pawar',0.08,45);
CREATE TABLE IF NOT EXISTS `deja_queue` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`title`	varchar ( 100 ) NOT NULL,
	`watched`	bool NOT NULL,
	`user_id`	integer NOT NULL,
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`) DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO `deja_queue` VALUES (2,'The Goldfinch',0,1);
INSERT INTO `deja_queue` VALUES (5,'The Sopranos (2000-2004)',1,1);
INSERT INTO `deja_queue` VALUES (12,'Maleficent: Mistress of Evil',0,1);
INSERT INTO `deja_queue` VALUES (13,'Those Who Wish Me Dead',0,1);
INSERT INTO `deja_queue` VALUES (16,'Big Little Lies',1,1);
INSERT INTO `deja_queue` VALUES (19,'Captain Marvel',0,1);
INSERT INTO `deja_queue` VALUES (20,'The Good Place (2016-2019)',0,1);
INSERT INTO `deja_queue` VALUES (22,'The Handmaid''s Tale (2017-2018)',0,1);
INSERT INTO `deja_queue` VALUES (52,'The Dressmaker',1,3);
INSERT INTO `deja_queue` VALUES (53,'The Scarapist',0,1);
INSERT INTO `deja_queue` VALUES (71,'Spider-Man: Into the Spider-Verse',1,1);
CREATE TABLE IF NOT EXISTS `deja_note` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`text`	text NOT NULL,
	`deja_id`	integer NOT NULL UNIQUE,
	FOREIGN KEY(`deja_id`) REFERENCES `deja_deja`(`id`) DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO `deja_note` VALUES (2,'',8);
INSERT INTO `deja_note` VALUES (6,'gitchy gitchy ya ya da dadfdf',12);
INSERT INTO `deja_note` VALUES (11,'',26);
INSERT INTO `deja_note` VALUES (13,'I can add note?',29);
CREATE TABLE IF NOT EXISTS `deja_deja` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`created`	datetime NOT NULL,
	`img_url`	varchar ( 100 ) NOT NULL,
	`user_id`	integer NOT NULL,
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`) DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO `deja_deja` VALUES (7,'2019-03-08 21:01:57.956098','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/doubt.jpeg?alt=media&token=2492903e-a29d-46c5-af08-5c57d6afbf04',1);
INSERT INTO `deja_deja` VALUES (8,'2019-03-08 21:05:30.162681','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/wonder%20woman.jpg?alt=media&token=8a72313e-9700-4d82-b733-c5e0a7d6ea7f',1);
INSERT INTO `deja_deja` VALUES (12,'2019-03-08 22:12:06.215844','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/moulin%20guy.jpg?alt=media&token=361aaf1d-9fcf-4999-892d-d65acf3b40a7',1);
INSERT INTO `deja_deja` VALUES (26,'2019-03-11 21:01:54.512728','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/captainmarvel.jpg?alt=media&token=8acc33ab-180e-4880-b2b6-744031f97f57',1);
INSERT INTO `deja_deja` VALUES (28,'2019-03-12 18:49:52.407219','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/mastergirl.gif?alt=media&token=f7886b84-81e6-4f6e-8238-0bb21ea9b909',1);
INSERT INTO `deja_deja` VALUES (29,'2019-03-12 18:50:41.909802','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/russian%20doll.jpg?alt=media&token=77f3fc9a-2d77-46e5-9f76-da767315561c',1);
INSERT INTO `deja_deja` VALUES (30,'2019-03-12 20:11:55.563546','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/room.jpg?alt=media&token=fe5b1b91-d362-4618-95cc-00be0955f220',1);
INSERT INTO `deja_deja` VALUES (31,'2019-03-12 20:31:47.166260','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/maleficent.jpg?alt=media&token=c9bb118a-df8d-4cda-b0d9-15c238ca1d49',1);
INSERT INTO `deja_deja` VALUES (32,'2019-03-12 23:08:54.478642','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/mygirl2.png?alt=media&token=265ff826-ac1c-49ac-91e2-6a1e4285bb2a',1);
INSERT INTO `deja_deja` VALUES (38,'2019-03-14 20:10:53.593663','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/IMG-7494.JPG?alt=media&token=9d30be2b-a063-41c3-832c-7fc717e5cb85',1);
INSERT INTO `deja_deja` VALUES (43,'2019-03-15 16:21:04.417717','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/snakesonaplane.jpg?alt=media&token=cd5fc181-fe1c-4e2b-aba0-a182c1a6ef0c',1);
INSERT INTO `deja_deja` VALUES (45,'2019-03-18 01:15:45.873754','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/handmaid.png?alt=media&token=02b3a98b-90e9-4f5f-81c5-ffaedcda7b11',1);
INSERT INTO `deja_deja` VALUES (74,'2019-03-18 20:31:37.762129','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/laworder.jpg?alt=media&token=33906c0b-413d-4ac4-a1ac-040aba8e8b6e',1);
INSERT INTO `deja_deja` VALUES (75,'2019-03-18 20:32:44.671584','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/hilarious.jpg?alt=media&token=82533285-4e1c-4562-be48-05ef7c73d04b',1);
INSERT INTO `deja_deja` VALUES (76,'2019-03-19 04:21:46.753969','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/cm.jpg?alt=media&token=a0753465-7e58-4320-b66c-631259f25c0a',1);
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`user_id`	integer NOT NULL,
	`permission_id`	integer NOT NULL,
	FOREIGN KEY(`permission_id`) REFERENCES `auth_permission`(`id`) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`) DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`user_id`	integer NOT NULL,
	`group_id`	integer NOT NULL,
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`) DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS `auth_user` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`password`	varchar ( 128 ) NOT NULL,
	`last_login`	datetime,
	`is_superuser`	bool NOT NULL,
	`username`	varchar ( 150 ) NOT NULL UNIQUE,
	`first_name`	varchar ( 30 ) NOT NULL,
	`email`	varchar ( 254 ) NOT NULL,
	`is_staff`	bool NOT NULL,
	`is_active`	bool NOT NULL,
	`date_joined`	datetime NOT NULL,
	`last_name`	varchar ( 150 ) NOT NULL
);
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$KrqVE6mjpER2$HhhAQDnZaDY73+EHZHPGy0PiYJF2joh+OZUDZ0DlUKU=','2019-03-19 05:39:23.693885',0,'seahorse','','',0,1,'2019-03-08 19:42:57.803925','');
INSERT INTO `auth_user` VALUES (2,'pbkdf2_sha256$120000$9Ad7f0iq2LEg$TqPqbtACG7TWYRwwiMP2XoeROGTRHQoMtDjUopZzJBg=','2019-03-18 14:53:06.757362',0,'curtainup','','',0,1,'2019-03-18 14:53:06.291266','');
INSERT INTO `auth_user` VALUES (3,'pbkdf2_sha256$120000$glZIVWSbB9hy$spX2xuTlkHHRmadzVEluV4duNA7ZiNVDu2YJLI/BOfY=','2019-03-18 14:56:04.310409',0,'scivarolo','','',0,1,'2019-03-18 14:56:03.853284','');
CREATE TABLE IF NOT EXISTS `auth_permission` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`content_type_id`	integer NOT NULL,
	`codename`	varchar ( 100 ) NOT NULL,
	`name`	varchar ( 255 ) NOT NULL,
	FOREIGN KEY(`content_type_id`) REFERENCES `django_content_type`(`id`) DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO `auth_permission` VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO `auth_permission` VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO `auth_permission` VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO `auth_permission` VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO `auth_permission` VALUES (5,2,'add_permission','Can add permission');
INSERT INTO `auth_permission` VALUES (6,2,'change_permission','Can change permission');
INSERT INTO `auth_permission` VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO `auth_permission` VALUES (8,2,'view_permission','Can view permission');
INSERT INTO `auth_permission` VALUES (9,3,'add_group','Can add group');
INSERT INTO `auth_permission` VALUES (10,3,'change_group','Can change group');
INSERT INTO `auth_permission` VALUES (11,3,'delete_group','Can delete group');
INSERT INTO `auth_permission` VALUES (12,3,'view_group','Can view group');
INSERT INTO `auth_permission` VALUES (13,4,'add_user','Can add user');
INSERT INTO `auth_permission` VALUES (14,4,'change_user','Can change user');
INSERT INTO `auth_permission` VALUES (15,4,'delete_user','Can delete user');
INSERT INTO `auth_permission` VALUES (16,4,'view_user','Can view user');
INSERT INTO `auth_permission` VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO `auth_permission` VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO `auth_permission` VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO `auth_permission` VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO `auth_permission` VALUES (21,6,'add_session','Can add session');
INSERT INTO `auth_permission` VALUES (22,6,'change_session','Can change session');
INSERT INTO `auth_permission` VALUES (23,6,'delete_session','Can delete session');
INSERT INTO `auth_permission` VALUES (24,6,'view_session','Can view session');
INSERT INTO `auth_permission` VALUES (25,7,'add_deja','Can add deja');
INSERT INTO `auth_permission` VALUES (26,7,'change_deja','Can change deja');
INSERT INTO `auth_permission` VALUES (27,7,'delete_deja','Can delete deja');
INSERT INTO `auth_permission` VALUES (28,7,'view_deja','Can view deja');
INSERT INTO `auth_permission` VALUES (29,8,'add_note','Can add note');
INSERT INTO `auth_permission` VALUES (30,8,'change_note','Can change note');
INSERT INTO `auth_permission` VALUES (31,8,'delete_note','Can delete note');
INSERT INTO `auth_permission` VALUES (32,8,'view_note','Can view note');
INSERT INTO `auth_permission` VALUES (33,9,'add_queue','Can add queue');
INSERT INTO `auth_permission` VALUES (34,9,'change_queue','Can change queue');
INSERT INTO `auth_permission` VALUES (35,9,'delete_queue','Can delete queue');
INSERT INTO `auth_permission` VALUES (36,9,'view_queue','Can view queue');
INSERT INTO `auth_permission` VALUES (37,10,'add_result','Can add result');
INSERT INTO `auth_permission` VALUES (38,10,'change_result','Can change result');
INSERT INTO `auth_permission` VALUES (39,10,'delete_result','Can delete result');
INSERT INTO `auth_permission` VALUES (40,10,'view_result','Can view result');
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`group_id`	integer NOT NULL,
	`permission_id`	integer NOT NULL,
	FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(`permission_id`) REFERENCES `auth_permission`(`id`) DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS `auth_group` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar ( 80 ) NOT NULL UNIQUE
);
CREATE INDEX IF NOT EXISTS `django_session_expire_date_a5c62663` ON `django_session` (
	`expire_date`
);
CREATE UNIQUE INDEX IF NOT EXISTS `django_content_type_app_label_model_76bd3d3b_uniq` ON `django_content_type` (
	`app_label`,
	`model`
);
CREATE INDEX IF NOT EXISTS `django_admin_log_user_id_c564eba6` ON `django_admin_log` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `django_admin_log_content_type_id_c4bce8eb` ON `django_admin_log` (
	`content_type_id`
);
CREATE INDEX IF NOT EXISTS `deja_result_deja_id_4d6c1613` ON `deja_result` (
	`deja_id`
);
CREATE INDEX IF NOT EXISTS `deja_queue_user_id_f5b13ea2` ON `deja_queue` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `deja_deja_user_id_43f4fb6c` ON `deja_deja` (
	`user_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` ON `auth_user_user_permissions` (
	`user_id`,
	`permission_id`
);
CREATE INDEX IF NOT EXISTS `auth_user_user_permissions_user_id_a95ead1b` ON `auth_user_user_permissions` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `auth_user_user_permissions_permission_id_1fbb5f2c` ON `auth_user_user_permissions` (
	`permission_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `auth_user_groups_user_id_group_id_94350c0c_uniq` ON `auth_user_groups` (
	`user_id`,
	`group_id`
);
CREATE INDEX IF NOT EXISTS `auth_user_groups_user_id_6a12ed8b` ON `auth_user_groups` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `auth_user_groups_group_id_97559544` ON `auth_user_groups` (
	`group_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `auth_permission_content_type_id_codename_01ab375a_uniq` ON `auth_permission` (
	`content_type_id`,
	`codename`
);
CREATE INDEX IF NOT EXISTS `auth_permission_content_type_id_2f476e4b` ON `auth_permission` (
	`content_type_id`
);
CREATE INDEX IF NOT EXISTS `auth_group_permissions_permission_id_84c5c92e` ON `auth_group_permissions` (
	`permission_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` ON `auth_group_permissions` (
	`group_id`,
	`permission_id`
);
CREATE INDEX IF NOT EXISTS `auth_group_permissions_group_id_b120cbf9` ON `auth_group_permissions` (
	`group_id`
);
COMMIT;
