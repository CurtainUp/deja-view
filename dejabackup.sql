BEGIN TRANSACTION;
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
INSERT INTO `deja_result` VALUES (36,'Brie Larson',0.95,9);
INSERT INTO `deja_result` VALUES (37,'Lana Wood',0.1,9);
INSERT INTO `deja_result` VALUES (38,'Deanna Russo',0.08,9);
INSERT INTO `deja_result` VALUES (39,'Patrice Munsel',0.08,9);
INSERT INTO `deja_result` VALUES (40,'Debbe Dunning',0.07,9);
INSERT INTO `deja_result` VALUES (41,'Andre Braugher',0.99,16);
INSERT INTO `deja_result` VALUES (42,'Magloire',0.67,16);
INSERT INTO `deja_result` VALUES (43,'Mouss Diouf',0.52,16);
INSERT INTO `deja_result` VALUES (44,'Ross Bagley',0.41,16);
INSERT INTO `deja_result` VALUES (50,'Lexi Johnson',0.15,23);
INSERT INTO `deja_result` VALUES (51,'Kasia Smutniak',0.11,23);
INSERT INTO `deja_result` VALUES (52,'Yelle',0.05,23);
INSERT INTO `deja_result` VALUES (53,'Reagan Pasternak',0.05,23);
INSERT INTO `deja_result` VALUES (54,'Vanessa Demouy',0.03,23);
INSERT INTO `deja_result` VALUES (55,'Rachel Ward',0.3,24);
INSERT INTO `deja_result` VALUES (56,'Natasha Lyonne',0.11,24);
INSERT INTO `deja_result` VALUES (57,'Greta Scacchi',0.09,24);
INSERT INTO `deja_result` VALUES (58,'Susan Sarandon',0.09,24);
INSERT INTO `deja_result` VALUES (59,'Patricia Quinn',0.08,24);
INSERT INTO `deja_result` VALUES (60,'Lexi Johnson',0.15,26);
INSERT INTO `deja_result` VALUES (61,'Kasia Smutniak',0.11,26);
INSERT INTO `deja_result` VALUES (62,'Yelle',0.05,26);
INSERT INTO `deja_result` VALUES (63,'Reagan Pasternak',0.05,26);
INSERT INTO `deja_result` VALUES (64,'Vanessa Demouy',0.03,26);
CREATE TABLE IF NOT EXISTS `deja_note` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`text`	text NOT NULL,
	`deja_id`	integer NOT NULL UNIQUE,
	FOREIGN KEY(`deja_id`) REFERENCES `deja_deja`(`id`) DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO `deja_note` VALUES (2,'',8);
