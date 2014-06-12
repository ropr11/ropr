CREATE DATABASE  IF NOT EXISTS `ropr` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_czech_ci */;
USE `ropr`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: ropr
-- ------------------------------------------------------
-- Server version	5.6.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `Employee_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Employee_Role_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  UNIQUE KEY `Employee_ID_UNIQUE` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_role`
--

DROP TABLE IF EXISTS `employee_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_role` (
  `role_ID` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`role_ID`),
  UNIQUE KEY `employee_role_ID_UNIQUE` (`role_ID`),
  UNIQUE KEY `role_UNIQUE` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_role`
--

LOCK TABLES `employee_role` WRITE;
/*!40000 ALTER TABLE `employee_role` DISABLE KEYS */;
INSERT INTO `employee_role` VALUES (1,'Driver'),(2,'Operator');
/*!40000 ALTER TABLE `employee_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `Order_ID` int(11) NOT NULL AUTO_INCREMENT,
  `City_from` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `City_to` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `Street_from` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `Street_to` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `Count_of_KM` int(11) DEFAULT NULL,
  `User_ID` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `Status` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `Id_User_Driver` int(11) DEFAULT NULL,
  PRIMARY KEY (`Order_ID`),
  UNIQUE KEY `Id_order_UNIQUE` (`Order_ID`),
  KEY `FK_id_user_idx` (`User_ID`),
  KEY `FK_id_user_driver_idx` (`Id_User_Driver`),
  CONSTRAINT `FK_id_user_driver` FOREIGN KEY (`Id_User_Driver`) REFERENCES `user` (`ID_User`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_user` FOREIGN KEY (`User_ID`) REFERENCES `user` (`ID_User`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 6',132,1,'2014-04-16 00:00:00','',NULL),(4,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova',NULL,1,'2014-04-16 15:12:06','',NULL),(5,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-16 15:12:37','',NULL),(6,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-16 16:19:23','',NULL),(7,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-16 16:20:00','',NULL),(8,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-16 16:27:04','',NULL),(9,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-16 16:38:40','',NULL),(10,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-16 16:44:33','',NULL),(11,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-16 16:49:21','',NULL),(12,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-16 16:52:24','',NULL),(13,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-16 16:57:47','',NULL),(14,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-16 17:00:35','',NULL),(15,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-16 23:42:21','',NULL),(16,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-16 23:56:21','',NULL),(17,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-17 00:31:32','',NULL),(18,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-17 00:36:45','',NULL),(19,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-17 00:38:25','',NULL),(20,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-17 00:39:17','',NULL),(25,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-17 01:19:59','',NULL),(26,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-17 01:25:50','',NULL),(27,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-17 01:29:43','',NULL),(28,'Ostrava','Ostrava','MÃÂ­steckÃÂ¡ 16','Daliborova 31',12,3,'2014-04-17 00:00:00','',NULL),(29,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-17 01:35:58','',NULL),(30,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-17 01:40:00','',NULL),(32,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-17 01:44:08','',NULL),(33,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-17 01:45:10','',NULL),(34,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-17 01:47:52','',NULL),(35,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-17 01:51:08','',NULL),(36,'Ostrava','Ostrava','TlapÃ¡kova 18','Vlasty VlasÃ¡kovÃ© 10',NULL,4,'2014-04-17 08:52:48','',NULL),(37,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-17 12:59:56','',NULL),(38,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-17 13:06:01','',NULL),(39,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-17 13:10:25','',NULL),(40,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-17 13:14:55','',NULL),(41,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-17 13:19:40','',NULL),(42,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-17 13:23:02','',NULL),(43,'Ostrava','Olomouc','Nad Porubkou 12','Brydlova 16',NULL,1,'2014-04-17 13:26:04','',NULL);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `ID_User` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `Password` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `Name` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `Surname` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `Email` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `Phone` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  `City` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `Street` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `ZIP` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `hint` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `passphrase` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`ID_User`),
  UNIQUE KEY `ID_Customer_UNIQUE` (`ID_User`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin','admin','admin','gahy@seznam.cz','123456789','Hulín','Potovní','76824','Oblíbený film','peklo'),(3,'tom','tom','Tomas','Gahura','gahy@gmail.com','123456789','Ostrava','Cihelna 12','70030','Oblíbený film','doma'),(4,'mirek','mirek','Miroslav','Slepi&#269;ka','miroslav@centrum.cz','777657765','12.3.1978','U  Dejnala 12','70030','Oblíbené místo','tady');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_authorization`
--

DROP TABLE IF EXISTS `user_authorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_authorization` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_user_role_idx` (`role_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`ID_User`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_role` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`User_role_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_authorization`
--

LOCK TABLES `user_authorization` WRITE;
/*!40000 ALTER TABLE `user_authorization` DISABLE KEYS */;
INSERT INTO `user_authorization` VALUES (1,1),(3,2),(4,3);
/*!40000 ALTER TABLE `user_authorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `User_role_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Role` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`User_role_ID`),
  UNIQUE KEY `User_role_ID_UNIQUE` (`User_role_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER'),(3,'ROLE_CUSTOMER');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ropr'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-23 19:33:20
