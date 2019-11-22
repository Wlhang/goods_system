-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: goods
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add User_Profile',7,'add_user_profile'),(26,'Can change User_Profile',7,'change_user_profile'),(27,'Can delete User_Profile',7,'delete_user_profile'),(28,'Can view User_Profile',7,'view_user_profile'),(29,'Can add confirm_code',8,'add_user_confirm'),(30,'Can change confirm_code',8,'change_user_confirm'),(31,'Can delete confirm_code',8,'delete_user_confirm'),(32,'Can view confirm_code',8,'view_user_confirm'),(33,'Can add shop',9,'add_shop'),(34,'Can change shop',9,'change_shop'),(35,'Can delete shop',9,'delete_shop'),(36,'Can view shop',9,'view_shop'),(37,'Can add goods',10,'add_goods'),(38,'Can change goods',10,'change_goods'),(39,'Can delete goods',10,'delete_goods'),(40,'Can view goods',10,'view_goods'),(41,'Can add search',11,'add_search'),(42,'Can change search',11,'change_search'),(43,'Can delete search',11,'delete_search'),(44,'Can view search',11,'view_search'),(45,'Can add order item',12,'add_orderitem'),(46,'Can change order item',12,'change_orderitem'),(47,'Can delete order item',12,'delete_orderitem'),(48,'Can view order item',12,'view_orderitem'),(49,'Can add order',13,'add_order'),(50,'Can change order',13,'change_order'),(51,'Can delete order',13,'delete_order'),(52,'Can view order',13,'view_order'),(53,'Can add item',14,'add_item'),(54,'Can change item',14,'change_item'),(55,'Can delete item',14,'delete_item'),(56,'Can view item',14,'view_item'),(57,'Can add cart',15,'add_cart'),(58,'Can change cart',15,'change_cart'),(59,'Can delete cart',15,'delete_cart'),(60,'Can view cart',15,'view_cart');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$Q6OKyPgHZrru$ysBNU9E1FDhOTVtIx/EHMhIpqevsSjYSDEFRGTEnhIo=','2019-11-22 10:00:37.935060',1,'admin','','','',1,1,'2019-10-18 21:26:44.646075'),(2,'pbkdf2_sha256$150000$m1rh01Nn8Tw2$DCWqGMQmNSujnFlwiVlHzvmGKbuCsrvLZqvYfFN58bE=','2019-11-22 09:55:18.435434',0,'hang','','','wlhang@nuaa.edu.cn',0,1,'2019-10-18 21:27:56.000000'),(3,'pbkdf2_sha256$150000$mCCG2CyADNmU$5q0w89Kl7XOoWZuD8//5UdqG4a7tiX2ZyXucnvz0E1M=','2019-11-18 22:58:16.244718',0,'wlhang','','','2380383965@qq.com',0,1,'2019-11-18 21:02:03.000000'),(5,'pbkdf2_sha256$150000$MDsucAjHHlpQ$U5+Ao4Gnn+hHXCqEewunMWKxQPTtoly1GHcfRh44JCE=','2019-11-19 22:10:21.305897',0,'hhhh','','','524039479@qq.com',0,1,'2019-11-19 22:10:08.898220');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_cart`
--

DROP TABLE IF EXISTS `cart_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creation_date` datetime(6) NOT NULL,
  `checked_out` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_cart`
--

