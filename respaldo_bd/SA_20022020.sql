-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sa_prueba
-- ------------------------------------------------------
-- Server version	8.0.17

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add (\'Menu\',)',7,'add_confmenu'),(26,'Can change (\'Menu\',)',7,'change_confmenu'),(27,'Can delete (\'Menu\',)',7,'delete_confmenu'),(28,'Can view (\'Menu\',)',7,'view_confmenu'),(29,'Can add (\'Modulo\',)',8,'add_confmodulo'),(30,'Can change (\'Modulo\',)',8,'change_confmodulo'),(31,'Can delete (\'Modulo\',)',8,'delete_confmodulo'),(32,'Can view (\'Modulo\',)',8,'view_confmodulo'),(33,'Can add Modulo_Menu',9,'add_confmodulo_menu'),(34,'Can change Modulo_Menu',9,'change_confmodulo_menu'),(35,'Can delete Modulo_Menu',9,'delete_confmodulo_menu'),(36,'Can view Modulo_Menu',9,'view_confmodulo_menu'),(37,'Can add (\'Rol\',)',10,'add_confrol'),(38,'Can change (\'Rol\',)',10,'change_confrol'),(39,'Can delete (\'Rol\',)',10,'delete_confrol'),(40,'Can view (\'Rol\',)',10,'view_confrol'),(41,'Can add (\'Usuario\',)',11,'add_confusuario'),(42,'Can change (\'Usuario\',)',11,'change_confusuario'),(43,'Can delete (\'Usuario\',)',11,'delete_confusuario'),(44,'Can view (\'Usuario\',)',11,'view_confusuario'),(45,'Can add (\'Lista\',)',12,'add_genrgeneral'),(46,'Can change (\'Lista\',)',12,'change_genrgeneral'),(47,'Can delete (\'Lista\',)',12,'delete_genrgeneral'),(48,'Can view (\'Lista\',)',12,'view_genrgeneral'),(49,'Can add (\'Año lectivo\',)',13,'add_mantaniolectivo'),(50,'Can change (\'Año lectivo\',)',13,'change_mantaniolectivo'),(51,'Can delete (\'Año lectivo\',)',13,'delete_mantaniolectivo'),(52,'Can view (\'Año lectivo\',)',13,'view_mantaniolectivo'),(53,'Can add (\'Empleado\',)',14,'add_mantempleado'),(54,'Can change (\'Empleado\',)',14,'change_mantempleado'),(55,'Can delete (\'Empleado\',)',14,'delete_mantempleado'),(56,'Can view (\'Empleado\',)',14,'view_mantempleado'),(57,'Can add (\'Estudiante\',)',15,'add_mantestudiante'),(58,'Can change (\'Estudiante\',)',15,'change_mantestudiante'),(59,'Can delete (\'Estudiante\',)',15,'delete_mantestudiante'),(60,'Can view (\'Estudiante\',)',15,'view_mantestudiante'),(61,'Can add (\'Persona\',)',16,'add_mantpersona'),(62,'Can change (\'Persona\',)',16,'change_mantpersona'),(63,'Can delete (\'Persona\',)',16,'delete_mantpersona'),(64,'Can view (\'Persona\',)',16,'view_mantpersona'),(65,'Can add Curso',17,'add_movcabcurso'),(66,'Can change Curso',17,'change_movcabcurso'),(67,'Can delete Curso',17,'delete_movcabcurso'),(68,'Can view Curso',17,'view_movcabcurso'),(69,'Can add Matriculacion estudiante',18,'add_movmatriculacionestudiante'),(70,'Can change Matriculacion estudiante',18,'change_movmatriculacionestudiante'),(71,'Can delete Matriculacion estudiante',18,'delete_movmatriculacionestudiante'),(72,'Can view Matriculacion estudiante',18,'view_movmatriculacionestudiante'),(73,'Can add Asignacion de curso',19,'add_movestudianteasignacioncurso'),(74,'Can change Asignacion de curso',19,'change_movestudianteasignacioncurso'),(75,'Can delete Asignacion de curso',19,'delete_movestudianteasignacioncurso'),(76,'Can view Asignacion de curso',19,'view_movestudianteasignacioncurso'),(77,'Can add Detalle Registro de Curso',20,'add_movdetalleregistronotas'),(78,'Can change Detalle Registro de Curso',20,'change_movdetalleregistronotas'),(79,'Can delete Detalle Registro de Curso',20,'delete_movdetalleregistronotas'),(80,'Can view Detalle Registro de Curso',20,'view_movdetalleregistronotas'),(81,'Can add Detalle Materia Curso',21,'add_movdetallemateriacurso'),(82,'Can change Detalle Materia Curso',21,'change_movdetallemateriacurso'),(83,'Can delete Detalle Materia Curso',21,'delete_movdetallemateriacurso'),(84,'Can view Detalle Materia Curso',21,'view_movdetallemateriacurso'),(85,'Can add Detalle Empleado',22,'add_movdetalleempleado'),(86,'Can change Detalle Empleado',22,'change_movdetalleempleado'),(87,'Can delete Detalle Empleado',22,'delete_movdetalleempleado'),(88,'Can view Detalle Empleado',22,'view_movdetalleempleado'),(89,'Can add Registro Notas',23,'add_movcabregistronotas'),(90,'Can change Registro Notas',23,'change_movcabregistronotas'),(91,'Can delete Registro Notas',23,'delete_movcabregistronotas'),(92,'Can view Registro Notas',23,'view_movcabregistronotas'),(93,'Can add Admision',24,'add_movadmision'),(94,'Can change Admision',24,'change_movadmision'),(95,'Can delete Admision',24,'delete_movadmision'),(96,'Can view Admision',24,'view_movadmision'),(97,'Can add (\'Representante\',)',25,'add_mantrepresentante'),(98,'Can change (\'Representante\',)',25,'change_mantrepresentante'),(99,'Can delete (\'Representante\',)',25,'delete_mantrepresentante'),(100,'Can view (\'Representante\',)',25,'view_mantrepresentante'),(101,'Can add (\'Lista\',)',26,'add_genrhistorial'),(102,'Can change (\'Lista\',)',26,'change_genrhistorial'),(103,'Can delete (\'Lista\',)',26,'delete_genrhistorial'),(104,'Can view (\'Lista\',)',26,'view_genrhistorial'),(105,'Can add (\'Rol de usuario\',)',27,'add_confusuario_rol'),(106,'Can change (\'Rol de usuario\',)',27,'change_confusuario_rol'),(107,'Can delete (\'Rol de usuario\',)',27,'delete_confusuario_rol'),(108,'Can view (\'Rol de usuario\',)',27,'view_confusuario_rol'),(109,'Can add (\'Permiso\',)',28,'add_confpermiso'),(110,'Can change (\'Permiso\',)',28,'change_confpermiso'),(111,'Can delete (\'Permiso\',)',28,'delete_confpermiso'),(112,'Can view (\'Permiso\',)',28,'view_confpermiso'),(113,'Can add (\'Empresa\',)',29,'add_confempresa'),(114,'Can change (\'Empresa\',)',29,'change_confempresa'),(115,'Can delete (\'Empresa\',)',29,'delete_confempresa'),(116,'Can view (\'Empresa\',)',29,'view_confempresa'),(117,'Can add Accion',30,'add_confaccion'),(118,'Can change Accion',30,'change_confaccion'),(119,'Can delete Accion',30,'delete_confaccion'),(120,'Can view Accion',30,'view_confaccion'),(121,'Can add (\'Correos Smpt\',)',31,'add_confcorreossmpt'),(122,'Can change (\'Correos Smpt\',)',31,'change_confcorreossmpt'),(123,'Can delete (\'Correos Smpt\',)',31,'delete_confcorreossmpt'),(124,'Can view (\'Correos Smpt\',)',31,'view_confcorreossmpt'),(125,'Can add (\'Detalle Permiso\',)',32,'add_confdetallepermiso'),(126,'Can change (\'Detalle Permiso\',)',32,'change_confdetallepermiso'),(127,'Can delete (\'Detalle Permiso\',)',32,'delete_confdetallepermiso'),(128,'Can view (\'Detalle Permiso\',)',32,'view_confdetallepermiso');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$gaWGfBQdKdC8$hjeac3EwyOm3Ajs1dbtuazJa2ozUOWLSVFvkRUhHfm8=','2019-12-10 22:13:29.867181',1,'admin','','','',1,1,'2019-11-06 21:45:51.148410'),(2,'pbkdf2_sha256$150000$TCcNxRn7UYO5$iqLi0yNYi5z5TRQShDxianR0Mm2zolC8dZ/YsAJWLuQ=',NULL,1,'admin1','','','',1,1,'2019-11-07 21:16:47.805989'),(3,'pbkdf2_sha256$150000$MRFAuNr9kpaT$Fl1DHcqtx1ayyU3x//xUVzjenfqtHxh2tC2uHQoPau4=','2019-12-22 15:56:14.848611',1,'luis_ardila','','','luisardilamacias@gmail.com',1,1,'2019-11-09 18:11:21.614525'),(4,'pbkdf2_sha256$150000$0LAvhdGDsYN7$KtKpglMy5Z472a1rVUwn3VRhsflbQTxVx7SsuqvYy8o=',NULL,1,'luis','','','',1,1,'2019-11-12 13:34:32.659020'),(5,'pbkdf2_sha256$150000$yOgWip2d0Hjq$BNdoLTOtgHqmp+/1I8dPsR2P1IJTHEL7ikrIfOU/ctY=','2019-11-18 21:51:01.076261',1,'nelio','','','neliomarcos040@gmail.com',1,1,'2019-11-18 21:50:00.776158'),(6,'12345',NULL,1,'anderson','anderson','sinaluisa','ajsinaluisa@est.itsgg.edu.ec',1,1,'2019-11-18 21:50:00.776158'),(7,'pbkdf2_sha256$150000$FIaiwqOm2dPZ$ZvaXnYy15VVUX5I9AYX5LP+7yhdsufOS6ksLVlf/2VQ=','2019-12-09 22:05:05.380967',1,'roddy','','','',1,1,'2019-11-20 22:04:09.014921'),(8,'pbkdf2_sha256$150000$YtRNd7WYZ8uY$+/V9lLnBV89XVLpjZPxMHot/U3jsFlFCw8XCwK35Xrc=','2020-02-01 19:59:17.000000',1,'cristof','','','cristof_21000@hotmail.com',1,1,'2020-02-01 19:56:21.000000');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,8,1),(2,8,2),(3,8,3),(4,8,4),(5,8,5),(6,8,6),(7,8,7),(8,8,8),(9,8,9),(10,8,10),(11,8,11),(12,8,12),(13,8,13),(14,8,14),(15,8,15),(16,8,16),(17,8,17),(18,8,18),(19,8,19),(20,8,20),(21,8,21),(22,8,22),(23,8,23),(24,8,24),(25,8,25),(26,8,26),(27,8,27),(28,8,28),(29,8,29),(30,8,30),(31,8,31),(32,8,32),(33,8,33),(34,8,34),(35,8,35),(36,8,36),(37,8,37),(38,8,38),(39,8,39),(40,8,40),(41,8,41),(42,8,42),(43,8,43),(44,8,44),(45,8,45),(46,8,46),(47,8,47),(48,8,48),(49,8,49),(50,8,50),(51,8,51),(52,8,52),(53,8,53),(54,8,54),(55,8,55),(56,8,56),(57,8,57),(58,8,58),(59,8,59),(60,8,60),(61,8,61),(62,8,62),(63,8,63),(64,8,64),(65,8,65),(66,8,66),(67,8,67),(68,8,68),(69,8,69),(70,8,70),(71,8,71),(72,8,72),(73,8,73),(74,8,74),(75,8,75),(76,8,76),(77,8,77),(78,8,78),(79,8,79),(80,8,80),(81,8,81),(82,8,82),(83,8,83),(84,8,84),(85,8,85),(86,8,86),(87,8,87),(88,8,88),(89,8,89),(90,8,90),(91,8,91),(92,8,92),(93,8,93),(94,8,94),(95,8,95),(96,8,96),(97,8,97),(98,8,98),(99,8,99),(100,8,100),(101,8,101),(102,8,102),(103,8,103),(104,8,104),(105,8,105),(106,8,106),(107,8,107),(108,8,108),(109,8,109),(110,8,110),(111,8,111),(112,8,112),(113,8,113),(114,8,114),(115,8,115),(116,8,116),(117,8,117),(118,8,118),(119,8,119),(120,8,120);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_accion`
--

