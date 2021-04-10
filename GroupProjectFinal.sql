CREATE DATABASE  IF NOT EXISTS `groupprojectfinal` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `groupprojectfinal`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: groupprojectfinal
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` char(68) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `postalcode` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'Alkinoos','Papakostas','user','$2a$10$0IelkNi0Wc0MXYQYTR8zZuN6ir/t98yG0s.XjQmjlh5U7m7dA4/kq','malakas@hotmail.com','pindou 28','Chaidari',12461),(2,'George','Rouvellas','rouv','$2a$10$7C5R8GyQhk2gS2/VJGr8eunzvYx5CDxZm5NJCnYCdVi/TBq2x26mO','askmdasd@hotma.com','pindou 28','Chaidari',12461),(3,'Petros','Papadatos','pap','$2a$10$uqgH6eV50kXKKPrjfiulm.omsQwIZ1uqtBz02Wgw.yB11F9TDHsRa','pap@gaksd.com','paraliaki 23','alimos',15123);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_has_role`
--

DROP TABLE IF EXISTS `account_has_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_has_role` (
  `account_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`account_id`,`role_id`),
  KEY `roleaccount_roleidFK2` (`role_id`),
  CONSTRAINT `accounthasrole_accountidFK1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  CONSTRAINT `accounthasrole_roleidFK2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_has_role`
--

LOCK TABLES `account_has_role` WRITE;
/*!40000 ALTER TABLE `account_has_role` DISABLE KEYS */;
INSERT INTO `account_has_role` VALUES (1,1),(3,1),(1,2),(2,2),(3,2);
/*!40000 ALTER TABLE `account_has_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_type_id` int NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `price_rate` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_categorytypeid_FK1` (`category_type_id`),
  CONSTRAINT `category_categorytypeid_FK1` FOREIGN KEY (`category_type_id`) REFERENCES `category_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,1,'FHD',1.25),(2,1,'WQHD',1.50),(3,1,'4K UHD',1.75),(4,1,'8K UHD',2.00);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_type`
--

DROP TABLE IF EXISTS `category_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_type`
--

LOCK TABLES `category_type` WRITE;
/*!40000 ALTER TABLE `category_type` DISABLE KEYS */;
INSERT INTO `category_type` VALUES (1,'quality');
/*!40000 ALTER TABLE `category_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quant` int DEFAULT NULL,
  `current_price` decimal(10,2) DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderdetails_orderid_FK1` (`order_id`),
  KEY `orderdetails_product_id_FK2` (`product_id`),
  CONSTRAINT `orderdetails_orderid_FK1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `orderdetails_product_id_FK2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details_has_category`
--

DROP TABLE IF EXISTS `order_details_has_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details_has_category` (
  `order_details_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`order_details_id`,`category_id`),
  KEY `orderdetailshascategory_categoryid_FK2` (`category_id`),
  CONSTRAINT `orderdetailshascategory_categoryid_FK2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `orderdetailshascategory_orderdetailsid_FK1` FOREIGN KEY (`order_details_id`) REFERENCES `order_details` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details_has_category`
--

LOCK TABLES `order_details_has_category` WRITE;
/*!40000 ALTER TABLE `order_details_has_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details_has_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `account_id` int NOT NULL,
  `payment_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_accountid_FK1` (`account_id`),
  KEY `orders_paymentid_FK2` (`payment_id`),
  CONSTRAINT `orders_accountid_FK1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  CONSTRAINT `orders_paymentid_FK2` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'cash'),(2,'credit card');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descr` varchar(30) NOT NULL,
  `path` varchar(100) DEFAULT NULL,
  `base_price` int NOT NULL,
  `product_category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_productcategory_fk1` (`product_category_id`),
  CONSTRAINT `product_productcategory_fk1` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Mountains','/Images/pexels-eberhard-grossgasteiger-1366919.jpg',50,1),(2,'Pathway','/Images/pexels-pixabay-358238.jpg',100,1),(3,'Forest Lake','/Images/pexels-philip-ackermann-1666021.jpg',150,1),(4,'Roadtrip','/Images/pexels-sebastian-palomino-1955134.jpg',200,1),(5,'Village Life','/Images/pexels-daniel-frank-356807.jpg',500,1),(6,'Night Sky','/Images/pexels-eberhard-grossgasteiger-1624438.jpg',1000,1),(7,'Fox','/Images/pexels-alex-andrews-2295744.jpg',250,2),(8,'Eagle','/Images/pexels-flickr-145962.jpg',500,2),(9,'King','/Images/pexels-public-domain-pictures-41315.jpg',600,2),(10,'Wild','/Images/pexels-public-domain-pictures-87403.jpg',500,2),(11,'Freedom','/Images/pexels-david-dibert-635499.jpg',150,2),(12,'Smart','/Images/pexels-public-domain-pictures-40984.jpg',450,2),(13,'Smile','/Images/pexels-pixabay-220453.jpg',500,3),(14,'Metamorphosis','/Images/pexels-photo-935985.jpeg',1000,3),(15,'Braids','/Images/pexels-neemias-seara-3680316.jpg',1200,3),(16,'Joy','/Images/pexels-andrea-piacquadio-774909.jpg',400,3),(17,'Simplicity','/Images/pexels-daniel-xavier-1239291.jpg',950,3),(18,'Confidence','/Images/pexels-mentatdgt-1024311.jpg',475,3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'landscapes'),(2,'animals'),(3,'people');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-10 14:41:05