LOCK TABLES `cart_cart` WRITE;
/*!40000 ALTER TABLE `cart_cart` DISABLE KEYS */;
INSERT INTO `cart_cart` VALUES (1,'2019-11-18 11:05:05.767641',0),(2,'2019-11-18 22:18:28.246412',0),(3,'2019-11-18 22:58:51.640533',0),(4,'2019-11-19 14:43:09.524022',0),(5,'2019-11-19 14:53:12.578515',0),(6,'2019-11-19 22:10:21.417880',0),(7,'2019-11-20 22:28:34.767869',0);
/*!40000 ALTER TABLE `cart_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL,
  `unit_price` decimal(18,2) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `cart_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_item_cart_id_157ecf5f_fk_cart_cart_id` (`cart_id`),
  KEY `cart_item_content_type_id_5737916f_fk_django_content_type_id` (`content_type_id`),
  CONSTRAINT `cart_item_cart_id_157ecf5f_fk_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart_cart` (`id`),
  CONSTRAINT `cart_item_content_type_id_5737916f_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
INSERT INTO `cart_item` VALUES (6,1,758.00,78,2,10),(39,1,178.00,80,5,10);
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-10-18 21:27:56.913330','2','hang',1,'[{\"added\": {}}]',4,1),(2,'2019-10-18 21:28:17.664371','2','hang',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',4,1),(3,'2019-10-28 19:38:02.888969','190','男装 高级轻型羽绒便携式茄克 419996 优衣库UNIQLO',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',10,1),(4,'2019-10-28 19:38:11.897836','189','VIISHOW冬装哆啦A梦联名款棉衣男 潮牌保暖棒球领小棉服男士外套',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',10,1),(5,'2019-10-29 15:42:10.301715','1','hang',1,'[{\"added\": {}}]',7,1),(6,'2019-11-18 21:02:03.572331','3','wlhang',1,'[{\"added\": {}}]',4,1),(7,'2019-11-18 21:04:50.207444','3','wlhang',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',4,1),(8,'2019-11-18 21:16:56.792125','2','wlhang',1,'[{\"added\": {}}]',7,1),(9,'2019-11-18 21:18:34.851255','3','admin',1,'[{\"added\": {}}]',7,1),(10,'2019-11-19 22:07:03.588192','4','hhhh',3,'',4,1),(11,'2019-11-21 22:23:14.733424','80','【直营】韩都衣舍2019韩版女装春装新款宽松豹纹连衣裙JN8322埕',2,'[{\"changed\": {\"fields\": [\"sales\"]}}]',10,1),(12,'2019-11-21 22:23:45.020754','69','韩都衣舍2019新款初秋气质女神范衣服假两件碎花连衣裙GS10128緈',2,'[{\"changed\": {\"fields\": [\"sales\"]}}]',10,1),(13,'2019-11-22 11:59:13.407154','20','20',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(15,'cart','cart'),(14,'cart','item'),(5,'contenttypes','contenttype'),(10,'goods','goods'),(13,'goods','order'),(12,'goods','orderitem'),(11,'goods','search'),(6,'sessions','session'),(9,'users','shop'),(8,'users','user_confirm'),(7,'users','user_profile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-10-18 21:22:33.713557'),(2,'auth','0001_initial','2019-10-18 21:22:38.558695'),(3,'admin','0001_initial','2019-10-18 21:23:19.250520'),(4,'admin','0002_logentry_remove_auto_add','2019-10-18 21:23:24.890925'),(5,'admin','0003_logentry_add_action_flag_choices','2019-10-18 21:23:25.015922'),(6,'contenttypes','0002_remove_content_type_name','2019-10-18 21:23:29.125185'),(7,'auth','0002_alter_permission_name_max_length','2019-10-18 21:23:32.781415'),(8,'auth','0003_alter_user_email_max_length','2019-10-18 21:23:33.937626'),(9,'auth','0004_alter_user_username_opts','2019-10-18 21:23:34.140679'),(10,'auth','0005_alter_user_last_login_null','2019-10-18 21:23:37.171878'),(11,'auth','0006_require_contenttypes_0002','2019-10-18 21:23:37.531278'),(12,'auth','0007_alter_validators_add_error_messages','2019-10-18 21:23:37.749956'),(13,'auth','0008_alter_user_username_max_length','2019-10-18 21:23:43.313994'),(14,'auth','0009_alter_user_last_name_max_length','2019-10-18 21:23:50.016863'),(15,'auth','0010_alter_group_name_max_length','2019-10-18 21:23:51.110650'),(16,'auth','0011_update_proxy_permissions','2019-10-18 21:23:51.438716'),(17,'users','0001_initial','2019-10-18 21:23:53.704339'),(18,'users','0002_auto_20191010_2056','2019-10-18 21:24:03.735677'),(19,'users','0003_user_confirm','2019-10-18 21:24:05.032517'),(20,'users','0004_auto_20191011_1037','2019-10-18 21:24:07.891745'),(21,'users','0005_auto_20191015_1107','2019-10-18 21:24:10.516742'),(22,'users','0006_goods_shop','2019-10-18 21:24:12.500998'),(23,'users','0007_auto_20191016_1723','2019-10-18 21:24:26.674020'),(24,'users','0008_auto_20191016_1726','2019-10-18 21:24:29.361448'),(25,'users','0009_auto_20191016_1734','2019-10-18 21:24:31.720748'),(26,'users','0010_delete_goods','2019-10-18 21:24:32.626924'),(27,'users','0011_goods','2019-10-18 21:24:33.830009'),(28,'users','0012_delete_goods','2019-10-18 21:24:37.267425'),(29,'goods','0001_initial','2019-10-18 21:24:38.142383'),(30,'goods','0002_auto_20191018_2108','2019-10-18 21:24:44.423534'),(31,'goods','0003_remove_goods_picture','2019-10-18 21:24:54.845136'),(32,'goods','0004_goods_picture','2019-10-18 21:24:56.610704'),(33,'sessions','0001_initial','2019-10-18 21:24:57.985598'),(34,'users','0013_shop_instruction','2019-10-18 21:25:01.318581'),(35,'goods','0005_auto_20191024_1023','2019-10-24 10:23:30.017612'),(36,'goods','0006_search','2019-10-24 19:42:48.128527'),(37,'goods','0007_goods_status','2019-10-25 10:37:55.258106'),(38,'goods','0008_goods_modify_time','2019-10-29 15:16:54.812608'),(39,'cart','0001_initial','2019-11-18 11:04:14.487582'),(40,'cart','0002_auto_20191118_1104','2019-11-18 11:04:30.275900'),(41,'goods','0009_order_orderitem','2019-11-18 11:04:32.967466'),(42,'users','0014_user_profile_shopping_cart','2019-11-19 14:29:10.761607'),(43,'users','0015_auto_20191119_1440','2019-11-19 14:41:03.479161'),(44,'goods','0010_auto_20191121_1010','2019-11-21 10:10:39.131078'),(45,'goods','0011_orderitem_status','2019-11-22 11:24:55.763247'),(46,'goods','0012_order_status','2019-11-22 11:55:07.898715');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('16us0i22x2sav4srm0s73n6ygsjhyk4w','MzUwYjFlNTM1Nzg4NDE3ZDY4MjFkZmU3ZDYyOGE0MGNiYWEwZDhiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5BbGxvd0FsbFVzZXJzTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjU3YTNiOTA3YWMzMjdhYTcxYjUyNzZkM2IxOTZhY2EyNzU0MGJjMiIsImlkZW50aXR5IjozLCJDQVJULUlEIjo1LCJnb29kc19tYW5hZ2UiOiIvZ29vZHMvY2hlY2tfZ29vZHMifQ==','2019-12-04 23:28:09.158217'),('29oyficgv3ptv1h05u0n44sz82j5a03g','MWYzZmE1N2Q5MmNjMDIzZjQ3YWEyNmQzYTkzZGE5OTZmNDgwYzAzNDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5BbGxvd0FsbFVzZXJzTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTA4Mjg0Yjk1ZDFmM2I0ZDQ4Mzg4NWRkZmMwNmZlZjBmYWMwMDNkNCJ9','2019-12-03 21:49:16.930388'),('2cqse26xu57upvkfxbo651sgxnsc8ae7','YTU0OGFhNGUzYTZjODMxZGRlNzM2ZDdiN2I3NjAyZTFhM2MwODdiMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5BbGxvd0FsbFVzZXJzTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWE3NTRhNTQ3MmIxNmU2N2RiOTRiZjMyNmZkMjg5YmY3NmRiMzFhNSIsImlkZW50aXR5IjoyLCJDQVJULUlEIjo3LCJnb29kc19tYW5hZ2UiOiIvZ29vZHMvbWFuYWdlLzEifQ==','2019-12-06 14:47:27.001132'),('333khh97vh6fnr1euhzgud42gv8f2qfx','NTRhMjdjYWU0Mjg5ZGJmNmY3NWMwNWRjYzgyM2U1OTQ1NmZmYTg0Yzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5BbGxvd0FsbFVzZXJzTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWE3NTRhNTQ3MmIxNmU2N2RiOTRiZjMyNmZkMjg5YmY3NmRiMzFhNSIsImlkZW50aXR5IjoyLCJDQVJULUlEIjo3fQ==','2019-12-05 23:17:41.825377'),('68ke4lnolytiw1jzq6v5phrvk251nltj','Yjk5NjljOWNjNTVkZjZmZGUxOWJlMzcxNzA5OGU1NjUxMDQ5OTM4Yjp7fQ==','2019-12-03 14:42:10.283769'),('8oggbxhb4hxzarjoc63xfzrskixhsljk','Y2Y5ZDI1N2U0ZGNiMWRmMGE3OWFkYmUyZmM1NDdkNjY0NWMyMjRhNzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5BbGxvd0FsbFVzZXJzTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWE3NTRhNTQ3MmIxNmU2N2RiOTRiZjMyNmZkMjg5YmY3NmRiMzFhNSIsImdvb2RzX21hbmFnZSI6Ii9nb29kcy9tYW5hZ2UvMT9zb3J0PTMmdj0xJnN0YXR1cz0lRTUlQkUlODUlRTUlQUUlQTElRTYlQTAlQjgifQ==','2019-11-11 21:21:11.272158'),('8z9xz98vvv5hatg40eo148ywsavnap63','MzUwYjFlNTM1Nzg4NDE3ZDY4MjFkZmU3ZDYyOGE0MGNiYWEwZDhiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5BbGxvd0FsbFVzZXJzTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjU3YTNiOTA3YWMzMjdhYTcxYjUyNzZkM2IxOTZhY2EyNzU0MGJjMiIsImlkZW50aXR5IjozLCJDQVJULUlEIjo1LCJnb29kc19tYW5hZ2UiOiIvZ29vZHMvY2hlY2tfZ29vZHMifQ==','2019-12-06 09:56:24.956233'),('e8cxp3p91ip6g27bt0rvauokb9388vqy','NTRhMjdjYWU0Mjg5ZGJmNmY3NWMwNWRjYzgyM2U1OTQ1NmZmYTg0Yzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5BbGxvd0FsbFVzZXJzTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWE3NTRhNTQ3MmIxNmU2N2RiOTRiZjMyNmZkMjg5YmY3NmRiMzFhNSIsImlkZW50aXR5IjoyLCJDQVJULUlEIjo3fQ==','2019-12-04 22:28:35.015545'),('hi0v9f4spitctgz9h5vg28vk8wsu8xcn','ZDYxYzVkOTY0ZTdkODE5OTc2ODlhZjg0NGZmMDBiNjIxN2JkYjU2MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5BbGxvd0FsbFVzZXJzTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjU3YTNiOTA3YWMzMjdhYTcxYjUyNzZkM2IxOTZhY2EyNzU0MGJjMiIsImlkZW50aXR5IjozLCJDQVJULUlEIjo1LCJnb29kc19tYW5hZ2UiOiIvZ29vZHMvY2hlY2tfZ29vZHM/c29ydD0xJnY9MCZQYWdlPTImc3RhdHVzPSVFNSVCRSU4NSVFNSVBRSVBMSVFNiVBMCVCOCJ9','2019-12-03 17:53:30.549299'),('jgmjb7jr8amtos1nhpx58f8l63k00ct0','Yjk5NjljOWNjNTVkZjZmZGUxOWJlMzcxNzA5OGU1NjUxMDQ5OTM4Yjp7fQ==','2019-12-03 14:43:09.281057'),('jqwl2v7q31lpyfwuz17tdfjwi35dooui','NzdmMTZhYWI2MzBlOGU0ZjViYzU2NWFhYTI0M2EwY2Q4NzU0ODUwYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5BbGxvd0FsbFVzZXJzTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjU3YTNiOTA3YWMzMjdhYTcxYjUyNzZkM2IxOTZhY2EyNzU0MGJjMiIsImlkZW50aXR5IjozLCJDQVJULUlEIjo1LCJnb29kc19tYW5hZ2UiOiIvZ29vZHMvbWFuYWdlLzcifQ==','2019-12-06 14:53:58.524809'),('k6rafa2gma2ct9hznfuw12iy20us1aig','NzJiMWI4MTgzMTJlODU5OWVlZDQ3ODU1NTIyY2JiMjExNWM1MjdlZjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5BbGxvd0FsbFVzZXJzTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2ZlYTdjYzkxYmZlZDRkNTFlYmRkYzZiYjRkOWViNDM2ZjI4YzhkNCJ9','2019-11-06 19:36:46.396760'),('n7v2f4t7rq6ypnilz0n2pu7bf3ax39yq','NzJiMWI4MTgzMTJlODU5OWVlZDQ3ODU1NTIyY2JiMjExNWM1MjdlZjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5BbGxvd0FsbFVzZXJzTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2ZlYTdjYzkxYmZlZDRkNTFlYmRkYzZiYjRkOWViNDM2ZjI4YzhkNCJ9','2019-11-06 12:35:18.232826'),('nl29on28ni3b9okyu98owrotz42uprhq','Yjk5NjljOWNjNTVkZjZmZGUxOWJlMzcxNzA5OGU1NjUxMDQ5OTM4Yjp7fQ==','2019-11-12 15:43:17.505287'),('ozchzbrfmgdtvbdsilzr7bt5p69kelyg','NmJhYzEwNWYwNDFjNTFjZTk1NWYwMjg1MzdmOWQwOGJkYTFmYzg0ZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5BbGxvd0FsbFVzZXJzTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODdhNWI4OTYxMjc2YmQ1OTI5Y2FiZGUyM2QxMGY4YmY4YWFlMjZiNCJ9','2019-11-01 21:34:32.503214'),('pou44aiyop2kce440120iydvv2y1fw8x','ZWMyMmRmNWQyYTFhYmMwYmU1Y2MyMjc5MGE3M2FhNDVhYjhkOTQzMjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5BbGxvd0FsbFVzZXJzTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU0NmEwNWU2NWU0Yjk0YTAyMGRjNjA4OTU5MWM3M2U0YzRkNDM2ZiIsImlkZW50aXR5IjoxLCJnb29kc19tYW5hZ2UiOiIvZ29vZHMvY2hlY2tfZ29vZHMiLCJDQVJULUlEIjozfQ==','2019-12-02 22:58:51.847498'),('req39j0pxei8r6xzew0pyq12euqbea39','M2JkYmVhNWJiYWYwY2M1ODdiYmMyNTlhMmU3YWVlMjhhN2FlNDg2Yjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5BbGxvd0FsbFVzZXJzTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWE3NTRhNTQ3MmIxNmU2N2RiOTRiZjMyNmZkMjg5YmY3NmRiMzFhNSJ9','2019-11-08 11:42:54.136834'),('vtlniv4ofiez2irqpoq64u1mq0xy40f9','M2JkYmVhNWJiYWYwY2M1ODdiYmMyNTlhMmU3YWVlMjhhN2FlNDg2Yjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5BbGxvd0FsbFVzZXJzTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWE3NTRhNTQ3MmIxNmU2N2RiOTRiZjMyNmZkMjg5YmY3NmRiMzFhNSJ9','2019-11-12 15:45:05.656821'),('znpvyzfj7ixskjzleac400r742pb4fsh','N2E4OWY3ODNjNTY4MDViNjY4ZGY1ZTg4Mjg1MDFiYmNkNTQ2MDJlYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5BbGxvd0FsbFVzZXJzTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTMzNjM4MDY0ODI4NDFiOTkzNTgyMTBmMDVlOWMxZTBjZTI1NzA3YiJ9','2019-11-07 19:44:13.967390');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_goods`
--

DROP TABLE IF EXISTS `goods_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `goods_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_type` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` double NOT NULL,
  `sales` int(11) NOT NULL,
  `remain` int(11) NOT NULL,
  `instruction` longtext NOT NULL,
  `location` varchar(20) NOT NULL,
  `store_id_id` int(11) NOT NULL,
  `picture` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `modify_time` time(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goods_store_id_id_5ed3da48_fk_users_shop_id` (`store_id_id`),
  CONSTRAINT `goods_goods_store_id_id_5ed3da48_fk_users_shop_id` FOREIGN KEY (`store_id_id`) REFERENCES `users_shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_goods`
--

LOCK TABLES `goods_goods` WRITE;
/*!40000 ALTER TABLE `goods_goods` DISABLE KEYS */;
INSERT INTO `goods_goods` VALUES (1,'男装','清新文艺范纯棉男装休闲衬衫2019春夏新',128,1,594,'清新文艺范纯棉\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e休闲衬衫2019春夏新款翻领纯色青年全棉衬衣男','广东 广州',1,'\\media\\picture\\1\\1.jpg',1,'15:24:32.706580'),(2,'男装','JHYQ自制原创 潮牌牛仔裤男宽松直筒工',148,4135,2530,'JHYQ自制原创 潮牌牛仔裤男宽松直筒工装裤嘻哈阔腿束脚牛仔裤子','浙江 杭州',1,'\\media\\picture\\1\\2.jpg',1,'15:32:09.177340'),(4,'男装','秋冬款冬季男士牛仔裤潮牌加绒加厚宽松直筒裤子男装修身休闲长裤',118,4896,219240,'秋冬款冬季男士牛仔裤潮牌加绒加厚宽松直筒裤子\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e修身休闲长裤','广东 广州',1,'\\media\\picture\\1\\4.jpg',2,'21:20:04.864070'),(5,'男装','花花公子西装男套装韩版潮流新郎结婚男士三件套职业正装休闲西服',398,2112,49030,'花花公子西装男套装韩版潮流新郎结婚男士三件套职业正装休闲西服','福建 泉州',1,'\\media\\picture\\1\\5.jpg',0,'15:16:51.207131'),(6,'男装','波司登长款鹅绒羽绒服男士时尚大毛领保暖加厚冬装外套B80142153',2429,133,6015,'波司登长款鹅绒羽绒服男士时尚大毛领保暖加厚冬装外套B80142153','江苏 苏州',1,'\\media\\picture\\1\\6.jpg',2,'15:16:51.207131'),(7,'男装','进口貂皮大衣男款整貂皮草男拉链水貂皮男士外套带帽皮草男装皮衣',2680,260,6097,'进口貂皮大衣男款整貂皮草男拉链水貂皮男士外套带帽皮草\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e皮衣','河北 衡水',1,'\\media\\picture\\1\\7.jpg',0,'15:16:51.207131'),(8,'男装','viishow2019秋季新款针织衫男 韩版男士外套潮牌情侣装圆领毛衣',149,8000,6593,'viishow2019秋季新款针织衫男 韩版男士外套潮牌情侣装圆领毛衣','福建 厦门',1,'\\media\\picture\\1\\8.jpg',0,'15:16:51.207131'),(9,'男装','花花公子外套男春秋休闲男士夹克2019秋冬新款男装秋装上衣潮秋季',269,1772,44448,'花花公子外套男春秋休闲男士夹克2019秋冬新款\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e秋装上衣潮秋季','福建 泉州',1,'\\media\\picture\\1\\9.jpg',0,'15:16:51.207131'),(10,'男装','男士外套秋冬季2019新款春秋韩版潮流棒球服工装夹克衣服秋装上衣',138,7500,0,'男士外套秋冬季2019新款春秋韩版潮流棒球服工装夹克衣服秋装上衣','福建 泉州',1,'\\media\\picture\\1\\10.jpg',0,'10:29:58.467497'),(11,'男装','羽绒服男2019冬季新款潮流帅气短款学生工装轻薄加厚冬装男士外套',398,2177,36043,'羽绒服男2019冬季新款潮流帅气短款学生工装轻薄加厚冬装男士外套','福建 厦门',1,'\\media\\picture\\1\\11.jpg',0,'15:16:51.207131'),(12,'男装','花花公子旗舰男装夹克2019春季新款韩版潮流帅气潮牌男士外套春秋',269,1076,148397,'花花公子旗舰\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e夹克2019春季新款韩版潮流帅气潮牌男士外套春秋','浙江 嘉兴',1,'\\media\\picture\\1\\12.jpg',0,'15:16:51.207131'),(13,'男装','秋季男外穿长袖t恤纯棉秋衣加绒白色男装大码秋装内穿打底衫上衣',79,7500,15546,'秋季男外穿长袖t恤纯棉秋衣加绒白色\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e大码秋装内穿打底衫上衣','上海',1,'\\media\\picture\\1\\13.jpg',0,'15:16:51.207131'),(14,'男装','秋季纯棉男商务男装长袖衬衫帅气休闲韩版修身寸衫秋装衬衣上衣服',99,6500,25668,'秋季纯棉男商务\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e长袖衬衫帅气休闲韩版修身寸衫秋装衬衣上衣服','上海',1,'\\media\\picture\\1\\14.jpg',0,'15:16:51.207131'),(15,'男装','Puma彪马卫衣男2019秋季新款男装运动圆领上衣长袖宽松外套套头衫',199,363,491,'Puma彪马卫衣男2019秋季新款\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e运动圆领上衣长袖宽松外套套头衫','江苏 连云港',1,'\\media\\picture\\1\\15.jpg',0,'15:16:51.207131'),(16,'男装','Adidas阿迪达斯棉衣男冬季新款男装保暖运动服棉袄棉衣外套DZ1429',509,10,198,'Adidas阿迪达斯棉衣男冬季新款\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e保暖运动服棉袄棉衣外套DZ1429','江苏 连云港',1,'\\media\\picture\\1\\16.jpg',0,'15:16:51.207131'),(17,'男装','太平鸟男装 大毛领中长款加厚羽绒服后背刺绣休闲保暖外套韩版潮',1599,582,0,'太平鸟\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e 大毛领中长款加厚羽绒服后背刺绣休闲保暖外套韩版潮','浙江 宁波',1,'\\media\\picture\\1\\17.jpg',0,'15:16:51.207131'),(18,'男装','太平鸟男装毛呢大衣男2019秋冬新款双面呢大衣多彩中长款呢子外套',999,93,6520,'太平鸟\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e毛呢大衣男2019秋冬新款双面呢大衣多彩中长款呢子外套','浙江 宁波',1,'\\media\\picture\\1\\18.jpg',0,'15:16:51.207131'),(19,'男装','太平鸟男装冬装短款青年潮流黄色工装羽绒服可拆卸连帽白鸭绒外套',1299,385,0,'太平鸟\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e冬装短款青年潮流黄色工装羽绒服可拆卸连帽白鸭绒外套','浙江 宁波',1,'\\media\\picture\\1\\19.jpg',0,'15:16:51.207131'),(20,'男装','鸿星尔克运动卫衣男潮秋带帽新款套头衫休闲男装男士长袖上衣外套',159,1092,4847,'鸿星尔克运动卫衣男潮秋带帽新款套头衫休闲\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e男士长袖上衣外套','福建 厦门',1,'\\media\\picture\\1\\20.jpg',0,'15:16:51.207131'),(21,'男装','黑择明男士双面呢夹克 秋装新款千鸟格工装上衣短款修身格子外套',759,89,32,'黑择明男士双面呢夹克 秋装新款千鸟格工装上衣短款修身格子外套','浙江 杭州',1,'\\media\\picture\\1\\21.jpg',0,'15:16:51.207131'),(22,'男装','男装 高级轻型羽绒连帽外套 420314 优衣库UNIQLO',599,1031,33341,'\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e 高级轻型羽绒连帽外套 420314 优衣库UNIQLO','上海',1,'\\media\\picture\\1\\22.jpg',0,'15:16:51.207131'),(23,'男装','黑择明男士羽绒服 韩版连帽外套冬装加厚潮流男装帅气保暖羽绒衣',499,186,180,'黑择明男士羽绒服 韩版连帽外套冬装加厚潮流\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e帅气保暖羽绒衣','浙江 杭州',1,'\\media\\picture\\1\\23.jpg',0,'15:16:51.207131'),(24,'男装','男装 高性能保暖羽绒大衣 419992 优衣库UNIQLO',1299,132,335,'\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e 高性能保暖羽绒大衣 419992 优衣库UNIQLO','上海',1,'\\media\\picture\\1\\24.jpg',0,'15:16:51.207131'),(25,'男装','Romon/罗蒙长袖衬衫男士中青年秋季商务休闲衬衣纯色修身工装衬衫',139,2482,816,'Romon/罗蒙长袖衬衫男士中青年秋季商务休闲衬衣纯色修身工装衬衫','安徽 合肥',1,'\\media\\picture\\1\\25.jpg',0,'15:16:51.207131'),(26,'男装','Romon/罗蒙时尚翻领长袖衬衫中青年男士商务上衣斜纹工装职业衬衣',129,3812,186,'Romon/罗蒙时尚翻领长袖衬衫中青年男士商务上衣斜纹工装职业衬衣','安徽 合肥',1,'\\media\\picture\\1\\26.jpg',0,'15:16:51.207131'),(27,'男装','太平鸟男装夹克男韩版外套男春秋飞行员夹克男棒球服男士外套男潮',339,1797,1358,'太平鸟\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e夹克男韩版外套男春秋飞行员夹克男棒球服男士外套男潮','浙江 宁波',1,'\\media\\picture\\1\\27.jpg',0,'15:16:51.207131'),(28,'男装','吉普盾2019冬季新款男士大毛领情侣羽绒服短款工装户外加厚外套潮',1169,30000,23834,'吉普盾2019冬季新款男士大毛领情侣羽绒服短款工装户外加厚外套潮','北京',1,'\\media\\picture\\1\\28.jpg',0,'15:16:51.207131'),(29,'男装','男士外套中长款棉衣潮流羽绒棉服加厚棉袄男装连帽冬季保暖上衣服',238,843,31877,'男士外套中长款棉衣潮流羽绒棉服加厚棉袄\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e连帽冬季保暖上衣服','江苏 苏州',1,'\\media\\picture\\1\\29.jpg',0,'15:16:51.207131'),(30,'男装','海宁真皮皮衣男中年秋冬季男士休闲绵羊皮外套爸爸装中老年皮夹克',688,450,7025,'海宁真皮皮衣男中年秋冬季男士休闲绵羊皮外套爸爸装中老年皮夹克','江苏 苏州',1,'\\media\\picture\\1\\30.jpg',0,'15:16:51.207131'),(31,'男装','CREAZIONI克莱切尼男装秋冬刺绣修身破洞牛仔裤男百搭小脚休闲裤',499,741,900,'CREAZIONI克莱切尼\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e秋冬刺绣修身破洞牛仔裤男百搭小脚休闲裤','浙江 杭州',1,'\\media\\picture\\1\\31.jpg',0,'15:16:51.207131'),(32,'男装','西服套装男士职业伴郎韩版新郎结婚礼服正装外套修身休闲小西装男',129,25000,0,'西服套装男士职业伴郎韩版新郎结婚礼服正装外套修身休闲小西装男','浙江 杭州',1,'\\media\\picture\\1\\32.jpg',0,'15:16:51.207131'),(33,'男装','棉衣男士冬季外套2019新款韩版羽绒棉服潮流冬装加厚冬天潮牌棉袄',138,7000,40196,'棉衣男士冬季外套2019新款韩版羽绒棉服潮流冬装加厚冬天潮牌棉袄','浙江 杭州',1,'\\media\\picture\\1\\33.jpg',0,'15:16:51.207131'),(34,'男装','男士棉服2019新款工装外套冬季潮流羽绒服棉袄冬装衣服加厚棉衣男',179,1221,0,'男士棉服2019新款工装外套冬季潮流羽绒服棉袄冬装衣服加厚棉衣男','福建 泉州',1,'\\media\\picture\\1\\34.jpg',0,'15:16:51.207131'),(35,'男装','秋冬休闲风衣男宽松户外休闲男士夹克中年加绒加厚冲锋军工装外套',258,935,46939,'秋冬休闲风衣男宽松户外休闲男士夹克中年加绒加厚冲锋军工装外套','江苏 苏州',1,'\\media\\picture\\1\\35.jpg',0,'15:16:51.207131'),(36,'男装','男士西服套装青少年韩版修身小西装三件套商务休闲西装结婚正装潮',168,5500,239495,'男士西服套装青少年韩版修身小西装三件套商务休闲西装结婚正装潮','江苏 苏州',1,'\\media\\picture\\1\\36.jpg',0,'15:16:51.207131'),(37,'男装','鄂尔多斯产羊绒衫男士宽松针织翻领T恤打底衫中老年爸爸毛衣冬装',499,423,0,'鄂尔多斯产羊绒衫男士宽松针织翻领T恤打底衫中老年爸爸毛衣冬装','浙江 嘉兴',1,'\\media\\picture\\1\\37.jpg',0,'15:16:51.207131'),(38,'男装','VIISHOW新款休闲长裤男 工装男士束脚裤束腿裤男生李现韩商言同款',179,1026,3115,'VIISHOW新款休闲长裤男 工装男士束脚裤束腿裤男生李现韩商言同款','福建 厦门',1,'\\media\\picture\\1\\38.jpg',0,'15:16:51.207131'),(39,'男装','啄木鸟真皮皮衣男式皮衣机车皮夹克绵羊皮真皮皮衣男装真皮夹克男',496.8,2934,75102,'啄木鸟真皮皮衣男式皮衣机车皮夹克绵羊皮真皮皮衣\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e真皮夹克男','上海',1,'\\media\\picture\\1\\39.jpg',0,'15:16:51.207131'),(40,'男装','男士外套冬季2019新款棉衣情侣韩版修身潮流短款棉袄工装羽绒棉服',138,8500,533235,'男士外套冬季2019新款棉衣情侣韩版修身潮流短款棉袄工装羽绒棉服','福建 厦门',1,'\\media\\picture\\1\\40.jpg',0,'15:16:51.207131'),(41,'男装','海宁真皮皮衣男士皮夹克2019秋冬纯正头层绵羊皮真皮男装机车外套',498,1238,2485,'海宁真皮皮衣男士皮夹克2019秋冬纯正头层绵羊皮真皮\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e机车外套','上海',1,'\\media\\picture\\1\\41.jpg',0,'15:16:51.207131'),(42,'男装','鸿星尔克连帽卫衣男子2019秋季新品休闲上衣舒适男装时尚长袖上衣',229,167,8657,'鸿星尔克连帽卫衣男子2019秋季新品休闲上衣舒适\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e时尚长袖上衣','福建 厦门',1,'\\media\\picture\\1\\42.jpg',0,'15:16:51.207131'),(43,'男装','中山装男中老年秋冬外套老人衣服爷爷中山服装爸爸套装老年人加绒',219,1342,36968,'中山装男中老年秋冬外套老人衣服爷爷中山服装爸爸套装老年人加绒','河南 焦作',1,'\\media\\picture\\1\\43.jpg',0,'15:16:51.207131'),(44,'男装','波司登男士羽绒服鹅绒短款2019新款时尚工装加厚外套B90142025',2199,46,1886,'波司登男士羽绒服鹅绒短款2019新款时尚工装加厚外套B90142025','江苏 苏州',1,'\\media\\picture\\1\\44.jpg',0,'15:16:51.207131'),(49,'男装','Lee秋款卫衣藏青色标准版型长袖卫衣',339,0,1200,'【预售】LeeX-LINE2019秋冬男印花圆领套头卫衣L391264XMB8D','上海',1,'\\media\\picture\\1\\49.jpg',0,'15:16:51.207131'),(50,'男装','2019秋冬长袖t恤男装鹿头修身罗马布圆',99,6,152438,'2019新款潮卫衣男秋季修身圆领大码宽松薄款男士秋冬款无帽衣服','广东 广州',1,'\\media\\picture\\1\\50.jpg',0,'15:16:51.207131'),(51,'男装','Old Navy男装印花条纹长袖T恤48',109,0,2522,'Old Navy\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e印花条纹长袖T恤481218A新款休闲华夫格针织上衣男潮','江苏 苏州',1,'\\media\\picture\\1\\51.jpg',0,'15:16:51.207131'),(52,'男装','连帽卫衣男秋冬三件套加绒加厚时尚潮流冬装休闲衣服男士运动套装',268,8,2390,'连帽卫衣男秋冬三件套加绒加厚时尚潮流冬装休闲衣服男士运动套装','福建 泉州',1,'\\media\\picture\\1\\52.jpg',0,'15:16:51.207131'),(53,'男装','Hush Puppies暇步士2019秋新男装纯棉立领休闲夹克外套|PJ-29551D',1199,8,1436,'Hush Puppies暇步士2019秋新\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e纯棉立领休闲夹克外套|PJ-29551D','浙江 嘉兴',1,'\\media\\picture\\1\\53.jpg',0,'15:16:51.207131'),(54,'男装','2019秋冬长袖t恤男装鹿头修身罗马布圆',99,376,152438,'2019新款潮卫衣男秋季修身圆领大码宽松薄款男士秋冬款无帽衣服','广东 广州',1,'\\media\\picture\\1\\54.jpg',0,'15:16:51.207131'),(55,'男装','Old Navy男装印花条纹长袖T恤48',109,40,2522,'Old Navy\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e印花条纹长袖T恤481218A新款休闲华夫格针织上衣男潮','江苏 苏州',1,'\\media\\picture\\1\\55.jpg',0,'15:16:51.207131'),(56,'男装','英爵伦 青年男装长袖衬衫 2019秋季新',118,137,528,'英爵伦 青年\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e长袖衬衫 2019秋季新款 纯色字母刺绣休闲衬衣男','广东 广州',1,'\\media\\picture\\1\\56.jpg',0,'15:16:51.207131'),(57,'男装','连帽卫衣男秋冬三件套加绒加厚时尚潮流冬装休闲衣服男士运动套装',268,2678,2390,'连帽卫衣男秋冬三件套加绒加厚时尚潮流冬装休闲衣服男士运动套装','福建 泉州',1,'\\media\\picture\\1\\57.jpg',0,'15:16:51.207131'),(58,'男装','Hush Puppies暇步士2019秋新男装纯棉立领休闲夹克外套|PJ-29551D',1199,198,1436,'Hush Puppies暇步士2019秋新\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e纯棉立领休闲夹克外套|PJ-29551D','浙江 嘉兴',1,'\\media\\picture\\1\\58.jpg',0,'15:16:51.207131'),(59,'女装','韩都衣舍2019秋冬新款女装韩版可爱图案宽松套头慵懒风毛衣针织衫',198,12,734,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2019秋冬新款女装韩版可爱图案宽松套头慵懒风毛衣针织衫','山东 济南',2,'\\media\\picture\\2\\59.jpg',0,'17:47:38.853555'),(60,'女装','韩都衣舍2019秋季新款韩版oversize针织衫女装开衫宽松中长款外套',188,32,40,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2019秋季新款韩版oversize针织衫女装开衫宽松中长款外套','山东 济南',2,'\\media\\picture\\2\\60.jpg',0,'17:47:39.006533'),(61,'女装','韩都衣舍2019冬装新款潮韩版女装加厚宽松毛领牛仔棉大衣外套棉服',358,17,235,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2019冬装新款潮韩版女装加厚宽松毛领牛仔棉大衣外套棉服','山东 济南',2,'\\media\\picture\\2\\61.jpg',0,'17:47:39.167509'),(62,'女装','韩都衣舍2019冬装新款女韩版大码加厚棉衣过膝棉袄女棉服ins外套',508,3,931,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2019冬装新款女韩版大码加厚棉衣过膝棉袄女棉服ins外套','山东 济南',2,'\\media\\picture\\2\\62.jpg',1,'15:40:41.130545'),(63,'女装','韩都衣舍2019韩版女装冬装新款潮上衣外套百搭短棉衣棉服LZ8773煜',398,1,113,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2019韩版女装冬装新款潮上衣外套百搭短棉衣棉服LZ8773煜','山东 济南',2,'\\media\\picture\\2\\63.jpg',0,'17:47:39.388482'),(64,'女装','韩都衣舍2019秋装新款韩版宽松显瘦打底圆领长袖卫衣女TK00264婏',178,11,4189,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2019秋装新款韩版宽松显瘦打底圆领长袖卫衣女TK00264婏','山东 济南',2,'\\media\\picture\\2\\64.jpg',0,'17:47:39.510453'),(65,'女装','韩都衣舍羽绒服女装韩版宽松连帽加厚时尚过膝2019新款长款冬装潮',778,3,84,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e羽绒服女装韩版宽松连帽加厚时尚过膝2019新款长款冬装潮','山东 济南',2,'\\media\\picture\\2\\65.jpg',0,'17:47:39.621435'),(66,'女装','韩都衣舍2019年秋季新款小款雾霾蓝小个子薄款高腰短款卫衣女潮酷',148,8,460,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2019年秋季新款小款雾霾蓝小个子薄款高腰短款卫衣女潮酷','山东 济南',2,'\\media\\picture\\2\\66.jpg',0,'17:47:39.743417'),(67,'女装','韩都衣舍2019秋装新款女装韩版格子宽松高腰显瘦潮女短裙子半身裙',108,9,14,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2019秋装新款女装韩版格子宽松高腰显瘦潮女短裙子半身裙','山东 济南',2,'\\media\\picture\\2\\67.jpg',0,'17:47:39.866398'),(68,'女装','韩都衣舍2018冬装新款女装毛领宽松中长款棉衣棉服OU12312堯',598,3,239,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2018冬装新款女装毛领宽松中长款棉衣棉服OU12312堯','山东 济南',2,'\\media\\picture\\2\\68.jpg',1,'22:09:11.328097'),(69,'女装','韩都衣舍2019新款初秋气质女神范衣服假两件碎花连衣裙GS10128緈',198,3,49,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2019新款初秋气质女神范衣服假两件碎花连衣裙GS10128緈','山东 济南',2,'\\media\\picture\\2\\69.jpg',1,'10:02:39.634598'),(70,'女装','韩都衣舍真皮马丁靴女英伦风2019新款百搭黑色平底短靴女加绒单靴',259,2712,20752,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e真皮马丁靴女英伦风2019新款百搭黑色平底短靴女加绒单靴','浙江 温州',2,'\\media\\picture\\2\\70.jpg',0,'17:47:40.310327'),(71,'女装','韩都衣舍2019冬季款加绒加厚高腰牛仔裤女显瘦百搭小脚裤修身长裤',129,15,20985,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2019冬季款加绒加厚高腰牛仔裤女显瘦百搭小脚裤修身长裤','广东 广州',2,'\\media\\picture\\2\\71.jpg',0,'17:47:40.443308'),(72,'女装','韩都衣舍闪亮字母黑色牛仔外套女短款宽松小个子工装夹克2019新款',139,21,7978,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e闪亮字母黑色牛仔外套女短款宽松小个子工装夹克2019新款','广东 广州',2,'\\media\\picture\\2\\72.jpg',0,'17:47:40.566291'),(73,'女装','双面珊瑚绒短外套宽松显瘦少女学生短款加绒抓绒上衣毛绒绒外套秋',88,23,13077,'双面珊瑚绒短外套宽松显瘦少女学生短款加绒抓绒上衣毛绒绒外套秋 \\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e','山东 济南',2,'\\media\\picture\\2\\73.jpg',0,'17:47:40.688269'),(74,'女装','oversize大码宽松牛油果绿色连帽卫衣女加肥加大学生休闲带帽卫衣',188,2,33,'oversize大码宽松牛油果绿色连帽卫衣女加肥加大学生休闲带帽卫衣 \\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e','山东 济南',2,'\\media\\picture\\2\\74.jpg',0,'17:47:40.822248'),(75,'女装','韩都衣舍2019冬装新款韩版宽松中长款大衣过膝毛呢外套GS10081緈',998,1,526,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2019冬装新款韩版宽松中长款大衣过膝毛呢外套GS10081緈','山东 济南',2,'\\media\\picture\\2\\75.jpg',0,'17:47:40.943230'),(76,'女装','韩都衣舍大幂幂同款马丁靴女2019新款百搭英伦风黑色真皮头层牛皮',399,2206,16048,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e大幂幂同款马丁靴女2019新款百搭英伦风黑色真皮头层牛皮','浙江 温州',2,'\\media\\picture\\2\\76.jpg',0,'17:47:41.066233'),(77,'女装','【双11预售】韩都衣舍2019冬新款韩版连帽中长款牛角扣羽绒服女魭',638,891,682,'【双11预售】\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2019冬新款韩版连帽中长款牛角扣羽绒服女魭','山东 济南',2,'\\media\\picture\\2\\77.jpg',0,'17:47:41.256180'),(78,'女装','韩都衣舍2019韩版女装冬装新款撞色加厚连帽中长款羽绒服EK9158囡',758,77,466,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2019韩版女装冬装新款撞色加厚连帽中长款羽绒服EK9158囡','山东 济南',2,'\\media\\picture\\2\\78.jpg',1,'22:09:11.584077'),(79,'女装','【直营】韩都衣舍2019春装新款女装韩版学生修身打底T恤JW13024筱',170.8,1,34,'【直营】\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2019春装新款女装韩版学生修身打底T恤JW13024筱','广东 深圳',2,'\\media\\picture\\2\\79.jpg',0,'17:47:41.590129'),(80,'女装','【直营】韩都衣舍2019韩版女装春装新款宽松豹纹连衣裙JN8322埕',178,5,67,'【直营】\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2019韩版女装春装新款宽松豹纹连衣裙JN8322埕','山东 济南',2,'\\media\\picture\\2\\80.jpg',1,'15:46:53.854493'),(81,'女装','韩都衣舍男装2019冬季新款工装大衣中长款情侣羽绒服外套AU9083虔',619.9,34,142,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e男装2019冬季新款工装大衣中长款情侣羽绒服外套AU9083虔','山东 济南',2,'\\media\\picture\\2\\81.jpg',0,'17:47:41.855089'),(82,'女装','韩都衣舍男装2019冬季新款加厚工装大衣中长款羽绒服外套AW9022虔',739.9,15,145,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e男装2019冬季新款加厚工装大衣中长款羽绒服外套AW9022虔','山东 济南',2,'\\media\\picture\\2\\82.jpg',0,'17:47:41.988066'),(83,'女装','韩都衣舍2019韩版冬装新款两色中长款慵懒风甜美减龄连帽羽绒服女',738,21,469,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2019韩版冬装新款两色中长款慵懒风甜美减龄连帽羽绒服女','山东 济南',2,'\\media\\picture\\2\\83.jpg',0,'17:47:42.089051'),(84,'女装','韩都衣舍2019秋冬新款宽松连帽加绒卫衣裙女过膝学院风套头连衣裙',198,50,165,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2019秋冬新款宽松连帽加绒卫衣裙女过膝学院风套头连衣裙','山东 济南',2,'\\media\\picture\\2\\84.jpg',0,'17:47:42.232031'),(85,'女装','韩都衣舍outlets2019新款冬装加厚白鸭绒中长款羽绒服女CQ8271莀',288,216,416,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003eoutlets2019新款冬装加厚白鸭绒中长款羽绒服女CQ8271莀','山东 济南',2,'\\media\\picture\\2\\85.jpg',0,'17:47:42.357012'),(86,'女装','韩都衣舍2019秋装新款女装韩版宽松显瘦拼接条纹长袖T恤IG6662僥',109,106,324,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2019秋装新款女装韩版宽松显瘦拼接条纹长袖T恤IG6662僥','山东 济南',2,'\\media\\picture\\2\\86.jpg',0,'17:47:42.466014'),(87,'女装','韩都衣舍outlets 韩都衣舍2018女韩版毛领牛仔棉衣棉服IG8245僥',248,61,46,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003eoutlets \\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2018女韩版毛领牛仔棉衣棉服IG8245僥','山东 济南',2,'\\media\\picture\\2\\87.jpg',0,'17:47:42.599972'),(88,'女装','韩都衣舍2019新款呢子复古格子短裙潮A字半身裙秋冬女LU8695荃',108,94,600,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2019新款呢子复古格子短裙潮A字半身裙秋冬女LU8695荃','山东 济南',2,'\\media\\picture\\2\\88.jpg',0,'17:47:42.721953'),(89,'女装','韩都衣舍2019秋装新款韩版女宽松加绒慵懒风连帽酷红色卫衣女潮',138,92,98,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2019秋装新款韩版女宽松加绒慵懒风连帽酷红色卫衣女潮','山东 济南',2,'\\media\\picture\\2\\89.jpg',0,'17:47:42.844003'),(90,'女装','韩都衣舍2019秋装新款宽松显瘦黑色ins时尚工装黑色休闲裤子潮',168,34,89,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2019秋装新款宽松显瘦黑色ins时尚工装黑色休闲裤子潮','山东 济南',2,'\\media\\picture\\2\\90.jpg',0,'17:47:43.011908'),(91,'女装','韩都衣舍2019年短款秋季新款女橘色韩版宽松网红带帽橙色加绒卫衣',168,21,6042,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2019年短款秋季新款女橘色韩版宽松网红带帽橙色加绒卫衣','山东 济南',2,'\\media\\picture\\2\\91.jpg',0,'17:47:43.412845'),(92,'女装','韩都衣舍2019新款初秋薄款宽松外搭潮毛衣开衫外套中长款针织衫女',168,24,101,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2019新款初秋薄款宽松外搭潮毛衣开衫外套中长款针织衫女','山东 济南',2,'\\media\\picture\\2\\92.jpg',0,'17:47:43.563824'),(93,'女装','韩都衣舍2019秋装撞色拼接牛油果绿色中长款反穿毛边假两件卫衣女',128,49,205,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2019秋装撞色拼接牛油果绿色中长款反穿毛边假两件卫衣女','山东 济南',2,'\\media\\picture\\2\\93.jpg',0,'17:47:43.821832'),(94,'女装','预售韩都衣舍2019秋装新款女装韩版宽松休闲潮加绒卫衣JW13226筱',168,18,66,'预售\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2019秋装新款女装韩版宽松休闲潮加绒卫衣JW13226筱','山东 济南',2,'\\media\\picture\\2\\94.jpg',0,'17:47:44.054794'),(95,'女装','【双11预售】韩都衣舍2019秋冬新款韩版中长款卫衣裙打底连衣裙女',208,46,3463,'【双11预售】\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e2019秋冬新款韩版中长款卫衣裙打底连衣裙女','山东 济南',2,'\\media\\picture\\2\\95.jpg',0,'17:47:44.598777'),(96,'女装','韩都衣舍圆形包包女包新款2019复古网红手提小圆包时尚百搭斜挎包',79,80,73,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e圆形包包女包新款2019复古网红手提小圆包时尚百搭斜挎包','广东 广州',2,'\\media\\picture\\2\\96.jpg',0,'17:47:44.765683'),(97,'女装','韩都衣舍裤子女2019新款女装秋秋直筒翻边阔腿裤牛仔裤女宽松长裤',158,28,3951,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e裤子女2019新款女装秋秋直筒翻边阔腿裤牛仔裤女宽松长裤','山东 济南',2,'\\media\\picture\\2\\97.jpg',0,'17:47:44.932705'),(98,'女装','韩都衣舍包包女包新款2019相机包休闲百搭斜挎包单肩格子小方包',119,52,10,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e包包女包新款2019相机包休闲百搭斜挎包单肩格子小方包','广东 广州',2,'\\media\\picture\\2\\98.jpg',0,'17:47:45.054640'),(99,'女装','韩都衣舍旗舰店休闲运动套装女春秋冬款女装潮卫衣+半身裙两件套',198,23,283,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e旗舰店休闲运动套装女春秋冬款女装潮卫衣+半身裙两件套','山东 济南',2,'\\media\\picture\\2\\99.jpg',0,'17:47:45.188629'),(100,'女装','韩都衣舍旗舰店灯芯绒外套女2019新款秋冬灯心绒短款上衣工装夹克',238,7,13,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e旗舰店灯芯绒外套女2019新款秋冬灯心绒短款上衣工装夹克','山东 济南',2,'\\media\\picture\\2\\100.jpg',0,'17:47:45.332595'),(101,'女装','韩都衣舍ins火的衬衫女bf长袖宽松韩版百搭高俊熙明星同款上衣',479,1,156,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003eins火的衬衫女bf长袖宽松韩版百搭高俊熙明星同款上衣','山东 济南',2,'\\media\\picture\\2\\101.jpg',0,'17:47:45.499570'),(102,'女装','韩都衣舍秋冬加绒牛仔外套女宽松学生韩版bf简单网红同款棉夹克潮',288,7,453,'\\u003cspan class\\u003dH\\u003e韩都衣舍\\u003c/span\\u003e秋冬加绒牛仔外套女宽松学生韩版bf简单网红同款棉夹克潮','山东 济南',2,'\\media\\picture\\2\\102.jpg',0,'17:47:45.621549'),(103,'男装','思莱德薄款纯色商务休闲棒球服夹克男外套',349.5,55,1139,'SELECTED思莱德冬季纯色潮流帅气男士外套棒球服夹克S|419221512','天津',1,'\\media\\picture\\1\\103.jpg',0,'15:16:51.207131'),(104,'男装','Lee秋款卫衣藏青色标准版型长袖卫衣',339,180,1199,'【预售】LeeX-LINE2019秋冬男印花圆领套头卫衣L391264XMB8D','上海',1,'\\media\\picture\\1\\104.jpg',0,'15:16:51.207131'),(105,'男装','Old Navy男装印花条纹长袖T恤48',109,40,2522,'Old Navy\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e印花条纹长袖T恤481218A新款休闲华夫格针织上衣男潮','江苏 苏州',1,'\\media\\picture\\1\\105.jpg',0,'15:16:51.207131'),(106,'男装','连帽卫衣男秋冬三件套加绒加厚时尚潮流冬装休闲衣服男士运动套装',268,2678,2389,'连帽卫衣男秋冬三件套加绒加厚时尚潮流冬装休闲衣服男士运动套装','福建 泉州',1,'\\media\\picture\\1\\106.jpg',0,'15:16:51.207131'),(107,'男装','Hush Puppies暇步士2019秋新男装纯棉立领休闲夹克外套|PJ-29551D',1199,198,1436,'Hush Puppies暇步士2019秋新\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e纯棉立领休闲夹克外套|PJ-29551D','浙江 嘉兴',1,'\\media\\picture\\1\\107.jpg',0,'15:16:51.207131'),(108,'男装','吉普盾2019男士羽绒服潮冬季新款青年中长款外套防风加厚男装帅气',1099,30000,17214,'吉普盾2019男士羽绒服潮冬季新款青年中长款外套防风加厚\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e帅气','北京',1,'\\media\\picture\\1\\108.jpg',0,'15:16:51.207131'),(109,'男装','七匹狼长袖t恤2019秋季新款中年男士上衣纯棉polo衫秋装体恤男装',197,2702,0,'七匹狼长袖t恤2019秋季新款中年男士上衣纯棉polo衫秋装体恤\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e','福建 厦门',1,'\\media\\picture\\1\\109.jpg',0,'15:16:51.207131'),(110,'男装','爸爸冬装加绒加厚保暖外套40岁50中年老人男士冬季皮衣夹克爷爷装',208,1689,35438,'爸爸冬装加绒加厚保暖外套40岁50中年老人男士冬季皮衣夹克爷爷装','浙江 嘉兴',1,'\\media\\picture\\1\\110.jpg',0,'15:16:51.207131'),(111,'男装','花花公子男士皮衣春秋季修身韩版立领皮夹克外套男装青年机车服潮',269,3088,95340,'花花公子男士皮衣春秋季修身韩版立领皮夹克外套\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e青年机车服潮','浙江 嘉兴',1,'\\media\\picture\\1\\111.jpg',0,'15:16:51.207131'),(112,'男装','七匹狼羽绒服2019冬季新款男士短款棒球服潮牌冬装轻薄款外套男装',652,189,0,'七匹狼羽绒服2019冬季新款男士短款棒球服潮牌冬装轻薄款外套\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e','福建 厦门',1,'\\media\\picture\\1\\112.jpg',0,'15:16:51.207131'),(113,'男装','金利来2019秋冬装新款男士舒适防风防泼水翻领夹克中年爸爸外套CQ',599,698,962,'金利来2019秋冬装新款男士舒适防风防泼水翻领夹克中年爸爸外套CQ','广东 广州',1,'\\media\\picture\\1\\113.jpg',0,'15:16:51.207131'),(114,'男装','恒源祥春秋季男装西服2019新款商务休闲男士西装韩版修身潮流外套',499,451,13917,'恒源祥春秋季\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e西服2019新款商务休闲男士西装韩版修身潮流外套','浙江 嘉兴',1,'\\media\\picture\\1\\114.jpg',0,'15:16:51.207131'),(115,'男装','反季羽绒服男潮2019新款中长款轻薄潮牌工装帅气潮流男士冬季外套',399,1758,63781,'反季羽绒服男潮2019新款中长款轻薄潮牌工装帅气潮流男士冬季外套','福建 厦门',1,'\\media\\picture\\1\\115.jpg',0,'15:16:51.207131'),(116,'男装','花花公子夹克男士2019春秋新款连帽秋冬百搭外套秋季休闲秋装上衣',269,2562,21277,'花花公子夹克男士2019春秋新款连帽秋冬百搭外套秋季休闲秋装上衣','福建 泉州',1,'\\media\\picture\\1\\116.jpg',0,'15:16:51.207131'),(117,'男装','男士卫衣套装春秋季2019新款大码休闲运动加绒加厚秋冬款外套潮牌',198,2863,87729,'男士卫衣套装春秋季2019新款大码休闲运动加绒加厚秋冬款外套潮牌','福建 泉州',1,'\\media\\picture\\1\\117.jpg',1,'21:20:38.093950'),(118,'男装','啄木鸟真皮皮衣男式皮衣机车皮夹克绵羊皮真皮皮衣男装真皮夹克男',498,3061,74357,'啄木鸟真皮皮衣男式皮衣机车皮夹克绵羊皮真皮皮衣\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e真皮夹克男','上海',1,'\\media\\picture\\1\\118.jpg',0,'15:16:51.207131'),(119,'男装','TEDELON/太子龙男士羽绒服冬季新款休闲狐狸大毛领中长款男装外套',739,456,1426,'TEDELON/太子龙男士羽绒服冬季新款休闲狐狸大毛领中长款\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e外套','安徽 合肥',1,'\\media\\picture\\1\\119.jpg',0,'15:16:51.207131'),(120,'男装','花花公子新款棉衣男士冬季羽绒棉服中长款外套衣服男装反季棉袄潮',299,629,8599,'花花公子新款棉衣男士冬季羽绒棉服中长款外套衣服\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e反季棉袄潮','福建 泉州',1,'\\media\\picture\\1\\120.jpg',0,'15:16:51.207131'),(121,'男装','黑择明男士皮衣短款皮夹克修身秋装上衣青年男装外套pu皮机车服潮',339,770,229,'黑择明男士皮衣短款皮夹克修身秋装上衣青年\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e外套pu皮机车服潮','浙江 杭州',1,'\\media\\picture\\1\\121.jpg',0,'15:16:51.207131'),(122,'男装','马克华菲夹克男士外套春秋休闲男装2019秋冬季新款潮流上衣棒球服',358,3055,0,'马克华菲夹克男士外套春秋休闲\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e2019秋冬季新款潮流上衣棒球服','福建 泉州',1,'\\media\\picture\\1\\122.jpg',0,'15:16:51.207131'),(123,'男装','男装秋冬季手工双面呢羊毛呢子大衣韩版中长款英伦无羊绒风衣外套',598,2641,140787,'\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e秋冬季手工双面呢羊毛呢子大衣韩版中长款英伦无羊绒风衣外套','浙江 杭州',1,'\\media\\picture\\1\\123.jpg',0,'15:16:51.207131'),(124,'男装','GU极优男装防风长绒教练茄克2019新款冬季时尚街头风外套男320285',279,415,1271,'GU极优\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e防风长绒教练茄克2019新款冬季时尚街头风外套男320285','上海',1,'\\media\\picture\\1\\124.jpg',0,'15:16:51.207131'),(125,'男装','GU极优男装松紧工装裤时尚嘻哈多袋潮流百搭男士休闲裤秋季320962',148,1288,1309,'GU极优\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e松紧工装裤时尚嘻哈多袋潮流百搭男士休闲裤秋季320962','上海',1,'\\media\\picture\\1\\125.jpg',0,'15:16:51.207131'),(126,'男装','PUMA彪马羽绒服男装2019冬季新款保暖防风连帽运动迷彩外套581639',999,4,50,'PUMA彪马羽绒服\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e2019冬季新款保暖防风连帽运动迷彩外套581639','江苏 连云港',1,'\\media\\picture\\1\\126.jpg',0,'15:16:51.207131'),(127,'男装','Nike耐克卫衣男 秋冬季新款男装运动服长袖T恤上衣套头衫男士外套',189,274,3646,'Nike耐克卫衣男 秋冬季新款\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e运动服长袖T恤上衣套头衫男士外套','江苏 连云港',1,'\\media\\picture\\1\\127.jpg',0,'15:16:51.207131'),(128,'男装','【邓超同款】杉杉男装超感羽绒服冬季保暖中长款风衣两件式外套男',798,85,0,'【邓超同款】杉杉\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e超感羽绒服冬季保暖中长款风衣两件式外套男','浙江 杭州',1,'\\media\\picture\\1\\128.jpg',0,'15:16:51.207131'),(129,'男装','杉杉男装秋冬中年爸爸翻领短款轻薄羽绒服商务男士防风夹克外套',559,320,0,'杉杉\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e秋冬中年爸爸翻领短款轻薄羽绒服商务男士防风夹克外套','浙江 宁波',1,'\\media\\picture\\1\\129.jpg',0,'15:16:51.207131'),(130,'男装','viishow2019秋季卫衣男 潮牌男士圆领套头嘻哈宽松外套情侣装ins',99,20000,30032,'viishow2019秋季卫衣男 潮牌男士圆领套头嘻哈宽松外套情侣装ins','福建 厦门',1,'\\media\\picture\\1\\130.jpg',0,'15:16:51.207131'),(131,'男装','太平鸟男装明线夹克男士宽松外套落肩绵羊毛茄克毛呢外套潮流落肩',1079,298,0,'太平鸟\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e明线夹克男士宽松外套落肩绵羊毛茄克毛呢外套潮流落肩','浙江 宁波',1,'\\media\\picture\\1\\131.jpg',0,'15:16:51.207131'),(132,'男装','美特斯邦威情侣装工装外套2019新款秋季休闲潮流卡其宽松男士夹克',239.9,685,3652,'美特斯邦威情侣装工装外套2019新款秋季休闲潮流卡其宽松男士夹克','上海',1,'\\media\\picture\\1\\132.jpg',0,'15:16:51.207131'),(133,'男装','viishow2019秋装新品哆啦A梦联名夹克男 潮牌牛仔衣男士扎染外套',299,380,4642,'viishow2019秋装新品哆啦A梦联名夹克男 潮牌牛仔衣男士扎染外套','福建 厦门',1,'\\media\\picture\\1\\133.jpg',0,'15:16:51.207131'),(134,'男装','太平鸟男装GORE-TEX科技羽绒服潮流短款连帽工装防风鹅绒机能外套',2099,103,0,'太平鸟\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003eGORE-TEX科技羽绒服潮流短款连帽工装防风鹅绒机能外套','浙江 宁波',1,'\\media\\picture\\1\\134.jpg',0,'15:16:51.207131'),(135,'男装','美特斯邦威男士羽绒服2019新款冬季连帽中长款工装大毛领羽绒男士',1199.9,0,900,'美特斯邦威男士羽绒服2019新款冬季连帽中长款工装大毛领羽绒男士','上海',1,'\\media\\picture\\1\\135.jpg',0,'15:16:51.207131'),(136,'男装','【设计师合作款】男装 摇粒绒内胆可脱卸连帽外套 422092 优衣库',899,1192,7924,'【设计师合作款】\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e 摇粒绒内胆可脱卸连帽外套 422092 优衣库','上海',1,'\\media\\picture\\1\\136.jpg',0,'15:16:51.207131'),(137,'男装','男装 BLOCKTECH抽绳连帽外套 420543 优衣库UNIQLO',599,2381,668,'\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e BLOCKTECH抽绳连帽外套 420543 优衣库UNIQLO','上海',1,'\\media\\picture\\1\\137.jpg',0,'15:16:51.207131'),(138,'男装','罗蒙男士短款羽绒服时尚休闲字母印花外套中青年2019新款保暖冬装',598,18,1976,'罗蒙男士短款羽绒服时尚休闲字母印花外套中青年2019新款保暖冬装','安徽 合肥',1,'\\media\\picture\\1\\138.jpg',0,'15:16:51.207131'),(139,'男装','罗蒙男士短款羽绒服冬季时尚袖标连帽宽松外套中青年潮流纯色冬装',608,22,610,'罗蒙男士短款羽绒服冬季时尚袖标连帽宽松外套中青年潮流纯色冬装','安徽 合肥',1,'\\media\\picture\\1\\139.jpg',0,'15:16:51.207131'),(140,'男装','鸿星尔克羽绒服男冬季新款保暖加厚运动外套防风衣简约冲锋衣男装',569,0,85,'鸿星尔克羽绒服男冬季新款保暖加厚运动外套防风衣简约冲锋衣\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e','福建 厦门',1,'\\media\\picture\\1\\140.jpg',0,'15:16:51.207131'),(141,'男装','4件 纯棉短袖男T恤纯色圆领半袖打底衫男装衣服t恤全棉学生潮流男',53,37,7449,'4件 纯棉短袖男T恤纯色圆领半袖打底衫\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e衣服t恤全棉学生潮流男','江西 南昌',1,'\\media\\picture\\1\\141.jpg',0,'15:16:51.207131'),(142,'男装','2019新款冬季男士棉衣中长款羽绒大棉服男装帅气袄子学生外套潮牌',198,3021,30400,'2019新款冬季男士棉衣中长款羽绒大棉服\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e帅气袄子学生外套潮牌','江苏 苏州',1,'\\media\\picture\\1\\142.jpg',0,'15:16:51.207131'),(143,'男装','英爵伦 2019秋季新款 夹克 男士秋季外套 男装春秋款秋冬韩版上衣',238,7500,3436,'英爵伦 2019秋季新款 夹克 男士秋季外套 \\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e春秋款秋冬韩版上衣','广东 广州',1,'\\media\\picture\\1\\143.jpg',0,'15:16:51.207131'),(144,'男装','绵羊皮真皮西装男士皮衣短款韩版修身皮夹克商务西服中年薄款',1280,232,0,'绵羊皮真皮西装男士皮衣短款韩版修身皮夹克商务西服中年薄款','浙江 嘉兴',1,'\\media\\picture\\1\\144.jpg',0,'15:16:51.207131'),(145,'男装','鸿星尔克卫衣男2019秋季新款休闲男装套头衫圆领透气简约上衣长袖',129,669,665,'鸿星尔克卫衣男2019秋季新款休闲\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e套头衫圆领透气简约上衣长袖','福建 厦门',1,'\\media\\picture\\1\\145.jpg',0,'15:16:51.207131'),(146,'男装','2019冬季新款男士棉衣短款袄子衣服外套棉服潮流帅气冬装羽绒棉袄',195,2179,10108,'2019冬季新款男士棉衣短款袄子衣服外套棉服潮流帅气冬装羽绒棉袄','浙江 杭州',1,'\\media\\picture\\1\\146.jpg',0,'15:16:51.207131'),(148,'男装','毛衣男冬季韩版加厚款圆领套头毛线衣男学生',69,1117,0,'毛衣男冬季韩版加厚款圆领套头毛线衣男学生潮流宽松男士针织衫','浙江 杭州',1,'\\media\\picture\\1\\148.jpg',1,'15:16:51.207131'),(149,'男装','卫衣男连帽长袖套装春秋季男装宽松潮学生',39.9,1750,599918,'秋冬季卫衣套装男连帽长袖\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e加绒加厚宽松潮假两件衣服情侣外套','浙江 杭州',1,'\\media\\picture\\1\\149.jpg',1,'22:50:10.134575'),(150,'男装','雅鹿反季羽绒服男士冬季2019新款爆款加厚冬装中长款羽绒外套男D',639,2001,0,'雅鹿反季羽绒服男士冬季2019新款爆款加厚冬装中长款羽绒外套男D','浙江 嘉兴',1,'\\media\\picture\\1\\150.jpg',1,'15:16:51.207131'),(151,'男装','羽绒服男士外套冬季2019新款韩版潮流轻薄款短款爆款帅气冬装潮牌',298,1698,0,'羽绒服男士外套冬季2019新款韩版潮流轻薄款短款爆款帅气冬装潮牌','福建 泉州',1,'\\media\\picture\\1\\151.jpg',1,'15:16:51.207131'),(152,'男装','yaloo/雅鹿男装冬季加厚羽绒马甲中老年装内胆背心保暖防寒马夹男',149,3735,7646,'yaloo/雅鹿\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e冬季加厚羽绒马甲中老年装内胆背心保暖防寒马夹男','江苏 宿迁',1,'\\media\\picture\\1\\152.jpg',1,'15:16:51.207131'),(153,'男装','黑择明男士秋装上衣韩版机车服修身皮衣短款PU皮夹克潮流男装外套',359,498,530,'黑择明男士秋装上衣韩版机车服修身皮衣短款PU皮夹克潮流\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e外套','浙江 杭州',1,'\\media\\picture\\1\\153.jpg',1,'15:16:51.207131'),(154,'男装','南极人爸爸装秋冬季羊毛呢夹克上衣中老年人男士加厚夹棉保暖外套',255,1929,482,'南极人爸爸装秋冬季羊毛呢夹克上衣中老年人男士加厚夹棉保暖外套','浙江 嘉兴',1,'\\media\\picture\\1\\154.jpg',1,'15:16:51.207131'),(155,'男装','男士羽绒服中长款2019新款冬季潮流帅气工装轻薄潮牌加厚冬装外套',398,891,9009,'男士羽绒服中长款2019新款冬季潮流帅气工装轻薄潮牌加厚冬装外套','福建 厦门',1,'\\media\\picture\\1\\155.jpg',1,'15:16:51.207131'),(156,'男装','套装男士卫衣秋冬季2019新款连帽金丝绒运动潮流加绒休闲外套男装',199,1356,31913,'套装男士卫衣秋冬季2019新款连帽金丝绒运动潮流加绒休闲外套\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e','福建 泉州',1,'\\media\\picture\\1\\156.jpg',1,'15:16:51.207131'),(157,'男装','A21新款2019男装修身小脚牛仔裤 男士弹力长裤刺绣潮流男裤子秋季',139,10000,15921,'A21新款2019\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e修身小脚牛仔裤 男士弹力长裤刺绣潮流男裤子秋季','广东 东莞',1,'\\media\\picture\\1\\157.jpg',1,'15:16:51.207131'),(158,'男装','GXG男装2019年秋季新款多色毛衣男宽松落肩袖针织衫毛衣羊毛衫潮',399,1003,6804,'GXG\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e2019年秋季新款多色毛衣男宽松落肩袖针织衫毛衣羊毛衫潮','浙江 宁波',1,'\\media\\picture\\1\\158.jpg',1,'15:16:51.207131'),(159,'男装','中年男装爸爸秋装上衣40岁50中老年人夹克外套男士加厚秋冬季衣服',128,15000,0,'中年\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e爸爸秋装上衣40岁50中老年人夹克外套男士加厚秋冬季衣服','江苏 苏州',1,'\\media\\picture\\1\\159.jpg',0,'15:16:51.207131'),(160,'男装','白鸭绒 90绒 男士羽绒服 2019新款爆款 潮流连帽宽松工装冬季外套',599,548,3736,'白鸭绒 90绒 男士羽绒服 2019新款爆款 潮流连帽宽松工装冬季外套','广东 广州',1,'\\media\\picture\\1\\160.jpg',1,'15:16:51.207131'),(161,'男装','爸爸冬装外套中年棉衣加绒加厚款冬季羽绒棉服中老年男装爷爷棉袄',188,1188,123009,'爸爸冬装外套中年棉衣加绒加厚款冬季羽绒棉服中老年\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e爷爷棉袄','江苏 苏州',1,'\\media\\picture\\1\\161.jpg',1,'15:16:51.207131'),(162,'男装','英爵伦 2019新款棉衣男 冬季棉服 男士棉袄 冬装潮牌男装加厚外套',258,902,220,'英爵伦 2019新款棉衣男 冬季棉服 男士棉袄 冬装潮牌\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e加厚外套','广东 广州',1,'\\media\\picture\\1\\162.jpg',1,'15:16:51.207131'),(163,'男装','传奇保罗风衣男中长款2019秋季新款上衣春秋款英伦风男装秋装外套',428,769,2372,'传奇保罗风衣男中长款2019秋季新款上衣春秋款英伦风\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e秋装外套','福建 泉州',1,'\\media\\picture\\1\\163.jpg',1,'15:16:51.207131'),(164,'男装','棉衣男士外套冬季潮流中长棉袄加肥加大码工装加厚大衣羽绒棉服男',258,3588,41078,'棉衣男士外套冬季潮流中长棉袄加肥加大码工装加厚大衣羽绒棉服男','福建 泉州',1,'\\media\\picture\\1\\164.jpg',1,'15:16:51.207131'),(165,'男装','恒源祥2019冬季新款爆款中长款男士羽绒服加厚中老年爸爸装外套男',628,757,991,'恒源祥2019冬季新款爆款中长款男士羽绒服加厚中老年爸爸装外套男','江苏 苏州',1,'\\media\\picture\\1\\165.jpg',1,'15:16:51.207131'),(166,'男装','七匹狼长袖t恤2019秋季新款中年男士上衣纯棉polo衫秋装体恤男装',199,2704,0,'七匹狼长袖t恤2019秋季新款中年男士上衣纯棉polo衫秋装体恤\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e','福建 厦门',1,'\\media\\picture\\1\\166.jpg',1,'15:16:51.207131'),(167,'男装','棉衣男士冬季外套2019新款韩版潮流冬天加厚棉袄冬装潮牌羽绒棉服',158,10000,51212,'棉衣男士冬季外套2019新款韩版潮流冬天加厚棉袄冬装潮牌羽绒棉服','福建 泉州',1,'\\media\\picture\\1\\167.jpg',1,'15:16:51.207131'),(168,'男装','中老年爸爸秋冬季外套男士毛呢大衣50岁冬装长款加绒加厚冬天棉服',298,889,9292,'中老年爸爸秋冬季外套男士毛呢大衣50岁冬装长款加绒加厚冬天棉服','浙江 杭州',1,'\\media\\picture\\1\\168.jpg',1,'15:16:51.207131'),(169,'男装','七匹狼夹克衫2019春秋季新款休闲爸爸外套中年男士秋装上衣男装冬',439,1142,0,'七匹狼夹克衫2019春秋季新款休闲爸爸外套中年男士秋装上衣\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e冬','福建 厦门',1,'\\media\\picture\\1\\169.jpg',1,'15:16:51.207131'),(170,'男装','阿迪达斯官网 O1 WB PARK 男装运动型格连帽夹克外套EH3743EH3745',699,343,415,'阿迪达斯官网 O1 WB PARK \\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e运动型格连帽夹克外套EH3743EH3745','江苏 苏州',1,'\\media\\picture\\1\\170.jpg',1,'15:16:51.207131'),(171,'男装','南极人中老年男装夹克衫秋冬季爸爸秋装外套男士商务休闲立领上衣',149,5500,37083,'南极人中老年\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e夹克衫秋冬季爸爸秋装外套男士商务休闲立领上衣','浙江 嘉兴',1,'\\media\\picture\\1\\171.jpg',1,'15:16:51.207131'),(172,'男装','金利来2019秋冬装新款男士舒适防风防泼水翻领夹克中年爸爸外套CQ',599,693,939,'金利来2019秋冬装新款男士舒适防风防泼水翻领夹克中年爸爸外套CQ','广东 广州',1,'\\media\\picture\\1\\172.jpg',1,'15:16:51.207131'),(173,'男装','传奇保罗外套男春秋款2019年秋季新款棒球服潮流男装休闲薄款夹克',598,535,953,'传奇保罗外套男春秋款2019年秋季新款棒球服潮流\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e休闲薄款夹克','福建 泉州',1,'\\media\\picture\\1\\173.jpg',1,'15:16:51.207131'),(175,'男装','花花公子夹克男士2019春秋新款秋冬百搭加绒外套秋季休闲秋装上衣',269,2588,61035,'花花公子夹克男士2019春秋新款秋冬百搭加绒外套秋季休闲秋装上衣','福建 泉州',1,'\\media\\picture\\1\\175.jpg',1,'15:16:51.207131'),(176,'男装','马克华菲牛仔外套男士2019春秋季款韩版潮流刺绣工装牛仔衣夹克男',388,570,0,'马克华菲牛仔外套男士2019春秋季款韩版潮流刺绣工装牛仔衣夹克男','湖北 武汉',1,'\\media\\picture\\1\\176.jpg',1,'15:16:51.207131'),(177,'男装','GU极优男装松紧工装裤时尚嘻哈多袋潮流百搭男士休闲裤秋季320962',148,1276,1298,'GU极优\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e松紧工装裤时尚嘻哈多袋潮流百搭男士休闲裤秋季320962','上海',1,'\\media\\picture\\1\\177.jpg',1,'15:16:51.207131'),(178,'男装','GU极优男装小高领卫衣经典圆领简约纯色上衣套头衫春秋百搭317488',89,2550,567,'GU极优\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e小高领卫衣经典圆领简约纯色上衣套头衫春秋百搭317488','上海',1,'\\media\\picture\\1\\178.jpg',1,'15:16:51.207131'),(179,'男装','Nike耐克卫衣男 秋冬季新款男装运动服长袖T恤上衣套头衫男士外套',189,269,3637,'Nike耐克卫衣男 秋冬季新款\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e运动服长袖T恤上衣套头衫男士外套','江苏 连云港',1,'\\media\\picture\\1\\179.jpg',1,'15:16:51.207131'),(180,'男装','NIKE耐克卫衣男装2019冬季新款长袖上衣运动外套加绒套头衫AR6641',229,47,320,'NIKE耐克卫衣\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e2019冬季新款长袖上衣运动外套加绒套头衫AR6641','江苏 连云港',1,'\\media\\picture\\1\\180.jpg',1,'15:16:51.207131'),(181,'男装','太平鸟男装 大毛领中长款加厚羽绒服后背刺绣休闲保暖外套韩版潮',1599,412,0,'太平鸟\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e 大毛领中长款加厚羽绒服后背刺绣休闲保暖外套韩版潮','浙江 宁波',1,'\\media\\picture\\1\\181.jpg',1,'15:16:51.207131'),(182,'男装','太平鸟男装 双面呢夹克短款大衣千鸟格工装夹克外套男士潮流茄克',999,546,0,'太平鸟\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e 双面呢夹克短款大衣千鸟格工装夹克外套男士潮流茄克','浙江 宁波',1,'\\media\\picture\\1\\182.jpg',1,'15:16:51.207131'),(183,'男装','杉杉2019秋冬新款男士长袖白衬衫抗皱商务正装中青年白色衬衣',139,2255,0,'杉杉2019秋冬新款男士长袖白衬衫抗皱商务正装中青年白色衬衣','浙江 宁波',1,'\\media\\picture\\1\\183.jpg',1,'15:16:51.207131'),(184,'男装','【邓超同款】杉杉男装超感羽绒服冬季保暖中长款风衣两件式外套男',798,83,0,'【邓超同款】杉杉\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e超感羽绒服冬季保暖中长款风衣两件式外套男','浙江 杭州',1,'\\media\\picture\\1\\184.jpg',1,'15:16:51.207131'),(185,'男装','VIISHOW2019哆啦A梦联名款卫衣男 日系男士情侣装外套连帽套头潮',179,1185,4370,'VIISHOW2019哆啦A梦联名款卫衣男 日系男士情侣装外套连帽套头潮','福建 厦门',1,'\\media\\picture\\1\\185.jpg',1,'15:16:51.207131'),(186,'男装','美特斯邦威棉服男帅气新款秋潮流韩版中长仿羊羔绒牛仔夹克男装',299.9,173,261,'美特斯邦威棉服男帅气新款秋潮流韩版中长仿羊羔绒牛仔夹克\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e','上海',1,'\\media\\picture\\1\\186.jpg',1,'15:16:51.207131'),(188,'男装','美特斯邦威牛仔裤男装春秋韩版潮流休闲青年多色弹力修身裤子男士',129.9,616,1939,'美特斯邦威牛仔裤\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e春秋韩版潮流休闲青年多色弹力修身裤子男士','上海',1,'\\media\\picture\\1\\188.jpg',1,'15:16:51.207131'),(189,'男装','VIISHOW冬装哆啦A梦联名款棉衣男 潮牌保暖棒球领小棉服男士外套',359,86,391,'VIISHOW冬装哆啦A梦联名款棉衣男 潮牌保暖棒球领小棉服男士外套','福建 厦门',1,'\\media\\picture\\1\\189.jpg',2,'15:16:51.207131'),(190,'男装','男装 高级轻型羽绒便携式茄克 419996 优衣库UNIQLO',399,2470,14048,'\\u003cspan class\\u003dH\\u003e男装\\u003c/span\\u003e 高级轻型羽绒便携式茄克 419996 优衣库UNIQLO','上海',1,'\\media\\picture\\1\\190.jpg',3,'15:16:51.207131');
/*!40000 ALTER TABLE `goods_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_order`
--

DROP TABLE IF EXISTS `goods_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `goods_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `totalprice` double NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_order_user_id_bd5a6274_fk_auth_user_id` (`user_id`),
  CONSTRAINT `goods_order_user_id_bd5a6274_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_order`
--

LOCK TABLES `goods_order` WRITE;
/*!40000 ALTER TABLE `goods_order` DISABLE KEYS */;
INSERT INTO `goods_order` VALUES (1,'wlhang','南京航空航天大学','15151825268','2019-11-18 20:57:27.526330','2019-11-18 20:57:27.526330',0,2,0,0),(12,'wlhang','南京航空航天大学','3333','2019-11-21 22:19:41.817652','2019-11-22 12:00:40.012746',1,1,178,1),(13,'wlhang','南京航空航天大学','3333','2019-11-21 22:20:51.186062','2019-11-22 11:49:25.051734',1,1,3382,0),(14,'wlhang','南京航空航天大学','3333','2019-11-21 22:50:09.572663','2019-11-21 22:50:16.768563',1,1,39.9,0),(15,'admin','home','123456','2019-11-22 10:01:38.593694','2019-11-22 10:01:38.749925',0,1,1194,0),(16,'admin','home','123456','2019-11-22 10:02:39.012525','2019-11-22 10:02:39.121913',0,1,376,0),(17,'admin','home','123456','2019-11-22 15:40:40.806110','2019-11-22 15:40:40.899872',0,1,508,0),(18,'admin','home','123456','2019-11-22 15:46:53.063611','2019-11-22 15:47:04.175102',1,1,178,0);
/*!40000 ALTER TABLE `goods_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_orderitem`
--

DROP TABLE IF EXISTS `goods_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `goods_orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(8,2) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_orderitem_order_id_0c207842_fk_goods_order_id` (`order_id`),
  KEY `goods_orderitem_product_id_ce8a7863_fk_goods_goods_id` (`product_id`),
  CONSTRAINT `goods_orderitem_order_id_0c207842_fk_goods_order_id` FOREIGN KEY (`order_id`) REFERENCES `goods_order` (`id`),
  CONSTRAINT `goods_orderitem_product_id_ce8a7863_fk_goods_goods_id` FOREIGN KEY (`product_id`) REFERENCES `goods_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_orderitem`
--

LOCK TABLES `goods_orderitem` WRITE;
/*!40000 ALTER TABLE `goods_orderitem` DISABLE KEYS */;
INSERT INTO `goods_orderitem` VALUES (1,758.00,1,1,78,'',0),(2,39.90,1,1,149,'',0),(20,178.00,1,12,80,'【直营】韩都衣舍2019韩版女装春装新款宽松豹纹连衣裙JN8322埕',1),(21,178.00,19,13,80,'【直营】韩都衣舍2019韩版女装春装新款宽松豹纹连衣裙JN8322埕',0),(22,39.90,1,14,149,'卫衣男连帽长袖套装春秋季男装宽松潮学生',0),(23,508.00,2,15,62,'韩都衣舍2019冬装新款女韩版大码加厚棉衣过膝棉袄女棉服ins外套',0),(24,178.00,1,15,80,'【直营】韩都衣舍2019韩版女装春装新款宽松豹纹连衣裙JN8322埕',0),(25,178.00,1,16,80,'【直营】韩都衣舍2019韩版女装春装新款宽松豹纹连衣裙JN8322埕',0),(26,198.00,1,16,69,'韩都衣舍2019新款初秋气质女神范衣服假两件碎花连衣裙GS10128緈',0),(27,508.00,1,17,62,'韩都衣舍2019冬装新款女韩版大码加厚棉衣过膝棉袄女棉服ins外套',0),(28,178.00,2,18,80,'【直营】韩都衣舍2019韩版女装春装新款宽松豹纹连衣裙JN8322埕',0);
/*!40000 ALTER TABLE `goods_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_search`
--

DROP TABLE IF EXISTS `goods_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `goods_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(30) NOT NULL,
  `time` datetime(6) NOT NULL,
  `name_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_search_name_id_3f09879b_fk_auth_user_id` (`name_id`),
  CONSTRAINT `goods_search_name_id_3f09879b_fk_auth_user_id` FOREIGN KEY (`name_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_search`
--

LOCK TABLES `goods_search` WRITE;
/*!40000 ALTER TABLE `goods_search` DISABLE KEYS */;
INSERT INTO `goods_search` VALUES (1,'秋季','2019-10-24 19:43:31.828324',2),(2,'秋季','2019-10-25 11:47:47.201345',2),(3,'秋季','2019-10-25 11:47:56.666287',2),(4,'秋季','2019-10-25 11:54:32.290621',2),(5,'秋季','2019-10-25 11:54:35.290158',2),(6,'','2019-10-25 11:54:43.913149',2),(7,'','2019-10-25 11:56:50.233630',2),(8,'','2019-10-25 11:58:10.038812',2),(9,'','2019-10-25 12:00:43.515838',2),(10,'','2019-10-25 12:01:10.877995',2),(11,'','2019-10-25 12:04:13.171603',2),(12,'','2019-10-25 12:04:41.560481',2),(13,'','2019-10-25 12:04:59.009803',2),(14,'','2019-10-25 12:05:34.852052',2),(15,'','2019-10-25 12:09:41.243074',2),(16,'','2019-10-25 12:10:27.283338',2),(17,'','2019-10-25 12:10:37.968039',2),(18,'','2019-10-25 12:10:41.278496',2),(19,'','2019-10-25 12:10:43.226175',2),(20,'','2019-10-25 12:11:57.534840',2),(21,'','2019-10-25 12:12:11.628018',2),(22,'','2019-10-25 12:16:34.833097',2),(23,'','2019-10-25 12:18:03.282750',2),(24,'','2019-10-25 12:18:09.655554',2),(25,'','2019-10-25 12:18:35.635144',2),(26,'','2019-10-25 12:19:03.249050',2),(27,'','2019-10-25 12:19:31.311145',2),(28,'','2019-10-25 12:19:46.196580',2),(29,'','2019-10-25 12:21:37.853002',2),(30,'','2019-10-25 12:22:04.052703',2),(31,'','2019-10-25 12:22:11.634792',2),(32,'','2019-10-25 12:22:53.361301',2),(33,'','2019-10-25 12:23:07.977889',2),(34,'','2019-10-25 12:23:17.447198',2),(35,'','2019-10-25 12:25:06.200825',2),(36,'','2019-10-25 12:25:14.929287',2),(37,'','2019-10-25 12:27:26.740398',2),(38,'','2019-10-25 12:30:29.571415',2),(39,'','2019-10-25 12:30:36.529201',2),(40,'','2019-10-25 12:30:52.307058',2),(41,'','2019-10-25 12:31:47.928862',2),(42,'','2019-10-25 12:32:32.760557',2),(43,'','2019-10-25 12:32:39.369329',2),(44,'','2019-10-25 13:00:09.566304',2),(45,'','2019-10-25 13:00:27.232714',2),(46,'','2019-10-25 13:05:53.214354',2),(47,'','2019-10-25 13:12:07.717948',2),(48,'','2019-10-25 13:12:26.700126',2),(49,'','2019-10-25 13:13:13.359027',2),(50,'','2019-10-25 13:13:26.741376',2),(51,'','2019-10-25 13:13:46.504549',2),(52,'','2019-10-25 14:10:37.544465',2),(53,'','2019-10-25 14:10:40.297178',2),(54,'','2019-10-25 14:11:52.586320',2),(55,'','2019-10-25 14:15:09.164981',2),(56,'','2019-10-25 14:16:15.820095',2),(57,'秋季','2019-10-25 16:17:51.146288',2),(58,'秋季','2019-10-25 16:17:56.086274',2),(59,'秋季','2019-10-25 16:18:01.831742',2),(60,'秋季','2019-10-25 16:18:05.889929',2),(61,'秋季','2019-10-25 16:18:10.448576',2),(62,'秋季','2019-10-25 16:19:43.699872',2),(63,'','2019-10-25 16:19:58.296058',2),(64,'秋季','2019-10-29 10:47:07.793890',2),(65,'秋季','2019-10-29 10:47:15.865382',2),(66,'秋季','2019-10-29 10:47:18.695374',2),(67,'秋季','2019-10-29 10:48:09.343116',2),(68,'秋季','2019-10-29 10:50:45.583112',2),(69,'','2019-10-29 10:50:52.903160',2),(70,'','2019-10-29 10:51:29.358294',2),(71,'秋季','2019-10-29 10:51:32.652704',2),(72,'秋季','2019-10-29 10:52:19.455807',2),(73,'秋季','2019-10-29 10:52:26.011142',2),(74,'秋季','2019-10-29 10:52:27.715260',2),(75,'秋季','2019-10-29 11:49:24.960803',1),(76,'秋季','2019-10-29 11:49:40.418422',1),(77,'秋季','2019-10-29 11:49:48.270375',1),(78,'秋季','2019-10-29 11:52:01.921778',1),(79,'秋季','2019-10-29 11:53:16.680509',1),(80,'秋季','2019-10-29 11:53:23.648624',1),(81,'秋季','2019-10-29 11:53:29.582559',1),(82,'秋季','2019-10-29 11:53:35.519810',1),(83,'秋季','2019-10-29 11:53:39.703123',1),(84,'秋季','2019-10-29 11:53:42.432495',1),(85,'秋季','2019-10-29 11:53:44.861571',1),(86,'秋季','2019-10-29 11:53:46.365530',1),(87,'秋季','2019-10-29 11:53:48.271254',1),(88,'秋季','2019-10-29 11:53:50.657592',1),(89,'秋季','2019-10-29 11:53:52.198361',1),(90,'秋季','2019-10-29 11:53:53.980094',1),(91,'秋季','2019-10-29 11:53:55.542800',1),(92,'秋季','2019-10-29 11:56:45.906899',1),(93,'秋季','2019-10-29 11:56:47.662422',1),(94,'秋季','2019-10-29 11:56:49.639134',1),(95,'秋季','2019-10-29 11:56:53.134658',1),(96,'秋季','2019-10-29 11:56:56.978592',1),(97,'秋季','2019-10-29 11:56:59.911768',1),(98,'秋季','2019-10-29 11:57:02.793293',1),(99,'秋季','2019-10-29 11:57:04.838905',1),(100,'秋季','2019-10-29 11:57:12.726803',1),(101,'秋季','2019-10-29 11:57:58.066808',1),(102,'','2019-10-29 11:58:04.837840',1),(103,'秋季','2019-10-29 13:00:33.957105',1),(104,'秋季','2019-10-29 13:00:40.774144',1),(105,'秋季','2019-10-29 13:05:17.545886',1),(106,'秋季','2019-10-29 13:14:11.853312',1),(107,'秋季','2019-10-29 13:14:26.498436',1),(108,'秋季','2019-10-29 13:14:28.932804',1),(109,'秋季','2019-10-29 13:14:34.168291',1),(110,'秋季','2019-10-29 13:14:38.020711',1),(111,'秋季','2019-10-29 13:14:40.651000',1),(112,'秋季','2019-10-29 13:14:48.872891',1),(113,'','2019-10-29 13:14:53.692167',1),(114,'秋季','2019-11-18 20:01:18.639278',2),(115,'秋季','2019-11-18 20:02:19.839915',2),(116,'秋季','2019-11-18 20:02:59.835685',2),(117,'秋季','2019-11-18 20:03:23.091613',2),(118,'秋季','2019-11-18 20:03:51.077592',2),(119,'秋季','2019-11-18 20:04:10.259969',2),(120,'秋季','2019-11-18 20:05:47.021621',2),(121,'秋季','2019-11-18 20:06:57.824214',2),(122,'秋季','2019-11-18 20:08:13.264971',2),(123,'秋季','2019-11-18 20:08:45.634068',2),(124,'秋季','2019-11-18 20:10:32.591089',2),(125,'秋季','2019-11-18 20:10:46.983241',2),(126,'秋季','2019-11-18 20:10:56.348029',2),(127,'秋季','2019-11-18 20:11:11.240091',2),(128,'秋季','2019-11-18 20:12:16.136090',2),(129,'秋季','2019-11-18 20:12:58.660085',2),(130,'秋季','2019-11-18 20:15:29.001274',2),(131,'秋季','2019-11-18 20:16:52.040158',2),(132,'秋季','2019-11-18 20:20:10.800654',2),(133,'秋季','2019-11-18 20:20:49.421390',2),(134,'秋季','2019-11-18 20:21:00.896345',2),(135,'秋季','2019-11-18 20:21:28.702585',2),(136,'秋季','2019-11-18 20:22:44.919702',2),(137,'秋季','2019-11-18 20:24:00.520113',2),(138,'秋季','2019-11-18 20:24:55.467285',2),(139,'秋季','2019-11-18 20:27:30.274415',2),(140,'秋季','2019-11-18 20:27:33.690917',2),(141,'秋季','2019-11-18 20:28:33.011091',2),(142,'秋季','2019-11-18 20:28:34.504862',2),(143,'秋季','2019-11-18 20:28:45.732756',2),(144,'秋季','2019-11-18 20:28:47.536475',2),(145,'秋季','2019-11-18 20:28:48.686305',2),(146,'秋季','2019-11-18 20:28:50.082078',2),(147,'秋季','2019-11-18 20:28:51.145912',2),(148,'秋季','2019-11-18 20:32:17.792892',2),(149,'秋季','2019-11-18 20:32:26.490821',2),(150,'秋季','2019-11-18 20:32:28.885675',2),(151,'秋季','2019-11-18 20:33:35.870546',2),(152,'秋季','2019-11-18 20:33:38.312672',2),(153,'秋季','2019-11-18 20:33:40.051402',2),(154,'秋季','2019-11-18 20:33:41.021270',2),(155,'秋季','2019-11-18 20:35:15.423809',2),(156,'秋季','2019-11-18 20:35:22.431524',2),(157,'秋季','2019-11-18 20:35:23.879298',2),(158,'秋季','2019-11-18 20:35:25.368319',2),(159,'秋季','2019-11-18 20:35:45.446674',2),(160,'秋季','2019-11-18 20:35:47.010452',2),(161,'秋季','2019-11-18 20:35:48.278232',2),(162,'秋季','2019-11-18 20:35:50.199950',2),(163,'秋季','2019-11-18 20:36:04.401597',2),(164,'秋季','2019-11-18 20:39:13.108103',2),(165,'秋季','2019-11-18 20:39:15.451771',2),(166,'秋季','2019-11-18 20:39:18.737747',2),(167,'秋季','2019-11-18 20:39:19.994572',2),(168,'秋季','2019-11-18 20:39:21.159389',2),(169,'秋季','2019-11-18 20:39:34.622691',2),(170,'秋季','2019-11-18 20:39:39.355439',2),(171,'秋季','2019-11-18 20:39:42.489824',2),(172,'','2019-11-18 20:39:47.203969',2),(173,'秋季','2019-11-18 20:55:03.591907',2),(174,'','2019-11-18 20:55:13.925990',2),(175,'秋季','2019-11-18 21:20:19.595867',1),(176,'秋季','2019-11-18 21:20:24.981095',1),(177,'秋季','2019-11-18 21:20:30.050212',1),(178,'秋季','2019-11-18 21:20:39.353756',1),(179,'卫衣','2019-11-19 21:17:28.881416',1),(180,'卫衣','2019-11-19 21:17:39.338807',1),(181,'秋季','2019-11-20 17:29:47.661625',1),(182,'秋季','2019-11-20 17:29:54.326611',1),(183,'秋季','2019-11-20 17:29:56.421318',1),(184,'秋季','2019-11-20 17:30:43.312222',1),(185,'','2019-11-20 17:30:48.519588',1),(186,'秋季','2019-11-20 17:36:20.481859',1),(187,'秋季','2019-11-20 17:36:21.952636',1),(188,'秋季','2019-11-20 17:36:23.591384',1),(189,'秋季','2019-11-20 17:49:22.372175',1),(190,'秋季','2019-11-20 17:50:04.462510',1),(191,'秋季','2019-11-20 17:50:09.160815',1),(192,'秋季','2019-11-20 17:50:14.614117',1),(193,'秋季','2019-11-20 17:50:56.271877',1),(194,'秋季','2019-11-20 17:51:23.622105',1),(195,'韩都衣舍','2019-11-20 17:51:30.989129',1),(196,'男装','2019-11-20 17:51:37.319246',1),(197,'韩都衣舍','2019-11-20 17:52:21.012871',1),(198,'秋季','2019-11-20 17:52:32.064608',1),(199,'秋季','2019-11-20 20:59:52.157984',1),(200,'秋季','2019-11-20 23:28:51.126550',1),(201,'秋季','2019-11-20 23:29:20.174162',1),(202,'韩都衣舍','2019-11-21 13:03:39.809838',1),(203,'卫衣','2019-11-21 13:03:44.075671',1),(204,'秋季','2019-11-21 13:03:47.233117',1),(205,'韩都衣舍','2019-11-21 13:03:49.239352',1);
/*!40000 ALTER TABLE `goods_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_shop`
--

DROP TABLE IF EXISTS `users_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `instruction` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_shop_owner_id_548a075b_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `users_shop_owner_id_548a075b_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_shop`
--

LOCK TABLES `users_shop` WRITE;
/*!40000 ALTER TABLE `users_shop` DISABLE KEYS */;
INSERT INTO `users_shop` VALUES (1,'buy_or_not',2,'男装'),(2,'韩都衣舍',2,'女装'),(7,'test1',1,'hh'),(9,'test2',1,'test'),(10,'test3',2,'test'),(11,'test4',3,'test'),(12,'test5',1,'test'),(13,'test6',2,'test'),(14,'test7',3,'test'),(15,'test8',1,'test'),(16,'test9',2,'test'),(17,'test10',3,'test'),(19,'test11',1,'test');
/*!40000 ALTER TABLE `users_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_confirm`
--

DROP TABLE IF EXISTS `users_user_confirm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_user_confirm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `c_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `users_user_confirm_user_id_87793a24_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_confirm`
--

LOCK TABLES `users_user_confirm` WRITE;
/*!40000 ALTER TABLE `users_user_confirm` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_confirm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_profile`
--

DROP TABLE IF EXISTS `users_user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_user_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shopping_cart` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `users_user_profile_user_id_c0f3ff8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_profile`
--

LOCK TABLES `users_user_profile` WRITE;
/*!40000 ALTER TABLE `users_user_profile` DISABLE KEYS */;
INSERT INTO `users_user_profile` VALUES (1,2,'123456',2,7),(2,1,'123456',3,0),(3,3,'123456',1,5),(5,1,'123456',5,6);
/*!40000 ALTER TABLE `users_user_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-22 15:48:57
