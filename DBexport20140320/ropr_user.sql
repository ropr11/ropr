CREATE DATABASE  IF NOT EXISTS `ropr` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_czech_ci */;
USE `ropr`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: ropr
-- ------------------------------------------------------
-- Server version	5.6.16

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
  PRIMARY KEY (`ID_User`),
  UNIQUE KEY `ID_Customer_UNIQUE` (`ID_User`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin','admin','admin','gahy@seznam.cz','123456789','Hulín','Poštovní','76824'),(46,'test','test','testName','testSurname','testEmail','123456','testCity','testStreet','testZip');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-20  7:49:22