INSERT INTO `deja_note` VALUES (3,'aDfkjf',9);
INSERT INTO `deja_note` VALUES (4,'There''s a sequel coming!!',10);
INSERT INTO `deja_note` VALUES (5,'info',11);
INSERT INTO `deja_note` VALUES (6,'gitchy gitchy ya ya da dadfdf',12);
INSERT INTO `deja_note` VALUES (7,'she deserved the oscar',13);
INSERT INTO `deja_note` VALUES (8,'Testing from an actual phone pic! It worked! But why is it flipped?',16);
INSERT INTO `deja_note` VALUES (10,'This movie should be really good! I still need to see Room...',23);
INSERT INTO `deja_note` VALUES (11,'',26);
INSERT INTO `deja_note` VALUES (12,'I''m so glad she won!',27);
INSERT INTO `deja_note` VALUES (13,'I can add note?',29);
CREATE TABLE IF NOT EXISTS `deja_deja` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`created`	datetime NOT NULL,
	`img_url`	varchar ( 100 ) NOT NULL,
	`user_id`	integer NOT NULL,
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`) DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO `deja_deja` VALUES (3,'2019-03-08 20:32:33.452499','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/maleficent.jpg?alt=media&token=947e95cb-3872-44e5-92e1-a6985efe58ae',1);
INSERT INTO `deja_deja` VALUES (6,'2019-03-08 20:42:11.326997','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/maleficent.jpg?alt=media&token=211b3c36-92e0-43ae-91cd-0ee1c1a36383',1);
INSERT INTO `deja_deja` VALUES (7,'2019-03-08 21:01:57.956098','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/doubt.jpeg?alt=media&token=2492903e-a29d-46c5-af08-5c57d6afbf04',1);
INSERT INTO `deja_deja` VALUES (8,'2019-03-08 21:05:30.162681','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/wonder%20woman.jpg?alt=media&token=8a72313e-9700-4d82-b733-c5e0a7d6ea7f',1);
INSERT INTO `deja_deja` VALUES (9,'2019-03-08 21:32:50.284049','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/room.jpg?alt=media&token=c7b29134-f01e-462b-b591-a28ba78956e7',1);
INSERT INTO `deja_deja` VALUES (10,'2019-03-08 21:37:32.264726','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/maleficent.jpg?alt=media&token=e5bc19cf-ed6e-4eaf-a904-d034c5b8fe99',1);
INSERT INTO `deja_deja` VALUES (11,'2019-03-08 21:56:06.023674','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/russian%20doll.jpg?alt=media&token=ac999c52-013b-4a6e-a780-ca68a95a558d',1);
INSERT INTO `deja_deja` VALUES (12,'2019-03-08 22:12:06.215844','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/moulin%20guy.jpg?alt=media&token=361aaf1d-9fcf-4999-892d-d65acf3b40a7',1);
INSERT INTO `deja_deja` VALUES (13,'2019-03-08 22:16:15.881790','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/room.jpg?alt=media&token=c8ffb13a-9f3f-4c6f-a4af-c6eadd2b3120',1);
INSERT INTO `deja_deja` VALUES (14,'2019-03-09 01:57:41.395012','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/russian%20doll.jpg?alt=media&token=5037a435-e180-4bd5-b9c8-b29e23d97330',1);
INSERT INTO `deja_deja` VALUES (15,'2019-03-09 01:58:18.362712','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/russian%20doll.jpg?alt=media&token=5037a435-e180-4bd5-b9c8-b29e23d97330',1);
INSERT INTO `deja_deja` VALUES (16,'2019-03-09 05:16:13.422246','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/IMG-7494.JPG?alt=media&token=84cf4948-3cc2-49c2-bad4-0912e944fcba',1);
INSERT INTO `deja_deja` VALUES (23,'2019-03-11 17:34:34.906370','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/captainmarvel.jpg?alt=media&token=1b9965cd-218e-4036-880c-b5bb0b24512b',1);
INSERT INTO `deja_deja` VALUES (24,'2019-03-11 17:36:22.161372','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/russian%20doll.jpg?alt=media&token=26924233-09f1-4a70-8993-eaa03462bad1',1);
INSERT INTO `deja_deja` VALUES (26,'2019-03-11 21:01:54.512728','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/captainmarvel.jpg?alt=media&token=8acc33ab-180e-4880-b2b6-744031f97f57',1);
INSERT INTO `deja_deja` VALUES (27,'2019-03-11 21:48:06.903211','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/mygirl2.png?alt=media&token=c2be31f9-75f7-480f-8d4e-ecf0cd9a75a3',1);
INSERT INTO `deja_deja` VALUES (28,'2019-03-12 18:49:52.407219','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/mastergirl.gif?alt=media&token=f7886b84-81e6-4f6e-8238-0bb21ea9b909',1);
INSERT INTO `deja_deja` VALUES (29,'2019-03-12 18:50:41.909802','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/russian%20doll.jpg?alt=media&token=77f3fc9a-2d77-46e5-9f76-da767315561c',1);
INSERT INTO `deja_deja` VALUES (30,'2019-03-12 20:11:55.563546','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/room.jpg?alt=media&token=fe5b1b91-d362-4618-95cc-00be0955f220',1);
INSERT INTO `deja_deja` VALUES (31,'2019-03-12 20:31:47.166260','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/maleficent.jpg?alt=media&token=c9bb118a-df8d-4cda-b0d9-15c238ca1d49',1);
INSERT INTO `deja_deja` VALUES (32,'2019-03-12 23:08:54.478642','https://firebasestorage.googleapis.com/v0/b/dejaview-d81e4.appspot.com/o/mygirl2.png?alt=media&token=265ff826-ac1c-49ac-91e2-6a1e4285bb2a',1);
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$KrqVE6mjpER2$HhhAQDnZaDY73+EHZHPGy0PiYJF2joh+OZUDZ0DlUKU=','2019-03-09 05:45:35.333801',0,'seahorse','','',0,1,'2019-03-08 19:42:57.803925','');
CREATE INDEX IF NOT EXISTS `deja_result_deja_id_4d6c1613` ON `deja_result` (
	`deja_id`
);
CREATE INDEX IF NOT EXISTS `deja_deja_user_id_43f4fb6c` ON `deja_deja` (
	`user_id`
);
COMMIT;
