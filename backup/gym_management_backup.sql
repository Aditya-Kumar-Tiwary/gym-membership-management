-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: gym_management_db
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `attendance_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `check_in_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`attendance_id`),
  KEY `member_id` (`member_id`),
  KEY `idx_attendance_check_in` (`check_in_time`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,1,'2026-11-10 07:00:00'),(2,2,'2026-11-10 07:30:00'),(3,3,'2026-11-11 08:00:00'),(4,4,'2026-11-11 09:00:00'),(5,5,'2026-11-12 06:45:00'),(6,6,'2026-11-12 07:15:00'),(7,7,'2026-11-13 08:30:00'),(8,8,'2026-11-13 09:15:00'),(9,9,'2026-11-14 06:30:00'),(10,10,'2026-11-14 07:45:00');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `join_date` date NOT NULL DEFAULT (curdate()),
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'Aditya','Tiwary','9876510001','aditya@anueg.com','Male','2026-01-10'),(2,'Rohan','Das','9876510002','rohan@anueg.com','Male','2026-01-15'),(3,'Priya','Sharma','9876510003','priya@anueg.com','Female','2026-02-01'),(4,'Ananya','Singh','9876510004','ananya@anueg.com','Female','2026-02-12'),(5,'Rahul','Verma','9876510005','rahul@anueg.com','Male','2026-03-05'),(6,'Sneha','Roy','9876510006','sneha@anueg.com','Female','2026-03-15'),(7,'Amit','Kumar','9876510007','amit@anueg.com','Male','2026-04-01'),(8,'Neha','Gupta','9876510008','neha@anueg.com','Female','2026-04-10'),(9,'Vikash','Mishra','9876510009','vikash@anueg.com','Male','2026-04-15'),(10,'Pooja','Mehta','9876510010','pooja@anueg.com','Female','2026-04-20'),(11,'Karan','Malhotra','9876500099','karan.malhotra@anueg.com','Male','2026-11-24'),(14,'Sahil','Kumar','9876500101','sahil.kumar@anueg.com','Male','2026-11-24'),(15,'Riya','Verma','9876500102','riya.verma@anueg.com','Female','2026-11-24');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership_log`
--

DROP TABLE IF EXISTS `membership_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `membership_id` int NOT NULL,
  `member_id` int NOT NULL,
  `action` varchar(50) NOT NULL,
  `log_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership_log`
--

