DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `departments` VALUES (1,'Information Technology','2020-08-21 19:04:27.128166','2020-08-21 19:04:27.128166'),(2,'Accounting','2020-08-21 19:04:33.855555','2020-08-21 19:04:33.855555'),(3,'Human Resources','2020-08-21 19:04:40.087660','2020-08-21 19:04:40.087660');

DROP TABLE IF EXISTS `departments_users`;
CREATE TABLE `departments_users` (
  `department_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  KEY `index_departments_users_on_department_id_and_user_id` (`department_id`,`user_id`),
  KEY `index_departments_users_on_user_id_and_department_id` (`user_id`,`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `departments_users` VALUES (2,1),(3,1);

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `permalink` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pages_on_subject_id` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `pages` VALUES (1,1,'First Page',NULL,1,1,'This is the first page.','2020-01-30 21:06:34.713072','2020-01-30 21:06:34.713072'),(2,1,'Second Page',NULL,2,1,NULL,'2020-01-30 21:08:14.124494','2020-01-30 21:08:14.124494');

DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `schema_migrations` VALUES ('20200128181810'),('20200128182204'),('20200128193438'),('20200128193447'),('20200821190107'),('20200821190212');

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `subjects` VALUES (1,'Initial Subject',1,1,'2020-01-29 21:26:41.003381','2020-01-29 21:43:35.046935'),(2,'Next Subject',2,0,'2020-01-29 21:28:33.046879','2020-01-29 21:46:21.997805'),(5,'Another subject',3,1,'2020-08-10 01:21:44.258130','2020-08-10 01:21:44.258130'),(6,'Callback subject',4,1,'2020-08-15 01:11:27.271292','2020-08-15 01:37:27.455514'),(7,'Maximum subject',5,1,'2020-08-15 01:38:27.278131','2020-08-15 01:38:27.278131');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `users` VALUES (1,'Kevin','Skoglund','someone@nowhere.com','2020-08-09 22:11:58.161210','2020-08-09 22:11:58.161210');
