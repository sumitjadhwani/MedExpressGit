-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: pms
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.19.04.1

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
-- Table structure for table `distributer`
--

DROP TABLE IF EXISTS `distributer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distributer` (
  `dist_id` int(11) NOT NULL,
  `dist_name` varchar(30) DEFAULT NULL,
  `dist_mob` mediumtext,
  `dist_addr` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dist_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributer`
--

LOCK TABLES `distributer` WRITE;
/*!40000 ALTER TABLE `distributer` DISABLE KEYS */;
INSERT INTO `distributer` VALUES (1,'Sun Pharma','978465165','K.M chowk,bengaluru'),(2,'Reddy Pharma','888888888','Laxmi road Chennai'),(3,'Kapoor And Sons','844465165','Bandra west mumbai'),(4,'Pablo and Co.','788465165','Delhi'),(5,'Kabra pharma industries','78965165','Kabra colony Bhandara'),(6,'Mittal Pharamaceuticals','78965165','KP Pune'),(7,'Appolo Meds','78965165','Nagpur');
/*!40000 ALTER TABLE `distributer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug`
--

DROP TABLE IF EXISTS `drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug` (
  `drug_id` int(11) NOT NULL,
  `expiry` date NOT NULL,
  `stock` int(11) DEFAULT NULL,
  KEY `drug_id` (`drug_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug`
--

LOCK TABLES `drug` WRITE;
/*!40000 ALTER TABLE `drug` DISABLE KEYS */;
INSERT INTO `drug` VALUES (8,'2020-05-05',5);
/*!40000 ALTER TABLE `drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug_details`
--

DROP TABLE IF EXISTS `drug_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug_details` (
  `drug_id` int(11) NOT NULL,
  `expiry` date NOT NULL,
  `stock` int(11) DEFAULT NULL,
  KEY `drug_id` (`drug_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug_details`
--

LOCK TABLES `drug_details` WRITE;
/*!40000 ALTER TABLE `drug_details` DISABLE KEYS */;
INSERT INTO `drug_details` VALUES (1,'2020-01-12',15),(13,'2021-05-20',25),(2,'2021-05-05',10),(1,'2021-05-20',10),(2,'2020-02-02',20),(2,'2022-01-05',10),(14,'2021-02-05',10),(14,'2022-12-02',15);
/*!40000 ALTER TABLE `drug_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drugs`
--

DROP TABLE IF EXISTS `drugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drugs` (
  `drug_id` int(11) NOT NULL AUTO_INCREMENT,
  `cost_price` int(11) DEFAULT NULL,
  `dist_id` int(11) DEFAULT NULL,
  `drug_name` varchar(30) NOT NULL,
  `location` varchar(30) DEFAULT NULL,
  `tot_stock` int(11) DEFAULT NULL,
  `sell_price` int(11) DEFAULT NULL,
  `packaging` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`drug_id`),
  KEY `dist_id` (`dist_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drugs`
--

LOCK TABLES `drugs` WRITE;
/*!40000 ALTER TABLE `drugs` DISABLE KEYS */;
INSERT INTO `drugs` VALUES (14,170,1,'NebistarSA','drawer_5',25,200,'strip of 10'),(2,150,2,'crocin','drawer_2',40,200,'strip of 10'),(3,175,5,'paracetamol','drawer_3',15,250,'strip of 15'),(4,225,4,'adulsa','drawer_4',25,250,'bottle of 75ml'),(5,150,5,'moov','drawer_5',20,200,'tube of 30g'),(6,130,6,'omnigel','drawer_6',25,170,'tube of 35g'),(7,160,7,'coldact','drawer_7',30,215,'strip of 10');
/*!40000 ALTER TABLE `drugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(30) DEFAULT NULL,
  `emp_mob` mediumtext,
  `emp_salary` int(11) DEFAULT NULL,
  `emp_pass` varchar(15) DEFAULT NULL,
  `emp_usename` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Rajas Agrawal','978465165',15000,'rajas@123','rajas123'),(2,'Jayesh Pande','888888888',18000,'123456','jayesh1'),(3,'Varun Thakur','844465165',15000,'v@123','varunthakur'),(4,'Biswa Rath','788465165',12000,'biswa43','biswa'),(5,'Sumit Kulkarni','78965165',10000,'sumit43','Sumit57'),(6,'Bablu Fhatak','9786786786',20000,'bablu','bablu');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_details`
--

DROP TABLE IF EXISTS `purchase_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_details` (
  `dist_id` int(11) DEFAULT NULL,
  `drug_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `cost_price` int(11) DEFAULT NULL,
  KEY `drug_id` (`drug_id`),
  KEY `dist_id` (`dist_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_details`
--

LOCK TABLES `purchase_details` WRITE;
/*!40000 ALTER TABLE `purchase_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_details`
--

DROP TABLE IF EXISTS `sales_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_details` (
  `drug_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `cust_name` varchar(30) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `sale_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `price` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `amt` int(11) DEFAULT NULL,
  KEY `drug_id` (`drug_id`),
  KEY `emp_id` (`emp_id`),
  KEY `sale_id` (`sale_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_details`
--

LOCK TABLES `sales_details` WRITE;
/*!40000 ALTER TABLE `sales_details` DISABLE KEYS */;
INSERT INTO `sales_details` VALUES (2,1,'kabra',1,'2019-10-11 17:10:40',200,1,200),(5,1,'kabra',1,'2019-10-11 17:10:58',200,1,200),(7,1,'sumit',2,'2019-10-11 19:00:24',215,1,215),(5,1,'sumit',2,'2019-10-11 19:00:24',200,1,200),(2,1,'abhay',3,'2019-10-11 19:01:50',200,1,200),(7,1,'abhay',3,'2019-10-11 19:01:50',215,1,215),(6,1,'yash',4,'2019-10-11 19:12:13',170,1,170),(2,1,'yash',4,'2019-10-11 19:12:13',200,1,200),(7,1,'abhay',5,'2019-10-11 19:15:14',215,1,215),(6,1,'ankush',6,'2019-10-11 19:18:22',170,1,170),(6,1,'ankush',6,'2019-10-11 19:18:22',170,1,170),(2,1,'ankush',6,'2019-10-11 19:18:22',200,1,200),(5,1,'hrushi',7,'2019-10-11 19:20:23',200,1,200),(2,1,'hrushi',7,'2019-10-11 19:20:23',200,1,200),(3,1,'Patil',8,'2019-10-12 04:18:59',250,1,250),(7,1,'Patil',8,'2019-10-12 04:18:59',215,2,430),(5,1,'fds',9,'2019-10-12 04:31:45',200,1,200),(7,1,'fds',9,'2019-10-12 04:31:45',215,1,215),(5,1,'dssa',10,'2019-10-12 04:41:32',200,1,200),(6,1,'Abhay',11,'2019-10-14 04:36:42',170,2,340),(5,1,'Abhay',11,'2019-10-14 04:36:42',200,1,200),(4,1,'',12,'2019-10-14 04:37:52',250,1,250),(3,1,'',12,'2019-10-14 04:37:52',250,1,250),(6,1,'default',13,'2019-10-14 04:42:35',170,1,85),(3,1,'default',14,'2019-10-14 04:45:09',250,1,250);
/*!40000 ALTER TABLE `sales_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_transaction`
--

DROP TABLE IF EXISTS `sales_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_transaction` (
  `sale_id` int(11) NOT NULL,
  `sale_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cust_name` varchar(30) DEFAULT NULL,
  `tot_amt` int(11) DEFAULT NULL,
  `tot_qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`sale_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_transaction`
--

LOCK TABLES `sales_transaction` WRITE;
/*!40000 ALTER TABLE `sales_transaction` DISABLE KEYS */;
INSERT INTO `sales_transaction` VALUES (1,'2019-10-11 17:06:35','kabra',400,2),(4,'2019-10-11 19:12:13','yash',370,2),(5,'2019-10-11 19:15:14','abhay',215,1),(6,'2019-10-11 19:18:22','ankush',540,3),(7,'2019-10-11 19:20:23','hrushi',400,2),(8,'2019-10-12 04:18:59','Patil',680,2),(9,'2019-10-12 04:31:45','fds',415,2),(10,'2019-10-12 04:41:32','dssa',200,1),(11,'2019-10-14 04:36:42','Abhay',540,2),(12,'2019-10-14 04:37:52','',500,2),(13,'2019-10-14 04:42:35','default',85,1),(14,'2019-10-14 04:45:09','default',250,1);
/*!40000 ALTER TABLE `sales_transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-14 10:48:41