DROP TABLE IF EXISTS `conf_accion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `conf_accion` (
  `id_accion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) NOT NULL,
  `id_genr_estado` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  PRIMARY KEY (`id_accion`),
  KEY `conf_accion_id_menu_7aa25df1_fk_conf_menu_id_menu` (`id_menu`),
  KEY `conf_accion_id_genr_estado_210e7c4e_fk_genr_gene` (`id_genr_estado`),
  CONSTRAINT `conf_accion_id_genr_estado_210e7c4e_fk_genr_gene` FOREIGN KEY (`id_genr_estado`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `conf_accion_id_menu_7aa25df1_fk_conf_menu_id_menu` FOREIGN KEY (`id_menu`) REFERENCES `conf_menu` (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_accion`
--

LOCK TABLES `conf_accion` WRITE;
/*!40000 ALTER TABLE `conf_accion` DISABLE KEYS */;
INSERT INTO `conf_accion` VALUES (1,'guardar',97,33),(2,'editar',97,33),(3,'eliminar',97,33),(4,'guardar',97,34),(5,'editar',97,34),(6,'eliminar',97,34),(7,'guardar',97,35),(8,'editar',97,35),(9,'eliminar',97,35),(10,'guardar',97,36),(11,'editar',97,36),(12,'eliminar',97,36),(13,'guardar',97,37),(14,'editar',97,37),(15,'eliminar',97,37),(16,'guardar',97,38),(17,'editar',97,38),(18,'eliminar',97,38),(19,'guardar',97,40),(20,'editar',97,40),(21,'eliminar',97,40);
/*!40000 ALTER TABLE `conf_accion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_correos_smpt`
--

DROP TABLE IF EXISTS `conf_correos_smpt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `conf_correos_smpt` (
  `id_correos_smpt` int(11) NOT NULL AUTO_INCREMENT,
  `ssl` varchar(30) NOT NULL,
  `dominio` varchar(30) NOT NULL,
  `puerto` varchar(20) NOT NULL,
  `usuario_c` varchar(100) NOT NULL,
  `contrasenia_c` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `id_genr_estado` int(11) NOT NULL,
  PRIMARY KEY (`id_correos_smpt`),
  UNIQUE KEY `conf_correos_smpt_usuario_c_59415639_uniq` (`usuario_c`),
  KEY `conf_correos_smpt_id_genr_estado_0164f920_fk_genr_gene` (`id_genr_estado`),
  CONSTRAINT `conf_correos_smpt_id_genr_estado_0164f920_fk_genr_gene` FOREIGN KEY (`id_genr_estado`) REFERENCES `genr_general` (`idgenr_general`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_correos_smpt`
--

LOCK TABLES `conf_correos_smpt` WRITE;
/*!40000 ALTER TABLE `conf_correos_smpt` DISABLE KEYS */;
/*!40000 ALTER TABLE `conf_correos_smpt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_detalle_permiso`
--

DROP TABLE IF EXISTS `conf_detalle_permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `conf_detalle_permiso` (
  `id_detalle_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `id_accion` int(11) NOT NULL,
  `id_genr_estado` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle_permiso`),
  KEY `conf_detalle_permiso_id_accion_783cbf93_fk_conf_accion_id_accion` (`id_accion`),
  KEY `conf_detalle_permiso_id_menu_40cfc026_fk_conf_menu_id_menu` (`id_menu`),
  KEY `conf_detalle_permiso_id_permiso_64432670_fk_conf_perm` (`id_permiso`),
  KEY `conf_detalle_permiso_id_genr_estado_7b80c5a7_fk_genr_gene` (`id_genr_estado`),
  CONSTRAINT `conf_detalle_permiso_id_accion_783cbf93_fk_conf_accion_id_accion` FOREIGN KEY (`id_accion`) REFERENCES `conf_accion` (`id_accion`),
  CONSTRAINT `conf_detalle_permiso_id_genr_estado_7b80c5a7_fk_genr_gene` FOREIGN KEY (`id_genr_estado`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `conf_detalle_permiso_id_menu_40cfc026_fk_conf_menu_id_menu` FOREIGN KEY (`id_menu`) REFERENCES `conf_menu` (`id_menu`),
  CONSTRAINT `conf_detalle_permiso_id_permiso_64432670_fk_conf_perm` FOREIGN KEY (`id_permiso`) REFERENCES `conf_permiso` (`id_permiso`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_detalle_permiso`
--

LOCK TABLES `conf_detalle_permiso` WRITE;
/*!40000 ALTER TABLE `conf_detalle_permiso` DISABLE KEYS */;
INSERT INTO `conf_detalle_permiso` VALUES (1,1,97,33,1),(2,2,97,33,1),(3,3,97,33,1),(4,1,97,34,2),(5,2,97,34,2),(6,3,97,34,2),(7,1,97,35,3),(8,2,97,35,3),(9,3,97,35,3),(10,1,97,36,4),(11,2,97,36,4),(12,3,97,36,4),(13,1,97,37,5),(14,2,97,37,5),(15,3,97,37,5),(16,1,97,38,6),(17,2,97,38,6),(18,3,97,38,6),(19,1,97,40,7),(20,2,97,40,7),(21,3,97,40,7);
/*!40000 ALTER TABLE `conf_detalle_permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_empresa`
--

DROP TABLE IF EXISTS `conf_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `conf_empresa` (
  `id_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `razon_social` varchar(200) NOT NULL,
  `identificacion` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `representante_legal` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `usuario_ing` varchar(45) NOT NULL,
  `terminal_ing` varchar(45) NOT NULL,
  `estado` int(11) NOT NULL,
  `id_genr_tipo_identificacion` int(11) NOT NULL,
  PRIMARY KEY (`id_empresa`),
  UNIQUE KEY `identificacion` (`identificacion`),
  KEY `conf_empresa_estado_88988ab2_fk_genr_general_idgenr_general` (`estado`),
  KEY `conf_empresa_id_genr_tipo_identif_24d6ebf1_fk_genr_gene` (`id_genr_tipo_identificacion`),
  CONSTRAINT `conf_empresa_estado_88988ab2_fk_genr_general_idgenr_general` FOREIGN KEY (`estado`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `conf_empresa_id_genr_tipo_identif_24d6ebf1_fk_genr_gene` FOREIGN KEY (`id_genr_tipo_identificacion`) REFERENCES `genr_general` (`idgenr_general`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_empresa`
--

LOCK TABLES `conf_empresa` WRITE;
/*!40000 ALTER TABLE `conf_empresa` DISABLE KEYS */;
INSERT INTO `conf_empresa` VALUES (1,'Coca cola','Formal','0987654321','Sur','JuanMateo','mateo@outlook.com','012584693','2020-02-06','2020-02-12','nelio','DESKTOP-HJAA63O',97,8),(3,'Indulac','INFormal','0147852369','Norte','Diego','loklo@outlook.com','036985247','2020-02-08','2020-02-12','nelio','DESKTOP-HJAA63O',97,8);
/*!40000 ALTER TABLE `conf_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_menu`
--

DROP TABLE IF EXISTS `conf_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `conf_menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `id_padre` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `url` varchar(60) NOT NULL,
  `icono` varchar(50) NOT NULL,
  `lazy_name` varchar(60) NOT NULL,
  `name` varchar(60) NOT NULL,
  `view` varchar(45) NOT NULL,
  `id_genr_estado` int(11) NOT NULL,
  PRIMARY KEY (`id_menu`),
  UNIQUE KEY `conf_menu_descripcion_0c58ddd5_uniq` (`descripcion`),
  KEY `conf_menu_id_genr_estado_5c3ac300_fk_genr_general_idgenr_general` (`id_genr_estado`),
  CONSTRAINT `conf_menu_id_genr_estado_5c3ac300_fk_genr_general_idgenr_general` FOREIGN KEY (`id_genr_estado`) REFERENCES `genr_general` (`idgenr_general`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_menu`
--

LOCK TABLES `conf_menu` WRITE;
/*!40000 ALTER TABLE `conf_menu` DISABLE KEYS */;
INSERT INTO `conf_menu` VALUES (23,0,5,'Configuraciones','#','fas fa-fw fa-cog','#','#','#',97),(24,0,4,'Reportes Especiales','#','fas fa-fw fa-wrench','#','#','#',97),(25,0,3,'Registro Notas','#','fas fa-fw fa-chart-area','#','#','#',97),(26,0,2,'Matricula','#','fas fa-fw fa-table','#','#','#',97),(27,0,1,'Admision','#','fas fa-fw fa-folder','#','#','#',97),(28,27,13,'Mantenimiento','Academico:mantenimiento','fas fa-fw fa-folder','mantenimiento/','mantenimiento','mantenimiento',97),(29,27,14,'Movimientos','Academico:movimientos','fas fa-fw fa-folder','movimientos/','movimientos','movimientos',97),(30,27,15,'Consultas','Academico:consultas','fas fa-fw fa-folder','consultas/','consultas','consultas',97),(31,27,16,'Procesos','Academico:procesos','fas fa-fw fa-folder','procesos/','procesos','procesos',97),(32,27,17,'Reportes','Academico:reportes','fas fa-fw fa-folder','reportes/','reportes','reportes',97),(33,23,2,'Usuarios','Academico:usuarios','fas fa-fw fa-cog','usuarios/','usuarios','usuarios',97),(34,23,3,'Roles','Academico:roles','fas fa-fw fa-cog','roles/','roles','roles',97),(35,23,4,'Perfiles','Academico:perfiles','fas fa-fw fa-cog','perfiles/','perfiles','perfiles',97),(36,23,5,'Menu','Academico:menu','fas fa-fw fa-cog','menu/','menu','menu',97),(37,23,6,'Modulo','Academico:modulo','fas fa-fw fa-cog','modulo/','modulo','modulo',97),(38,23,7,'Acciones','Academico:acciones','fas fa-fw fa-cog','acciones/','acciones','acciones',97),(40,23,8,'Empresa','Academico:empresas','fas fa-fw fa-cog','empresas/','empresas','empresas',97);
/*!40000 ALTER TABLE `conf_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_modulo`
--

DROP TABLE IF EXISTS `conf_modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `conf_modulo` (
  `id_modulo` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `id_genr_estado` int(11) NOT NULL,
  PRIMARY KEY (`id_modulo`),
  UNIQUE KEY `conf_modulo_codigo_d91006df_uniq` (`codigo`),
  UNIQUE KEY `conf_modulo_nombre_d71d1a91_uniq` (`nombre`),
  KEY `conf_modulo_id_genr_estado_7ac01822_fk_genr_gene` (`id_genr_estado`),
  CONSTRAINT `conf_modulo_id_genr_estado_7ac01822_fk_genr_gene` FOREIGN KEY (`id_genr_estado`) REFERENCES `genr_general` (`idgenr_general`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_modulo`
--

LOCK TABLES `conf_modulo` WRITE;
/*!40000 ALTER TABLE `conf_modulo` DISABLE KEYS */;
INSERT INTO `conf_modulo` VALUES (6,'001','Admision',97),(7,'002','Matricula',97),(8,'003','Registro Notas',97),(9,'004','Reportes Especiales',97),(10,'005','Configuraciones',97);
/*!40000 ALTER TABLE `conf_modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_modulo_menu`
--

DROP TABLE IF EXISTS `conf_modulo_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `conf_modulo_menu` (
  `id_modulo_menu` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) NOT NULL,
  `id_modulo` int(11) NOT NULL,
  `id_genr_estado` int(11) NOT NULL,
  PRIMARY KEY (`id_modulo_menu`),
  KEY `conf_modulo_menu_id_menu_5439ef13_fk_conf_menu_id_menu` (`id_menu`),
  KEY `conf_modulo_menu_id_modulo_0d359a15_fk_conf_modulo_id_modulo` (`id_modulo`),
  KEY `conf_modulo_menu_id_genr_estado_210b4a0c_fk_genr_gene` (`id_genr_estado`),
  CONSTRAINT `conf_modulo_menu_id_genr_estado_210b4a0c_fk_genr_gene` FOREIGN KEY (`id_genr_estado`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `conf_modulo_menu_id_menu_5439ef13_fk_conf_menu_id_menu` FOREIGN KEY (`id_menu`) REFERENCES `conf_menu` (`id_menu`),
  CONSTRAINT `conf_modulo_menu_id_modulo_0d359a15_fk_conf_modulo_id_modulo` FOREIGN KEY (`id_modulo`) REFERENCES `conf_modulo` (`id_modulo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_modulo_menu`
--

LOCK TABLES `conf_modulo_menu` WRITE;
/*!40000 ALTER TABLE `conf_modulo_menu` DISABLE KEYS */;
INSERT INTO `conf_modulo_menu` VALUES (1,33,10,97),(2,34,10,97),(3,35,10,97),(4,36,10,97),(5,37,10,97),(6,38,10,97),(7,40,10,97),(8,28,6,97),(9,29,6,97),(10,23,10,97),(11,24,9,97),(12,25,8,97),(13,26,7,97),(14,27,6,97);
/*!40000 ALTER TABLE `conf_modulo_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_permiso`
--

DROP TABLE IF EXISTS `conf_permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `conf_permiso` (
  `id_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `id_modulo_menu` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  PRIMARY KEY (`id_permiso`),
  KEY `conf_permiso_id_modulo_menu_7910b1bd_fk_conf_modu` (`id_modulo_menu`),
  KEY `fk_permiso_rol_idx` (`id_rol`),
  CONSTRAINT `conf_permiso_id_modulo_menu_7910b1bd_fk_conf_modu` FOREIGN KEY (`id_modulo_menu`) REFERENCES `conf_modulo_menu` (`id_modulo_menu`),
  CONSTRAINT `fk_rol_permiso` FOREIGN KEY (`id_rol`) REFERENCES `conf_rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_permiso`
--

LOCK TABLES `conf_permiso` WRITE;
/*!40000 ALTER TABLE `conf_permiso` DISABLE KEYS */;
INSERT INTO `conf_permiso` VALUES (1,1,3),(2,2,3),(3,3,3),(4,4,3),(5,5,3),(6,6,3),(7,7,3),(14,8,3),(15,9,3),(16,10,3),(17,11,3),(18,12,3),(19,13,3),(20,14,3);
/*!40000 ALTER TABLE `conf_permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_rol`
--

DROP TABLE IF EXISTS `conf_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `conf_rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `id_genr_estado` int(11) NOT NULL,
  PRIMARY KEY (`id_rol`),
  KEY `conf_rol_id_genr_estado_73f22c71_fk_genr_general_idgenr_general` (`id_genr_estado`),
  CONSTRAINT `conf_rol_id_genr_estado_73f22c71_fk_genr_general_idgenr_general` FOREIGN KEY (`id_genr_estado`) REFERENCES `genr_general` (`idgenr_general`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_rol`
--

LOCK TABLES `conf_rol` WRITE;
/*!40000 ALTER TABLE `conf_rol` DISABLE KEYS */;
INSERT INTO `conf_rol` VALUES (3,'001','Administrativo',97),(5,'002','Profesor',97),(6,'003','Estudiantes',97),(7,'004','Representante',97);
/*!40000 ALTER TABLE `conf_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_usuario`
--

DROP TABLE IF EXISTS `conf_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `conf_usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `id_genr_estado` int(11) NOT NULL,
  `id_genr_tipo_usuario` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `fecha_limite` date DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `conf_usuario_id_genr_tipo_usuario_cd3441b2_fk_genr_gene` (`id_genr_tipo_usuario`),
  KEY `conf_usuario_id_persona_a923aec6_fk_mant_persona_id_persona` (`id_persona`),
  KEY `conf_usuario_id_genr_estado_b989846a_fk_genr_gene` (`id_genr_estado`),
  CONSTRAINT `conf_usuario_id_genr_estado_b989846a_fk_genr_gene` FOREIGN KEY (`id_genr_estado`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `conf_usuario_id_genr_tipo_usuario_cd3441b2_fk_genr_gene` FOREIGN KEY (`id_genr_tipo_usuario`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `conf_usuario_id_persona_a923aec6_fk_mant_persona_id_persona` FOREIGN KEY (`id_persona`) REFERENCES `mant_persona` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_usuario`
--

LOCK TABLES `conf_usuario` WRITE;
/*!40000 ALTER TABLE `conf_usuario` DISABLE KEYS */;
INSERT INTO `conf_usuario` VALUES (8,'nelio','ce01b883461bb771a6085503655b87613a843e9b',97,21,1,NULL),(50,'Josue','145a6fa2632f101836877c4365dd93627aee7c35',97,19,1,NULL),(53,'Jaime','5803568d61bc07bd5a6cf1a2c18b3b94e325dddc',97,22,1,NULL),(64,'Peralta','8d51746f97f8d5d14f101105ee1544e6ffcedbcf',97,21,1,NULL),(65,'josue','9959c10cadf3b51950519e7ceb2e302a2b76b4be',97,21,1,NULL);
/*!40000 ALTER TABLE `conf_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_usuario_rol`
--

DROP TABLE IF EXISTS `conf_usuario_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `conf_usuario_rol` (
  `id_usuario_rol` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario_rol`),
  KEY `conf_usuario_rol_id_rol_fa9dfb05_fk_conf_rol_id_rol` (`id_rol`),
  KEY `conf_usuario_rol_id_usuario_428d0a15_fk_conf_usuario_id_usuario` (`id_usuario`),
  CONSTRAINT `conf_usuario_rol_id_rol_fa9dfb05_fk_conf_rol_id_rol` FOREIGN KEY (`id_rol`) REFERENCES `conf_rol` (`id_rol`),
  CONSTRAINT `conf_usuario_rol_id_usuario_428d0a15_fk_conf_usuario_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `conf_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_usuario_rol`
--

LOCK TABLES `conf_usuario_rol` WRITE;
/*!40000 ALTER TABLE `conf_usuario_rol` DISABLE KEYS */;
INSERT INTO `conf_usuario_rol` VALUES (1,3,8);
/*!40000 ALTER TABLE `conf_usuario_rol` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-11-13 13:02:38.744373','2','Luis Eduardo',1,'[{\"added\": {}}]',8,3),(2,'2019-11-13 21:59:49.969004','1','001',1,'[{\"added\": {}}]',10,3),(3,'2019-11-13 22:00:12.955299','1','Configuraciones',1,'[{\"added\": {}}]',9,3),(4,'2019-11-13 22:38:41.695317','2','Agregar usuarios',1,'[{\"added\": {}}]',9,3),(5,'2019-11-13 22:51:46.617889','1','001',3,'',10,3),(6,'2019-11-13 22:52:25.714687','2','Configuraciones',1,'[{\"added\": {}}]',10,3),(7,'2019-11-13 22:52:52.500926','2','Reportes',2,'[{\"changed\": {\"fields\": [\"codigo\"]}}]',10,3),(8,'2019-11-13 23:00:36.205275','3','Mantenimiento',1,'[{\"added\": {}}]',10,3),(9,'2019-11-13 23:01:12.225751','4','Configuraciones',1,'[{\"added\": {}}]',10,3),(10,'2019-11-13 23:03:06.747278','3','Gestion de usuarios',1,'[{\"added\": {}}]',9,3),(11,'2019-11-13 23:04:31.628140','4','Listar usuarios',1,'[{\"added\": {}}]',9,3),(12,'2019-11-13 23:05:23.056746','5','Configurar permisos',1,'[{\"added\": {}}]',9,3),(13,'2019-11-13 23:14:19.901640','6','Mantenimientos',1,'[{\"added\": {}}]',9,3),(14,'2019-11-13 23:15:37.798458','7','Mi cuenta',1,'[{\"added\": {}}]',9,3),(15,'2019-11-13 23:26:34.469100','8','Gestion de empleados',1,'[{\"added\": {}}]',9,3),(16,'2019-11-13 23:27:29.699793','9','Gestion de alumnos',1,'[{\"added\": {}}]',9,3),(17,'2019-11-13 23:27:56.325910','9','Gestion de alumnos',3,'',9,3),(18,'2019-11-13 23:27:56.529927','8','Gestion de empleados',3,'',9,3),(19,'2019-11-13 23:27:56.721916','7','Mi cuenta',3,'',9,3),(20,'2019-11-13 23:27:56.910848','6','Mantenimientos',3,'',9,3),(21,'2019-11-13 23:27:57.099981','5','Configurar permisos',3,'',9,3),(22,'2019-11-13 23:27:57.323039','4','Listar usuarios',3,'',9,3),(23,'2019-11-13 23:27:57.521320','3','Gestion de usuarios',3,'',9,3),(24,'2019-11-13 23:31:38.193819','5','Movimientos',1,'[{\"added\": {}}]',10,3),(25,'2019-11-13 23:32:41.324856','10','Gestion de matriculas',1,'[{\"added\": {}}]',9,3),(26,'2019-11-13 23:33:26.037417','10','Movimientos',2,'[{\"changed\": {\"fields\": [\"version\"]}}]',9,3),(27,'2019-11-13 23:34:26.184336','11','Gestion de matriculas',1,'[{\"added\": {}}]',9,3),(28,'2019-11-13 23:35:05.053030','12','Gestion de cursos',1,'[{\"added\": {}}]',9,3),(29,'2019-11-13 23:37:47.162663','13','Mantenimientos',1,'[{\"added\": {}}]',9,3),(30,'2019-11-13 23:38:55.706521','14','Gestion de empleados',1,'[{\"added\": {}}]',9,3),(31,'2019-11-13 23:40:01.048732','15','Gestion de Representantes',1,'[{\"added\": {}}]',9,3),(32,'2019-11-13 23:40:27.462437','16','Configuracion',1,'[{\"added\": {}}]',9,3),(33,'2019-11-13 23:41:27.526927','17','Gestion de permisos',1,'[{\"added\": {}}]',9,3),(34,'2019-11-13 23:41:54.540467','18','Gestion de usuarios',1,'[{\"added\": {}}]',9,3),(35,'2019-11-13 23:42:41.982896','19','Resportes',1,'[{\"added\": {}}]',9,3),(36,'2019-11-13 23:43:16.294061','20','Historial de actividades',1,'[{\"added\": {}}]',9,3),(37,'2019-11-13 23:44:03.114360','21','Reportes de empleados',1,'[{\"added\": {}}]',9,3),(38,'2019-11-13 23:44:31.545948','22','Reportes de estudiantes',1,'[{\"added\": {}}]',9,3),(39,'2019-11-13 23:49:49.878903','2','Administrador',1,'[{\"added\": {}}]',12,3),(40,'2019-11-13 23:50:04.418004','2','luisillo',1,'[{\"added\": {}}]',11,3),(41,'2019-11-13 23:54:26.950357','1','ConfPermiso object (1)',1,'[{\"added\": {}}]',13,3),(42,'2019-11-13 23:55:02.956511','2','ConfPermiso object (2)',1,'[{\"added\": {}}]',13,3),(43,'2019-11-13 23:55:47.484035','3','ConfPermiso object (3)',1,'[{\"added\": {}}]',13,3),(44,'2019-11-13 23:56:13.819604','4','ConfPermiso object (4)',1,'[{\"added\": {}}]',13,3),(45,'2019-11-14 01:58:58.108833','19','Reportes',2,'[{\"changed\": {\"fields\": [\"version\"]}}]',9,3),(46,'2019-11-14 02:59:29.995818','19','Reportacion',2,'[{\"changed\": {\"fields\": [\"version\"]}}]',9,3),(47,'2019-11-14 03:01:05.236065','19','Reportes',2,'[{\"changed\": {\"fields\": [\"version\"]}}]',9,3),(48,'2019-11-14 03:20:59.381124','19','Reportacion',2,'[{\"changed\": {\"fields\": [\"version\"]}}]',9,3),(49,'2019-11-14 03:21:31.233973','19','Reportes',2,'[{\"changed\": {\"fields\": [\"version\"]}}]',9,3),(50,'2019-11-14 21:08:16.637142','6','Admision',1,'[{\"added\": {}}]',10,3),(51,'2019-11-14 22:59:43.157097','7','Matricula',1,'[{\"added\": {}}]',10,3),(52,'2019-11-14 23:00:28.368782','8','Registro Notas',1,'[{\"added\": {}}]',10,3),(53,'2019-11-14 23:01:19.633444','9','Reportes Especiales',1,'[{\"added\": {}}]',10,3),(54,'2019-11-14 23:01:46.357003','10','Configuraciones',1,'[{\"added\": {}}]',10,3),(55,'2019-11-14 23:03:00.492996','23','Configuraciones',1,'[{\"added\": {}}]',9,3),(56,'2019-11-14 23:04:33.051254','24','Reportes Especiales',1,'[{\"added\": {}}]',9,3),(57,'2019-11-14 23:06:00.005130','23','Configuraciones',2,'[{\"changed\": {\"fields\": [\"orden\"]}}]',9,3),(58,'2019-11-14 23:06:25.604527','24','Reportes Especiales',2,'[{\"changed\": {\"fields\": [\"orden\"]}}]',9,3),(59,'2019-11-14 23:07:23.092569','25','Registro Notas',1,'[{\"added\": {}}]',9,3),(60,'2019-11-14 23:09:20.015997','26','Matricula',1,'[{\"added\": {}}]',9,3),(61,'2019-11-14 23:11:39.155523','27','Admision',1,'[{\"added\": {}}]',9,3),(62,'2019-11-14 23:12:42.695234','28','mantenimiento  personas',1,'[{\"added\": {}}]',9,3),(63,'2019-11-14 23:13:23.324283','29','movimientos',1,'[{\"added\": {}}]',9,3),(64,'2019-11-14 23:14:37.779092','30','consultas',1,'[{\"added\": {}}]',9,3),(65,'2019-11-14 23:15:19.074743','31','procesos',1,'[{\"added\": {}}]',9,3),(66,'2019-11-14 23:17:07.759353','32','reportes',1,'[{\"added\": {}}]',9,3),(67,'2019-11-14 23:18:33.057665','33','usuarios',1,'[{\"added\": {}}]',9,3),(68,'2019-11-14 23:19:20.242819','34','roles',1,'[{\"added\": {}}]',9,3),(69,'2019-11-14 23:19:55.338867','35','perfiles',1,'[{\"added\": {}}]',9,3),(70,'2019-11-14 23:20:29.073435','36','menu',1,'[{\"added\": {}}]',9,3),(71,'2019-11-14 23:21:50.129877','37','modulo',1,'[{\"added\": {}}]',9,3),(72,'2019-11-14 23:22:24.794149','38','acciones',1,'[{\"added\": {}}]',9,3),(73,'2019-11-14 23:23:43.999508','5','ConfPermiso object (5)',1,'[{\"added\": {}}]',13,3),(74,'2019-11-14 23:24:48.555786','6','ConfPermiso object (6)',1,'[{\"added\": {}}]',13,3),(75,'2019-11-14 23:25:59.372959','7','ConfPermiso object (7)',1,'[{\"added\": {}}]',13,3),(76,'2019-11-14 23:27:05.775277','8','ConfPermiso object (8)',1,'[{\"added\": {}}]',13,3),(77,'2019-11-14 23:27:41.999823','9','ConfPermiso object (9)',1,'[{\"added\": {}}]',13,3),(78,'2019-11-14 23:44:43.112082','27','Admision',2,'[{\"changed\": {\"fields\": [\"id_genr_estado\"]}}]',9,3),(79,'2019-11-14 23:45:49.556787','27','Admision',2,'[{\"changed\": {\"fields\": [\"id_genr_estado\"]}}]',9,3),(80,'2019-11-14 23:54:39.207666','26','Matricula',2,'[{\"changed\": {\"fields\": [\"id_genr_estado\"]}}]',9,3),(81,'2019-11-14 23:59:36.287549','26','Matricula',2,'[{\"changed\": {\"fields\": [\"id_genr_estado\"]}}]',9,3),(82,'2019-11-15 00:13:13.045228','26','Matricula',2,'[{\"changed\": {\"fields\": [\"id_genr_estado\"]}}]',9,3),(83,'2019-11-15 00:18:05.380578','26','Matricula',2,'[{\"changed\": {\"fields\": [\"id_genr_estado\"]}}]',9,3),(84,'2019-11-15 00:22:32.792640','26','Matricula',2,'[{\"changed\": {\"fields\": [\"id_genr_estado\"]}}]',9,3),(85,'2019-11-15 10:00:42.372343','26','Matricula',2,'[{\"changed\": {\"fields\": [\"id_genr_estado\"]}}]',9,3),(86,'2019-11-15 10:04:20.394055','26','Matricula',2,'[{\"changed\": {\"fields\": [\"id_genr_estado\"]}}]',9,3),(87,'2019-11-15 10:07:47.046472','26','Matricula',2,'[{\"changed\": {\"fields\": [\"id_genr_estado\"]}}]',9,3),(88,'2019-11-15 10:08:20.239709','26','Matricula',2,'[{\"changed\": {\"fields\": [\"id_genr_estado\"]}}]',9,3),(89,'2019-11-15 10:49:42.348331','28','mantenimiento  personas',2,'[{\"changed\": {\"fields\": [\"id_genr_estado\"]}}]',9,3),(90,'2019-11-15 10:50:20.004533','28','mantenimiento  personas',2,'[{\"changed\": {\"fields\": [\"id_genr_estado\"]}}]',9,3),(91,'2019-11-15 20:42:56.329322','27','Admision',2,'[{\"changed\": {\"fields\": [\"id_genr_estado\"]}}]',9,3),(92,'2019-11-15 20:50:35.819593','27','Admision',2,'[{\"changed\": {\"fields\": [\"id_genr_estado\"]}}]',9,3),(93,'2019-11-17 23:28:03.614239','25','Registro Notas',2,'[{\"changed\": {\"fields\": [\"id_genr_estado\"]}}]',9,3),(94,'2019-11-17 23:28:45.739556','25','Registro Notas',2,'[{\"changed\": {\"fields\": [\"id_genr_estado\"]}}]',9,3),(95,'2019-11-18 11:05:43.165369','28','mantenimiento_personas',2,'[{\"changed\": {\"fields\": [\"descripcion\"]}}]',9,3),(96,'2019-11-18 11:56:05.100910','28','mantenimiento personas',2,'[{\"changed\": {\"fields\": [\"descripcion\"]}}]',9,3),(97,'2019-11-18 23:05:19.897326','3','nelio',1,'[{\"added\": {}}]',11,5),(98,'2019-11-19 12:13:45.539205','36','menu',2,'[{\"changed\": {\"fields\": [\"url\"]}}]',9,3),(99,'2019-11-19 12:14:19.469109','37','modulo',2,'[{\"changed\": {\"fields\": [\"url\"]}}]',9,3),(100,'2019-11-19 12:14:50.155294','38','acciones',2,'[{\"changed\": {\"fields\": [\"url\"]}}]',9,3),(101,'2019-11-19 12:16:19.141183','33','usuarios',2,'[{\"changed\": {\"fields\": [\"url\"]}}]',9,3),(102,'2019-11-20 17:45:29.288105','10','ConfPermiso object (10)',1,'[{\"added\": {}}]',13,3),(103,'2019-11-20 17:46:04.182011','11','ConfPermiso object (11)',1,'[{\"added\": {}}]',13,3),(104,'2019-11-20 17:46:43.998148','12','ConfPermiso object (12)',1,'[{\"added\": {}}]',13,3),(105,'2019-11-20 17:47:18.883312','13','ConfPermiso object (13)',1,'[{\"added\": {}}]',13,3),(106,'2019-11-20 17:47:45.629270','14','ConfPermiso object (14)',1,'[{\"added\": {}}]',13,3),(107,'2019-11-20 18:09:33.801800','10','ConfPermiso object (10)',2,'[{\"changed\": {\"fields\": [\"id_genr_estado\"]}}]',13,3),(108,'2019-11-20 18:10:10.972368','10','ConfPermiso object (10)',2,'[{\"changed\": {\"fields\": [\"id_genr_estado\"]}}]',13,3),(109,'2019-11-26 21:02:56.193580','39','prueba',1,'[{\"added\": {}}]',9,3),(110,'2019-11-27 22:17:18.652381','40','Empresa',1,'[{\"added\": {}}]',9,3),(111,'2019-11-27 22:19:10.112281','40','Empresa',2,'[{\"changed\": {\"fields\": [\"url\"]}}]',9,3),(112,'2019-12-01 02:22:20.202436','17','ConfPermiso object (17)',2,'[{\"changed\": {\"fields\": [\"id_modulo\"]}}]',13,3),(113,'2019-12-01 02:30:40.105182','3','Conf_rol_permiso object (3)',1,'[{\"added\": {}}]',15,3),(114,'2019-12-01 02:31:34.410275','17','ConfPermiso object (17)',2,'[{\"changed\": {\"fields\": [\"id_menu\", \"id_modulo\"]}}]',13,3),(115,'2019-12-01 02:32:59.238921','18','ConfPermiso object (18)',1,'[{\"added\": {}}]',13,3),(116,'2019-12-01 02:33:49.686422','19','ConfPermiso object (19)',1,'[{\"added\": {}}]',13,3),(117,'2019-12-01 02:34:34.988239','4','Conf_rol_permiso object (4)',1,'[{\"added\": {}}]',15,3),(118,'2019-12-01 02:34:56.265152','5','Conf_rol_permiso object (5)',1,'[{\"added\": {}}]',15,3),(119,'2019-12-01 03:39:38.643536','39','prueba',3,'',9,3),(120,'2019-12-01 03:40:50.225038','38','Acciones',2,'[{\"changed\": {\"fields\": [\"descripcion\"]}}]',9,3),(121,'2019-12-04 04:04:57.052939','6','Conf_rol_permiso object (6)',3,'',15,3),(122,'2019-12-04 04:05:55.636924','19','Conf_rol_permiso object (19)',1,'[{\"added\": {}}]',15,3),(123,'2019-12-04 04:07:20.007289','8','Conf_rol_permiso object (8)',3,'',15,3),(124,'2019-12-04 04:08:42.860759','20','Conf_rol_permiso object (20)',1,'[{\"added\": {}}]',15,3),(125,'2019-12-05 02:44:47.920937','2','Luis Eduardo',2,'[{\"changed\": {\"fields\": [\"foto\", \"pidentificacion\"]}}]',8,3),(126,'2019-12-05 02:46:20.846809','2','Luis Eduardo',2,'[{\"changed\": {\"fields\": [\"foto\", \"pidentificacion\"]}}]',8,3),(127,'2019-12-05 22:28:05.811367','5','Profesor',1,'[{\"added\": {}}]',12,7),(128,'2019-12-05 22:35:48.151029','8','nelio',2,'[{\"changed\": {\"fields\": [\"id_genr_tipo_usuario\"]}}]',11,7),(129,'2019-12-05 22:43:40.239704','6','Estudiantes',1,'[{\"added\": {}}]',12,7),(130,'2019-12-05 22:44:20.977612','7','Representante',1,'[{\"added\": {}}]',12,7),(131,'2019-12-22 16:10:45.767014','13','pruebas',2,'[{\"changed\": {\"fields\": [\"id_genr_estado\"]}}]',10,3),(132,'2019-12-22 16:11:34.113638','13','pruebas',3,'',10,3),(133,'2019-12-22 16:11:34.320944','12','pruebas',3,'',10,3),(134,'2020-02-01 20:01:10.754885','8','cristof',2,'[{\"changed\": {\"fields\": [\"user_permissions\"]}}]',4,8);
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(30,'GestionAcademica','confaccion'),(31,'GestionAcademica','confcorreossmpt'),(32,'GestionAcademica','confdetallepermiso'),(29,'GestionAcademica','confempresa'),(7,'GestionAcademica','confmenu'),(8,'GestionAcademica','confmodulo'),(9,'GestionAcademica','confmodulo_menu'),(28,'GestionAcademica','confpermiso'),(10,'GestionAcademica','confrol'),(11,'GestionAcademica','confusuario'),(27,'GestionAcademica','confusuario_rol'),(12,'GestionAcademica','genrgeneral'),(26,'GestionAcademica','genrhistorial'),(13,'GestionAcademica','mantaniolectivo'),(14,'GestionAcademica','mantempleado'),(15,'GestionAcademica','mantestudiante'),(16,'GestionAcademica','mantpersona'),(25,'GestionAcademica','mantrepresentante'),(24,'GestionAcademica','movadmision'),(17,'GestionAcademica','movcabcurso'),(23,'GestionAcademica','movcabregistronotas'),(22,'GestionAcademica','movdetalleempleado'),(21,'GestionAcademica','movdetallemateriacurso'),(20,'GestionAcademica','movdetalleregistronotas'),(19,'GestionAcademica','movestudianteasignacioncurso'),(18,'GestionAcademica','movmatriculacionestudiante'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'GestionAcademica','0001_initial','2020-02-01 22:49:11.451075'),(2,'contenttypes','0001_initial','2020-02-01 22:49:39.319457'),(3,'auth','0001_initial','2020-02-01 22:49:49.725069'),(4,'admin','0001_initial','2020-02-01 22:49:56.567422'),(5,'admin','0002_logentry_remove_auto_add','2020-02-01 22:49:57.582778'),(6,'admin','0003_logentry_add_action_flag_choices','2020-02-01 22:49:58.394871'),(7,'contenttypes','0002_remove_content_type_name','2020-02-01 22:50:00.469864'),(8,'auth','0002_alter_permission_name_max_length','2020-02-01 22:50:01.266553'),(9,'auth','0003_alter_user_email_max_length','2020-02-01 22:50:02.047607'),(10,'auth','0004_alter_user_username_opts','2020-02-01 22:50:02.594368'),(11,'auth','0005_alter_user_last_login_null','2020-02-01 22:50:03.328038'),(12,'auth','0006_require_contenttypes_0002','2020-02-01 22:50:03.781360'),(13,'auth','0007_alter_validators_add_error_messages','2020-02-01 22:50:04.374668'),(14,'auth','0008_alter_user_username_max_length','2020-02-01 22:50:06.039634'),(15,'auth','0009_alter_user_last_name_max_length','2020-02-01 22:50:06.836304'),(16,'auth','0010_alter_group_name_max_length','2020-02-01 22:50:07.586144'),(17,'auth','0011_update_proxy_permissions','2020-02-01 22:50:08.960744'),(18,'sessions','0001_initial','2020-02-01 22:50:10.444849'),(19,'GestionAcademica','0002_auto_20200211_1953','2020-02-12 13:46:54.365613'),(20,'GestionAcademica','0003_auto_20200213_1739','2020-02-13 22:40:36.046062'),(21,'GestionAcademica','0004_auto_20200215_1119','2020-02-15 16:24:46.559744'),(22,'GestionAcademica','0005_confcorreossmpt_id_genr_estado','2020-02-15 16:26:20.929680'),(23,'GestionAcademica','0006_auto_20200218_0953','2020-02-18 15:29:53.402159'),(24,'GestionAcademica','0007_auto_20200218_1031','2020-02-19 22:45:03.591489'),(25,'GestionAcademica','0008_confusuario_fecha_limite','2020-02-19 22:45:06.809038');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('057rmk7g4x1omcbkfybus53884my6qo2','ZWQ1NzQxYjlhZDlmNDhhNDg5MTgyMTdlNWY3NjI3YzY0ODczYjU1YTp7InVzdWFyaW8iOjgsIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNDJlNzY2ZWY3YjdjYzZlNjk1ZTk0ZWU0ZTZmZDdkMjYxZTc4OTgyIn0=','2019-12-15 02:20:54.140345'),('0b79h3mlq1vch3saozxpo5flgh176x5v','NTVmMGNiZTNjOTA2M2FhMGRmYmYwMGI5NDA4NjNhNWI3YjAzYjY0Zjp7InVzdWFyaW8iOjgsIl9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3ZWMxOTM2MDc0M2Q4NmNmM2QxOWIyMTJiNTI0YjBhMWRmMGYwYWRmIn0=','2019-12-18 21:19:09.442071'),('0h9e8unn4pw6tesos16htp519zyxm9vj','ODRjZThjNGY2NTc5NmVlNDFkMjhlYjA0YzNhNTNmY2Y5NDFiYWI5OTp7InVzdWFyaW8iOiJ1c3VhcmlvIn0=','2019-12-06 21:53:35.761490'),('0tqxnfn8k7lz9vbln3mrnrxcx68c1027','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 22:37:40.198441'),('16b1arc8bsjywnoljt01bttbw4utu8da','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-31 22:22:47.985641'),('171aqnlpma1kj2hefhuj5kkljv7r4zfn','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 21:34:51.346095'),('17af5ngsvlu1mz8ktp01u97a895cngmq','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-19 05:38:31.499530'),('1dw6e3ddxbv7ixpoufxrewdh1jtasm1u','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 22:48:44.710604'),('1ovcwousbx2ptkjrl1nnntzlp5dd0ljx','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-23 22:44:00.704194'),('20jdz92zlibyi726au2ko5wik49zlav6','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 21:44:53.939678'),('2cky9c1aypjfa6ax1ank83fqb63n4noo','YTZhOTU5YWYyNTk2ZWI3ZTkzNTNjMzNhMDhjMGUzYzNhODBiZTAyMzp7fQ==','2019-12-17 23:24:28.805901'),('2cxuzo1bbmrcd9xl158wt22gwqi29ya7','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-17 21:53:11.653796'),('2et82sbu2jklpexuxi8s4yry54p3qnxq','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-11 23:27:51.399654'),('2h9p87gvpr3r88w2m8lt94z5ivsnak3u','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 21:52:19.952320'),('2k1abxdtdq35mpfrmbl150t3m17d2rx7','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-17 22:03:39.775869'),('2kzdypjtnmj7pfpghr0gtwdhiowmkzie','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:00:20.832011'),('2xs6fiyahgcww0c0b6czx5g6tch4aj0n','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-21 02:34:09.963749'),('37x5ycgtcgd9pq7wn5y9b0yhjb167onj','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:31:47.890997'),('3djg4kgv2evj8u55nz4txzquuke4u03a','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:14:50.572385'),('3e7fes414aid6op04clsbhjw1tj0biwz','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 21:51:39.547797'),('3elzrlnttuvfznrtmxm1ngx78pw2oblr','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 23:24:14.331302'),('3i827bb2al2jcnjpzq8frk9hmdp3qz7v','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 21:43:55.732389'),('3ji0pgsrf1tl6stgo6tegld1jokqsxid','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 21:41:14.613770'),('3ozfp92xkzeazknalq3i4fau60el1r7n','NGRlOTllZmJhZTJlMThkMTg1ZGEyMmMxMWVjYzUxZTUxOTc1NmUzMTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNDJlNzY2ZWY3YjdjYzZlNjk1ZTk0ZWU0ZTZmZDdkMjYxZTc4OTgyIn0=','2019-11-27 21:40:00.536298'),('3qo353ku4pmhn82jv707jpqdglbpbtw7','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 21:48:16.166817'),('3v708rxwt8wddgpk5vsiffvesun162ln','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 20:59:09.651632'),('3vqzp3rmxduun4dpxgdrd3y13ludlpfi','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 21:39:54.310381'),('3yncl6h6jsedxa6i5elivw3eciwhttd5','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 22:10:44.813955'),('40fr5h3v9qeore3e4p4x7w4pugw38t80','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 22:16:08.137099'),('48oj7w8cm0sf9yxchzh4uyh5nlp4kl4z','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-17 21:58:49.392816'),('4oaoc7b6w49lsk1bs9a5fm7yrc27mc6t','NGRlOTllZmJhZTJlMThkMTg1ZGEyMmMxMWVjYzUxZTUxOTc1NmUzMTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNDJlNzY2ZWY3YjdjYzZlNjk1ZTk0ZWU0ZTZmZDdkMjYxZTc4OTgyIn0=','2019-11-23 18:20:25.760369'),('4rqp5wwfyvusyuz7i1eihh8ggdg6yppp','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:24:10.642339'),('4yo1iz2qcdd3aomdzh3efc2z31siec3e','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-17 22:12:55.688754'),('57t5j52cab6fag1sua0jz40ilkjva7r7','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 22:53:12.038381'),('5j0qle8pfz6jjaszbbdc9n67x9f704ac','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 22:40:05.848313'),('5lmzb419hr2ppvnxvesaqk3dnaknrnyp','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2020-01-08 16:03:53.546609'),('5v7p92bbrj35kttz1bgn8mfz4grab766','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:06:47.668192'),('61qxx7tfoeia2qtfudzixdc2b786v50h','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 22:55:41.367644'),('62l55o3d5duo0eebpj3rxce5bqjhxoxy','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 22:03:44.758091'),('64lkkpe6b7bu3kos6tx162ioxc1qhhek','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-19 21:52:55.031809'),('6bl7ub1k7fi8qxx53l39ijlx5gs7j7kx','NDEzMmQ4OTI0NzI4ZWY3ODRmMzcxMTI0ZjExNTVhZDNhNGQ0OGVmYjp7InVzdWFyaW8iOjgsIl9zZXNzaW9uX2luaXRfdGltZXN0YW1wXyI6MTU3NTkzMjc5MS44OTgxODk4fQ==','2019-12-23 23:06:33.956180'),('6p8u0a117u62ifr72892ta0ote3s8h3g','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:00:34.721925'),('6t3psev1g9i7p2mxjmt1bimjr0qy5fos','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 22:58:35.398104'),('6xjjbo63lxh9vh9avv4v45v77wi6y2r9','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 23:17:25.806057'),('6zd1fyi2s5bx2elb22xalhcqsqqlmb2t','ZWQ1NzQxYjlhZDlmNDhhNDg5MTgyMTdlNWY3NjI3YzY0ODczYjU1YTp7InVzdWFyaW8iOjgsIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNDJlNzY2ZWY3YjdjYzZlNjk1ZTk0ZWU0ZTZmZDdkMjYxZTc4OTgyIn0=','2019-12-18 03:19:20.132725'),('70r5ww9n4a2rd6k5pjos3pp4jh0hid3z','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-22 18:28:19.787819'),('7206o9ftjymzf4rj3j6b8k41i9j1aqyf','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:23:50.026626'),('73gc3a18i162049yhyvl3aylurmfqhey','YTZhOTU5YWYyNTk2ZWI3ZTkzNTNjMzNhMDhjMGUzYzNhODBiZTAyMzp7fQ==','2019-12-23 23:16:23.305401'),('74xtiw6lv735ruorolny1ys1v0n2swxh','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 21:34:23.610479'),('7501b80dmab99m0ficiyhtx98aryeeyr','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:26:32.530561'),('7a6u8wt1m8ds9dvxml4ae8xkog14aoa3','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 23:20:19.058382'),('7aiwfo4k02uyfzssxtybagtrknj1wrxq','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-21 22:58:11.563862'),('7c7t3e40vnk3ggqn60t5kmteew5ns6hg','YTZhOTU5YWYyNTk2ZWI3ZTkzNTNjMzNhMDhjMGUzYzNhODBiZTAyMzp7fQ==','2019-12-12 23:29:51.903664'),('7mqzyimrtv6wrp0snvsckvikdwr2f5a0','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2020-01-09 01:24:57.772347'),('7p7q03q7nweykv2x45hl6og42m30walx','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 21:31:11.944754'),('7v6lv2loi271d4bufgvqzx9f5dvsxcj9','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:42:49.381952'),('7wuujkfxe7y3s1u9p15nyw7bq1smj8or','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 20:52:35.387509'),('80wb6lwqvv5ytb2x21p01eu8own0as6m','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 21:46:08.083952'),('8bskrk28y5cvma84rlgy0dwltzuy9b8v','NDlhZTQ1ZjY2NTI3MGI4MTNkYjIxM2IzOGE0MmI4YzlmZGRhYzI5ZTp7Il9zZXNzaW9uX2luaXRfdGltZXN0YW1wXyI6MTU3NjEwMTM2Mi45MjIyMTI2fQ==','2019-12-25 21:56:05.898137'),('8hqn9wz7wu7som5buhn0tivwek42sbcg','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2020-02-07 21:28:27.701492'),('8i4fze775ts37nlwqszwhyf3jnpysthc','OWE2N2FjM2M3NzNkYWRmYTk5YTc2ZTExOWU3NTkwYzdiYjM1MmMwOTp7InVzdWFyaW8iOiJ1c3VhcmlvIiwiX2F1dGhfdXNlcl9pZCI6IjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA0MmU3NjZlZjdiN2NjNmU2OTVlOTRlZTRlNmZkN2QyNjFlNzg5ODIifQ==','2019-12-06 22:24:39.449546'),('8j4p0k7xp6wadaf4jzpkjrbktk8pn9kf','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2020-02-20 01:39:38.907286'),('8o0oaieyx5f221e14z911o4ym9ftcmzn','NGRlOTllZmJhZTJlMThkMTg1ZGEyMmMxMWVjYzUxZTUxOTc1NmUzMTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNDJlNzY2ZWY3YjdjYzZlNjk1ZTk0ZWU0ZTZmZDdkMjYxZTc4OTgyIn0=','2019-12-17 20:51:47.215762'),('8w4ia4qtexbgbhi00g1s18sjls5b0e82','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-27 01:09:58.840988'),('94hqck1es5lv5pca2eohwimqneu03ozx','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-17 23:23:45.976366'),('97eqspwwwirl5lp0he7v34nsffs817n5','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 20:52:50.941382'),('9aqwyyty6dbffg6q4w4ll8a6ynx7mw84','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2020-02-20 06:25:20.963109'),('9ce2ue6oq7cfvfovst6uwybsdf8d6tsa','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 22:33:29.018559'),('9edjsl39jic24i7bgqck155jq28w7m40','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 21:57:21.664164'),('9nej7tzf1ijeg3y6f50mfc58dup4xbm9','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 23:01:40.049256'),('a45i0y9emv3xuttvxwa5rtp9vsh4en3a','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:05:43.666780'),('a7rmnmqwzu6j0i3mxqz1qov95dez9uoz','MzQwNzQxZmRiZWNlZTY5YjdmODRjYzY5NjQyMzZkY2ZlNzZkNmZjZjp7InVzdWFyaW8iOiJsdWlzaWxsbyJ9','2019-12-03 22:39:44.322398'),('aekvs93io92jhetto2b5cek91ow9783u','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:59:59.547980'),('afxhg66en82s5cuk2hwb0djptla4qdoa','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 21:53:01.001614'),('agq569lcpu1wma70z1jssk9rdb9as7j8','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 21:53:20.367919'),('akjb82l3i11ap84jejtulfb3tuxbpseg','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:34:51.167011'),('anochcqr6qfqxlqk1j5tw8u28fbvjvmo','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 22:28:56.140011'),('ap2tbbi34hf41f3s5xkxrw8kmcmyvnax','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:52:02.315984'),('asdrozh7e8sggbfhn64l1ep7w69v8ubv','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:25:29.050339'),('atv92s25kkpey9d4xcmvcinrnh7fqtuj','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 22:30:55.408217'),('azzbsagdwuhmvttqsifiw3rconjygc4z','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 22:27:49.912576'),('b0g8ushpaolhh78u0q7zpmth6fr2he9q','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-17 21:54:43.307136'),('b5vl4rm2y1bba8ijikg866dd082r42rk','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-25 00:56:34.699153'),('b88slt1mmp7t8e1pr69olwil2w9map21','OWVlMWMwYzA0YzZkZGEyNDZlNzE1MDI3NmUzYTZiMGQ1NzA0MjQ4Mjp7Im1lbWJlcl9pZCI6MX0=','2019-12-02 19:18:24.024488'),('bb4oegxry7d9wu9swdzgx6b1agt1z9ud','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 22:05:57.791818'),('bbqddiaegje9a2g4dn7gqhae7mn5n4f8','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-22 17:40:07.751684'),('bcrmbxa9d0gdtalx3mzq02ehwl8mmuik','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-17 23:15:45.447101'),('bjb5lhy0nfkfzh4nmweuyjuedbewgnq4','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-28 17:45:35.280012'),('bmnme7e0anj9ajsotkzd4wbgahmxb5mq','NGRlOTllZmJhZTJlMThkMTg1ZGEyMmMxMWVjYzUxZTUxOTc1NmUzMTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNDJlNzY2ZWY3YjdjYzZlNjk1ZTk0ZWU0ZTZmZDdkMjYxZTc4OTgyIn0=','2019-12-19 02:56:55.820228'),('bn8ja42ld9hzl7pwsjq81uen2tc56fl8','MzMzYTM2M2VlMGIyNDM4NWNlOTc4NGRlZTZiNmJmZjUwY2E5NGYyNzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNDJlNzY2ZWY3YjdjYzZlNjk1ZTk0ZWU0ZTZmZDdkMjYxZTc4OTgyIiwidXN1YXJpbyI6OH0=','2019-12-16 22:50:47.836405'),('bzs0poam46bpfrsb9b5c9syf6whys8z7','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-21 00:17:50.984212'),('c30ihebzkp05feus9044pqe25wrjxkf9','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-19 22:39:47.203470'),('cp69r67hgb329se0g3d8mx1p4qwrb8xh','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 22:37:14.421468'),('dbe0h0k34prsudpu3veb206kkzhwzu8r','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 22:03:36.918951'),('deuaqahbagk0ovftht32vxgnt2jj5acv','MGJkMmEzZWQ0Mjk3OWQzMDFhMTQ4NGVhNmUwNmZmNzVlNzNmYjY5NDp7InVzdWFyaW8iOiJuZWxpbyJ9','2019-12-03 22:44:35.192813'),('doswmjkv9fhihf9l9ofh2kvuv7gmmjw1','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 21:35:51.910618'),('dte03cykx6gkdxkt9hfi78dbrz0ttqt3','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 22:51:26.811940'),('e8je8tcr2u7r4giehlhg1zb3611058ho','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:04:04.039527'),('ectverw7p4quxn4s4nvn89tbb6z7l1ku','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-15 12:52:56.412813'),('epof0wbpmc6aobcmfrrvsjsjyskab2yy','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-11 23:28:36.112449'),('f6n1yp2crf0fvoou47ihva8l5ei77ozn','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 23:07:34.146922'),('f9c2gbbsjavjej28ur6dvs5yinrj8xqp','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-17 23:11:53.080505'),('fshea8mvp8sy24a41mzd9qy47keldixm','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 22:02:49.280357'),('ftgwves51d32ghlaiipgcjuhs372wfmd','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:16:05.060768'),('fvg66xei93aj4w5r8lbuqbiacdfbdiu1','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 22:11:08.116236'),('gdh1rkzq5xdu2woix8nkqzgtu4g78b59','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 22:49:41.637423'),('gfjguysnqnoothyk65nxj3iqmoo3kf3t','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:26:34.287606'),('gi2r60lqn1oe2zefbb2x3h0lmy8bnkq5','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-31 22:32:17.646850'),('goq72f7adt9tug84kztb8vs3n2tl8e88','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 22:24:55.656361'),('h09xc0wbyuc6ki0ijrpiufhf0yep2r22','MzMzYTM2M2VlMGIyNDM4NWNlOTc4NGRlZTZiNmJmZjUwY2E5NGYyNzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNDJlNzY2ZWY3YjdjYzZlNjk1ZTk0ZWU0ZTZmZDdkMjYxZTc4OTgyIiwidXN1YXJpbyI6OH0=','2019-12-22 16:39:10.517787'),('hdccd2ci0kdvz834iy1vsf52p3onf9d7','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 21:39:13.957003'),('hf4ki45mwp8pmt1tfnv0c378lnpx9o87','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 22:03:03.949915'),('ho5d0x32re8ahsq76on6mizc3eg7moth','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-19 20:47:34.932120'),('hp1tymsu3lmsrf5ouk2d510wm9o2pjq3','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 23:03:36.405888'),('ht3u82p975aqrmyk01mo8pg9wz0nw74a','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 23:19:16.909774'),('huxe9dacr2yhm0choz2q4eqdcg7udu1o','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-17 23:34:46.797600'),('hx5fb8gp105ovo3yi6rfm0njozebfa89','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-17 23:18:36.733309'),('ieusgxvxhmdekdjc737me98rtjnvucky','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 21:28:15.442052'),('iphgf9jttftmjjqejks3c5kqlj3jyl3m','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2020-02-19 00:44:34.868617'),('ivt22txqw0ew1o83cqa96gofd0pr3x3o','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 21:54:01.871917'),('j1wpdrfft576txnczoc6mefkzbkxpef4','NGRlOTllZmJhZTJlMThkMTg1ZGEyMmMxMWVjYzUxZTUxOTc1NmUzMTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNDJlNzY2ZWY3YjdjYzZlNjk1ZTk0ZWU0ZTZmZDdkMjYxZTc4OTgyIn0=','2019-11-28 21:04:12.886506'),('jcnwxop450bb72izxjs4d7cxv85lsb25','NTVmMGNiZTNjOTA2M2FhMGRmYmYwMGI5NDA4NjNhNWI3YjAzYjY0Zjp7InVzdWFyaW8iOjgsIl9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3ZWMxOTM2MDc0M2Q4NmNmM2QxOWIyMTJiNTI0YjBhMWRmMGYwYWRmIn0=','2019-12-13 23:23:23.483896'),('jp1c99uv8bpxfh24mbg18jgv86yvy510','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 23:01:26.379550'),('jrvbe8un6pxcekf538gbbsitdlyjkqav','MmNiMDFjODdhMzg4MTZlYmQzYWRmNmIyYjdjNTNlNjVjYjRjYzc2Mjp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZmNmYzFkYzkzZDU5NjlkZWVmY2E1NjQ0N2JkYTVkMTBiMjYxMmE2IiwidXN1YXJpbyI6OH0=','2020-02-02 03:24:07.865560'),('k1fu0q2k4bft6bfmh5lhi8q3c6700vnw','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 23:15:35.537737'),('kbxjo4i2ph76g9wojh2iv5t1a9nbh2jg','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 22:58:38.110915'),('ke8lmdgkhmvhglh0vmjwraco891uyk46','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 20:38:52.044228'),('kog6z1opw88dgq2zo6c4osbi5kbqx59a','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 21:53:46.380873'),('ks5cornno1rhym4n8a1l39y0nn6bwdb3','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2020-02-20 20:39:37.991378'),('kt6cg8w0c6fmipgs2czwdtz1nz4tjya0','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 22:51:31.028371'),('kvnq2be0qw3xenz6xtyon3i7la6ffoog','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 22:39:15.438201'),('l5aqyf1jghfccx1me9pyroalanyrubda','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-30 15:17:33.718526'),('l9b81h6i7mjgycpcck5cchyd3tg90qgt','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-19 22:30:02.380117'),('lbv5tt9wkr59w2ruvmqj8x8nqzq3a1gg','YTZhOTU5YWYyNTk2ZWI3ZTkzNTNjMzNhMDhjMGUzYzNhODBiZTAyMzp7fQ==','2019-12-12 23:25:17.094506'),('ljw4s0yvtc7uqt4wajz7enpl50r57prq','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-21 22:03:51.483989'),('ll19ny0za2amjldwzdczkidpnpzb6a16','YTZhOTU5YWYyNTk2ZWI3ZTkzNTNjMzNhMDhjMGUzYzNhODBiZTAyMzp7fQ==','2019-12-27 01:25:54.938019'),('lprq19rfi7x2rcvbqok3g1x3df6ok3bw','MDM5N2VhMTEzYzVmOTIzYzkxNjA5NjY0Y2Q0MmJjNzQ1ODBjMjc3Yjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDQyZTc2NmVmN2I3Y2M2ZTY5NWU5NGVlNGU2ZmQ3ZDI2MWU3ODk4MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2019-11-29 20:42:00.269685'),('lwoyn8ypu1s22c60ovs6md8znapgk8j8','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 12:47:02.488853'),('lylk93wsxfw98gwrnnoya17axqd32mxj','YTZhOTU5YWYyNTk2ZWI3ZTkzNTNjMzNhMDhjMGUzYzNhODBiZTAyMzp7fQ==','2019-12-22 19:37:37.992459'),('m0388wrvfif17bvsbtfv18ucagge6opq','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-24 20:43:06.620296'),('mff4yhu354vzgvna74tt6cs2ih6x8oan','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:22:54.876811'),('mo69l39t4jwz1cx7gcytw3lrfz2h5aie','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-17 22:01:12.870732'),('mryugvhhioyu01pcjulo4rfk4r68w15i','NGY2OWIyYTJhNDk5ODk0MWIyN2VkM2Q0Y2RiZDA5NmMxZGMwZjY2ODp7InVzdWFyaW8iOjgsIl9zZXNzaW9uX2luaXRfdGltZXN0YW1wXyI6MTU3NjAxOTgwNi4xOTAyMDk5fQ==','2019-12-24 23:16:52.871641'),('mshln3e72fdfup347jh3jafv7p55tvfr','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 21:42:09.734452'),('mw27m2qfkncy74dbb1u9n34szdsnk0xj','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 23:10:43.416045'),('ncu9luslekq4m2zprsyg3b6cc4j9bez7','NGRlOTllZmJhZTJlMThkMTg1ZGEyMmMxMWVjYzUxZTUxOTc1NmUzMTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNDJlNzY2ZWY3YjdjYzZlNjk1ZTk0ZWU0ZTZmZDdkMjYxZTc4OTgyIn0=','2019-12-04 16:11:22.085474'),('nggv184eh8t3wvnnr15b7tj9mvdzrqbc','YTZhOTU5YWYyNTk2ZWI3ZTkzNTNjMzNhMDhjMGUzYzNhODBiZTAyMzp7fQ==','2019-12-19 13:58:43.987642'),('nlue6r8nzzo4unoutdri63od6cmrg331','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 21:48:40.201655'),('nn4o1s0hc5d4bo5yw90yz0ua6fz0tuw3','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 21:17:51.295640'),('nqn903kwog124z0twe5fmznhica5j2an','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:40:02.256347'),('o0z4zjwmrzpzag4htshudhec90vot72k','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:53:12.733872'),('o11nb4k98sm3ipr42n2g1slxmnjomoer','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 22:52:24.916843'),('o13g1pkc7otyhfjrudzp7oq8b0s37i2p','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 22:36:09.436328'),('o30kr2jg014scb3zl51mg5x6g1vjo3nq','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-19 21:38:14.489086'),('o3bygpjln79y9j0nv38iwlh1ndlfjnjj','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-21 01:44:45.136238'),('o3dd2e0cduinrjvd7olswek2u8zzj6o4','MzMzYTM2M2VlMGIyNDM4NWNlOTc4NGRlZTZiNmJmZjUwY2E5NGYyNzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNDJlNzY2ZWY3YjdjYzZlNjk1ZTk0ZWU0ZTZmZDdkMjYxZTc4OTgyIiwidXN1YXJpbyI6OH0=','2019-12-19 20:50:07.681177'),('o5h1bjcoik32793xyht9quwujiwrbx92','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 23:30:08.001994'),('o7qtzk64z74jwfhib1ku09shfslmr55h','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 22:23:12.847741'),('oddzclgsl4zqmej9xdb9uyvhzkjtagck','YTZhOTU5YWYyNTk2ZWI3ZTkzNTNjMzNhMDhjMGUzYzNhODBiZTAyMzp7fQ==','2020-01-07 00:22:34.013825'),('ohx5kpj72y0goc3s2j7xz6l5x0dnc461','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:49:12.310387'),('okl3aup9nlci6ludtdpxn0fsbvzjcn2k','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 21:33:09.244309'),('oo679q23588s9n2ud207dtk61w9hk8gw','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 22:09:20.130029'),('ooflm0rpt5htuuvzg516ck48b9s9iaci','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-29 02:40:11.348585'),('oou6sbckfgkii49w7s67n7yfbz1xutq9','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-11 23:26:17.229343'),('ovb56wm9ybbmwajoz7eyfxil0o0lxv7u','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-22 19:06:02.814404'),('ovn82ay2i9e7uq127b32lv91ruyvk0ho','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2020-01-08 23:26:50.808569'),('p2wvc597gmopb4gbhbv2i5n2yk9qv4zn','ZjExOTEzMGZlNzlmNGE2MGYzZTJmOWExNDU3Y2NjMGY0ZmQ3M2VlZTp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0N2NiN2Q0MGUzZTUxN2I1MDJjMzJmNmM4MWRmNTYxN2QyYzU5Y2YxIn0=','2019-12-02 21:51:01.292405'),('p3pkmsupzr8edk4l4g4rrk12op3xg2vs','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 22:21:55.195057'),('pkonzh9710nk8d04dbob9kujpajhe8li','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-29 13:05:34.154688'),('pni1i72a7kwt6jkdd299s64trg451zmg','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-11 22:57:26.683298'),('pqx0dghg3xhxu1dlvnwa61onypek535b','NDVmOGUzODQxYmIwMzA1YzUwNzUyZWYyNTNhOGVmY2EyNzY5YzdjMjp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3ZWMxOTM2MDc0M2Q4NmNmM2QxOWIyMTJiNTI0YjBhMWRmMGYwYWRmIiwidXN1YXJpbyI6OH0=','2019-12-17 21:51:58.046427'),('pub7tqr7xtdf268i9pytr8rt0bqpru1s','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 21:29:24.038975'),('px499r6be4moxruc7ejnzk5monpz0xpe','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2020-01-09 03:44:31.830333'),('pzwmifsaf9ibw4j5w0ucdm9z14mwakl4','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 21:21:41.668189'),('q0yteg3191a1y9u19t254nmzvon0u00z','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:15:42.635926'),('q7qzuxxs91awr0r8hso27wudr9kbve9w','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-13 21:18:03.245574'),('q8t6l7nx0lehbg1blvfhhr73q7u39ive','YTZhOTU5YWYyNTk2ZWI3ZTkzNTNjMzNhMDhjMGUzYzNhODBiZTAyMzp7fQ==','2019-12-30 21:57:28.105348'),('ql9bu80eykey3vv9ueqn507h4j5lpjsa','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-31 16:38:13.815922'),('qovsehn0bl6xxoq19dwpimxroe24ljkj','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:13:59.425381'),('r97ywntxf6pl5l9l62hmubtrylw4y89g','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-17 22:43:59.467503'),('rbb9zewwooxmzcex62m161mqtnnheyk3','YTZhOTU5YWYyNTk2ZWI3ZTkzNTNjMzNhMDhjMGUzYzNhODBiZTAyMzp7fQ==','2020-01-07 20:10:49.011778'),('rcemxbynq6kpaxpbg4e82cfourl7rwut','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:30:03.601311'),('rhnta0r97qruk23tvj63ruf7wmv6lp77','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 22:48:12.802041'),('rkrhdnrb1o5eqp0zf7uj7jn0ucbt7lng','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-24 11:52:27.854464'),('rp03y5sb6vbq02w1mnute9zo5zewki2q','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:07:42.238181'),('rvynr9f9y5tsdp9d9ogfc0f8lcduiaik','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 23:15:15.667772'),('rz5q9thktrj026vnhxjf0u2df0euezj8','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 23:04:27.497040'),('rzv3twhmpw30s1pmhehybsjdyywzbxjp','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-11 23:21:57.210479'),('s3dh3x3pg7drj349uoym23nv9mejch2o','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 23:01:53.864583'),('s9zkhaci4ij0k7wwnl5ctwabip01zpnf','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2020-01-03 21:13:59.009029'),('sah8hdnsxc7igzyioww0wwmli86lt3p2','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 21:45:18.405189'),('sdyd38wa8vqv66gpvl929a4ruc34kl8i','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 23:17:23.038818'),('sh4o9erb0fwjhkh932zhbzck1ls4sm6x','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-28 18:09:47.022564'),('slu74tn2dcavc5zbjfwrtmzhjjaex171','MzMzYTM2M2VlMGIyNDM4NWNlOTc4NGRlZTZiNmJmZjUwY2E5NGYyNzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNDJlNzY2ZWY3YjdjYzZlNjk1ZTk0ZWU0ZTZmZDdkMjYxZTc4OTgyIiwidXN1YXJpbyI6OH0=','2019-12-20 21:05:43.090342'),('smygpdmqofim87l7g7lp30qiqyufdq66','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 22:26:16.743499'),('sn3c6qpenyemdb5q62wgut6awucdrrsz','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2020-01-08 00:11:33.938872'),('snzop3emhtokz7me22we3ze45i0sn2mg','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 22:09:39.089821'),('squjqxnqww2pkdt3t8zuecjgm3kyvlet','MWNkYWJhNGQyYmRmZjBhMmUwNWRiOTI5MzdiYzZiZGYxZDQ5NDljODp7Il9zZXNzaW9uX2luaXRfdGltZXN0YW1wXyI6MTU3NjEwMDg0MS41MjIyNzJ9','2019-12-25 21:47:26.481190'),('szos64kz39z8mnzjl28wk41iobfrja25','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-19 22:27:04.556603'),('t2rp8hfhbiwdoelcc0oxrfcv9yc1msdn','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-11 23:25:21.243197'),('t5tnqfdd1kjzdf7l5cgdh3uf521c42mw','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 22:51:00.150015'),('tb3y1i8cr50ooy8e41ustrg7ec4mhj45','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 20:58:36.791609'),('to9p4w8uz3cghytyp7rriplx3p1ew3f5','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 22:57:04.415301'),('u1uatlgpm3bgnoe1i77qbs5mmctxssgq','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:09:20.557877'),('u4mjj4w5r88mkkt2rofbtgphzygpephy','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:33:44.868704'),('uagim7f1wqpxnk61ehfprjmtdc51mzo3','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:35:25.901071'),('uaqdbmfecajfq317g1qj7gbf7rymt8jk','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 22:40:33.300311'),('ubm8f5ujlr0aqc746paxqrywit976cf8','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-17 21:15:35.854983'),('udbbig3xxm1s76nzox2wkced0m1tlugw','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2020-01-07 01:27:52.030932'),('ujvx1y0c7j4h68hvtk5kug8up20zsm08','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2020-01-09 19:56:17.084914'),('umhrgoux1elghvroukljzvhfgk28u4b7','NjBlYTI1MGVkNzlhMDU3NjBkYWNiMDA4NjdiYzRiMzkxMGI0YTU5ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjVmMmU1NGM5ZjIwNGNkMmFhZmVlNTFkZGU3ZGY4MzEyYTNjNjFiIn0=','2019-11-21 21:24:07.681536'),('uug000mprl2xet0o3ck93kinjkhipgg0','NGRlOTllZmJhZTJlMThkMTg1ZGEyMmMxMWVjYzUxZTUxOTc1NmUzMTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNDJlNzY2ZWY3YjdjYzZlNjk1ZTk0ZWU0ZTZmZDdkMjYxZTc4OTgyIn0=','2019-11-28 22:19:45.616010'),('uvpp58cq8kvrkdq71defb3jmpmtfyvvi','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-24 21:48:05.435664'),('v24g0a1pd9f7ejbzkfdlpvpms59iqpg1','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-22 18:40:26.951517'),('v4avyifznc0vbgu42077dagtt1y5rppy','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 22:21:01.059153'),('v4cy53owxq44cvsgw35pgh9d2af4dwl1','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-17 22:20:36.253486'),('v4x6a6sflgs8d6fmaglds2f08fbasfzc','NGRlOTllZmJhZTJlMThkMTg1ZGEyMmMxMWVjYzUxZTUxOTc1NmUzMTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNDJlNzY2ZWY3YjdjYzZlNjk1ZTk0ZWU0ZTZmZDdkMjYxZTc4OTgyIn0=','2019-11-26 13:40:12.835441'),('vm3bpcmpdwgxjwgjohlrn00byxw4oex8','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 21:50:39.019151'),('vmoolzi9xynejkei2lcbx254lex4rpv1','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-17 23:32:34.018211'),('vpkfr9dbqvozqys5f0hbsxaabf0u0nxn','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 21:49:07.582006'),('vyqlke84frthfz7i8tb69acu4st9q167','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-17 21:30:43.128000'),('w4mb1yoj8yllk15301nprua256hw7245','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 22:13:46.443876'),('w885nowu97bajcszcsjtuq7j1e9qgwcw','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 22:12:03.962127'),('w9uvluqsjildkfp9v7uuargiqayrlgc3','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 21:47:53.441474'),('waaols9dnvyqv7dhdghae85a79bf5oke','NGRlOTllZmJhZTJlMThkMTg1ZGEyMmMxMWVjYzUxZTUxOTc1NmUzMTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNDJlNzY2ZWY3YjdjYzZlNjk1ZTk0ZWU0ZTZmZDdkMjYxZTc4OTgyIn0=','2019-12-22 15:46:08.784056'),('wdv2upn0r4tyxkgb4ptv85eltrhp3rlj','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-22 17:07:21.698787'),('whbffdvzzb0gzkf2ty7pk9tv0q1uica2','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-17 23:30:10.808010'),('wn1y5csp3pm68e56j9cl87285nt4o8il','YTZhOTU5YWYyNTk2ZWI3ZTkzNTNjMzNhMDhjMGUzYzNhODBiZTAyMzp7fQ==','2019-12-16 22:04:57.532112'),('woway6gdq3qkzrcvbq0rkxchdng5i56d','NGRlOTllZmJhZTJlMThkMTg1ZGEyMmMxMWVjYzUxZTUxOTc1NmUzMTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNDJlNzY2ZWY3YjdjYzZlNjk1ZTk0ZWU0ZTZmZDdkMjYxZTc4OTgyIn0=','2019-11-27 12:42:54.223703'),('wsejmm11kfo2xqfji6ehlk8akwysu0g8','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-13 22:50:46.374657'),('wsry94ottflymv1a3ev4rqzrjxjcrlkh','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 22:32:24.333313'),('wtshyqiyzpj1r6jtyn2igi7ooxcoyb4z','YTZhOTU5YWYyNTk2ZWI3ZTkzNTNjMzNhMDhjMGUzYzNhODBiZTAyMzp7fQ==','2020-01-09 02:33:13.509519'),('x16pnnccvki91llwnb68y1vr77y80q4b','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 22:41:26.970189'),('xa6mudh4oko3c6o48rbbli6apa1aav35','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 22:31:36.873581'),('xb9t18lr12497ll01xn1g5zvk3dv3m4b','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-17 21:00:30.925001'),('xcper4mt7mj6sfrq0rbma4ebdmzthcrz','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 23:02:53.682653'),('xibbaodtqhqd6q313msj7xzogbqtl1xb','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-26 23:14:23.986868'),('xzj89igj36fx8wlk7b917lu36emrtalg','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-17 23:20:27.217482'),('y1gk97vhgbbe4qbiteradywk95uqyzqp','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 20:37:32.435794'),('y2i9zo0bhvb8r11dcci0kkn8uerb6due','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 23:09:03.921913'),('y2x4p1rhz0qyn61b4skxrqjwxrrzveu6','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 23:04:17.281689'),('yf4c2x44p48vbs42qma2fzki1vy32gw9','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 23:28:49.199521'),('yhs5e9jh6c8bjtyih7u2rf4p6rl2rou1','ODRjZThjNGY2NTc5NmVlNDFkMjhlYjA0YzNhNTNmY2Y5NDFiYWI5OTp7InVzdWFyaW8iOiJ1c3VhcmlvIn0=','2019-12-09 21:24:25.916873'),('ym9w4rffuv0clgtx340bppwin5sfrf0r','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 21:08:26.944853'),('ymnwwxllvbpifq5i9yvpkzkkb438vwmj','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 22:58:17.429748'),('yyaxuxso1148mjr5vv5gmdpfhf933rvt','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2020-02-06 21:43:48.189573'),('yzmvrq2dxgndq71nt2eplhs7wc9v6zlj','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-17 23:18:46.016325'),('z5k8grdk9gkhp1qmoyg3j524dwgmh6il','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-12 22:35:13.242718'),('zdut4n0j459z8ukyw046p0bfm9wy4wt4','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2020-01-09 20:56:28.455644'),('zfn2ku58ehufpmcxvas5p4ono0z5i42k','NGRlOTllZmJhZTJlMThkMTg1ZGEyMmMxMWVjYzUxZTUxOTc1NmUzMTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNDJlNzY2ZWY3YjdjYzZlNjk1ZTk0ZWU0ZTZmZDdkMjYxZTc4OTgyIn0=','2019-12-22 15:09:44.367293'),('zg4sdbelzd9jggrpnrfwa6bmytk8bouf','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 22:53:58.982972'),('zijejemvbn2i5l36thy04weiwcuw8enx','ZTE0YzBhMzQ2OTFlZGMxZjJhODhmMzViZTdlMWE5ZmVmNDVjOTliZDp7Il9zZXNzaW9uX2luaXRfdGltZXN0YW1wXyI6MTU3NjEwMDY1MC4zMzExOTF9','2019-12-25 21:44:15.852460'),('zswtbsj3qz28cb69evgqh7i1o6ciby9e','NjEwZGMxY2M4NmFkY2NiYWUwOWEyZDQ4Y2NkYWNkZjlmMDRiODM4OTp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3ZWMxOTM2MDc0M2Q4NmNmM2QxOWIyMTJiNTI0YjBhMWRmMGYwYWRmIn0=','2019-12-09 21:27:34.171894'),('ztiwd1g4af3mtmjbpyrmhoq4var8ysbg','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2020-02-13 01:08:20.488506'),('ztze7ylj9wzpl2cd2wwhme03zarxz570','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-16 02:33:58.504047'),('zxqi73vudv749md5scudz3w1ee3lfv38','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-18 22:21:36.776356'),('zzjf63exgrhheomvjb79gfhene5lmisk','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2019-12-11 23:22:29.725421');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genr_general`
--

DROP TABLE IF EXISTS `genr_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `genr_general` (
  `idgenr_general` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idgenr_general`)
) ENGINE=InnoDB AUTO_INCREMENT=1749 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genr_general`
--

LOCK TABLES `genr_general` WRITE;
/*!40000 ALTER TABLE `genr_general` DISABLE KEYS */;
INSERT INTO `genr_general` VALUES (1,'TIP','GEN','Genero'),(2,'TIP','EST','Estado civil'),(3,'GEN','001','FEMENINO'),(4,'GEN','002','MASCULINO'),(5,'EST','001','CASADO'),(6,'EST','002','SOLTERO'),(7,'TIP','TID','TIPO IDENTIFICACION'),(8,'TID','C','CEDULA'),(9,'TID','R','RUC'),(10,'TID','P','PASAPORTE'),(11,'TIP','TPA','PAISES'),(12,'TPA','016','AMERICA SAMOA'),(13,'TPA','074','BOUVET ISLAND'),(14,'TPA','593','ECUADOR'),(15,'TPA','110','ESTADOS UNIDOS'),(16,'TPA','126','VENEZUELA'),(17,'TPA','105','COLOMBIA'),(18,'TIP','TUS','TIPO DE USUARIO'),(19,'TUS','EST','ROL ESTUDIANTE'),(20,'TUS','PRO','ROL PROFESOR'),(21,'TUS','ADM','ROL ADMINISTRATIVO'),(22,'TUS','REP','ROL REPRESENTANTE'),(23,'TIP','MAT','MATERIAS'),(24,'MAT','001','MATEMATICAS'),(25,'MAT','002','INGLES'),(26,'MAT','003','SOCIALES'),(27,'TIP','QUI','QUIMESTRE'),(28,'QUI','Q01','PRIMER QUIMESTRE'),(29,'QUI','Q02','SEGUNDO QUIMESTRE'),(30,'TIP','PER','PERFIL'),(31,'PER','PRO','PERFIL PROFESOR'),(32,'PER','ADM','PERFIL ADMINISTRATIVO'),(33,'593','GUA','GUAYAS'),(34,'593','PIC','PICHINCHA'),(35,'GUA','GUY','GUAYAQUIL'),(36,'GUA','DUR','DURAN'),(37,'PIC','QUI','QUITO'),(38,'PIC','PIM','PIMANPIRO'),(39,'TIP','JOR','JORNADA'),(40,'JOR ','JMA','MATUTINO'),(41,'JOR','JVE','VESPERTINO'),(42,'JOR ','JNO','NOCTURNO'),(43,'TIP','ETN','ETNIA INDIGENA'),(44,'ETN','IND','INDIGENA'),(45,'ETN ','AFR','ADROECUATORIANO'),(46,'ETN','NEG','NEGRO'),(47,'ETN','MUL','MULATO'),(48,'ETN ','MON','MONTUVIO'),(49,'ETN','MEZ','MEZTISO'),(50,'ETN','BLA','BLANCO'),(51,'TIP','IDA','IDIOMA ANCESTRAL'),(52,'IDA','ACH','ACHUAR CHICHAM'),(53,'IDA','AND','ANDOA'),(54,'IDA','AWA','AWAPIT'),(55,'IDA','CHA','CHA PALAA'),(56,'IDA','HUA','HUAO TEDEO'),(57,'IDA','ING','INGAE'),(58,'IDA','KIC','KICHWA'),(59,'IDA','NIN','NINGUNO'),(60,'IDA','PAI','PAICOCA'),(61,'IDA','SHI','SHIWIAR CHICHAM'),(62,'IDA','SHU','SHUAR CHICHAM'),(63,'IDA','SIA','SIAPEDE'),(64,'IDA','TSA','TSA\'FIQUI'),(65,'IDA','ZAP','ZAPARA'),(66,'TIP','CMI','CATEGORIA MIGRATORIA'),(67,'CMI','PER','RESIDENTE PERMANENTE'),(68,'CMI','DET','RESIDENTE DE TRANSITO O NO RESIDENTE'),(69,'CMI','TEM','RESIDENTE TEMPORAL'),(70,'CMI','REF','REFUGIADO'),(71,'CMI','NIN','NINGUNA'),(76,'TIP','NFO','NIVEL DE FORMACION PADRES'),(77,'NFO','CAL','CENTRO DE ALFABETIZACION'),(78,'NFO','JIN','JARDIN DE INFANTES'),(79,'NFO','PRI','PRIMARIA (1RO A 7MO GRADO)'),(80,'NFO','EBA','EDUCACION BASICA (8VO A 10MO GRADO)'),(81,'NFO','SEC','SECUNDARIA (NO CULMINO EL BACHILLER)'),(82,'NFO','EME','EDUCACION MEDIA (SI CULMINO EL BACHILLER)'),(83,'NFO','SUN','SUPERIOR NO UNIVERSITARIA (TECNICO - TECNOLOG'),(84,'NFO','SUU','SUPERIOR UNIVERSITARIA (3ER NIVEL)'),(85,'NFO','POG','POST-GRADO (4TO NIVEL)'),(86,'TIP','TSA','TIPO DE SANGRE'),(87,'TSA','SA1','O-'),(88,'TSA','SA2','O+'),(89,'TSA','SA3','A-'),(90,'TSA','SA4','A+'),(91,'TSA','SA5','B-'),(92,'TSA','SA6','B+'),(93,'TSA','SA7','AB-'),(94,'TSA','SA8','AB+'),(96,'TIP','STA','ESTADOS'),(97,'STA','1','ACTIVO'),(98,'STA','0','INACTIVO'),(99,'STA','2','EN PROCESO'),(100,'593','01','AZUAY'),(101,'593','02','BOLIVAR'),(102,'593','03','CAÑAR'),(103,'593','04','CARCHI'),(104,'593','05','COTOPAXI'),(105,'593','06','CHIMBORAZO'),(106,'593','07','EL ORO'),(107,'593','08','ESMERALDAS'),(108,'593','09','GUAYAS'),(109,'593','10','IMBABURA'),(110,'593','11','LOJA'),(111,'593','12','LOS RIOS'),(112,'593','13','MANABI'),(113,'593','14','MORONA SANTIAGO'),(114,'593','15','NAPO'),(115,'593','16','PASTAZA'),(116,'593','17','PICHINCHA'),(117,'593','18','TUNGURAHUA'),(118,'593','19','ZAMORA CHINCHIPE'),(119,'593','20','GALAPAGOS'),(120,'593','21','SUCUMBIOS'),(121,'593','22','ORELLANA'),(122,'593','23','SANTO DOMINGO DE LOS TSACHILAS'),(123,'593','24','SANTA ELENA'),(124,'593','90','ZONAS NO DELIMITADAS'),(125,'01','0101','CUENCA'),(126,'01','0102','GIRÓN'),(127,'01','0103','GUALACEO'),(128,'01','0104','NABÓN'),(129,'01','0105','PAUTE'),(130,'01','0106','PUCARA'),(131,'01','0107','SAN FERNANDO'),(132,'01','0108','SANTA ISABEL'),(133,'01','0109','SIGSIG'),(134,'01','0110','OÑA'),(135,'01','0111','CHORDELEG'),(136,'01','0112','EL PAN'),(137,'01','0113','SEVILLA DE ORO'),(138,'01','0114','GUACHAPALA'),(139,'01','0115','CAMILO PONCE ENRÍQUEZ'),(140,'02','0201','GUARANDA'),(141,'02','0202','CHILLANES'),(142,'02','0203','CHIMBO'),(143,'02','0204','ECHEANDÍA'),(144,'02','0205','SAN MIGUEL'),(145,'02','0206','CALUMA'),(146,'02','0207','LAS NAVES'),(147,'03','0301','AZOGUES'),(148,'03','0302','BIBLIÁN'),(149,'03','0303','CAÑAR'),(150,'03','0304','LA TRONCAL'),(151,'03','0305','EL TAMBO'),(152,'03','0306','DÉLEG'),(153,'03','0307','SUSCAL'),(154,'04','0401','TULCÁN'),(155,'04','0402','BOLÍVAR'),(156,'04','0403','ESPEJO'),(157,'04','0404','MIRA'),(158,'04','0405','MONTÚFAR'),(159,'04','0406','SAN PEDRO DE HUACA'),(160,'05','0501','LATACUNGA'),(161,'05','0502','LA MANÁ'),(162,'05','0503','PANGUA'),(163,'05','0504','PUJILI'),(164,'05','0505','SALCEDO'),(165,'05','0506','SAQUISILÍ'),(166,'05','0507','SIGCHOS'),(167,'06','0601','RIOBAMBA'),(168,'06','0602','ALAUSI'),(169,'06','0603','COLTA'),(170,'06','0604','CHAMBO'),(171,'06','0605','CHUNCHI'),(172,'06','0606','GUAMOTE'),(173,'06','0607','GUANO'),(174,'06','0608','PALLATANGA'),(175,'06','0609','PENIPE'),(176,'06','0610','CUMANDÁ'),(177,'07','0701','MACHALA'),(178,'07','0702','ARENILLAS'),(179,'07','0703','ATAHUALPA'),(180,'07','0704','BALSAS'),(181,'07','0705','CHILLA'),(182,'07','0706','EL GUABO'),(183,'07','0707','HUAQUILLAS'),(184,'07','0708','MARCABELÍ'),(185,'07','0709','PASAJE'),(186,'07','0710','PIÑAS'),(187,'07','0711','PORTOVELO'),(188,'07','0712','SANTA ROSA'),(189,'07','0713','ZARUMA'),(190,'07','0714','LAS LAJAS'),(191,'08','0801','ESMERALDAS'),(192,'08','0802','ELOY ALFARO'),(193,'08','0803','MUISNE'),(194,'08','0804','QUININDÉ'),(195,'08','0805','SAN LORENZO'),(196,'08','0806','ATACAMES'),(197,'08','0807','RIOVERDE'),(198,'08','0808','LA CONCORDIA'),(199,'09','0901','GUAYAQUIL'),(200,'09','0902','ALFREDO BAQUERIZO MORENO (JUJÁN)'),(201,'09','0903','BALAO'),(202,'09','0904','BALZAR'),(203,'09','0905','COLIMES'),(204,'09','0906','DAULE'),(205,'09','0907','DURÁN'),(206,'09','0908','EL EMPALME'),(207,'09','0909','EL TRIUNFO'),(208,'09','0910','MILAGRO'),(209,'09','0911','NARANJAL'),(210,'09','0912','NARANJITO'),(211,'09','0913','PALESTINA'),(212,'09','0914','PEDRO CARBO'),(213,'09','0916','SAMBORONDÓN'),(214,'09','0918','SANTA LUCÍA'),(215,'09','0919','SALITRE (URBINA JADO)'),(216,'09','0920','SAN JACINTO DE YAGUACHI'),(217,'09','0921','PLAYAS'),(218,'09','0922','SIMÓN BOLÍVAR'),(219,'09','0923','CORONEL MARCELINO MARIDUEÑA'),(220,'09','0924','LOMAS DE SARGENTILLO'),(221,'09','0925','NOBOL'),(222,'09','0927','GENERAL ANTONIO ELIZALDE'),(223,'09','0928','ISIDRO AYORA'),(224,'10','1001','IBARRA'),(225,'10','1002','ANTONIO ANTE'),(226,'10','1003','COTACACHI'),(227,'10','1004','OTAVALO'),(228,'10','1005','PIMAMPIRO'),(229,'10','1006','SAN MIGUEL DE URCUQUÍ'),(230,'11','1101','LOJA'),(231,'11','1102','CALVAS'),(232,'11','1103','CATAMAYO'),(233,'11','1104','CELICA'),(234,'11','1105','CHAGUARPAMBA'),(235,'11','1106','ESPÍNDOLA'),(236,'11','1107','GONZANAMÁ'),(237,'11','1108','MACARÁ'),(238,'11','1109','PALTAS'),(239,'11','1110','PUYANGO'),(240,'11','1111','SARAGURO'),(241,'11','1112','SOZORANGA'),(242,'11','1113','ZAPOTILLO'),(243,'11','1114','PINDAL'),(244,'11','1115','QUILANGA'),(245,'11','1116','OLMEDO'),(246,'12','1201','BABAHOYO'),(247,'12','1202','BABA'),(248,'12','1203','MONTALVO'),(249,'12','1204','PUEBLOVIEJO'),(250,'12','1205','QUEVEDO'),(251,'12','1206','URDANETA'),(252,'12','1207','VENTANAS'),(253,'12','1208','VÍNCES'),(254,'12','1209','PALENQUE'),(255,'12','1210','BUENA FÉ'),(256,'12','1211','VALENCIA'),(257,'12','1212','MOCACHE'),(258,'12','1213','QUINSALOMA'),(259,'13','1301','PORTOVIEJO'),(260,'13','1302','BOLÍVAR'),(261,'13','1303','CHONE'),(262,'13','1304','EL CARMEN'),(263,'13','1305','FLAVIO ALFARO'),(264,'13','1306','JIPIJAPA'),(265,'13','1307','JUNÍN'),(266,'13','1308','MANTA'),(267,'13','1309','MONTECRISTI'),(268,'13','1310','PAJÁN'),(269,'13','1311','PICHINCHA'),(270,'13','1312','ROCAFUERTE'),(271,'13','1313','SANTA ANA'),(272,'13','1314','SUCRE'),(273,'13','1315','TOSAGUA'),(274,'13','1316','24 DE MAYO'),(275,'13','1317','PEDERNALES'),(276,'13','1318','OLMEDO'),(277,'13','1319','PUERTO LÓPEZ'),(278,'13','1320','JAMA'),(279,'13','1321','JARAMIJÓ'),(280,'13','1322','SAN VICENTE'),(281,'14','1401','MORONA'),(282,'14','1402','GUALAQUIZA'),(283,'14','1403','LIMÓN INDANZA'),(284,'14','1404','PALORA'),(285,'14','1405','SANTIAGO'),(286,'14','1406','SUCÚA'),(287,'14','1407','HUAMBOYA'),(288,'14','1408','SAN JUAN BOSCO'),(289,'14','1409','TAISHA'),(290,'14','1410','LOGROÑO'),(291,'14','1411','PABLO SEXTO'),(292,'14','1412','TIWINTZA'),(293,'15','1501','TENA'),(294,'15','1503','ARCHIDONA'),(295,'15','1504','EL CHACO'),(296,'15','1507','QUIJOS'),(297,'15','1509','CARLOS JULIO AROSEMENA TOLA'),(298,'16','1601','PASTAZA'),(299,'16','1602','MERA'),(300,'16','1603','SANTA CLARA'),(301,'16','1604','ARAJUNO'),(302,'17','1701','QUITO'),(303,'17','1702','CAYAMBE'),(304,'17','1703','MEJIA'),(305,'17','1704','PEDRO MONCAYO'),(306,'17','1705','RUMIÑAHUI'),(307,'17','1707','SAN MIGUEL DE LOS BANCOS'),(308,'17','1708','PEDRO VICENTE MALDONADO'),(309,'17','1709','PUERTO QUITO'),(310,'18','1801','AMBATO'),(311,'18','1802','BAÑOS DE AGUA SANTA'),(312,'18','1803','CEVALLOS'),(313,'18','1804','MOCHA'),(314,'18','1805','PATATE'),(315,'18','1806','QUERO'),(316,'18','1807','SAN PEDRO DE PELILEO'),(317,'18','1808','SANTIAGO DE PÍLLARO'),(318,'18','1809','TISALEO'),(319,'19','1901','ZAMORA'),(320,'19','1902','CHINCHIPE'),(321,'19','1903','NANGARITZA'),(322,'19','1904','YACUAMBI'),(323,'19','1905','YANTZAZA (YANZATZA)'),(324,'19','1906','EL PANGUI'),(325,'19','1907','CENTINELA DEL CÓNDOR'),(326,'19','1908','PALANDA'),(327,'19','1909','PAQUISHA'),(328,'20','2001','SAN CRISTÓBAL'),(329,'20','2002','ISABELA'),(330,'20','2003','SANTA CRUZ'),(331,'21','2101','LAGO AGRIO'),(332,'21','2102','GONZALO PIZARRO'),(333,'21','2103','PUTUMAYO'),(334,'21','2104','SHUSHUFINDI'),(335,'21','2105','SUCUMBÍOS'),(336,'21','2106','CASCALES'),(337,'21','2107','CUYABENO'),(338,'22','2201','ORELLANA'),(339,'22','2202','AGUARICO'),(340,'22','2203','LA JOYA DE LOS SACHAS'),(341,'22','2204','LORETO'),(342,'23','2301','SANTO DOMINGO'),(343,'24','2401','SANTA ELENA'),(344,'24','2402','LA LIBERTAD'),(345,'24','2403','SALINAS'),(346,'90','9001','LAS GOLONDRINAS'),(347,'90','9003','MANGA DEL CURA'),(348,'90','9004','EL PIEDRERO'),(349,'0101','010101','BELLAVISTA'),(350,'0101','010102','CAÑARIBAMBA'),(351,'0101','010103','EL BATÁN'),(352,'0101','010104','EL SAGRARIO'),(353,'0101','010105','EL VECINO'),(354,'0101','010106','GIL RAMÍREZ DÁVALOS'),(355,'0101','010107','HUAYNACÁPAC'),(356,'0101','010108','MACHÁNGARA'),(357,'0101','010109','MONAY'),(358,'0101','010110','SAN BLAS'),(359,'0101','010111','SAN SEBASTIÁN'),(360,'0101','010112','SUCRE'),(361,'0101','010113','TOTORACOCHA'),(362,'0101','010114','YANUNCAY'),(363,'0101','010115','HERMANO MIGUEL'),(364,'0101','010150','CUENCA'),(365,'0101','010151','BAÑOS'),(366,'0101','010152','CUMBE'),(367,'0101','010153','CHAUCHA'),(368,'0101','010154','CHECA (JIDCAY)'),(369,'0101','010155','CHIQUINTAD'),(370,'0101','010156','LLACAO'),(371,'0101','010157','MOLLETURO'),(372,'0101','010158','NULTI'),(373,'0101','010159','OCTAVIO CORDERO PALACIOS (SANTA ROSA)'),(374,'0101','010160','PACCHA'),(375,'0101','010161','QUINGEO'),(376,'0101','010162','RICAURTE'),(377,'0101','010163','SAN JOAQUÍN'),(378,'0101','010164','SANTA ANA'),(379,'0101','010165','SAYAUSÍ'),(380,'0101','010166','SIDCAY'),(381,'0101','010167','SININCAY'),(382,'0101','010168','TARQUI'),(383,'0101','010169','TURI'),(384,'0101','010170','VALLE'),(385,'0101','010171','VICTORIA DEL PORTETE (IRQUIS)'),(386,'0102','010250','GIRÓN'),(387,'0102','010251','ASUNCIÓN'),(388,'0102','010252','SAN GERARDO'),(389,'0103','010350','GUALACEO'),(390,'0103','010351','CHORDELEG'),(391,'0103','010352','DANIEL CÓRDOVA TORAL (EL ORIENTE)'),(392,'0103','010353','JADÁN'),(393,'0103','010354','MARIANO MORENO'),(394,'0103','010355','PRINCIPAL'),(395,'0103','010356','REMIGIO CRESPO TORAL (GÚLAG)'),(396,'0103','010357','SAN JUAN'),(397,'0103','010358','ZHIDMAD'),(398,'0103','010359','LUIS CORDERO VEGA'),(399,'0103','010360','SIMÓN BOLÍVAR (CAB. EN GAÑANZOL)'),(400,'0104','010450','NABÓN'),(401,'0104','010451','COCHAPATA'),(402,'0104','010452','EL PROGRESO (CAB.EN ZHOTA)'),(403,'0104','010453','LAS NIEVES (CHAYA)'),(404,'0104','010454','OÑA'),(405,'0105','010550','PAUTE'),(406,'0105','010551','AMALUZA'),(407,'0105','010552','BULÁN (JOSÉ VÍCTOR IZQUIERDO)'),(408,'0105','010553','CHICÁN (GUILLERMO ORTEGA)'),(409,'0105','010554','EL CABO'),(410,'0105','010555','GUACHAPALA'),(411,'0105','010556','GUARAINAG'),(412,'0105','010557','PALMAS'),(413,'0105','010558','PAN'),(414,'0105','010559','SAN CRISTÓBAL (CARLOS ORDÓÑEZ LAZO)'),(415,'0105','010560','SEVILLA DE ORO'),(416,'0105','010561','TOMEBAMBA'),(417,'0105','010562','DUG DUG'),(418,'0106','010650','PUCARÁ'),(419,'0106','010651','CAMILO PONCE ENRÍQUEZ (CAB. EN RÍO 7 DE MOLLE'),(420,'0106','010652','SAN RAFAEL DE SHARUG'),(421,'0107','010750','SAN FERNANDO'),(422,'0107','010751','CHUMBLÍN'),(423,'0108','010850','SANTA ISABEL (CHAGUARURCO)'),(424,'0108','010851','ABDÓN CALDERÓN (LA UNIÓN)'),(425,'0108','010852','EL CARMEN DE PIJILÍ'),(426,'0108','010853','ZHAGLLI (SHAGLLI)'),(427,'0108','010854','SAN SALVADOR DE CAÑARIBAMBA'),(428,'0109','010950','SIGSIG'),(429,'0109','010951','CUCHIL (CUTCHIL)'),(430,'0109','010952','GIMA'),(431,'0109','010953','GUEL'),(432,'0109','010954','LUDO'),(433,'0109','010955','SAN BARTOLOMÉ'),(434,'0109','010956','SAN JOSÉ DE RARANGA'),(435,'0110','011050','SAN FELIPE DE OÑA CABECERA CANTONAL'),(436,'0110','011051','SUSUDEL'),(437,'0111','011150','CHORDELEG'),(438,'0111','011151','PRINCIPAL'),(439,'0111','011152','LA UNIÓN'),(440,'0111','011153','LUIS GALARZA ORELLANA (CAB.EN DELEGSOL)'),(441,'0111','011154','SAN MARTÍN DE PUZHIO'),(442,'0112','011250','EL PAN'),(443,'0112','011251','AMALUZA'),(444,'0112','011252','PALMAS'),(445,'0112','011253','SAN VICENTE'),(446,'0113','011350','SEVILLA DE ORO'),(447,'0113','011351','AMALUZA'),(448,'0113','011352','PALMAS'),(449,'0114','011450','GUACHAPALA'),(450,'0115','011550','CAMILO PONCE ENRÍQUEZ'),(451,'0115','011551','EL CARMEN DE PIJILÍ'),(452,'0201','020101','ÁNGEL POLIBIO CHÁVES'),(453,'0201','020102','GABRIEL IGNACIO VEINTIMILLA'),(454,'0201','020103','GUANUJO'),(455,'0201','020150','GUARANDA'),(456,'0201','020151','FACUNDO VELA'),(457,'0201','020152','GUANUJO'),(458,'0201','020153','JULIO E. MORENO (CATANAHUÁN GRANDE)'),(459,'0201','020154','LAS NAVES'),(460,'0201','020155','SALINAS'),(461,'0201','020156','SAN LORENZO'),(462,'0201','020157','SAN SIMÓN (YACOTO)'),(463,'0201','020158','SANTA FÉ (SANTA FÉ)'),(464,'0201','020159','SIMIÁTUG'),(465,'0201','020160','SAN LUIS DE PAMBIL'),(466,'0202','020250','CHILLANES'),(467,'0202','020251','SAN JOSÉ DEL TAMBO (TAMBOPAMBA)'),(468,'0203','020350','SAN JOSÉ DE CHIMBO'),(469,'0203','020351','ASUNCIÓN (ASANCOTO)'),(470,'0203','020352','CALUMA'),(471,'0203','020353','MAGDALENA (CHAPACOTO)'),(472,'0203','020354','SAN SEBASTIÁN'),(473,'0203','020355','TELIMBELA'),(474,'0204','020450','ECHEANDÍA'),(475,'0205','020550','SAN MIGUEL'),(476,'0205','020551','BALSAPAMBA'),(477,'0205','020552','BILOVÁN'),(478,'0205','020553','RÉGULO DE MORA'),(479,'0205','020554','SAN PABLO (SAN PABLO DE ATENAS)'),(480,'0205','020555','SANTIAGO'),(481,'0205','020556','SAN VICENTE'),(482,'0206','020650','CALUMA'),(483,'0207','020701','LAS MERCEDES'),(484,'0207','020702','LAS NAVES'),(485,'0207','020750','LAS NAVES'),(486,'0301','030101','AURELIO BAYAS MARTÍNEZ'),(487,'0301','030102','AZOGUES'),(488,'0301','030103','BORRERO'),(489,'0301','030104','SAN FRANCISCO'),(490,'0301','030150','AZOGUES'),(491,'0301','030151','COJITAMBO'),(492,'0301','030152','DÉLEG'),(493,'0301','030153','GUAPÁN'),(494,'0301','030154','JAVIER LOYOLA (CHUQUIPATA)'),(495,'0301','030155','LUIS CORDERO'),(496,'0301','030156','PINDILIG'),(497,'0301','030157','RIVERA'),(498,'0301','030158','SAN MIGUEL'),(499,'0301','030159','SOLANO'),(500,'0301','030160','TADAY'),(501,'0302','030250','BIBLIÁN'),(502,'0302','030251','NAZÓN (CAB. EN PAMPA DE DOMÍNGUEZ)'),(503,'0302','030252','SAN FRANCISCO DE SAGEO'),(504,'0302','030253','TURUPAMBA'),(505,'0302','030254','JERUSALÉN'),(506,'0303','030350','CAÑAR'),(507,'0303','030351','CHONTAMARCA'),(508,'0303','030352','CHOROCOPTE'),(509,'0303','030353','GENERAL MORALES (SOCARTE)'),(510,'0303','030354','GUALLETURO'),(511,'0303','030355','HONORATO VÁSQUEZ (TAMBO VIEJO)'),(512,'0303','030356','INGAPIRCA'),(513,'0303','030357','JUNCAL'),(514,'0303','030358','SAN ANTONIO'),(515,'0303','030359','SUSCAL'),(516,'0303','030360','TAMBO'),(517,'0303','030361','ZHUD'),(518,'0303','030362','VENTURA'),(519,'0303','030363','DUCUR'),(520,'0304','030450','LA TRONCAL'),(521,'0304','030451','MANUEL J. CALLE'),(522,'0304','030452','PANCHO NEGRO'),(523,'0305','030550','EL TAMBO'),(524,'0306','030650','DÉLEG'),(525,'0306','030651','SOLANO'),(526,'0307','030750','SUSCAL'),(527,'0401','040101','GONZÁLEZ SUÁREZ'),(528,'0401','040102','TULCÁN'),(529,'0401','040150','TULCÁN'),(530,'0401','040151','EL CARMELO (EL PUN)'),(531,'0401','040152','HUACA'),(532,'0401','040153','JULIO ANDRADE (OREJUELA)'),(533,'0401','040154','MALDONADO'),(534,'0401','040155','PIOTER'),(535,'0401','040156','TOBAR DONOSO (LA BOCANA DE CAMUMBÍ)'),(536,'0401','040157','TUFIÑO'),(537,'0401','040158','URBINA (TAYA)'),(538,'0401','040159','EL CHICAL'),(539,'0401','040160','MARISCAL SUCRE'),(540,'0401','040161','SANTA MARTHA DE CUBA'),(541,'0402','040250','BOLÍVAR'),(542,'0402','040251','GARCÍA MORENO'),(543,'0402','040252','LOS ANDES'),(544,'0402','040253','MONTE OLIVO'),(545,'0402','040254','SAN VICENTE DE PUSIR'),(546,'0402','040255','SAN RAFAEL'),(547,'0403','040301','EL ÁNGEL'),(548,'0403','040302','27 DE SEPTIEMBRE'),(549,'0403','040350','EL ANGEL'),(550,'0403','040351','EL GOALTAL'),(551,'0403','040352','LA LIBERTAD (ALIZO)'),(552,'0403','040353','SAN ISIDRO'),(553,'0404','040450','MIRA (CHONTAHUASI)'),(554,'0404','040451','CONCEPCIÓN'),(555,'0404','040452','JIJÓN Y CAAMAÑO (CAB. EN RÍO BLANCO)'),(556,'0404','040453','JUAN MONTALVO (SAN IGNACIO DE QUIL)'),(557,'0405','040501','GONZÁLEZ SUÁREZ'),(558,'0405','040502','SAN JOSÉ'),(559,'0405','040550','SAN GABRIEL'),(560,'0405','040551','CRISTÓBAL COLÓN'),(561,'0405','040552','CHITÁN DE NAVARRETE'),(562,'0405','040553','FERNÁNDEZ SALVADOR'),(563,'0405','040554','LA PAZ'),(564,'0405','040555','PIARTAL'),(565,'0406','040650','HUACA'),(566,'0406','040651','MARISCAL SUCRE'),(567,'0501','050101','ELOY ALFARO (SAN FELIPE)'),(568,'0501','050102','IGNACIO FLORES (PARQUE FLORES)'),(569,'0501','050103','JUAN MONTALVO (SAN SEBASTIÁN)'),(570,'0501','050104','LA MATRIZ'),(571,'0501','050105','SAN BUENAVENTURA'),(572,'0501','050150','LATACUNGA'),(573,'0501','050151','ALAQUES (ALÁQUEZ)'),(574,'0501','050152','BELISARIO QUEVEDO (GUANAILÍN)'),(575,'0501','050153','GUAITACAMA (GUAYTACAMA)'),(576,'0501','050154','JOSEGUANGO BAJO'),(577,'0501','050155','LAS PAMPAS'),(578,'0501','050156','MULALÓ'),(579,'0501','050157','11 DE NOVIEMBRE (ILINCHISI)'),(580,'0501','050158','POALÓ'),(581,'0501','050159','SAN JUAN DE PASTOCALLE'),(582,'0501','050160','SIGCHOS'),(583,'0501','050161','TANICUCHÍ'),(584,'0501','050162','TOACASO'),(585,'0501','050163','PALO QUEMADO'),(586,'0502','050201','EL CARMEN'),(587,'0502','050202','LA MANÁ'),(588,'0502','050203','EL TRIUNFO'),(589,'0502','050250','LA MANÁ'),(590,'0502','050251','GUASAGANDA (CAB.EN GUASAGANDA'),(591,'0502','050252','PUCAYACU'),(592,'0503','050350','EL CORAZÓN'),(593,'0503','050351','MORASPUNGO'),(594,'0503','050352','PINLLOPATA'),(595,'0503','050353','RAMÓN CAMPAÑA'),(596,'0504','050450','PUJILÍ'),(597,'0504','050451','ANGAMARCA'),(598,'0504','050452','CHUCCHILÁN (CHUGCHILÁN)'),(599,'0504','050453','GUANGAJE'),(600,'0504','050454','ISINLIBÍ (ISINLIVÍ)'),(601,'0504','050455','LA VICTORIA'),(602,'0504','050456','PILALÓ'),(603,'0504','050457','TINGO'),(604,'0504','050458','ZUMBAHUA'),(605,'0505','050550','SAN MIGUEL'),(606,'0505','050551','ANTONIO JOSÉ HOLGUÍN (SANTA LUCÍA)'),(607,'0505','050552','CUSUBAMBA'),(608,'0505','050553','MULALILLO'),(609,'0505','050554','MULLIQUINDIL (SANTA ANA)'),(610,'0505','050555','PANSALEO'),(611,'0506','050650','SAQUISILÍ'),(612,'0506','050651','CANCHAGUA'),(613,'0506','050652','CHANTILÍN'),(614,'0506','050653','COCHAPAMBA'),(615,'0507','050750','SIGCHOS'),(616,'0507','050751','CHUGCHILLÁN'),(617,'0507','050752','ISINLIVÍ'),(618,'0507','050753','LAS PAMPAS'),(619,'0507','050754','PALO QUEMADO'),(620,'0601','060101','LIZARZABURU'),(621,'0601','060102','MALDONADO'),(622,'0601','060103','VELASCO'),(623,'0601','060104','VELOZ'),(624,'0601','060105','YARUQUÍES'),(625,'0601','060150','RIOBAMBA'),(626,'0601','060151','CACHA (CAB. EN MACHÁNGARA)'),(627,'0601','060152','CALPI'),(628,'0601','060153','CUBIJÍES'),(629,'0601','060154','FLORES'),(630,'0601','060155','LICÁN'),(631,'0601','060156','LICTO'),(632,'0601','060157','PUNGALÁ'),(633,'0601','060158','PUNÍN'),(634,'0601','060159','QUIMIAG'),(635,'0601','060160','SAN JUAN'),(636,'0601','060161','SAN LUIS'),(637,'0602','060250','ALAUSÍ'),(638,'0602','060251','ACHUPALLAS'),(639,'0602','060252','CUMANDÁ'),(640,'0602','060253','GUASUNTOS'),(641,'0602','060254','HUIGRA'),(642,'0602','060255','MULTITUD'),(643,'0602','060256','PISTISHÍ (NARIZ DEL DIABLO)'),(644,'0602','060257','PUMALLACTA'),(645,'0602','060258','SEVILLA'),(646,'0602','060259','SIBAMBE'),(647,'0602','060260','TIXÁN'),(648,'0603','060301','CAJABAMBA'),(649,'0603','060302','SICALPA'),(650,'0603','060350','VILLA LA UNIÓN (CAJABAMBA)'),(651,'0603','060351','CAÑI'),(652,'0603','060352','COLUMBE'),(653,'0603','060353','JUAN DE VELASCO (PANGOR)'),(654,'0603','060354','SANTIAGO DE QUITO (CAB. EN SAN ANTONIO DE QUI'),(655,'0604','060450','CHAMBO'),(656,'0605','060550','CHUNCHI'),(657,'0605','060551','CAPZOL'),(658,'0605','060552','COMPUD'),(659,'0605','060553','GONZOL'),(660,'0605','060554','LLAGOS'),(661,'0606','060650','GUAMOTE'),(662,'0606','060651','CEBADAS'),(663,'0606','060652','PALMIRA'),(664,'0607','060701','EL ROSARIO'),(665,'0607','060702','LA MATRIZ'),(666,'0607','060750','GUANO'),(667,'0607','060751','GUANANDO'),(668,'0607','060752','ILAPO'),(669,'0607','060753','LA PROVIDENCIA'),(670,'0607','060754','SAN ANDRÉS'),(671,'0607','060755','SAN GERARDO DE PACAICAGUÁN'),(672,'0607','060756','SAN ISIDRO DE PATULÚ'),(673,'0607','060757','SAN JOSÉ DEL CHAZO'),(674,'0607','060758','SANTA FÉ DE GALÁN'),(675,'0607','060759','VALPARAÍSO'),(676,'0608','060850','PALLATANGA'),(677,'0609','060950','PENIPE'),(678,'0609','060951','EL ALTAR'),(679,'0609','060952','MATUS'),(680,'0609','060953','PUELA'),(681,'0609','060954','SAN ANTONIO DE BAYUSHIG'),(682,'0609','060955','LA CANDELARIA'),(683,'0609','060956','BILBAO (CAB.EN QUILLUYACU)'),(684,'0610','061050','CUMANDÁ'),(685,'0701','070101','LA PROVIDENCIA'),(686,'0701','070102','MACHALA'),(687,'0701','070103','PUERTO BOLÍVAR'),(688,'0701','070104','NUEVE DE MAYO'),(689,'0701','070105','EL CAMBIO'),(690,'0701','070150','MACHALA'),(691,'0701','070151','EL CAMBIO'),(692,'0701','070152','EL RETIRO'),(693,'0702','070250','ARENILLAS'),(694,'0702','070251','CHACRAS'),(695,'0702','070252','LA LIBERTAD'),(696,'0702','070253','LAS LAJAS (CAB. EN LA VICTORIA)'),(697,'0702','070254','PALMALES'),(698,'0702','070255','CARCABÓN'),(699,'0703','070350','PACCHA'),(700,'0703','070351','AYAPAMBA'),(701,'0703','070352','CORDONCILLO'),(702,'0703','070353','MILAGRO'),(703,'0703','070354','SAN JOSÉ'),(704,'0703','070355','SAN JUAN DE CERRO AZUL'),(705,'0704','070450','BALSAS'),(706,'0704','070451','BELLAMARÍA'),(707,'0705','070550','CHILLA'),(708,'0706','070650','EL GUABO'),(709,'0706','070651','BARBONES (SUCRE)'),(710,'0706','070652','LA IBERIA'),(711,'0706','070653','TENDALES (CAB.EN PUERTO TENDALES)'),(712,'0706','070654','RÍO BONITO'),(713,'0707','070701','ECUADOR'),(714,'0707','070702','EL PARAÍSO'),(715,'0707','070703','HUALTACO'),(716,'0707','070704','MILTON REYES'),(717,'0707','070705','UNIÓN LOJANA'),(718,'0707','070750','HUAQUILLAS'),(719,'0708','070850','MARCABELÍ'),(720,'0708','070851','EL INGENIO'),(721,'0709','070901','BOLÍVAR'),(722,'0709','070902','LOMA DE FRANCO'),(723,'0709','070903','OCHOA LEÓN (MATRIZ)'),(724,'0709','070904','TRES CERRITOS'),(725,'0709','070950','PASAJE'),(726,'0709','070951','BUENAVISTA'),(727,'0709','070952','CASACAY'),(728,'0709','070953','LA PEAÑA'),(729,'0709','070954','PROGRESO'),(730,'0709','070955','UZHCURRUMI'),(731,'0709','070956','CAÑAQUEMADA'),(732,'0710','071001','LA MATRIZ'),(733,'0710','071002','LA SUSAYA'),(734,'0710','071003','PIÑAS GRANDE'),(735,'0710','071050','PIÑAS'),(736,'0710','071051','CAPIRO (CAB. EN LA CAPILLA DE CAPIRO)'),(737,'0710','071052','LA BOCANA'),(738,'0710','071053','MOROMORO (CAB. EN EL VADO)'),(739,'0710','071054','PIEDRAS'),(740,'0710','071055','SAN ROQUE (AMBROSIO MALDONADO)'),(741,'0710','071056','SARACAY'),(742,'0711','071150','PORTOVELO'),(743,'0711','071151','CURTINCAPA'),(744,'0711','071152','MORALES'),(745,'0711','071153','SALATÍ'),(746,'0712','071201','SANTA ROSA'),(747,'0712','071202','PUERTO JELÍ'),(748,'0712','071203','BALNEARIO JAMBELÍ (SATÉLITE)'),(749,'0712','071204','JUMÓN (SATÉLITE)'),(750,'0712','071205','NUEVO SANTA ROSA'),(751,'0712','071250','SANTA ROSA'),(752,'0712','071251','BELLAVISTA'),(753,'0712','071252','JAMBELÍ'),(754,'0712','071253','LA AVANZADA'),(755,'0712','071254','SAN ANTONIO'),(756,'0712','071255','TORATA'),(757,'0712','071256','VICTORIA'),(758,'0712','071257','BELLAMARÍA'),(759,'0713','071350','ZARUMA'),(760,'0713','071351','ABAÑÍN'),(761,'0713','071352','ARCAPAMBA'),(762,'0713','071353','GUANAZÁN'),(763,'0713','071354','GUIZHAGUIÑA'),(764,'0713','071355','HUERTAS'),(765,'0713','071356','MALVAS'),(766,'0713','071357','MULUNCAY GRANDE'),(767,'0713','071358','SINSAO'),(768,'0713','071359','SALVIAS'),(769,'0714','071401','LA VICTORIA'),(770,'0714','071402','PLATANILLOS'),(771,'0714','071403','VALLE HERMOSO'),(772,'0714','071450','LA VICTORIA'),(773,'0714','071451','LA LIBERTAD'),(774,'0714','071452','EL PARAÍSO'),(775,'0714','071453','SAN ISIDRO'),(776,'0801','080101','BARTOLOMÉ RUIZ (CÉSAR FRANCO CARRIÓN)'),(777,'0801','080102','5 DE AGOSTO'),(778,'0801','080103','ESMERALDAS'),(779,'0801','080104','LUIS TELLO (LAS PALMAS)'),(780,'0801','080105','SIMÓN PLATA TORRES'),(781,'0801','080150','ESMERALDAS'),(782,'0801','080151','ATACAMES'),(783,'0801','080152','CAMARONES (CAB. EN SAN VICENTE)'),(784,'0801','080153','CRNEL. CARLOS CONCHA TORRES (CAB.EN HUELE)'),(785,'0801','080154','CHINCA'),(786,'0801','080155','CHONTADURO'),(787,'0801','080156','CHUMUNDÉ'),(788,'0801','080157','LAGARTO'),(789,'0801','080158','LA UNIÓN'),(790,'0801','080159','MAJUA'),(791,'0801','080160','MONTALVO (CAB. EN HORQUETA)'),(792,'0801','080161','RÍO VERDE'),(793,'0801','080162','ROCAFUERTE'),(794,'0801','080163','SAN MATEO'),(795,'0801','080164','SÚA (CAB. EN LA BOCANA)'),(796,'0801','080165','TABIAZO'),(797,'0801','080166','TACHINA'),(798,'0801','080167','TONCHIGÜE'),(799,'0801','080168','VUELTA LARGA'),(800,'0802','080250','VALDEZ (LIMONES)'),(801,'0802','080251','ANCHAYACU'),(802,'0802','080252','ATAHUALPA (CAB. EN CAMARONES)'),(803,'0802','080253','BORBÓN'),(804,'0802','080254','LA TOLA'),(805,'0802','080255','LUIS VARGAS TORRES (CAB. EN PLAYA DE ORO)'),(806,'0802','080256','MALDONADO'),(807,'0802','080257','PAMPANAL DE BOLÍVAR'),(808,'0802','080258','SAN FRANCISCO DE ONZOLE'),(809,'0802','080259','SANTO DOMINGO DE ONZOLE'),(810,'0802','080260','SELVA ALEGRE'),(811,'0802','080261','TELEMBÍ'),(812,'0802','080262','COLÓN ELOY DEL MARÍA'),(813,'0802','080263','SAN JOSÉ DE CAYAPAS'),(814,'0802','080264','TIMBIRÉ'),(815,'0803','080350','MUISNE'),(816,'0803','080351','BOLÍVAR'),(817,'0803','080352','DAULE'),(818,'0803','080353','GALERA'),(819,'0803','080354','QUINGUE (OLMEDO PERDOMO FRANCO)'),(820,'0803','080355','SALIMA'),(821,'0803','080356','SAN FRANCISCO'),(822,'0803','080357','SAN GREGORIO'),(823,'0803','080358','SAN JOSÉ DE CHAMANGA (CAB.EN CHAMANGA)'),(824,'0804','080450','ROSA ZÁRATE (QUININDÉ)'),(825,'0804','080451','CUBE'),(826,'0804','080452','CHURA (CHANCAMA) (CAB. EN EL YERBERO)'),(827,'0804','080453','MALIMPIA'),(828,'0804','080454','VICHE'),(829,'0804','080455','LA UNIÓN'),(830,'0805','080550','SAN LORENZO'),(831,'0805','080551','ALTO TAMBO (CAB. EN GUADUAL)'),(832,'0805','080552','ANCÓN (PICHANGAL) (CAB. EN PALMA REAL)'),(833,'0805','080553','CALDERÓN'),(834,'0805','080554','CARONDELET'),(835,'0805','080555','5 DE JUNIO (CAB. EN UIMBI)'),(836,'0805','080556','CONCEPCIÓN'),(837,'0805','080557','MATAJE (CAB. EN SANTANDER)'),(838,'0805','080558','SAN JAVIER DE CACHAVÍ (CAB. EN SAN JAVIER)'),(839,'0805','080559','SANTA RITA'),(840,'0805','080560','TAMBILLO'),(841,'0805','080561','TULULBÍ (CAB. EN RICAURTE)'),(842,'0805','080562','URBINA'),(843,'0806','080650','ATACAMES'),(844,'0806','080651','LA UNIÓN'),(845,'0806','080652','SÚA (CAB. EN LA BOCANA)'),(846,'0806','080653','TONCHIGÜE'),(847,'0806','080654','TONSUPA'),(848,'0807','080750','RIOVERDE'),(849,'0807','080751','CHONTADURO'),(850,'0807','080752','CHUMUNDÉ'),(851,'0807','080753','LAGARTO'),(852,'0807','080754','MONTALVO (CAB. EN HORQUETA)'),(853,'0807','080755','ROCAFUERTE'),(854,'0808','080850','LA CONCORDIA'),(855,'0808','080851','MONTERREY'),(856,'0808','080852','LA VILLEGAS'),(857,'0808','080853','PLAN PILOTO'),(858,'0901','090101','AYACUCHO'),(859,'0901','090102','BOLÍVAR (SAGRARIO)'),(860,'0901','090103','CARBO (CONCEPCIÓN)'),(861,'0901','090104','FEBRES CORDERO'),(862,'0901','090105','GARCÍA MORENO'),(863,'0901','090106','LETAMENDI'),(864,'0901','090107','NUEVE DE OCTUBRE'),(865,'0901','090108','OLMEDO (SAN ALEJO)'),(866,'0901','090109','ROCA'),(867,'0901','090110','ROCAFUERTE'),(868,'0901','090111','SUCRE'),(869,'0901','090112','TARQUI'),(870,'0901','090113','URDANETA'),(871,'0901','090114','XIMENA'),(872,'0901','090115','PASCUALES'),(873,'0901','090150','GUAYAQUIL'),(874,'0901','090151','CHONGÓN'),(875,'0901','090152','JUAN GÓMEZ RENDÓN (PROGRESO)'),(876,'0901','090153','MORRO'),(877,'0901','090154','PASCUALES'),(878,'0901','090155','PLAYAS (GRAL. VILLAMIL)'),(879,'0901','090156','POSORJA'),(880,'0901','090157','PUNÁ'),(881,'0901','090158','TENGUEL'),(882,'0902','090250','ALFREDO BAQUERIZO MORENO (JUJÁN)'),(883,'0903','090350','BALAO'),(884,'0904','090450','BALZAR'),(885,'0905','090550','COLIMES'),(886,'0905','090551','SAN JACINTO'),(887,'0906','090601','DAULE'),(888,'0906','090602','LA AURORA (SATÉLITE)'),(889,'0906','090603','BANIFE'),(890,'0906','090604','EMILIANO CAICEDO MARCOS'),(891,'0906','090605','MAGRO'),(892,'0906','090606','PADRE JUAN BAUTISTA AGUIRRE'),(893,'0906','090607','SANTA CLARA'),(894,'0906','090608','VICENTE PIEDRAHITA'),(895,'0906','090650','DAULE'),(896,'0906','090651','ISIDRO AYORA (SOLEDAD)'),(897,'0906','090652','JUAN BAUTISTA AGUIRRE (LOS TINTOS)'),(898,'0906','090653','LAUREL'),(899,'0906','090654','LIMONAL'),(900,'0906','090655','LOMAS DE SARGENTILLO'),(901,'0906','090656','LOS LOJAS (ENRIQUE BAQUERIZO MORENO)'),(902,'0906','090657','PIEDRAHITA (NOBOL)'),(903,'0907','090701','ELOY ALFARO (DURÁN)'),(904,'0907','090702','EL RECREO'),(905,'0907','090750','ELOY ALFARO (DURÁN)'),(906,'0908','090850','VELASCO IBARRA (EL EMPALME)'),(907,'0908','090851','GUAYAS (PUEBLO NUEVO)'),(908,'0908','090852','EL ROSARIO'),(909,'0909','090950','EL TRIUNFO'),(910,'0910','091050','MILAGRO'),(911,'0910','091051','CHOBO'),(912,'0910','091052','GENERAL ELIZALDE (BUCAY)'),(913,'0910','091053','MARISCAL SUCRE (HUAQUES)'),(914,'0910','091054','ROBERTO ASTUDILLO (CAB. EN CRUCE DE VENECIA)'),(915,'0911','091150','NARANJAL'),(916,'0911','091151','JESÚS MARÍA'),(917,'0911','091152','SAN CARLOS'),(918,'0911','091153','SANTA ROSA DE FLANDES'),(919,'0911','091154','TAURA'),(920,'0912','091250','NARANJITO'),(921,'0913','091350','PALESTINA'),(922,'0914','091450','PEDRO CARBO'),(923,'0914','091451','VALLE DE LA VIRGEN'),(924,'0914','091452','SABANILLA'),(925,'0916','091601','SAMBORONDÓN'),(926,'0916','091602','LA PUNTILLA (SATÉLITE)'),(927,'0916','091650','SAMBORONDÓN'),(928,'0916','091651','TARIFA'),(929,'0918','091850','SANTA LUCÍA'),(930,'0919','091901','BOCANA'),(931,'0919','091902','CANDILEJOS'),(932,'0919','091903','CENTRAL'),(933,'0919','091904','PARAÍSO'),(934,'0919','091905','SAN MATEO'),(935,'0919','091950','EL SALITRE (LAS RAMAS)'),(936,'0919','091951','GRAL. VERNAZA (DOS ESTEROS)'),(937,'0919','091952','LA VICTORIA (ÑAUZA)'),(938,'0919','091953','JUNQUILLAL'),(939,'0920','092050','SAN JACINTO DE YAGUACHI'),(940,'0920','092051','CRNEL. LORENZO DE GARAICOA (PEDREGAL)'),(941,'0920','092052','CRNEL. MARCELINO MARIDUEÑA (SAN CARLOS)'),(942,'0920','092053','GRAL. PEDRO J. MONTERO (BOLICHE)'),(943,'0920','092054','SIMÓN BOLÍVAR'),(944,'0920','092055','YAGUACHI VIEJO (CONE)'),(945,'0920','092056','VIRGEN DE FÁTIMA'),(946,'0921','092150','GENERAL VILLAMIL (PLAYAS)'),(947,'0922','092250','SIMÓN BOLÍVAR'),(948,'0922','092251','CRNEL.LORENZO DE GARAICOA (PEDREGAL)'),(949,'0923','092350','CORONEL MARCELINO MARIDUEÑA (SAN CARLOS)'),(950,'0924','092450','LOMAS DE SARGENTILLO'),(951,'0924','092451','ISIDRO AYORA (SOLEDAD)'),(952,'0925','092550','NARCISA DE JESÚS'),(953,'0927','092750','GENERAL ANTONIO ELIZALDE (BUCAY)'),(954,'0928','092850','ISIDRO AYORA'),(955,'1001','100101','CARANQUI'),(956,'1001','100102','GUAYAQUIL DE ALPACHACA'),(957,'1001','100103','SAGRARIO'),(958,'1001','100104','SAN FRANCISCO'),(959,'1001','100105','LA DOLOROSA DEL PRIORATO'),(960,'1001','100150','SAN MIGUEL DE IBARRA'),(961,'1001','100151','AMBUQUÍ'),(962,'1001','100152','ANGOCHAGUA'),(963,'1001','100153','CAROLINA'),(964,'1001','100154','LA ESPERANZA'),(965,'1001','100155','LITA'),(966,'1001','100156','SALINAS'),(967,'1001','100157','SAN ANTONIO'),(968,'1002','100201','ANDRADE MARÍN (LOURDES)'),(969,'1002','100202','ATUNTAQUI'),(970,'1002','100250','ATUNTAQUI'),(971,'1002','100251','IMBAYA (SAN LUIS DE COBUENDO)'),(972,'1002','100252','SAN FRANCISCO DE NATABUELA'),(973,'1002','100253','SAN JOSÉ DE CHALTURA'),(974,'1002','100254','SAN ROQUE'),(975,'1003','100301','SAGRARIO'),(976,'1003','100302','SAN FRANCISCO'),(977,'1003','100350','COTACACHI'),(978,'1003','100351','APUELA'),(979,'1003','100352','GARCÍA MORENO (LLURIMAGUA)'),(980,'1003','100353','IMANTAG'),(981,'1003','100354','PEÑAHERRERA'),(982,'1003','100355','PLAZA GUTIÉRREZ (CALVARIO)'),(983,'1003','100356','QUIROGA'),(984,'1003','100357','6 DE JULIO DE CUELLAJE (CAB. EN CUELLAJE)'),(985,'1003','100358','VACAS GALINDO (EL CHURO) (CAB.EN SAN MIGUEL A'),(986,'1004','100401','JORDÁN'),(987,'1004','100402','SAN LUIS'),(988,'1004','100450','OTAVALO'),(989,'1004','100451','DR. MIGUEL EGAS CABEZAS (PEGUCHE)'),(990,'1004','100452','EUGENIO ESPEJO (CALPAQUÍ)'),(991,'1004','100453','GONZÁLEZ SUÁREZ'),(992,'1004','100454','PATAQUÍ'),(993,'1004','100455','SAN JOSÉ DE QUICHINCHE'),(994,'1004','100456','SAN JUAN DE ILUMÁN'),(995,'1004','100457','SAN PABLO'),(996,'1004','100458','SAN RAFAEL'),(997,'1004','100459','SELVA ALEGRE (CAB.EN SAN MIGUEL DE PAMPLONA)'),(998,'1005','100550','PIMAMPIRO'),(999,'1005','100551','CHUGÁ'),(1000,'1005','100552','MARIANO ACOSTA'),(1001,'1005','100553','SAN FRANCISCO DE SIGSIPAMBA'),(1002,'1006','100650','URCUQUÍ CABECERA CANTONAL'),(1003,'1006','100651','CAHUASQUÍ'),(1004,'1006','100652','LA MERCED DE BUENOS AIRES'),(1005,'1006','100653','PABLO ARENAS'),(1006,'1006','100654','SAN BLAS'),(1007,'1006','100655','TUMBABIRO'),(1008,'1101','110101','EL SAGRARIO'),(1009,'1101','110102','SAN SEBASTIÁN'),(1010,'1101','110103','SUCRE'),(1011,'1101','110104','VALLE'),(1012,'1101','110150','LOJA'),(1013,'1101','110151','CHANTACO'),(1014,'1101','110152','CHUQUIRIBAMBA'),(1015,'1101','110153','EL CISNE'),(1016,'1101','110154','GUALEL'),(1017,'1101','110155','JIMBILLA'),(1018,'1101','110156','MALACATOS (VALLADOLID)'),(1019,'1101','110157','SAN LUCAS'),(1020,'1101','110158','SAN PEDRO DE VILCABAMBA'),(1021,'1101','110159','SANTIAGO'),(1022,'1101','110160','TAQUIL (MIGUEL RIOFRÍO)'),(1023,'1101','110161','VILCABAMBA (VICTORIA)'),(1024,'1101','110162','YANGANA (ARSENIO CASTILLO)'),(1025,'1101','110163','QUINARA'),(1026,'1102','110201','CARIAMANGA'),(1027,'1102','110202','CHILE'),(1028,'1102','110203','SAN VICENTE'),(1029,'1102','110250','CARIAMANGA'),(1030,'1102','110251','COLAISACA'),(1031,'1102','110252','EL LUCERO'),(1032,'1102','110253','UTUANA'),(1033,'1102','110254','SANGUILLÍN'),(1034,'1103','110301','CATAMAYO'),(1035,'1103','110302','SAN JOSÉ'),(1036,'1103','110350','CATAMAYO (LA TOMA)'),(1037,'1103','110351','EL TAMBO'),(1038,'1103','110352','GUAYQUICHUMA'),(1039,'1103','110353','SAN PEDRO DE LA BENDITA'),(1040,'1103','110354','ZAMBI'),(1041,'1104','110450','CELICA'),(1042,'1104','110451','CRUZPAMBA (CAB. EN CARLOS BUSTAMANTE)'),(1043,'1104','110452','CHAQUINAL'),(1044,'1104','110453','12 DE DICIEMBRE (CAB. EN ACHIOTES)'),(1045,'1104','110454','PINDAL (FEDERICO PÁEZ)'),(1046,'1104','110455','POZUL (SAN JUAN DE POZUL)'),(1047,'1104','110456','SABANILLA'),(1048,'1104','110457','TNTE. MAXIMILIANO RODRÍGUEZ LOAIZA'),(1049,'1105','110550','CHAGUARPAMBA'),(1050,'1105','110551','BUENAVISTA'),(1051,'1105','110552','EL ROSARIO'),(1052,'1105','110553','SANTA RUFINA'),(1053,'1105','110554','AMARILLOS'),(1054,'1106','110650','AMALUZA'),(1055,'1106','110651','BELLAVISTA'),(1056,'1106','110652','JIMBURA'),(1057,'1106','110653','SANTA TERESITA'),(1058,'1106','110654','27 DE ABRIL (CAB. EN LA NARANJA)'),(1059,'1106','110655','EL INGENIO'),(1060,'1106','110656','EL AIRO'),(1061,'1107','110750','GONZANAMÁ'),(1062,'1107','110751','CHANGAIMINA (LA LIBERTAD)'),(1063,'1107','110752','FUNDOCHAMBA'),(1064,'1107','110753','NAMBACOLA'),(1065,'1107','110754','PURUNUMA (EGUIGUREN)'),(1066,'1107','110755','QUILANGA (LA PAZ)'),(1067,'1107','110756','SACAPALCA'),(1068,'1107','110757','SAN ANTONIO DE LAS ARADAS (CAB. EN LAS ARADAS'),(1069,'1108','110801','GENERAL ELOY ALFARO (SAN SEBASTIÁN)'),(1070,'1108','110802','MACARÁ (MANUEL ENRIQUE RENGEL SUQUILANDA)'),(1071,'1108','110850','MACARÁ'),(1072,'1108','110851','LARAMA'),(1073,'1108','110852','LA VICTORIA'),(1074,'1108','110853','SABIANGO (LA CAPILLA)'),(1075,'1109','110901','CATACOCHA'),(1076,'1109','110902','LOURDES'),(1077,'1109','110950','CATACOCHA'),(1078,'1109','110951','CANGONAMÁ'),(1079,'1109','110952','GUACHANAMÁ'),(1080,'1109','110953','LA TINGUE'),(1081,'1109','110954','LAURO GUERRERO'),(1082,'1109','110955','OLMEDO (SANTA BÁRBARA)'),(1083,'1109','110956','ORIANGA'),(1084,'1109','110957','SAN ANTONIO'),(1085,'1109','110958','CASANGA'),(1086,'1109','110959','YAMANA'),(1087,'1110','111050','ALAMOR'),(1088,'1110','111051','CIANO'),(1089,'1110','111052','EL ARENAL'),(1090,'1110','111053','EL LIMO (MARIANA DE JESÚS)'),(1091,'1110','111054','MERCADILLO'),(1092,'1110','111055','VICENTINO'),(1093,'1111','111150','SARAGURO'),(1094,'1111','111151','EL PARAÍSO DE CELÉN'),(1095,'1111','111152','EL TABLÓN'),(1096,'1111','111153','LLUZHAPA'),(1097,'1111','111154','MANÚ'),(1098,'1111','111155','SAN ANTONIO DE QUMBE (CUMBE)'),(1099,'1111','111156','SAN PABLO DE TENTA'),(1100,'1111','111157','SAN SEBASTIÁN DE YÚLUC'),(1101,'1111','111158','SELVA ALEGRE'),(1102,'1111','111159','URDANETA (PAQUISHAPA)'),(1103,'1111','111160','SUMAYPAMBA'),(1104,'1112','111250','SOZORANGA'),(1105,'1112','111251','NUEVA FÁTIMA'),(1106,'1112','111252','TACAMOROS'),(1107,'1113','111350','ZAPOTILLO'),(1108,'1113','111351','MANGAHURCO (CAZADEROS)'),(1109,'1113','111352','GARZAREAL'),(1110,'1113','111353','LIMONES'),(1111,'1113','111354','PALETILLAS'),(1112,'1113','111355','BOLASPAMBA'),(1113,'1114','111450','PINDAL'),(1114,'1114','111451','CHAQUINAL'),(1115,'1114','111452','12 DE DICIEMBRE (CAB.EN ACHIOTES)'),(1116,'1114','111453','MILAGROS'),(1117,'1115','111550','QUILANGA'),(1118,'1115','111551','FUNDOCHAMBA'),(1119,'1115','111552','SAN ANTONIO DE LAS ARADAS (CAB. EN LAS ARADAS'),(1120,'1116','111650','OLMEDO'),(1121,'1116','111651','LA TINGUE'),(1122,'1201','120101','CLEMENTE BAQUERIZO'),(1123,'1201','120102','DR. CAMILO PONCE'),(1124,'1201','120103','BARREIRO'),(1125,'1201','120104','EL SALTO'),(1126,'1201','120150','BABAHOYO'),(1127,'1201','120151','BARREIRO (SANTA RITA)'),(1128,'1201','120152','CARACOL'),(1129,'1201','120153','FEBRES CORDERO (LAS JUNTAS)'),(1130,'1201','120154','PIMOCHA'),(1131,'1201','120155','LA UNIÓN'),(1132,'1202','120250','BABA'),(1133,'1202','120251','GUARE'),(1134,'1202','120252','ISLA DE BEJUCAL'),(1135,'1203','120350','MONTALVO'),(1136,'1204','120450','PUEBLOVIEJO'),(1137,'1204','120451','PUERTO PECHICHE'),(1138,'1204','120452','SAN JUAN'),(1139,'1205','120501','QUEVEDO'),(1140,'1205','120502','SAN CAMILO'),(1141,'1205','120503','SAN JOSÉ'),(1142,'1205','120504','GUAYACÁN'),(1143,'1205','120505','NICOLÁS INFANTE DÍAZ'),(1144,'1205','120506','SAN CRISTÓBAL'),(1145,'1205','120507','SIETE DE OCTUBRE'),(1146,'1205','120508','24 DE MAYO'),(1147,'1205','120509','VENUS DEL RÍO QUEVEDO'),(1148,'1205','120510','VIVA ALFARO'),(1149,'1205','120550','QUEVEDO'),(1150,'1205','120551','BUENA FÉ'),(1151,'1205','120552','MOCACHE'),(1152,'1205','120553','SAN CARLOS'),(1153,'1205','120554','VALENCIA'),(1154,'1205','120555','LA ESPERANZA'),(1155,'1206','120650','CATARAMA'),(1156,'1206','120651','RICAURTE'),(1157,'1207','120701','10 DE NOVIEMBRE'),(1158,'1207','120750','VENTANAS'),(1159,'1207','120751','QUINSALOMA'),(1160,'1207','120752','ZAPOTAL'),(1161,'1207','120753','CHACARITA'),(1162,'1207','120754','LOS ÁNGELES'),(1163,'1208','120850','VINCES'),(1164,'1208','120851','ANTONIO SOTOMAYOR (CAB. EN PLAYAS DE VINCES)'),(1165,'1208','120852','PALENQUE'),(1166,'1209','120950','PALENQUE'),(1167,'1210','121001','SAN JACINTO DE BUENA FÉ'),(1168,'1210','121002','7 DE AGOSTO'),(1169,'1210','121003','11 DE OCTUBRE'),(1170,'1210','121050','SAN JACINTO DE BUENA FÉ'),(1171,'1210','121051','PATRICIA PILAR'),(1172,'1211','121150','VALENCIA'),(1173,'1212','121250','MOCACHE'),(1174,'1213','121350','QUINSALOMA'),(1175,'1301','130101','PORTOVIEJO'),(1176,'1301','130102','12 DE MARZO'),(1177,'1301','130103','COLÓN'),(1178,'1301','130104','PICOAZÁ'),(1179,'1301','130105','SAN PABLO'),(1180,'1301','130106','ANDRÉS DE VERA'),(1181,'1301','130107','FRANCISCO PACHECO'),(1182,'1301','130108','18 DE OCTUBRE'),(1183,'1301','130109','SIMÓN BOLÍVAR'),(1184,'1301','130150','PORTOVIEJO'),(1185,'1301','130151','ABDÓN CALDERÓN (SAN FRANCISCO)'),(1186,'1301','130152','ALHAJUELA (BAJO GRANDE)'),(1187,'1301','130153','CRUCITA'),(1188,'1301','130154','PUEBLO NUEVO'),(1189,'1301','130155','RIOCHICO (RÍO CHICO)'),(1190,'1301','130156','SAN PLÁCIDO'),(1191,'1301','130157','CHIRIJOS'),(1192,'1302','130250','CALCETA'),(1193,'1302','130251','MEMBRILLO'),(1194,'1302','130252','QUIROGA'),(1195,'1303','130301','CHONE'),(1196,'1303','130302','SANTA RITA'),(1197,'1303','130350','CHONE'),(1198,'1303','130351','BOYACÁ'),(1199,'1303','130352','CANUTO'),(1200,'1303','130353','CONVENTO'),(1201,'1303','130354','CHIBUNGA'),(1202,'1303','130355','ELOY ALFARO'),(1203,'1303','130356','RICAURTE'),(1204,'1303','130357','SAN ANTONIO'),(1205,'1304','130401','EL CARMEN'),(1206,'1304','130402','4 DE DICIEMBRE'),(1207,'1304','130450','EL CARMEN'),(1208,'1304','130451','WILFRIDO LOOR MOREIRA (MAICITO)'),(1209,'1304','130452','SAN PEDRO DE SUMA'),(1210,'1305','130550','FLAVIO ALFARO'),(1211,'1305','130551','SAN FRANCISCO DE NOVILLO (CAB. EN'),(1212,'1305','130552','ZAPALLO'),(1213,'1306','130601','DR. MIGUEL MORÁN LUCIO'),(1214,'1306','130602','MANUEL INOCENCIO PARRALES Y GUALE'),(1215,'1306','130603','SAN LORENZO DE JIPIJAPA'),(1216,'1306','130650','JIPIJAPA'),(1217,'1306','130651','AMÉRICA'),(1218,'1306','130652','EL ANEGADO (CAB. EN ELOY ALFARO)'),(1219,'1306','130653','JULCUY'),(1220,'1306','130654','LA UNIÓN'),(1221,'1306','130655','MACHALILLA'),(1222,'1306','130656','MEMBRILLAL'),(1223,'1306','130657','PEDRO PABLO GÓMEZ'),(1224,'1306','130658','PUERTO DE CAYO'),(1225,'1306','130659','PUERTO LÓPEZ'),(1226,'1307','130750','JUNÍN'),(1227,'1308','130801','LOS ESTEROS'),(1228,'1308','130802','MANTA'),(1229,'1308','130803','SAN MATEO'),(1230,'1308','130804','TARQUI'),(1231,'1308','130805','ELOY ALFARO'),(1232,'1308','130850','MANTA'),(1233,'1308','130851','SAN LORENZO'),(1234,'1308','130852','SANTA MARIANITA (BOCA DE PACOCHE)'),(1235,'1309','130901','ANIBAL SAN ANDRÉS'),(1236,'1309','130902','MONTECRISTI'),(1237,'1309','130903','EL COLORADO'),(1238,'1309','130904','GENERAL ELOY ALFARO'),(1239,'1309','130905','LEONIDAS PROAÑO'),(1240,'1309','130950','MONTECRISTI'),(1241,'1309','130951','JARAMIJÓ'),(1242,'1309','130952','LA PILA'),(1243,'1310','131050','PAJÁN'),(1244,'1310','131051','CAMPOZANO (LA PALMA DE PAJÁN)'),(1245,'1310','131052','CASCOL'),(1246,'1310','131053','GUALE'),(1247,'1310','131054','LASCANO'),(1248,'1311','131150','PICHINCHA'),(1249,'1311','131151','BARRAGANETE'),(1250,'1311','131152','SAN SEBASTIÁN'),(1251,'1312','131250','ROCAFUERTE'),(1252,'1313','131301','SANTA ANA'),(1253,'1313','131302','LODANA'),(1254,'1313','131350','SANTA ANA DE VUELTA LARGA'),(1255,'1313','131351','AYACUCHO'),(1256,'1313','131352','HONORATO VÁSQUEZ (CAB. EN VÁSQUEZ)'),(1257,'1313','131353','LA UNIÓN'),(1258,'1313','131354','OLMEDO'),(1259,'1313','131355','SAN PABLO (CAB. EN PUEBLO NUEVO)'),(1260,'1314','131401','BAHÍA DE CARÁQUEZ'),(1261,'1314','131402','LEONIDAS PLAZA GUTIÉRREZ'),(1262,'1314','131450','BAHÍA DE CARÁQUEZ'),(1263,'1314','131451','CANOA'),(1264,'1314','131452','COJIMÍES'),(1265,'1314','131453','CHARAPOTÓ'),(1266,'1314','131454','10 DE AGOSTO'),(1267,'1314','131455','JAMA'),(1268,'1314','131456','PEDERNALES'),(1269,'1314','131457','SAN ISIDRO'),(1270,'1314','131458','SAN VICENTE'),(1271,'1315','131550','TOSAGUA'),(1272,'1315','131551','BACHILLERO'),(1273,'1315','131552','ANGEL PEDRO GILER (LA ESTANCILLA)'),(1274,'1316','131650','SUCRE'),(1275,'1316','131651','BELLAVISTA'),(1276,'1316','131652','NOBOA'),(1277,'1316','131653','ARQ. SIXTO DURÁN BALLÉN'),(1278,'1317','131750','PEDERNALES'),(1279,'1317','131751','COJIMÍES'),(1280,'1317','131752','10 DE AGOSTO'),(1281,'1317','131753','ATAHUALPA'),(1282,'1318','131850','OLMEDO'),(1283,'1319','131950','PUERTO LÓPEZ'),(1284,'1319','131951','MACHALILLA'),(1285,'1319','131952','SALANGO'),(1286,'1320','132050','JAMA'),(1287,'1321','132150','JARAMIJÓ'),(1288,'1322','132250','SAN VICENTE'),(1289,'1322','132251','CANOA'),(1290,'1401','140150','MACAS'),(1291,'1401','140151','ALSHI (CAB. EN 9 DE OCTUBRE)'),(1292,'1401','140152','CHIGUAZA'),(1293,'1401','140153','GENERAL PROAÑO'),(1294,'1401','140154','HUASAGA (CAB.EN WAMPUIK)'),(1295,'1401','140155','MACUMA'),(1296,'1401','140156','SAN ISIDRO'),(1297,'1401','140157','SEVILLA DON BOSCO'),(1298,'1401','140158','SINAÍ'),(1299,'1401','140159','TAISHA'),(1300,'1401','140160','ZUÑA (ZÚÑAC)'),(1301,'1401','140161','TUUTINENTZA'),(1302,'1401','140162','CUCHAENTZA'),(1303,'1401','140163','SAN JOSÉ DE MORONA'),(1304,'1401','140164','RÍO BLANCO'),(1305,'1402','140201','GUALAQUIZA'),(1306,'1402','140202','MERCEDES MOLINA'),(1307,'1402','140250','GUALAQUIZA'),(1308,'1402','140251','AMAZONAS (ROSARIO DE CUYES)'),(1309,'1402','140252','BERMEJOS'),(1310,'1402','140253','BOMBOIZA'),(1311,'1402','140254','CHIGÜINDA'),(1312,'1402','140255','EL ROSARIO'),(1313,'1402','140256','NUEVA TARQUI'),(1314,'1402','140257','SAN MIGUEL DE CUYES'),(1315,'1402','140258','EL IDEAL'),(1316,'1403','140350','GENERAL LEONIDAS PLAZA GUTIÉRREZ (LIMÓN)'),(1317,'1403','140351','INDANZA'),(1318,'1403','140352','PAN DE AZÚCAR'),(1319,'1403','140353','SAN ANTONIO (CAB. EN SAN ANTONIO CENTRO'),(1320,'1403','140354','SAN CARLOS DE LIMÓN (SAN CARLOS DEL'),(1321,'1403','140355','SAN JUAN BOSCO'),(1322,'1403','140356','SAN MIGUEL DE CONCHAY'),(1323,'1403','140357','SANTA SUSANA DE CHIVIAZA (CAB. EN CHIVIAZA)'),(1324,'1403','140358','YUNGANZA (CAB. EN EL ROSARIO)'),(1325,'1404','140450','PALORA (METZERA)'),(1326,'1404','140451','ARAPICOS'),(1327,'1404','140452','CUMANDÁ (CAB. EN COLONIA AGRÍCOLA SEVILLA DEL'),(1328,'1404','140453','HUAMBOYA'),(1329,'1404','140454','SANGAY (CAB. EN NAYAMANACA)'),(1330,'1405','140550','SANTIAGO DE MÉNDEZ'),(1331,'1405','140551','COPAL'),(1332,'1405','140552','CHUPIANZA'),(1333,'1405','140553','PATUCA'),(1334,'1405','140554','SAN LUIS DE EL ACHO (CAB. EN EL ACHO)'),(1335,'1405','140555','SANTIAGO'),(1336,'1405','140556','TAYUZA'),(1337,'1405','140557','SAN FRANCISCO DE CHINIMBIMI'),(1338,'1406','140650','SUCÚA'),(1339,'1406','140651','ASUNCIÓN'),(1340,'1406','140652','HUAMBI'),(1341,'1406','140653','LOGROÑO'),(1342,'1406','140654','YAUPI'),(1343,'1406','140655','SANTA MARIANITA DE JESÚS'),(1344,'1407','140750','HUAMBOYA'),(1345,'1407','140751','CHIGUAZA'),(1346,'1407','140752','PABLO SEXTO'),(1347,'1408','140850','SAN JUAN BOSCO'),(1348,'1408','140851','PAN DE AZÚCAR'),(1349,'1408','140852','SAN CARLOS DE LIMÓN'),(1350,'1408','140853','SAN JACINTO DE WAKAMBEIS'),(1351,'1408','140854','SANTIAGO DE PANANZA'),(1352,'1409','140950','TAISHA'),(1353,'1409','140951','HUASAGA (CAB. EN WAMPUIK)'),(1354,'1409','140952','MACUMA'),(1355,'1409','140953','TUUTINENTZA'),(1356,'1409','140954','PUMPUENTSA'),(1357,'1410','141050','LOGROÑO'),(1358,'1410','141051','YAUPI'),(1359,'1410','141052','SHIMPIS'),(1360,'1411','141150','PABLO SEXTO'),(1361,'1412','141250','SANTIAGO'),(1362,'1412','141251','SAN JOSÉ DE MORONA'),(1363,'1501','150150','TENA'),(1364,'1501','150151','AHUANO'),(1365,'1501','150152','CARLOS JULIO AROSEMENA TOLA (ZATZA-YACU)'),(1366,'1501','150153','CHONTAPUNTA'),(1367,'1501','150154','PANO'),(1368,'1501','150155','PUERTO MISAHUALLI'),(1369,'1501','150156','PUERTO NAPO'),(1370,'1501','150157','TÁLAG'),(1371,'1501','150158','SAN JUAN DE MUYUNA'),(1372,'1503','150350','ARCHIDONA'),(1373,'1503','150351','AVILA'),(1374,'1503','150352','COTUNDO'),(1375,'1503','150353','LORETO'),(1376,'1503','150354','SAN PABLO DE USHPAYACU'),(1377,'1503','150355','PUERTO MURIALDO'),(1378,'1504','150450','EL CHACO'),(1379,'1504','150451','GONZALO DíAZ DE PINEDA (EL BOMBÓN)'),(1380,'1504','150452','LINARES'),(1381,'1504','150453','OYACACHI'),(1382,'1504','150454','SANTA ROSA'),(1383,'1504','150455','SARDINAS'),(1384,'1507','150750','BAEZA'),(1385,'1507','150751','COSANGA'),(1386,'1507','150752','CUYUJA'),(1387,'1507','150753','PAPALLACTA'),(1388,'1507','150754','SAN FRANCISCO DE BORJA (VIRGILIO DÁVILA)'),(1389,'1507','150755','SAN JOSÉ DEL PAYAMINO'),(1390,'1507','150756','SUMACO'),(1391,'1509','150950','CARLOS JULIO AROSEMENA TOLA'),(1392,'1601','160150','PUYO'),(1393,'1601','160151','ARAJUNO'),(1394,'1601','160152','CANELOS'),(1395,'1601','160153','CURARAY'),(1396,'1601','160154','DIEZ DE AGOSTO'),(1397,'1601','160155','FÁTIMA'),(1398,'1601','160156','MONTALVO (ANDOAS)'),(1399,'1601','160157','POMONA'),(1400,'1601','160158','RÍO CORRIENTES'),(1401,'1601','160159','RÍO TIGRE'),(1402,'1601','160160','SANTA CLARA'),(1403,'1601','160161','SARAYACU'),(1404,'1601','160162','SIMÓN BOLÍVAR (CAB. EN MUSHULLACTA)'),(1405,'1601','160163','TARQUI'),(1406,'1601','160164','TENIENTE HUGO ORTIZ'),(1407,'1601','160165','VERACRUZ (INDILLAMA) (CAB. EN INDILLAMA)'),(1408,'1601','160166','EL TRIUNFO'),(1409,'1602','160250','MERA'),(1410,'1602','160251','MADRE TIERRA'),(1411,'1602','160252','SHELL'),(1412,'1603','160350','SANTA CLARA'),(1413,'1603','160351','SAN JOSÉ'),(1414,'1604','160450','ARAJUNO'),(1415,'1604','160451','CURARAY'),(1416,'1701','170101','BELISARIO QUEVEDO'),(1417,'1701','170102','CARCELÉN'),(1418,'1701','170103','CENTRO HISTÓRICO'),(1419,'1701','170104','COCHAPAMBA'),(1420,'1701','170105','COMITÉ DEL PUEBLO'),(1421,'1701','170106','COTOCOLLAO'),(1422,'1701','170107','CHILIBULO'),(1423,'1701','170108','CHILLOGALLO'),(1424,'1701','170109','CHIMBACALLE'),(1425,'1701','170110','EL CONDADO'),(1426,'1701','170111','GUAMANÍ'),(1427,'1701','170112','IÑAQUITO'),(1428,'1701','170113','ITCHIMBÍA'),(1429,'1701','170114','JIPIJAPA'),(1430,'1701','170115','KENNEDY'),(1431,'1701','170116','LA ARGELIA'),(1432,'1701','170117','LA CONCEPCIÓN'),(1433,'1701','170118','LA ECUATORIANA'),(1434,'1701','170119','LA FERROVIARIA'),(1435,'1701','170120','LA LIBERTAD'),(1436,'1701','170121','LA MAGDALENA'),(1437,'1701','170122','LA MENA'),(1438,'1701','170123','MARISCAL SUCRE'),(1439,'1701','170124','PONCEANO'),(1440,'1701','170125','PUENGASÍ'),(1441,'1701','170126','QUITUMBE'),(1442,'1701','170127','RUMIPAMBA'),(1443,'1701','170128','SAN BARTOLO'),(1444,'1701','170129','SAN ISIDRO DEL INCA'),(1445,'1701','170130','SAN JUAN'),(1446,'1701','170131','SOLANDA'),(1447,'1701','170132','TURUBAMBA'),(1448,'1701','170150','QUITO DISTRITO METROPOLITANO'),(1449,'1701','170151','ALANGASÍ'),(1450,'1701','170152','AMAGUAÑA'),(1451,'1701','170153','ATAHUALPA'),(1452,'1701','170154','CALACALÍ'),(1453,'1701','170155','CALDERÓN'),(1454,'1701','170156','CONOCOTO'),(1455,'1701','170157','CUMBAYÁ'),(1456,'1701','170158','CHAVEZPAMBA'),(1457,'1701','170159','CHECA'),(1458,'1701','170160','EL QUINCHE'),(1459,'1701','170161','GUALEA'),(1460,'1701','170162','GUANGOPOLO'),(1461,'1701','170163','GUAYLLABAMBA'),(1462,'1701','170164','LA MERCED'),(1463,'1701','170165','LLANO CHICO'),(1464,'1701','170166','LLOA'),(1465,'1701','170167','MINDO'),(1466,'1701','170168','NANEGAL'),(1467,'1701','170169','NANEGALITO'),(1468,'1701','170170','NAYÓN'),(1469,'1701','170171','NONO'),(1470,'1701','170172','PACTO'),(1471,'1701','170173','PEDRO VICENTE MALDONADO'),(1472,'1701','170174','PERUCHO'),(1473,'1701','170175','PIFO'),(1474,'1701','170176','PÍNTAG'),(1475,'1701','170177','POMASQUI'),(1476,'1701','170178','PUÉLLARO'),(1477,'1701','170179','PUEMBO'),(1478,'1701','170180','SAN ANTONIO'),(1479,'1701','170181','SAN JOSÉ DE MINAS'),(1480,'1701','170182','SAN MIGUEL DE LOS BANCOS'),(1481,'1701','170183','TABABELA'),(1482,'1701','170184','TUMBACO'),(1483,'1701','170185','YARUQUÍ'),(1484,'1701','170186','ZAMBIZA'),(1485,'1701','170187','PUERTO QUITO'),(1486,'1702','170201','AYORA'),(1487,'1702','170202','CAYAMBE'),(1488,'1702','170203','JUAN MONTALVO'),(1489,'1702','170250','CAYAMBE'),(1490,'1702','170251','ASCÁZUBI'),(1491,'1702','170252','CANGAHUA'),(1492,'1702','170253','OLMEDO (PESILLO)'),(1493,'1702','170254','OTÓN'),(1494,'1702','170255','SANTA ROSA DE CUZUBAMBA'),(1495,'1703','170350','MACHACHI'),(1496,'1703','170351','ALÓAG'),(1497,'1703','170352','ALOASÍ'),(1498,'1703','170353','CUTUGLAHUA'),(1499,'1703','170354','EL CHAUPI'),(1500,'1703','170355','MANUEL CORNEJO ASTORGA (TANDAPI)'),(1501,'1703','170356','TAMBILLO'),(1502,'1703','170357','UYUMBICHO'),(1503,'1704','170450','TABACUNDO'),(1504,'1704','170451','LA ESPERANZA'),(1505,'1704','170452','MALCHINGUÍ'),(1506,'1704','170453','TOCACHI'),(1507,'1704','170454','TUPIGACHI'),(1508,'1705','170501','SANGOLQUÍ'),(1509,'1705','170502','SAN PEDRO DE TABOADA'),(1510,'1705','170503','SAN RAFAEL'),(1511,'1705','170550','SANGOLQUI'),(1512,'1705','170551','COTOGCHOA'),(1513,'1705','170552','RUMIPAMBA'),(1514,'1707','170750','SAN MIGUEL DE LOS BANCOS'),(1515,'1707','170751','MINDO'),(1516,'1707','170752','PEDRO VICENTE MALDONADO'),(1517,'1707','170753','PUERTO QUITO'),(1518,'1708','170850','PEDRO VICENTE MALDONADO'),(1519,'1709','170950','PUERTO QUITO'),(1520,'1801','180101','ATOCHA – FICOA'),(1521,'1801','180102','CELIANO MONGE'),(1522,'1801','180103','HUACHI CHICO'),(1523,'1801','180104','HUACHI LORETO'),(1524,'1801','180105','LA MERCED'),(1525,'1801','180106','LA PENÍNSULA'),(1526,'1801','180107','MATRIZ'),(1527,'1801','180108','PISHILATA'),(1528,'1801','180109','SAN FRANCISCO'),(1529,'1801','180150','AMBATO'),(1530,'1801','180151','AMBATILLO'),(1531,'1801','180152','ATAHUALPA (CHISALATA)'),(1532,'1801','180153','AUGUSTO N. MARTÍNEZ (MUNDUGLEO)'),(1533,'1801','180154','CONSTANTINO FERNÁNDEZ (CAB. EN CULLITAHUA)'),(1534,'1801','180155','HUACHI GRANDE'),(1535,'1801','180156','IZAMBA'),(1536,'1801','180157','JUAN BENIGNO VELA'),(1537,'1801','180158','MONTALVO'),(1538,'1801','180159','PASA'),(1539,'1801','180160','PICAIGUA'),(1540,'1801','180161','PILAGÜÍN (PILAHÜÍN)'),(1541,'1801','180162','QUISAPINCHA (QUIZAPINCHA)'),(1542,'1801','180163','SAN BARTOLOMÉ DE PINLLOG'),(1543,'1801','180164','SAN FERNANDO (PASA SAN FERNANDO)'),(1544,'1801','180165','SANTA ROSA'),(1545,'1801','180166','TOTORAS'),(1546,'1801','180167','CUNCHIBAMBA'),(1547,'1801','180168','UNAMUNCHO'),(1548,'1802','180250','BAÑOS DE AGUA SANTA'),(1549,'1802','180251','LLIGUA'),(1550,'1802','180252','RÍO NEGRO'),(1551,'1802','180253','RÍO VERDE'),(1552,'1802','180254','ULBA'),(1553,'1803','180350','CEVALLOS'),(1554,'1804','180450','MOCHA'),(1555,'1804','180451','PINGUILÍ'),(1556,'1805','180550','PATATE'),(1557,'1805','180551','EL TRIUNFO'),(1558,'1805','180552','LOS ANDES (CAB. EN POATUG)'),(1559,'1805','180553','SUCRE (CAB. EN SUCRE-PATATE URCU)'),(1560,'1806','180650','QUERO'),(1561,'1806','180651','RUMIPAMBA'),(1562,'1806','180652','YANAYACU - MOCHAPATA (CAB. EN YANAYACU)'),(1563,'1807','180701','PELILEO'),(1564,'1807','180702','PELILEO GRANDE'),(1565,'1807','180750','PELILEO'),(1566,'1807','180751','BENÍTEZ (PACHANLICA)'),(1567,'1807','180752','BOLÍVAR'),(1568,'1807','180753','COTALÓ'),(1569,'1807','180754','CHIQUICHA (CAB. EN CHIQUICHA GRANDE)'),(1570,'1807','180755','EL ROSARIO (RUMICHACA)'),(1571,'1807','180756','GARCÍA MORENO (CHUMAQUI)'),(1572,'1807','180757','GUAMBALÓ (HUAMBALÓ)'),(1573,'1807','180758','SALASACA'),(1574,'1808','180801','CIUDAD NUEVA'),(1575,'1808','180802','PÍLLARO'),(1576,'1808','180850','PÍLLARO'),(1577,'1808','180851','BAQUERIZO MORENO'),(1578,'1808','180852','EMILIO MARÍA TERÁN (RUMIPAMBA)'),(1579,'1808','180853','MARCOS ESPINEL (CHACATA)'),(1580,'1808','180854','PRESIDENTE URBINA (CHAGRAPAMBA -PATZUCUL)'),(1581,'1808','180855','SAN ANDRÉS'),(1582,'1808','180856','SAN JOSÉ DE POALÓ'),(1583,'1808','180857','SAN MIGUELITO'),(1584,'1809','180950','TISALEO'),(1585,'1809','180951','QUINCHICOTO'),(1586,'1901','190101','EL LIMÓN'),(1587,'1901','190102','ZAMORA'),(1588,'1901','190150','ZAMORA'),(1589,'1901','190151','CUMBARATZA'),(1590,'1901','190152','GUADALUPE'),(1591,'1901','190153','IMBANA (LA VICTORIA DE IMBANA)'),(1592,'1901','190154','PAQUISHA'),(1593,'1901','190155','SABANILLA'),(1594,'1901','190156','TIMBARA'),(1595,'1901','190157','ZUMBI'),(1596,'1901','190158','SAN CARLOS DE LAS MINAS'),(1597,'1902','190250','ZUMBA'),(1598,'1902','190251','CHITO'),(1599,'1902','190252','EL CHORRO'),(1600,'1902','190253','EL PORVENIR DEL CARMEN'),(1601,'1902','190254','LA CHONTA'),(1602,'1902','190255','PALANDA'),(1603,'1902','190256','PUCAPAMBA'),(1604,'1902','190257','SAN FRANCISCO DEL VERGEL'),(1605,'1902','190258','VALLADOLID'),(1606,'1902','190259','SAN ANDRÉS'),(1607,'1903','190350','GUAYZIMI'),(1608,'1903','190351','ZURMI'),(1609,'1903','190352','NUEVO PARAÍSO'),(1610,'1904','190450','28 DE MAYO (SAN JOSÉ DE YACUAMBI)'),(1611,'1904','190451','LA PAZ'),(1612,'1904','190452','TUTUPALI'),(1613,'1905','190550','YANTZAZA (YANZATZA)'),(1614,'1905','190551','CHICAÑA'),(1615,'1905','190552','EL PANGUI'),(1616,'1905','190553','LOS ENCUENTROS'),(1617,'1906','190650','EL PANGUI'),(1618,'1906','190651','EL GUISME'),(1619,'1906','190652','PACHICUTZA'),(1620,'1906','190653','TUNDAYME'),(1621,'1907','190750','ZUMBI'),(1622,'1907','190751','PAQUISHA'),(1623,'1907','190752','TRIUNFO-DORADO'),(1624,'1907','190753','PANGUINTZA'),(1625,'1908','190850','PALANDA'),(1626,'1908','190851','EL PORVENIR DEL CARMEN'),(1627,'1908','190852','SAN FRANCISCO DEL VERGEL'),(1628,'1908','190853','VALLADOLID'),(1629,'1908','190854','LA CANELA'),(1630,'1909','190950','PAQUISHA'),(1631,'1909','190951','BELLAVISTA'),(1632,'1909','190952','NUEVO QUITO'),(1633,'2001','200150','PUERTO BAQUERIZO MORENO'),(1634,'2001','200151','EL PROGRESO'),(1635,'2001','200152','ISLA SANTA MARÍA (FLOREANA) (CAB. EN PTO. VEL'),(1636,'2002','200250','PUERTO VILLAMIL'),(1637,'2002','200251','TOMÁS DE BERLANGA (SANTO TOMÁS)'),(1638,'2003','200350','PUERTO AYORA'),(1639,'2003','200351','BELLAVISTA'),(1640,'2003','200352','SANTA ROSA (INCLUYE LA ISLA BALTRA)'),(1641,'2101','210150','NUEVA LOJA'),(1642,'2101','210151','CUYABENO'),(1643,'2101','210152','DURENO'),(1644,'2101','210153','GENERAL FARFÁN'),(1645,'2101','210154','TARAPOA'),(1646,'2101','210155','EL ENO'),(1647,'2101','210156','PACAYACU'),(1648,'2101','210157','JAMBELÍ'),(1649,'2101','210158','SANTA CECILIA'),(1650,'2101','210159','AGUAS NEGRAS'),(1651,'2102','210250','EL DORADO DE CASCALES'),(1652,'2102','210251','EL REVENTADOR'),(1653,'2102','210252','GONZALO PIZARRO'),(1654,'2102','210253','LUMBAQUÍ'),(1655,'2102','210254','PUERTO LIBRE'),(1656,'2102','210255','SANTA ROSA DE SUCUMBÍOS'),(1657,'2103','210350','PUERTO EL CARMEN DEL PUTUMAYO'),(1658,'2103','210351','PALMA ROJA'),(1659,'2103','210352','PUERTO BOLÍVAR (PUERTO MONTÚFAR)'),(1660,'2103','210353','PUERTO RODRÍGUEZ'),(1661,'2103','210354','SANTA ELENA'),(1662,'2104','210450','SHUSHUFINDI'),(1663,'2104','210451','LIMONCOCHA'),(1664,'2104','210452','PAÑACOCHA'),(1665,'2104','210453','SAN ROQUE (CAB. EN SAN VICENTE)'),(1666,'2104','210454','SAN PEDRO DE LOS COFANES'),(1667,'2104','210455','SIETE DE JULIO'),(1668,'2105','210550','LA BONITA'),(1669,'2105','210551','EL PLAYÓN DE SAN FRANCISCO'),(1670,'2105','210552','LA SOFÍA'),(1671,'2105','210553','ROSA FLORIDA'),(1672,'2105','210554','SANTA BÁRBARA'),(1673,'2106','210650','EL DORADO DE CASCALES'),(1674,'2106','210651','SANTA ROSA DE SUCUMBÍOS'),(1675,'2106','210652','SEVILLA'),(1676,'2107','210750','TARAPOA'),(1677,'2107','210751','CUYABENO'),(1678,'2107','210752','AGUAS NEGRAS'),(1679,'2201','220150','PUERTO FRANCISCO DE ORELLANA (EL COCA)'),(1680,'2201','220151','DAYUMA'),(1681,'2201','220152','TARACOA (NUEVA ESPERANZA: YUCA)'),(1682,'2201','220153','ALEJANDRO LABAKA'),(1683,'2201','220154','EL DORADO'),(1684,'2201','220155','EL EDÉN'),(1685,'2201','220156','GARCÍA MORENO'),(1686,'2201','220157','INÉS ARANGO (CAB. EN WESTERN)'),(1687,'2201','220158','LA BELLEZA'),(1688,'2201','220159','NUEVO PARAÍSO (CAB. EN UNIÓN'),(1689,'2201','220160','SAN JOSÉ DE GUAYUSA'),(1690,'2201','220161','SAN LUIS DE ARMENIA'),(1691,'2202','220201','TIPITINI'),(1692,'2202','220250','NUEVO ROCAFUERTE'),(1693,'2202','220251','CAPITÁN AUGUSTO RIVADENEYRA'),(1694,'2202','220252','CONONACO'),(1695,'2202','220253','SANTA MARÍA DE HUIRIRIMA'),(1696,'2202','220254','TIPUTINI'),(1697,'2202','220255','YASUNÍ'),(1698,'2203','220350','LA JOYA DE LOS SACHAS'),(1699,'2203','220351','ENOKANQUI'),(1700,'2203','220352','POMPEYA'),(1701,'2203','220353','SAN CARLOS'),(1702,'2203','220354','SAN SEBASTIÁN DEL COCA'),(1703,'2203','220355','LAGO SAN PEDRO'),(1704,'2203','220356','RUMIPAMBA'),(1705,'2203','220357','TRES DE NOVIEMBRE'),(1706,'2203','220358','UNIÓN MILAGREÑA'),(1707,'2204','220450','LORETO'),(1708,'2204','220451','AVILA (CAB. EN HUIRUNO)'),(1709,'2204','220452','PUERTO MURIALDO'),(1710,'2204','220453','SAN JOSÉ DE PAYAMINO'),(1711,'2204','220454','SAN JOSÉ DE DAHUANO'),(1712,'2204','220455','SAN VICENTE DE HUATICOCHA'),(1713,'2301','230101','ABRAHAM CALAZACÓN'),(1714,'2301','230102','BOMBOLÍ'),(1715,'2301','230103','CHIGUILPE'),(1716,'2301','230104','RÍO TOACHI'),(1717,'2301','230105','RÍO VERDE'),(1718,'2301','230106','SANTO DOMINGO DE LOS COLORADOS'),(1719,'2301','230107','ZARACAY'),(1720,'2301','230150','SANTO DOMINGO DE LOS COLORADOS'),(1721,'2301','230151','ALLURIQUÍN'),(1722,'2301','230152','PUERTO LIMÓN'),(1723,'2301','230153','LUZ DE AMÉRICA'),(1724,'2301','230154','SAN JACINTO DEL BÚA'),(1725,'2301','230155','VALLE HERMOSO'),(1726,'2301','230156','EL ESFUERZO'),(1727,'2301','230157','SANTA MARÍA DEL TOACHI'),(1728,'2401','240101','BALLENITA'),(1729,'2401','240102','SANTA ELENA'),(1730,'2401','240150','SANTA ELENA'),(1731,'2401','240151','ATAHUALPA'),(1732,'2401','240152','COLONCHE'),(1733,'2401','240153','CHANDUY'),(1734,'2401','240154','MANGLARALTO'),(1735,'2401','240155','SIMÓN BOLÍVAR (JULIO MORENO)'),(1736,'2401','240156','SAN JOSÉ DE ANCÓN'),(1737,'2402','240250','LA LIBERTAD'),(1738,'2403','240301','CARLOS ESPINOZA LARREA'),(1739,'2403','240302','GRAL. ALBERTO ENRÍQUEZ GALLO'),(1740,'2403','240303','VICENTE ROCAFUERTE'),(1741,'2403','240304','SANTA ROSA'),(1742,'2403','240350','SALINAS'),(1743,'2403','240351','ANCONCITO'),(1744,'2403','240352','JOSÉ LUIS TAMAYO (MUEY)'),(1745,'9001','900151','LAS GOLONDRINAS'),(1746,'9003','900351','MANGA DEL CURA'),(1747,'9004','900451','EL PIEDRERO'),(1748,'TUS','TEM','USUARIO TEMPORAL');
/*!40000 ALTER TABLE `genr_general` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genr_historial`
--

DROP TABLE IF EXISTS `genr_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `genr_historial` (
  `id_historial` int(11) NOT NULL AUTO_INCREMENT,
  `modulo` varchar(50) NOT NULL,
  `accion` varchar(50) NOT NULL,
  `usuario_mod` varchar(50) NOT NULL,
  `terminal_mod` varchar(50) NOT NULL,
  `fecha_mod` date NOT NULL,
  `id_menu` int(11) NOT NULL,
  PRIMARY KEY (`id_historial`),
  KEY `genr_historial_id_menu_32224d38_fk_conf_menu_id_menu` (`id_menu`),
  CONSTRAINT `genr_historial_id_menu_32224d38_fk_conf_menu_id_menu` FOREIGN KEY (`id_menu`) REFERENCES `conf_menu` (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genr_historial`
--

LOCK TABLES `genr_historial` WRITE;
/*!40000 ALTER TABLE `genr_historial` DISABLE KEYS */;
INSERT INTO `genr_historial` VALUES (1,'Configuraciones','Crear','nelio','127.0.1.1','2019-11-29',23),(2,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-02',23),(3,'Configuraciones','Crear','nelio','172.10.181.85','2019-12-03',0),(4,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-03',23),(5,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-03',23),(6,'Configuraciones','Crear','nelio','172.10.181.85','2019-12-03',23),(7,'Configuraciones','Crear','nelio','172.10.181.85','2019-12-03',23),(8,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-03',23),(9,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-03',23),(10,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-03',23),(11,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-03',23),(12,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-03',23),(13,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-03',23),(14,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-03',23),(15,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-03',23),(16,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-03',23),(17,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-03',23),(18,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-03',23),(19,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-03',23),(20,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-03',23),(21,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-03',23),(22,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-04',23),(23,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-04',23),(24,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-04',23),(25,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-04',23),(26,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-04',23),(27,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-04',23),(28,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-04',23),(29,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-04',23),(30,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-04',23),(31,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-04',23),(32,'Configuraciones','Crear','nelio','Usuario','2019-12-05',23),(33,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-05',23),(34,'Configuraciones','Crear','nelio','DESKTOP-FECK72D','2019-12-09',23),(35,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-18',23),(36,'Configuraciones','Crear','nelio','DESKTOP-NSKTLLL','2019-12-18',23),(37,'Configuraciones','Crear','nelio','DESKTOP-HJAA63O','2020-02-12',23),(38,'Configuraciones','Crear','nelio','DESKTOP-HJAA63O','2020-02-12',23);
/*!40000 ALTER TABLE `genr_historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mant_anio_lectivo`
--

DROP TABLE IF EXISTS `mant_anio_lectivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mant_anio_lectivo` (
  `id_anio_lectivo` int(11) NOT NULL AUTO_INCREMENT,
  `anio` int(11) NOT NULL,
  `ciclo` int(11) NOT NULL,
  `fecha_incio_ciclo` date NOT NULL,
  `fecha_fin_ciclo` date NOT NULL,
  `id_genr_estado` int(11) NOT NULL,
  PRIMARY KEY (`id_anio_lectivo`),
  KEY `mant_anio_lectivo_id_genr_estado_cec5b50c_fk_genr_gene` (`id_genr_estado`),
  CONSTRAINT `mant_anio_lectivo_id_genr_estado_cec5b50c_fk_genr_gene` FOREIGN KEY (`id_genr_estado`) REFERENCES `genr_general` (`idgenr_general`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mant_anio_lectivo`
--

LOCK TABLES `mant_anio_lectivo` WRITE;
/*!40000 ALTER TABLE `mant_anio_lectivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `mant_anio_lectivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mant_empleado`
--

DROP TABLE IF EXISTS `mant_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mant_empleado` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_ingreso` datetime(6) NOT NULL,
  `usuario_ing` varchar(45) NOT NULL,
  `terminal_ing` varchar(45) NOT NULL,
  `id_anio_lectivo` int(11) NOT NULL,
  `id_detalle_empleado` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `mant_empleado_id_anio_lectivo_8e86b683_fk_mant_anio` (`id_anio_lectivo`),
  KEY `mant_empleado_id_detalle_empleado_a72575b4_fk_mov_detal` (`id_detalle_empleado`),
  KEY `mant_empleado_id_persona_b0b32e94_fk_mant_persona_id_persona` (`id_persona`),
  KEY `mant_empleado_id_usuario_2929f7e1_fk_conf_usuario_id_usuario` (`id_usuario`),
  CONSTRAINT `mant_empleado_id_anio_lectivo_8e86b683_fk_mant_anio` FOREIGN KEY (`id_anio_lectivo`) REFERENCES `mant_anio_lectivo` (`id_anio_lectivo`),
  CONSTRAINT `mant_empleado_id_detalle_empleado_a72575b4_fk_mov_detal` FOREIGN KEY (`id_detalle_empleado`) REFERENCES `mov_detalle_empleado` (`id_detalle_empleado`),
  CONSTRAINT `mant_empleado_id_persona_b0b32e94_fk_mant_persona_id_persona` FOREIGN KEY (`id_persona`) REFERENCES `mant_persona` (`id_persona`),
  CONSTRAINT `mant_empleado_id_usuario_2929f7e1_fk_conf_usuario_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `conf_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mant_empleado`
--

LOCK TABLES `mant_empleado` WRITE;
/*!40000 ALTER TABLE `mant_empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `mant_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mant_estudiante`
--

DROP TABLE IF EXISTS `mant_estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mant_estudiante` (
  `id_estudiante` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_estudiante` varchar(45) NOT NULL,
  `fecha_ingreso` datetime(6) NOT NULL,
  `usuario_ing` varchar(45) NOT NULL,
  `terminal_ing` varchar(45) NOT NULL,
  `id_persona` int(11) NOT NULL,
  PRIMARY KEY (`id_estudiante`),
  KEY `mant_estudiante_id_persona_876bb4bc_fk_mant_persona_id_persona` (`id_persona`),
  CONSTRAINT `mant_estudiante_id_persona_876bb4bc_fk_mant_persona_id_persona` FOREIGN KEY (`id_persona`) REFERENCES `mant_persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mant_estudiante`
--

LOCK TABLES `mant_estudiante` WRITE;
/*!40000 ALTER TABLE `mant_estudiante` DISABLE KEYS */;
/*!40000 ALTER TABLE `mant_estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mant_persona`
--

DROP TABLE IF EXISTS `mant_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mant_persona` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `fecha_de_nacimiento` date NOT NULL,
  `estado` int(11) NOT NULL,
  `identificacion` varchar(50) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `fecha_ingreso` datetime(6) NOT NULL,
  `usuario_ing` varchar(60) NOT NULL,
  `terminal_ing` varchar(60) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `celular` varchar(15) NOT NULL,
  `lugar_nacimiento` varchar(45) NOT NULL,
  `discapacidad` tinyint(1) NOT NULL,
  `discapacidad_renal` tinyint(1) NOT NULL,
  `discapacidad_neurologica` tinyint(1) NOT NULL,
  `enfermedad_alergica` tinyint(1) NOT NULL,
  `asma` tinyint(1) NOT NULL,
  `epilepsia` tinyint(1) NOT NULL,
  `enfermedad_congenita` tinyint(1) NOT NULL,
  `enfermedad_respiratoria` tinyint(1) NOT NULL,
  `atencion_psicologica` tinyint(1) NOT NULL,
  `bono_solidario` tinyint(1) NOT NULL,
  `mienbros_hogar` int(11) NOT NULL,
  `pnombres` varchar(45) DEFAULT NULL,
  `papellidos` varchar(45) DEFAULT NULL,
  `pidentificacion` varchar(15) DEFAULT NULL,
  `pdireccion` varchar(45) DEFAULT NULL,
  `ptelefono` varchar(45) DEFAULT NULL,
  `pvive_con_usted` tinyint(1) DEFAULT NULL,
  `mnombres` varchar(45) DEFAULT NULL,
  `mapellidos` varchar(45) DEFAULT NULL,
  `mdireccion` varchar(45) DEFAULT NULL,
  `mtelefono` varchar(45) DEFAULT NULL,
  `midentificacion` varchar(15) DEFAULT NULL,
  `mvive_con_usted` tinyint(1) DEFAULT NULL,
  `rnombres` varchar(45) DEFAULT NULL,
  `rapellidos` varchar(45) DEFAULT NULL,
  `rtelefono` varchar(45) DEFAULT NULL,
  `rvive_con_usted` tinyint(1) DEFAULT NULL,
  `ridentificacion` varchar(13) DEFAULT NULL,
  `id_genr_categoria_migratoria` int(11) NOT NULL,
  `id_genr_ciudad` int(11) NOT NULL,
  `id_genr_estado_civil` int(11) NOT NULL,
  `id_genr_estado_laboralm` int(11) NOT NULL,
  `id_genr_estado_laboralp` int(11) NOT NULL,
  `id_genr_etnia` int(11) NOT NULL,
  `id_genr_genero` int(11) NOT NULL,
  `id_genr_idioma_ancestral` int(11) NOT NULL,
  `id_genr_indigena` int(11) NOT NULL,
  `id_genr_jornada` int(11) NOT NULL,
  `id_genr_pais` int(11) NOT NULL,
  `id_genr_provincia` int(11) NOT NULL,
  `id_genr_tipo_identificacion` int(11) NOT NULL,
  `id_genr_tipo_parentesco` int(11) NOT NULL,
  `id_genr_tipo_sangre` int(11) NOT NULL,
  `id_genr_tipo_usuario` int(11) NOT NULL,
  `rdireccion_trabajo` varchar(200) DEFAULT NULL,
  `rhorario_laboral` varchar(40) DEFAULT NULL,
  `rtelefono_trabajo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_persona`),
  UNIQUE KEY `identificacion` (`identificacion`),
  UNIQUE KEY `pidentificacion` (`pidentificacion`),
  UNIQUE KEY `midentificacion` (`midentificacion`),
  UNIQUE KEY `ridentificacion` (`ridentificacion`),
  KEY `mant_persona_id_genr_categoria_mi_4922626f_fk_genr_gene` (`id_genr_categoria_migratoria`),
  KEY `mant_persona_id_genr_ciudad_9749b7b1_fk_genr_gene` (`id_genr_ciudad`),
  KEY `mant_persona_id_genr_estado_civil_51eac68f_fk_genr_gene` (`id_genr_estado_civil`),
  KEY `mant_persona_id_genr_estado_labor_a9fbeff5_fk_genr_gene` (`id_genr_estado_laboralm`),
  KEY `mant_persona_id_genr_estado_labor_72eac056_fk_genr_gene` (`id_genr_estado_laboralp`),
  KEY `mant_persona_id_genr_etnia_ac16f1d3_fk_genr_gene` (`id_genr_etnia`),
  KEY `mant_persona_id_genr_genero_c43145ca_fk_genr_gene` (`id_genr_genero`),
  KEY `mant_persona_id_genr_idioma_ances_b5f2a186_fk_genr_gene` (`id_genr_idioma_ancestral`),
  KEY `mant_persona_id_genr_indigena_fc05b8f1_fk_genr_gene` (`id_genr_indigena`),
  KEY `mant_persona_id_genr_jornada_aa6dc71f_fk_genr_gene` (`id_genr_jornada`),
  KEY `mant_persona_id_genr_pais_ad6a9277_fk_genr_gene` (`id_genr_pais`),
  KEY `mant_persona_id_genr_provincia_72e9ed88_fk_genr_gene` (`id_genr_provincia`),
  KEY `mant_persona_id_genr_tipo_identif_70f41b35_fk_genr_gene` (`id_genr_tipo_identificacion`),
  KEY `mant_persona_id_genr_tipo_parente_156bc50d_fk_genr_gene` (`id_genr_tipo_parentesco`),
  KEY `mant_persona_id_genr_tipo_sangre_ba558316_fk_genr_gene` (`id_genr_tipo_sangre`),
  KEY `mant_persona_id_genr_tipo_usuario_9a359f1a_fk_genr_gene` (`id_genr_tipo_usuario`),
  CONSTRAINT `mant_persona_id_genr_categoria_mi_4922626f_fk_genr_gene` FOREIGN KEY (`id_genr_categoria_migratoria`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_id_genr_ciudad_9749b7b1_fk_genr_gene` FOREIGN KEY (`id_genr_ciudad`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_id_genr_estado_civil_51eac68f_fk_genr_gene` FOREIGN KEY (`id_genr_estado_civil`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_id_genr_estado_labor_72eac056_fk_genr_gene` FOREIGN KEY (`id_genr_estado_laboralp`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_id_genr_estado_labor_a9fbeff5_fk_genr_gene` FOREIGN KEY (`id_genr_estado_laboralm`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_id_genr_etnia_ac16f1d3_fk_genr_gene` FOREIGN KEY (`id_genr_etnia`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_id_genr_genero_c43145ca_fk_genr_gene` FOREIGN KEY (`id_genr_genero`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_id_genr_idioma_ances_b5f2a186_fk_genr_gene` FOREIGN KEY (`id_genr_idioma_ancestral`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_id_genr_indigena_fc05b8f1_fk_genr_gene` FOREIGN KEY (`id_genr_indigena`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_id_genr_jornada_aa6dc71f_fk_genr_gene` FOREIGN KEY (`id_genr_jornada`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_id_genr_pais_ad6a9277_fk_genr_gene` FOREIGN KEY (`id_genr_pais`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_id_genr_provincia_72e9ed88_fk_genr_gene` FOREIGN KEY (`id_genr_provincia`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_id_genr_tipo_identif_70f41b35_fk_genr_gene` FOREIGN KEY (`id_genr_tipo_identificacion`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_id_genr_tipo_parente_156bc50d_fk_genr_gene` FOREIGN KEY (`id_genr_tipo_parentesco`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_id_genr_tipo_sangre_ba558316_fk_genr_gene` FOREIGN KEY (`id_genr_tipo_sangre`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_id_genr_tipo_usuario_9a359f1a_fk_genr_gene` FOREIGN KEY (`id_genr_tipo_usuario`) REFERENCES `genr_general` (`idgenr_general`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mant_persona`
--

LOCK TABLES `mant_persona` WRITE;
/*!40000 ALTER TABLE `mant_persona` DISABLE KEYS */;
INSERT INTO `mant_persona` VALUES (1,'Cristhofer','Peralta','2000-10-02',97,'123','123','cristof_21000@hotmail.com','0000-00-00 00:00:00.000000','','','Duran','0999999','Cuenca',0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,21,'no requerido','no requerido','no requerido');
/*!40000 ALTER TABLE `mant_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mant_representante`
--

DROP TABLE IF EXISTS `mant_representante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mant_representante` (
  `id_representante` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_ing` varchar(45) NOT NULL,
  `fecha_ingreso` datetime(6) NOT NULL,
  `terminal_ing` varchar(45) NOT NULL,
  `ingresos_totales` double NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_genr_nivel_formacion` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  PRIMARY KEY (`id_representante`),
  KEY `mant_representante_id_genr_nivel_formac_84cba28b_fk_genr_gene` (`id_genr_nivel_formacion`),
  KEY `mant_representante_id_persona_f06c7605_fk_mant_pers` (`id_persona`),
  CONSTRAINT `mant_representante_id_genr_nivel_formac_84cba28b_fk_genr_gene` FOREIGN KEY (`id_genr_nivel_formacion`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_representante_id_persona_f06c7605_fk_mant_pers` FOREIGN KEY (`id_persona`) REFERENCES `mant_persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mant_representante`
--

LOCK TABLES `mant_representante` WRITE;
/*!40000 ALTER TABLE `mant_representante` DISABLE KEYS */;
/*!40000 ALTER TABLE `mant_representante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mov_admision`
--

DROP TABLE IF EXISTS `mov_admision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mov_admision` (
  `id_admision` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_documento` varchar(45) NOT NULL,
  `documento` varchar(45) NOT NULL,
  `id_estudiante` int(11) NOT NULL,
  PRIMARY KEY (`id_admision`),
  KEY `mov_admision_id_estudiante_a4dd1e55_fk_mant_estu` (`id_estudiante`),
  CONSTRAINT `mov_admision_id_estudiante_a4dd1e55_fk_mant_estu` FOREIGN KEY (`id_estudiante`) REFERENCES `mant_estudiante` (`id_estudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_admision`
--

LOCK TABLES `mov_admision` WRITE;
/*!40000 ALTER TABLE `mov_admision` DISABLE KEYS */;
/*!40000 ALTER TABLE `mov_admision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mov_cab_curso`
--

DROP TABLE IF EXISTS `mov_cab_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mov_cab_curso` (
  `id_curso` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `cupo` int(11) NOT NULL,
  `id_anio_lectivo` int(11) NOT NULL,
  `id_genr_curso` int(11) NOT NULL,
  `id_genr_formacion` int(11) NOT NULL,
  `id_genr_jornada` int(11) NOT NULL,
  `id_genr_paralelo` int(11) NOT NULL,
  PRIMARY KEY (`id_curso`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `mov_cab_curso_id_anio_lectivo_1044a1f2_fk_mant_anio` (`id_anio_lectivo`),
  KEY `mov_cab_curso_id_genr_curso_5faf9c55_fk_genr_gene` (`id_genr_curso`),
  KEY `mov_cab_curso_id_genr_formacion_cfb255f5_fk_genr_gene` (`id_genr_formacion`),
  KEY `mov_cab_curso_id_genr_jornada_af275278_fk_genr_gene` (`id_genr_jornada`),
  KEY `mov_cab_curso_id_genr_paralelo_402a7101_fk_genr_gene` (`id_genr_paralelo`),
  CONSTRAINT `mov_cab_curso_id_anio_lectivo_1044a1f2_fk_mant_anio` FOREIGN KEY (`id_anio_lectivo`) REFERENCES `mant_anio_lectivo` (`id_anio_lectivo`),
  CONSTRAINT `mov_cab_curso_id_genr_curso_5faf9c55_fk_genr_gene` FOREIGN KEY (`id_genr_curso`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mov_cab_curso_id_genr_formacion_cfb255f5_fk_genr_gene` FOREIGN KEY (`id_genr_formacion`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mov_cab_curso_id_genr_jornada_af275278_fk_genr_gene` FOREIGN KEY (`id_genr_jornada`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mov_cab_curso_id_genr_paralelo_402a7101_fk_genr_gene` FOREIGN KEY (`id_genr_paralelo`) REFERENCES `genr_general` (`idgenr_general`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_cab_curso`
--

LOCK TABLES `mov_cab_curso` WRITE;
/*!40000 ALTER TABLE `mov_cab_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `mov_cab_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mov_cab_registro_notas`
--

DROP TABLE IF EXISTS `mov_cab_registro_notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mov_cab_registro_notas` (
  `id_registro_notas` int(11) NOT NULL AUTO_INCREMENT,
  `promedio_curso_1q` double NOT NULL,
  `promedio_curso_2q` double NOT NULL,
  `promedio_curso_general` double NOT NULL,
  `id_anio_lectivo` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `id_genr_materia` int(11) NOT NULL,
  PRIMARY KEY (`id_registro_notas`),
  KEY `mov_cab_registro_not_id_anio_lectivo_70edd485_fk_mant_anio` (`id_anio_lectivo`),
  KEY `mov_cab_registro_not_id_curso_f98f0d91_fk_mov_cab_c` (`id_curso`),
  KEY `mov_cab_registro_not_id_empleado_b3a71bdb_fk_mant_empl` (`id_empleado`),
  KEY `mov_cab_registro_not_id_genr_materia_2b3b7084_fk_genr_gene` (`id_genr_materia`),
  CONSTRAINT `mov_cab_registro_not_id_anio_lectivo_70edd485_fk_mant_anio` FOREIGN KEY (`id_anio_lectivo`) REFERENCES `mant_anio_lectivo` (`id_anio_lectivo`),
  CONSTRAINT `mov_cab_registro_not_id_curso_f98f0d91_fk_mov_cab_c` FOREIGN KEY (`id_curso`) REFERENCES `mov_cab_curso` (`id_curso`),
  CONSTRAINT `mov_cab_registro_not_id_empleado_b3a71bdb_fk_mant_empl` FOREIGN KEY (`id_empleado`) REFERENCES `mant_empleado` (`id_empleado`),
  CONSTRAINT `mov_cab_registro_not_id_genr_materia_2b3b7084_fk_genr_gene` FOREIGN KEY (`id_genr_materia`) REFERENCES `genr_general` (`idgenr_general`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_cab_registro_notas`
--

LOCK TABLES `mov_cab_registro_notas` WRITE;
/*!40000 ALTER TABLE `mov_cab_registro_notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `mov_cab_registro_notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mov_detalle_empleado`
--

DROP TABLE IF EXISTS `mov_detalle_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mov_detalle_empleado` (
  `id_detalle_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `id_anio_lectivo` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `id_genr_materia` int(11) NOT NULL,
  `id_genr_paralelo` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle_empleado`),
  KEY `mov_detalle_empleado_id_anio_lectivo_66f29d45_fk_genr_gene` (`id_anio_lectivo`),
  KEY `mov_detalle_empleado_id_curso_af0c86b2_fk_mov_cab_curso_id_curso` (`id_curso`),
  KEY `mov_detalle_empleado_id_genr_materia_2f227137_fk_genr_gene` (`id_genr_materia`),
  KEY `mov_detalle_empleado_id_genr_paralelo_672cb28b_fk_genr_gene` (`id_genr_paralelo`),
  CONSTRAINT `mov_detalle_empleado_id_anio_lectivo_66f29d45_fk_genr_gene` FOREIGN KEY (`id_anio_lectivo`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mov_detalle_empleado_id_curso_af0c86b2_fk_mov_cab_curso_id_curso` FOREIGN KEY (`id_curso`) REFERENCES `mov_cab_curso` (`id_curso`),
  CONSTRAINT `mov_detalle_empleado_id_genr_materia_2f227137_fk_genr_gene` FOREIGN KEY (`id_genr_materia`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mov_detalle_empleado_id_genr_paralelo_672cb28b_fk_genr_gene` FOREIGN KEY (`id_genr_paralelo`) REFERENCES `genr_general` (`idgenr_general`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_detalle_empleado`
--

LOCK TABLES `mov_detalle_empleado` WRITE;
/*!40000 ALTER TABLE `mov_detalle_empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `mov_detalle_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mov_detalle_materia_curso`
--

DROP TABLE IF EXISTS `mov_detalle_materia_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mov_detalle_materia_curso` (
  `id_detalle_curso` int(11) NOT NULL AUTO_INCREMENT,
  `anio` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `id_genr_materias` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle_curso`),
  KEY `mov_detalle_materia__estado_dd6018f2_fk_genr_gene` (`estado`),
  KEY `mov_detalle_materia__id_curso_170afc3d_fk_mov_cab_c` (`id_curso`),
  KEY `mov_detalle_materia__id_genr_materias_089c4fd0_fk_genr_gene` (`id_genr_materias`),
  CONSTRAINT `mov_detalle_materia__estado_dd6018f2_fk_genr_gene` FOREIGN KEY (`estado`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mov_detalle_materia__id_curso_170afc3d_fk_mov_cab_c` FOREIGN KEY (`id_curso`) REFERENCES `mov_cab_curso` (`id_curso`),
  CONSTRAINT `mov_detalle_materia__id_genr_materias_089c4fd0_fk_genr_gene` FOREIGN KEY (`id_genr_materias`) REFERENCES `genr_general` (`idgenr_general`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_detalle_materia_curso`
--

LOCK TABLES `mov_detalle_materia_curso` WRITE;
/*!40000 ALTER TABLE `mov_detalle_materia_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `mov_detalle_materia_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mov_detalle_registro_notas`
--

DROP TABLE IF EXISTS `mov_detalle_registro_notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mov_detalle_registro_notas` (
  `id_detalle_registro_notas` int(11) NOT NULL AUTO_INCREMENT,
  `primer_parcial` double NOT NULL,
  `segundo_parcial` double NOT NULL,
  `tercer_parcial` double NOT NULL,
  `examen` double NOT NULL,
  `promedio` double NOT NULL,
  `total_promedio_general` double NOT NULL,
  `id_estudiante` int(11) NOT NULL,
  `id_general_quimestre` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle_registro_notas`),
  KEY `mov_detalle_registro_id_estudiante_3ae5821d_fk_mant_estu` (`id_estudiante`),
  KEY `mov_detalle_registro_id_general_quimestre_50304210_fk_genr_gene` (`id_general_quimestre`),
  CONSTRAINT `mov_detalle_registro_id_estudiante_3ae5821d_fk_mant_estu` FOREIGN KEY (`id_estudiante`) REFERENCES `mant_estudiante` (`id_estudiante`),
  CONSTRAINT `mov_detalle_registro_id_general_quimestre_50304210_fk_genr_gene` FOREIGN KEY (`id_general_quimestre`) REFERENCES `genr_general` (`idgenr_general`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_detalle_registro_notas`
--

LOCK TABLES `mov_detalle_registro_notas` WRITE;
/*!40000 ALTER TABLE `mov_detalle_registro_notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `mov_detalle_registro_notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mov_estudiante_asignacion_curso`
--

DROP TABLE IF EXISTS `mov_estudiante_asignacion_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mov_estudiante_asignacion_curso` (
  `id_estudiante_curso` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_ingreso` datetime(6) NOT NULL,
  `usuario_ing` varchar(45) NOT NULL,
  `terminal_ing` varchar(45) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `id_estudiante` int(11) NOT NULL,
  PRIMARY KEY (`id_estudiante_curso`),
  KEY `mov_estudiante_asign_id_curso_276599f5_fk_mov_cab_c` (`id_curso`),
  KEY `mov_estudiante_asign_id_estudiante_f09035df_fk_mant_estu` (`id_estudiante`),
  CONSTRAINT `mov_estudiante_asign_id_curso_276599f5_fk_mov_cab_c` FOREIGN KEY (`id_curso`) REFERENCES `mov_cab_curso` (`id_curso`),
  CONSTRAINT `mov_estudiante_asign_id_estudiante_f09035df_fk_mant_estu` FOREIGN KEY (`id_estudiante`) REFERENCES `mant_estudiante` (`id_estudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_estudiante_asignacion_curso`
--

LOCK TABLES `mov_estudiante_asignacion_curso` WRITE;
/*!40000 ALTER TABLE `mov_estudiante_asignacion_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `mov_estudiante_asignacion_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mov_matriculacion_estudiante`
--

DROP TABLE IF EXISTS `mov_matriculacion_estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mov_matriculacion_estudiante` (
  `id_matriculacion_estudiante` int(11) NOT NULL AUTO_INCREMENT,
  `id_anio_lectivo` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `id_estudiante` int(11) NOT NULL,
  PRIMARY KEY (`id_matriculacion_estudiante`),
  KEY `mov_matriculacion_es_id_anio_lectivo_67a84072_fk_mant_anio` (`id_anio_lectivo`),
  KEY `mov_matriculacion_es_id_curso_4025598b_fk_mov_cab_c` (`id_curso`),
  KEY `mov_matriculacion_es_id_estudiante_919bb5ca_fk_mant_estu` (`id_estudiante`),
  CONSTRAINT `mov_matriculacion_es_id_anio_lectivo_67a84072_fk_mant_anio` FOREIGN KEY (`id_anio_lectivo`) REFERENCES `mant_anio_lectivo` (`id_anio_lectivo`),
  CONSTRAINT `mov_matriculacion_es_id_curso_4025598b_fk_mov_cab_c` FOREIGN KEY (`id_curso`) REFERENCES `mov_cab_curso` (`id_curso`),
  CONSTRAINT `mov_matriculacion_es_id_estudiante_919bb5ca_fk_mant_estu` FOREIGN KEY (`id_estudiante`) REFERENCES `mant_estudiante` (`id_estudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_matriculacion_estudiante`
--

LOCK TABLES `mov_matriculacion_estudiante` WRITE;
/*!40000 ALTER TABLE `mov_matriculacion_estudiante` DISABLE KEYS */;
/*!40000 ALTER TABLE `mov_matriculacion_estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sa_prueba'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-20 16:11:03