LOCK TABLES `membership_log` WRITE;
/*!40000 ALTER TABLE `membership_log` DISABLE KEYS */;
INSERT INTO `membership_log` VALUES (1,1,1,'NEW MEMBERSHIP CREATED','2026-11-24 00:02:53'),(2,2,2,'NEW MEMBERSHIP CREATED','2026-11-24 00:02:53'),(3,3,3,'NEW MEMBERSHIP CREATED','2026-11-24 00:02:53'),(4,4,4,'NEW MEMBERSHIP CREATED','2026-11-24 00:02:53'),(5,5,5,'NEW MEMBERSHIP CREATED','2026-11-24 00:02:53'),(6,6,6,'NEW MEMBERSHIP CREATED','2026-11-24 00:02:53'),(7,7,7,'NEW MEMBERSHIP CREATED','2026-11-24 00:02:53'),(8,8,8,'NEW MEMBERSHIP CREATED','2026-11-24 00:02:53'),(9,9,9,'NEW MEMBERSHIP CREATED','2026-11-24 00:02:53'),(10,10,10,'NEW MEMBERSHIP CREATED','2026-11-24 00:02:53'),(11,11,11,'NEW MEMBERSHIP CREATED','2026-11-24 00:24:05');
/*!40000 ALTER TABLE `membership_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memberships`
--

DROP TABLE IF EXISTS `memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `memberships` (
  `membership_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `plan_id` int NOT NULL,
  `trainer_id` int DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('ACTIVE','EXPIRED','CANCELLED') NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (`membership_id`),
  KEY `member_id` (`member_id`),
  KEY `plan_id` (`plan_id`),
  KEY `trainer_id` (`trainer_id`),
  KEY `idx_memberships_end_date` (`end_date`),
  CONSTRAINT `memberships_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  CONSTRAINT `memberships_ibfk_2` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`plan_id`),
  CONSTRAINT `memberships_ibfk_3` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberships`
--

LOCK TABLES `memberships` WRITE;
/*!40000 ALTER TABLE `memberships` DISABLE KEYS */;
INSERT INTO `memberships` VALUES (1,1,4,1,'2026-01-10','2027-01-10','ACTIVE'),(2,2,3,2,'2026-02-15','2026-08-15','ACTIVE'),(3,3,2,3,'2026-03-01','2026-06-01','ACTIVE'),(4,4,1,4,'2026-04-12','2026-05-12','EXPIRED'),(5,5,4,1,'2026-05-05','2027-05-05','ACTIVE'),(6,6,3,2,'2026-06-15','2026-12-15','ACTIVE'),(7,7,2,3,'2026-07-01','2026-10-01','ACTIVE'),(8,8,1,4,'2026-08-10','2026-09-10','ACTIVE'),(9,9,4,1,'2026-09-15','2027-09-15','ACTIVE'),(10,10,3,2,'2026-10-20','2027-04-20','ACTIVE'),(11,11,1,2,'2026-11-24','2026-12-24','ACTIVE');
/*!40000 ALTER TABLE `memberships` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_membership_before_insert` BEFORE INSERT ON `memberships` FOR EACH ROW BEGIN
    DECLARE v_duration INT;

    SELECT duration_months
    INTO v_duration
    FROM plans
    WHERE plan_id = NEW.plan_id;

    SET NEW.end_date =
        DATE_ADD(NEW.start_date, INTERVAL v_duration MONTH);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_membership_after_insert` AFTER INSERT ON `memberships` FOR EACH ROW BEGIN

    INSERT INTO membership_log
    (membership_id, member_id, action)
    VALUES
    (NEW.membership_id, NEW.member_id, 'NEW MEMBERSHIP CREATED');

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `membership_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_method` enum('CASH','UPI','CARD','BANK_TRANSFER') NOT NULL,
  `payment_status` enum('PAID','PENDING','FAILED') NOT NULL DEFAULT 'PENDING',
  PRIMARY KEY (`payment_id`),
  KEY `membership_id` (`membership_id`),
  KEY `idx_payments_payment_date` (`payment_date`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`membership_id`) REFERENCES `memberships` (`membership_id`),
  CONSTRAINT `payments_chk_1` CHECK ((`amount` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,9000.00,'2026-01-10 09:00:00','UPI','PAID'),(2,2,5000.00,'2026-02-15 10:00:00','CASH','PAID'),(3,3,2700.00,'2026-03-01 11:00:00','CARD','PAID'),(4,4,1000.00,'2026-04-12 09:30:00','UPI','PAID'),(5,5,9000.00,'2026-05-05 10:30:00','BANK_TRANSFER','PAID'),(6,6,5000.00,'2026-06-15 08:45:00','UPI','PAID'),(7,7,2700.00,'2026-07-01 12:00:00','CASH','PAID'),(8,8,1000.00,'2026-08-10 09:15:00','CARD','PAID'),(9,9,9000.00,'2026-09-15 10:15:00','UPI','PAID'),(10,10,5000.00,'2026-10-20 11:30:00','CASH','PAID'),(11,11,1000.00,'2026-11-24 00:24:05','UPI','PAID');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans` (
  `plan_id` int NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(50) NOT NULL,
  `duration_months` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`plan_id`),
  UNIQUE KEY `plan_name` (`plan_name`),
  CONSTRAINT `plans_chk_1` CHECK ((`duration_months` > 0)),
  CONSTRAINT `plans_chk_2` CHECK ((`price` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` VALUES (1,'Monthly',1,1000.00,'One month gym membership'),(2,'Quarterly',3,2700.00,'Three months gym membership'),(3,'Half Yearly',6,5000.00,'Six months gym membership'),(4,'Yearly',12,9000.00,'Twelve months gym membership'),(5,'Bi-Monthly',2,1800.00,'Two months gym membership'),(6,'Nine Months',9,7200.00,'Nine months gym membership'),(7,'Two Years',24,16000.00,'Twenty-four months gym membership'),(8,'Student Annual',12,7500.00,'Discounted annual student membership');
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainers`
--

DROP TABLE IF EXISTS `trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainers` (
  `trainer_id` int NOT NULL AUTO_INCREMENT,
  `trainer_name` varchar(100) NOT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`trainer_id`),
  UNIQUE KEY `phone` (`phone`),
  CONSTRAINT `trainers_chk_1` CHECK ((`salary` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainers`
--

LOCK TABLES `trainers` WRITE;
/*!40000 ALTER TABLE `trainers` DISABLE KEYS */;
INSERT INTO `trainers` VALUES (1,'Rahul Sharma','Weight Training','9876500001',25000.00,'2024-01-15'),(2,'Priya Singh','Yoga and Flexibility','9876500002',22000.00,'2023-06-10'),(3,'Amit Verma','Cardio Training','9876500003',24000.00,'2024-03-20'),(4,'Sneha Gupta','Strength Training','9876500004',28000.00,'2022-11-05'),(5,'Arjun Mehta','Personal Training','9876500005',26000.00,'2023-02-14'),(6,'Neha Kapoor','Zumba and Fitness','9876500006',23000.00,'2024-04-10'),(7,'Vikram Patel','CrossFit','9876500007',30000.00,'2022-08-01'),(8,'Meera Joshi','Nutrition and Wellness','9876500008',27000.00,'2023-09-18');
/*!40000 ALTER TABLE `trainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_expiring_memberships`
--

DROP TABLE IF EXISTS `v_expiring_memberships`;
/*!50001 DROP VIEW IF EXISTS `v_expiring_memberships`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_expiring_memberships` AS SELECT 
 1 AS `membership_id`,
 1 AS `member_id`,
 1 AS `member_name`,
 1 AS `phone`,
 1 AS `plan_name`,
 1 AS `end_date`,
 1 AS `days_remaining`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_membership_summary`
--

DROP TABLE IF EXISTS `v_membership_summary`;
/*!50001 DROP VIEW IF EXISTS `v_membership_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_membership_summary` AS SELECT 
 1 AS `membership_id`,
 1 AS `member_id`,
 1 AS `member_name`,
 1 AS `plan_name`,
 1 AS `price`,
 1 AS `trainer_name`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_plan_membership_report`
--

DROP TABLE IF EXISTS `v_plan_membership_report`;
/*!50001 DROP VIEW IF EXISTS `v_plan_membership_report`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_plan_membership_report` AS SELECT 
 1 AS `plan_id`,
 1 AS `plan_name`,
 1 AS `price`,
 1 AS `total_memberships`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_expiring_memberships`
--

/*!50001 DROP VIEW IF EXISTS `v_expiring_memberships`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_expiring_memberships` AS select `ms`.`membership_id` AS `membership_id`,`m`.`member_id` AS `member_id`,concat(`m`.`first_name`,' ',`m`.`last_name`) AS `member_name`,`m`.`phone` AS `phone`,`p`.`plan_name` AS `plan_name`,`ms`.`end_date` AS `end_date`,(to_days(`ms`.`end_date`) - to_days(curdate())) AS `days_remaining` from ((`memberships` `ms` join `members` `m` on((`ms`.`member_id` = `m`.`member_id`))) join `plans` `p` on((`ms`.`plan_id` = `p`.`plan_id`))) where ((`ms`.`status` = 'ACTIVE') and (`ms`.`end_date` between curdate() and (curdate() + interval 7 day))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_membership_summary`
--

/*!50001 DROP VIEW IF EXISTS `v_membership_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_membership_summary` AS select `ms`.`membership_id` AS `membership_id`,`m`.`member_id` AS `member_id`,concat(`m`.`first_name`,' ',`m`.`last_name`) AS `member_name`,`p`.`plan_name` AS `plan_name`,`p`.`price` AS `price`,`t`.`trainer_name` AS `trainer_name`,`ms`.`start_date` AS `start_date`,`ms`.`end_date` AS `end_date`,`ms`.`status` AS `status` from (((`memberships` `ms` join `members` `m` on((`ms`.`member_id` = `m`.`member_id`))) join `plans` `p` on((`ms`.`plan_id` = `p`.`plan_id`))) left join `trainers` `t` on((`ms`.`trainer_id` = `t`.`trainer_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_plan_membership_report`
--

/*!50001 DROP VIEW IF EXISTS `v_plan_membership_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_plan_membership_report` AS select `p`.`plan_id` AS `plan_id`,`p`.`plan_name` AS `plan_name`,`p`.`price` AS `price`,count(`ms`.`membership_id`) AS `total_memberships` from (`plans` `p` left join `memberships` `ms` on((`p`.`plan_id` = `ms`.`plan_id`))) group by `p`.`plan_id`,`p`.`plan_name`,`p`.`price` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-24  0:54:08
