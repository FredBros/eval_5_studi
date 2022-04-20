-- MariaDB dump 10.19  Distrib 10.7.3-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: theatre_studi
-- ------------------------------------------------------
-- Server version	10.7.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES
(1,'Gabriel'),
(2,'In the Line of Fire'),
(3,'Shock Doctrine, The'),
(4,'Clifford'),
(5,'Short Circuit'),
(6,'Spring Break'),
(7,'Rebel Without a Cause'),
(8,'Mo'),
(9,'Manny'),
(10,'Men Who Tread on the Tiger\'s Tail, The (Tora no o wo fumu otokotachi)');
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate`
--

DROP TABLE IF EXISTS `rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate` (
  `category` varchar(50) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate`
--

LOCK TABLES `rate` WRITE;
/*!40000 ALTER TABLE `rate` DISABLE KEYS */;
INSERT INTO `rate` VALUES
('Étudiant',7.6),
('Moins de 14 ans',5.9),
('Plein tarif',9.2);
/*!40000 ALTER TABLE `rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `seats` int(11) NOT NULL,
  `room` varchar(255) NOT NULL,
  `theatre_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `theatre_id` (`theatre_id`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`theatre_id`) REFERENCES `theatre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES
(1,188,'12',8),
(2,0,'',NULL),
(3,227,'12',1),
(4,0,'',NULL),
(5,80,'13',5),
(6,0,'',NULL),
(7,53,'8',7),
(8,0,'',NULL),
(9,330,'3',7),
(10,0,'',NULL),
(11,128,'5',8),
(12,0,'',NULL),
(13,88,'14',2),
(14,0,'',NULL),
(15,156,'18',7),
(16,0,'',NULL),
(17,360,'2',3),
(18,0,'',NULL),
(19,276,'18',8);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showing`
--

DROP TABLE IF EXISTS `showing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `showing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `schedule` datetime NOT NULL,
  `reserved_seats` int(11) NOT NULL,
  `room_id` int(10) unsigned DEFAULT NULL,
  `film_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`),
  KEY `film_id` (`film_id`),
  CONSTRAINT `showing_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `showing_ibfk_2` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showing`
--

LOCK TABLES `showing` WRITE;
/*!40000 ALTER TABLE `showing` DISABLE KEYS */;
INSERT INTO `showing` VALUES
(1,'2021-11-29 13:53:58',8,1,4),
(2,'2021-09-12 11:55:17',26,7,1),
(3,'2021-05-10 21:20:29',19,9,2),
(4,'2022-02-01 09:40:19',29,9,7),
(5,'2021-06-24 10:08:48',1,3,9),
(6,'2021-11-03 08:09:48',35,4,8),
(7,'2022-04-06 10:41:21',6,2,1),
(8,'2022-04-10 00:25:24',34,2,9),
(9,'2021-11-28 12:24:47',36,1,10),
(10,'2022-03-07 17:43:43',8,4,8);
/*!40000 ALTER TABLE `showing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showing_viewer`
--

DROP TABLE IF EXISTS `showing_viewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `showing_viewer` (
  `showing_id` int(10) unsigned NOT NULL,
  `viewer_id` int(10) unsigned NOT NULL,
  KEY `showing_id` (`showing_id`),
  KEY `viewer_id` (`viewer_id`),
  CONSTRAINT `showing_viewer_ibfk_1` FOREIGN KEY (`showing_id`) REFERENCES `showing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `showing_viewer_ibfk_2` FOREIGN KEY (`viewer_id`) REFERENCES `viewer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showing_viewer`
--

LOCK TABLES `showing_viewer` WRITE;
/*!40000 ALTER TABLE `showing_viewer` DISABLE KEYS */;
/*!40000 ALTER TABLE `showing_viewer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theatre`
--

DROP TABLE IF EXISTS `theatre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theatre` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `postcode` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theatre`
--

LOCK TABLES `theatre` WRITE;
/*!40000 ALTER TABLE `theatre` DISABLE KEYS */;
INSERT INTO `theatre` VALUES
(1,'Horseweed','8517 Boyd Lane','Ina',33354),
(2,'Holly Osmanthus','08 Rieder Trail','Kréstena',65616),
(3,'Burgess\' Skin Lichen','03 Heffernan Alley','Debrecen',14032),
(4,'Lavender','55796 Reinke Way','Il’inskiy Pogost',12511),
(5,'Waterwheel Plant','6 Sachtjen Road','Göteborg',45782),
(6,'Darrow\'s Flavopunctelia Lichen','4278 High Crossing Park','Jardia',29208),
(7,'Spathulate Candle Snuffer Moss','122 Elgar Place','Finzes',92997),
(8,'Yankeeweed','78 Pine View Point','Haoguantun',99937),
(9,'Luna County Globemallow','742 Armistice Drive','Mandaon',42965),
(10,'San Luis Lupine','2 Gateway Street','Bila',50143);
/*!40000 ALTER TABLE `theatre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `theatre_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `theatre_id` (`theatre_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`theatre_id`) REFERENCES `theatre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
(1,'Clarae','Håkan','db_admin','XKujdsV705',NULL),
(2,'Rangell','Inès','db_admin','9blFgeaXADq',NULL),
(3,'Mattimoe','Måns','db_admin','KLLThj',NULL),
(4,'Rowntree','Liè','db_datawriter','kLS3iwC0AM',1),
(5,'Shrimplin','Cunégonde','db_datawriter','86FAnr31',10),
(6,'Bindley','Lèi','db_datawriter','1HNXppBV',4),
(7,'Whitloe','Vénus','db_datawriter','J0Jd4YPJ8Vd',6),
(8,'Karslake','Esbjörn','db_datawriter','cfbb7E',7),
(9,'Andrioni','Märta','db_datawriter','2ChFwPgE',9),
(10,'Tather','Aurélie','db_datawriter','Mvpi0dP6OI',3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viewer`
--

DROP TABLE IF EXISTS `viewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viewer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `debit_card` bigint(20) unsigned DEFAULT NULL,
  `seat_number` int(11) DEFAULT NULL,
  `places` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viewer`
--

LOCK TABLES `viewer` WRITE;
/*!40000 ALTER TABLE `viewer` DISABLE KEYS */;
INSERT INTO `viewer` VALUES
(1,'Wankel','Maëlys','ewankel0@creativecommons.org','KUVT6Xa',3569044418408857,NULL,5),
(2,'Kock','Björn','ekock1@china.com.cn','iJPVX62SwMw',3540698747883884,NULL,1),
(3,'Aspinwall','Léonore','aaspinwall2@wordpress.com','eDGSc9tC',56022511043703653,NULL,3),
(4,'Hubble','Athéna','rhubble3@i2i.jp','jsZerGT',372301585646245,NULL,3),
(5,'Boncore','Marie-ève','fboncore4@jalbum.net','WHah1rRb',4905380216894386539,NULL,4),
(6,'Kort','Marie-thérèse','bkort5@fastcompany.com','widthzlCwNd',3568334426623816,NULL,3),
(7,'Sollner','André','msollner6@seesaa.net','u5rRWHCb',3576159276801760,NULL,3),
(8,'Tawton','Renée','etawton7@jigsy.com','jBy9Il3Bn',3571531242737788,NULL,3),
(9,'Bodham','Mélanie','hbodham8@wp.com','hx9kYSv',6375850433301373,NULL,5),
(10,'Gemlbett','Séverine','egemlbett9@wordpress.org','Auv6nbRl',3560950126174657,36,2);
/*!40000 ALTER TABLE `viewer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-20 13:29:59
