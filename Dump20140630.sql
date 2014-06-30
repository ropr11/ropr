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
  CONSTRAINT `FK_id_user` FOREIGN KEY (`User_ID`) REFERENCES `user` (`ID_User`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_user_driver` FOREIGN KEY (`Id_User_Driver`) REFERENCES `user` (`ID_User`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (44,'Ostrava','Olomouc','Nad Porubkou 16','Brydlova 16',11,3,'2014-04-24 01:46:23','DONE',3),(45,'Ostrava','Olomouc','U Haldy 52','PavlovskÃÂ¡',12,1,'2014-04-24 09:48:44','DONE',3),(46,'Ostrava','Olomouc','Uhaldy 52','Daliborova 31',122,1,'2014-04-25 00:40:04','DONE',3),(47,'PelehÃÂimov','Praha','PalackÃ©ho','NÃÂ¡bÃÂeÃÂ¾ÃÂ­',NULL,1,'2014-05-05 11:21:03','PREPARE',3);
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
INSERT INTO `user` VALUES (1,'admin','admin','admin','admin','gahy@seznam.cz','123456789','Hulín','Potovní','76824','Oblíbený film','peklo'),(3,'tom','t','Tomas','Gahura','gahy@gmail.com','123456789','Ostrava','Cihelna 12','70030','Oblíbený film','doma'),(4,'mirek','mirek','Miroslav','Slepi&#269;ka','miroslav@centrum.cz','777657765','12.3.1978','U  Dejnala 12','70030','Oblíbené místo','tady');
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
INSERT INTO `user_role` VALUES (1,'ADMIN'),(2,'USER'),(3,'CUSTOMER');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-30 16:55:53