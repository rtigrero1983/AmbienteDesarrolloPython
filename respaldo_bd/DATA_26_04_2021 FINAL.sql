-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_academico
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add (\'Menu\',)',7,'add_confmenu'),(26,'Can change (\'Menu\',)',7,'change_confmenu'),(27,'Can delete (\'Menu\',)',7,'delete_confmenu'),(28,'Can view (\'Menu\',)',7,'view_confmenu'),(29,'Can add (\'Modulo\',)',8,'add_confmodulo'),(30,'Can change (\'Modulo\',)',8,'change_confmodulo'),(31,'Can delete (\'Modulo\',)',8,'delete_confmodulo'),(32,'Can view (\'Modulo\',)',8,'view_confmodulo'),(33,'Can add (\'Rol\',)',9,'add_confrol'),(34,'Can change (\'Rol\',)',9,'change_confrol'),(35,'Can delete (\'Rol\',)',9,'delete_confrol'),(36,'Can view (\'Rol\',)',9,'view_confrol'),(37,'Can add (\'Usuario\',)',10,'add_confusuario'),(38,'Can change (\'Usuario\',)',10,'change_confusuario'),(39,'Can delete (\'Usuario\',)',10,'delete_confusuario'),(40,'Can view (\'Usuario\',)',10,'view_confusuario'),(41,'Can add (\'Lista\',)',11,'add_genrgeneral'),(42,'Can change (\'Lista\',)',11,'change_genrgeneral'),(43,'Can delete (\'Lista\',)',11,'delete_genrgeneral'),(44,'Can view (\'Lista\',)',11,'view_genrgeneral'),(45,'Can add (\'Año lectivo\',)',12,'add_mantaniolectivo'),(46,'Can change (\'Año lectivo\',)',12,'change_mantaniolectivo'),(47,'Can delete (\'Año lectivo\',)',12,'delete_mantaniolectivo'),(48,'Can view (\'Año lectivo\',)',12,'view_mantaniolectivo'),(49,'Can add (\'Empleado\',)',13,'add_mantempleado'),(50,'Can change (\'Empleado\',)',13,'change_mantempleado'),(51,'Can delete (\'Empleado\',)',13,'delete_mantempleado'),(52,'Can view (\'Empleado\',)',13,'view_mantempleado'),(53,'Can add (\'Estudiante\',)',14,'add_mantestudiante'),(54,'Can change (\'Estudiante\',)',14,'change_mantestudiante'),(55,'Can delete (\'Estudiante\',)',14,'delete_mantestudiante'),(56,'Can view (\'Estudiante\',)',14,'view_mantestudiante'),(57,'Can add (\'Persona\',)',15,'add_mantpersona'),(58,'Can change (\'Persona\',)',15,'change_mantpersona'),(59,'Can delete (\'Persona\',)',15,'delete_mantpersona'),(60,'Can view (\'Persona\',)',15,'view_mantpersona'),(61,'Can add Ani_electivo_curso_paralelo',16,'add_mov_aniolectivo_curso'),(62,'Can change Ani_electivo_curso_paralelo',16,'change_mov_aniolectivo_curso'),(63,'Can delete Ani_electivo_curso_paralelo',16,'delete_mov_aniolectivo_curso'),(64,'Can view Ani_electivo_curso_paralelo',16,'view_mov_aniolectivo_curso'),(65,'Can add Mov_Materia_profesor',17,'add_mov_materia_profesor'),(66,'Can change Mov_Materia_profesor',17,'change_mov_materia_profesor'),(67,'Can delete Mov_Materia_profesor',17,'delete_mov_materia_profesor'),(68,'Can view Mov_Materia_profesor',17,'view_mov_materia_profesor'),(69,'Can add Usuario_temp',18,'add_usuariotemp'),(70,'Can change Usuario_temp',18,'change_usuariotemp'),(71,'Can delete Usuario_temp',18,'delete_usuariotemp'),(72,'Can view Usuario_temp',18,'view_usuariotemp'),(73,'Can add Matriculacion estudiante',19,'add_movmatriculacionestudiante'),(74,'Can change Matriculacion estudiante',19,'change_movmatriculacionestudiante'),(75,'Can delete Matriculacion estudiante',19,'delete_movmatriculacionestudiante'),(76,'Can view Matriculacion estudiante',19,'view_movmatriculacionestudiante'),(77,'Can add Detalle Registro de Curso',20,'add_movdetalleregistronotas'),(78,'Can change Detalle Registro de Curso',20,'change_movdetalleregistronotas'),(79,'Can delete Detalle Registro de Curso',20,'delete_movdetalleregistronotas'),(80,'Can view Detalle Registro de Curso',20,'view_movdetalleregistronotas'),(81,'Can add Detalle Materia Curso',21,'add_movdetallemateriacurso'),(82,'Can change Detalle Materia Curso',21,'change_movdetallemateriacurso'),(83,'Can delete Detalle Materia Curso',21,'delete_movdetallemateriacurso'),(84,'Can view Detalle Materia Curso',21,'view_movdetallemateriacurso'),(85,'Can add Registro Notas',22,'add_movcabregistronotas'),(86,'Can change Registro Notas',22,'change_movcabregistronotas'),(87,'Can delete Registro Notas',22,'delete_movcabregistronotas'),(88,'Can view Registro Notas',22,'view_movcabregistronotas'),(89,'Can add Curso',23,'add_movcabcurso'),(90,'Can change Curso',23,'change_movcabcurso'),(91,'Can delete Curso',23,'delete_movcabcurso'),(92,'Can view Curso',23,'view_movcabcurso'),(93,'Can add Admision',24,'add_movadmision'),(94,'Can change Admision',24,'change_movadmision'),(95,'Can delete Admision',24,'delete_movadmision'),(96,'Can view Admision',24,'view_movadmision'),(97,'Can add Mov_Horas_docente',25,'add_mov_horas_docente'),(98,'Can change Mov_Horas_docente',25,'change_mov_horas_docente'),(99,'Can delete Mov_Horas_docente',25,'delete_mov_horas_docente'),(100,'Can view Mov_Horas_docente',25,'view_mov_horas_docente'),(101,'Can add Mov_Horario_materia',26,'add_mov_horario_materia'),(102,'Can change Mov_Horario_materia',26,'change_mov_horario_materia'),(103,'Can delete Mov_Horario_materia',26,'delete_mov_horario_materia'),(104,'Can view Mov_Horario_materia',26,'view_mov_horario_materia'),(105,'Can add (\'Representante\',)',27,'add_mantrepresentante'),(106,'Can change (\'Representante\',)',27,'change_mantrepresentante'),(107,'Can delete (\'Representante\',)',27,'delete_mantrepresentante'),(108,'Can view (\'Representante\',)',27,'view_mantrepresentante'),(109,'Can add (\'Lista\',)',28,'add_genrhistorial'),(110,'Can change (\'Lista\',)',28,'change_genrhistorial'),(111,'Can delete (\'Lista\',)',28,'delete_genrhistorial'),(112,'Can view (\'Lista\',)',28,'view_genrhistorial'),(113,'Can add (\'Permiso\',)',29,'add_confpermiso'),(114,'Can change (\'Permiso\',)',29,'change_confpermiso'),(115,'Can delete (\'Permiso\',)',29,'delete_confpermiso'),(116,'Can view (\'Permiso\',)',29,'view_confpermiso'),(117,'Can add Modulo_Menu',30,'add_confmodulo_menu'),(118,'Can change Modulo_Menu',30,'change_confmodulo_menu'),(119,'Can delete Modulo_Menu',30,'delete_confmodulo_menu'),(120,'Can view Modulo_Menu',30,'view_confmodulo_menu'),(121,'Can add (\'Empresa\',)',31,'add_confempresa'),(122,'Can change (\'Empresa\',)',31,'change_confempresa'),(123,'Can delete (\'Empresa\',)',31,'delete_confempresa'),(124,'Can view (\'Empresa\',)',31,'view_confempresa'),(125,'Can add (\'Correos Smpt\',)',32,'add_confcorreossmpt'),(126,'Can change (\'Correos Smpt\',)',32,'change_confcorreossmpt'),(127,'Can delete (\'Correos Smpt\',)',32,'delete_confcorreossmpt'),(128,'Can view (\'Correos Smpt\',)',32,'view_confcorreossmpt'),(129,'Can add Accion',33,'add_confaccion'),(130,'Can change Accion',33,'change_confaccion'),(131,'Can delete Accion',33,'delete_confaccion'),(132,'Can view Accion',33,'view_confaccion');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (2,'pbkdf2_sha256$150000$Xp0dXhpnOsLS$V2ftBvtTL9Z+rxAAcLBD4ZrPwSHynEwPSFN4dSpw7ms=','2020-11-06 00:05:05.686973',1,'anderson','','','afullink@gmail.com',1,1,'2020-11-06 00:04:34.423401');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_accion`
--

DROP TABLE IF EXISTS `conf_accion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conf_accion` (
  `id_accion` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  `rol` int NOT NULL,
  PRIMARY KEY (`id_accion`),
  KEY `conf_accion_rol_d7718683_fk_conf_rol_id_rol` (`rol`),
  CONSTRAINT `conf_accion_rol_d7718683_fk_conf_rol_id_rol` FOREIGN KEY (`rol`) REFERENCES `conf_rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_accion`
--

LOCK TABLES `conf_accion` WRITE;
/*!40000 ALTER TABLE `conf_accion` DISABLE KEYS */;
INSERT INTO `conf_accion` VALUES (2,'Agregar',3),(3,'Editar',3),(4,'Imprimir',3),(5,'Eliminar',3),(6,'Editar',7);
/*!40000 ALTER TABLE `conf_accion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_accion_menu`
--

DROP TABLE IF EXISTS `conf_accion_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conf_accion_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `confaccion_id` int NOT NULL,
  `confmenu_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `conf_accion_menu_confaccion_id_confmenu_id_a67c15a8_uniq` (`confaccion_id`,`confmenu_id`),
  KEY `conf_accion_menu_confmenu_id_88cd0db1_fk_conf_menu_id_menu` (`confmenu_id`),
  CONSTRAINT `conf_accion_menu_confaccion_id_57e43ae7_fk_conf_accion_id_accion` FOREIGN KEY (`confaccion_id`) REFERENCES `conf_accion` (`id_accion`),
  CONSTRAINT `conf_accion_menu_confmenu_id_88cd0db1_fk_conf_menu_id_menu` FOREIGN KEY (`confmenu_id`) REFERENCES `conf_menu` (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_accion_menu`
--

LOCK TABLES `conf_accion_menu` WRITE;
/*!40000 ALTER TABLE `conf_accion_menu` DISABLE KEYS */;
INSERT INTO `conf_accion_menu` VALUES (14,2,25),(22,2,33),(9,2,34),(18,2,35),(15,2,36),(20,2,38),(10,3,34),(19,3,35),(2,3,36),(21,3,38),(7,4,23),(5,4,36),(6,4,37),(12,5,26),(13,5,34),(16,5,36),(17,5,37),(23,6,27),(24,6,28),(25,6,45);
/*!40000 ALTER TABLE `conf_accion_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_correos_smpt`
--

DROP TABLE IF EXISTS `conf_correos_smpt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conf_correos_smpt` (
  `id_correos_smpt` int NOT NULL AUTO_INCREMENT,
  `ssl` varchar(30) NOT NULL,
  `dominio` varchar(30) NOT NULL,
  `puerto` varchar(20) NOT NULL,
  `usuario_c` varchar(100) NOT NULL,
  `contrasenia_c` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `id_genr_estado` int NOT NULL,
  PRIMARY KEY (`id_correos_smpt`),
  UNIQUE KEY `usuario_c` (`usuario_c`),
  KEY `conf_correos_smpt_id_genr_estado_0164f920_fk_genr_gene` (`id_genr_estado`),
  CONSTRAINT `conf_correos_smpt_id_genr_estado_0164f920_fk_genr_gene` FOREIGN KEY (`id_genr_estado`) REFERENCES `genr_general` (`idgenr_general`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_correos_smpt`
--

LOCK TABLES `conf_correos_smpt` WRITE;
/*!40000 ALTER TABLE `conf_correos_smpt` DISABLE KEYS */;
/*!40000 ALTER TABLE `conf_correos_smpt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_empresa`
--

DROP TABLE IF EXISTS `conf_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conf_empresa` (
  `id_empresa` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `razon_social` varchar(200) NOT NULL,
  `identificacion` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `representante_legal` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `usuario_ing` varchar(45) DEFAULT NULL,
  `terminal_ing` varchar(45) DEFAULT NULL,
  `estado` int NOT NULL,
  `id_genr_tipo_identificacion` int NOT NULL,
  PRIMARY KEY (`id_empresa`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `identificacion` (`identificacion`),
  KEY `conf_empresa_estado_88988ab2_fk_genr_general_idgenr_general` (`estado`),
  KEY `conf_empresa_id_genr_tipo_identif_24d6ebf1_fk_genr_gene` (`id_genr_tipo_identificacion`),
  CONSTRAINT `conf_empresa_estado_88988ab2_fk_genr_general_idgenr_general` FOREIGN KEY (`estado`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `conf_empresa_id_genr_tipo_identif_24d6ebf1_fk_genr_gene` FOREIGN KEY (`id_genr_tipo_identificacion`) REFERENCES `genr_general` (`idgenr_general`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_empresa`
--

LOCK TABLES `conf_empresa` WRITE;
/*!40000 ALTER TABLE `conf_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `conf_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_menu`
--

DROP TABLE IF EXISTS `conf_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conf_menu` (
  `id_menu` int NOT NULL AUTO_INCREMENT,
  `id_padre` int NOT NULL,
  `orden` int NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `url` varchar(60) NOT NULL,
  `icono` varchar(50) NOT NULL,
  `lazy_name` varchar(60) NOT NULL,
  `name` varchar(60) NOT NULL,
  `view` varchar(45) NOT NULL,
  `id_genr_estado` int NOT NULL,
  PRIMARY KEY (`id_menu`),
  UNIQUE KEY `descripcion` (`descripcion`),
  KEY `conf_menu_id_genr_estado_5c3ac300_fk_genr_general_idgenr_general` (`id_genr_estado`),
  CONSTRAINT `conf_menu_id_genr_estado_5c3ac300_fk_genr_general_idgenr_general` FOREIGN KEY (`id_genr_estado`) REFERENCES `genr_general` (`idgenr_general`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_menu`
--

LOCK TABLES `conf_menu` WRITE;
/*!40000 ALTER TABLE `conf_menu` DISABLE KEYS */;
INSERT INTO `conf_menu` VALUES (23,0,5,'Configuraciones','#','fas fa-fw fa-cog','#','#','#',97),(24,0,4,'Reportes Especiales','#','fas fa-fw fa-wrench','#','#','#',97),(25,0,3,'Registro Notas','#','fas fa-fw fa-chart-area','#','#','#',97),(26,0,2,'Matriculacion','#','fas fa-fw fa-table','#','#','#',97),(27,0,1,'Admision','#','fas fa-fw fa-folder','#','#','#',97),(28,27,13,'Mantenimiento','#','fas fa-fw fa-folder','#','#','#',97),(30,27,15,'Consultas','Academico:consultas','fas fa-fw fa-folder','consultas/','consultas','consultas',98),(32,27,17,'ReporteMant','#','fas fa-fw fa-folder','#','#','#',97),(33,23,2,'Usuarios','Academico:usuarios','fas fa-fw fa-cog','usuarios/','usuarios','usuarios',97),(34,23,3,'Roles','Academico:roles','fas fa-fw fa-cog','roles/','roles','roles',97),(35,23,4,'Permisos','Academico:permisos','fas fa-fw fa-cog','perfiles/','permisos','perfiles',97),(36,23,5,'Menu','Academico:menu','fas fa-fw fa-cog','menu/','menu','menu',97),(37,23,6,'Modulo','Academico:modulo','fas fa-fw fa-cog','modulo/','modulo','modulo',97),(38,23,7,'Acciones','Academico:acciones','fas fa-fw fa-cog','acciones/','acciones','acciones',97),(40,23,8,'Unidad','Academico:empresas','fas fa-fw fa-cog','empresas/','empresas','empresas',97),(45,28,1,'Estudiantes','Academico:estudiante','fas fa-fw fa-folder','estudiante/','estudiante','Estudiante',97),(46,28,2,'Empleados','Academico:empleado','fas fa-fw fa-folder','empleado/','empleado','Empleado',97),(47,23,10,'Reporte Conf','#','fas fa-fw fa-cog','#','#','#',97),(48,47,1,'Reporte Usuario','Academico:reporte_usuarios','fas fa-fw fa-cog','reporte_usuarios/','reporte_usuarios','reporte_usuarios',97),(49,47,2,'Reporte Rol','Academico:reporte_roles','fas fa-fw fa-cog','reporte_roles/','reporte_roles','reporte_roles',97),(50,32,1,'ReporteEst','Academico:reporte_estudiante','fas fa-fw fa-folder','reporte_estudiante/','reporte_estudiante','reporte_estudiante',97),(51,32,2,'ReporteEmp','Academico:reporte_empleado','fas fa-fw fa-folder','reporte_empleado/','reporte_empleado','reporte_empleado',97),(52,26,1,'M Mantenimientos','#','fas fa-fw fa-table','#','#','#',97),(53,52,1,'Año Lectivo','Academico:anio_lectivo','fas fa-fw fa-table','anio_lectivo/','anio_lectivo','anio_lectivo',97),(54,26,2,'M Movimientos','#','fas fa-fw fa-table','#','#','#',97),(55,26,3,'M Procesos','#','fas fa-fw fa-table','#','#','#',97),(57,54,1,'AñoLectivo/Curso','Academico:asignacion_curso','fas fa-fw fa-table','asignacion_curso/','asignacion_curso','asignacion_curso',97),(58,52,2,'General','Academico:general','fas fa-fw fa-table','general/','general','general',97),(60,23,11,'SMTP','Academico:agregar_smtp','fas fa-fw fa-cog','agregar_smtp/','agregar_smtp','agregar_smtp',97),(61,26,5,'Asignaciones','#','fas fa-fw fa-table','#','#','#',97),(62,61,1,'Materia/Profesor','Academico:asignacion_materiasprof','fas fa-fw fa-table','asignacion_materiasprof/','asignacion_materiasprof','asignacion_materiasprof',97),(63,61,2,'Materia/Curso','Academico:asignacion_materia_curso','fas fa-fw fa-table','asignacion_materia_curso/','asignacion_materia_curso','asignacion_materia_curso',97),(64,61,2,'Horario/Curso','Academico:crear_horariocurso','fas fa-fw fa-table','crear_horariocurso','crear_horariocurso','crear_horariocurso',97),(66,26,6,'Reportes/Matriculacion','#','fas fa-fw fa-table','#','#','#',97),(67,66,1,'Horarios/Estudiantes','Academico:reporte_horarioestudy','fas fa-fw fa-table','reporte_horarioestudy/','reporte_horarioestudy','reporte_horarioestudy',97),(68,66,2,'Horarios/Profesores','Academico:Horario_profesor','fas fa-fw fa-table','Horario_profesor/','Horario_profesor','Horario_profesor',97),(69,52,3,'Cursos','Academico:cursos','fas fa-fw fa-table','cursos','cursos','ListaCurso',97),(70,25,1,'Notas Estudiante','Academico:registro_notas','fas fa-fw fa-chart-area','registronotas/','registro_notas','registro_notas',97),(71,54,2,'Validar/Matricula','Academico:estudiante_filtro','fas fa-fw fa-table','estudiantes_filtro/','estudiante_filtro','filtro_estudiantes',97),(72,54,3,'Pre-Registro','Academico:read_file','fas fa-fw fa-table','read_file','read_file','Upload_File',97),(73,61,3,'Horario','Academico:horario_curso','fas fa-fw fa-table','horario_curso/','horario_curso','horario_curso',97);
/*!40000 ALTER TABLE `conf_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_modulo`
--

DROP TABLE IF EXISTS `conf_modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conf_modulo` (
  `id_modulo` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `id_genr_estado` int NOT NULL,
  PRIMARY KEY (`id_modulo`),
  UNIQUE KEY `codigo` (`codigo`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `conf_modulo_id_genr_estado_7ac01822_fk_genr_gene` (`id_genr_estado`),
  CONSTRAINT `conf_modulo_id_genr_estado_7ac01822_fk_genr_gene` FOREIGN KEY (`id_genr_estado`) REFERENCES `genr_general` (`idgenr_general`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_modulo`
--

LOCK TABLES `conf_modulo` WRITE;
/*!40000 ALTER TABLE `conf_modulo` DISABLE KEYS */;
INSERT INTO `conf_modulo` VALUES (6,'001','Admisiones',97),(7,'002','Matriculaciones',97),(8,'003','Registro Notas',97),(9,'004','Reportes Especiales',97),(10,'005','Configuraciones',97);
/*!40000 ALTER TABLE `conf_modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_modulo_menu`
--

DROP TABLE IF EXISTS `conf_modulo_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conf_modulo_menu` (
  `id_modulo_menu` int NOT NULL AUTO_INCREMENT,
  `id_genr_estado` int NOT NULL,
  `id_menu` int NOT NULL,
  `id_modulo` int NOT NULL,
  PRIMARY KEY (`id_modulo_menu`),
  KEY `conf_modulo_menu_id_genr_estado_210b4a0c_fk_genr_gene` (`id_genr_estado`),
  KEY `conf_modulo_menu_id_menu_5439ef13_fk_conf_menu_id_menu` (`id_menu`),
  KEY `conf_modulo_menu_id_modulo_0d359a15_fk_conf_modulo_id_modulo` (`id_modulo`),
  CONSTRAINT `conf_modulo_menu_id_genr_estado_210b4a0c_fk_genr_gene` FOREIGN KEY (`id_genr_estado`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `conf_modulo_menu_id_menu_5439ef13_fk_conf_menu_id_menu` FOREIGN KEY (`id_menu`) REFERENCES `conf_menu` (`id_menu`),
  CONSTRAINT `conf_modulo_menu_id_modulo_0d359a15_fk_conf_modulo_id_modulo` FOREIGN KEY (`id_modulo`) REFERENCES `conf_modulo` (`id_modulo`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_modulo_menu`
--

LOCK TABLES `conf_modulo_menu` WRITE;
/*!40000 ALTER TABLE `conf_modulo_menu` DISABLE KEYS */;
INSERT INTO `conf_modulo_menu` VALUES (15,97,23,10),(16,97,24,9),(17,97,25,8),(18,97,26,7),(19,97,27,6),(20,97,28,6),(22,97,30,6),(24,97,32,6),(25,97,33,10),(26,97,34,10),(27,97,35,10),(28,97,36,10),(29,97,37,10),(30,97,38,10),(31,97,40,10),(34,97,47,6),(35,97,48,6),(36,97,49,6),(37,97,60,10);
/*!40000 ALTER TABLE `conf_modulo_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_permiso`
--

DROP TABLE IF EXISTS `conf_permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conf_permiso` (
  `id_permiso` int NOT NULL AUTO_INCREMENT,
  `id_rol` int NOT NULL,
  PRIMARY KEY (`id_permiso`),
  KEY `conf_permiso_id_rol_b839125a_fk_conf_rol_id_rol` (`id_rol`),
  CONSTRAINT `conf_permiso_id_rol_b839125a_fk_conf_rol_id_rol` FOREIGN KEY (`id_rol`) REFERENCES `conf_rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_permiso`
--

LOCK TABLES `conf_permiso` WRITE;
/*!40000 ALTER TABLE `conf_permiso` DISABLE KEYS */;
INSERT INTO `conf_permiso` VALUES (1,3),(2,5),(3,7);
/*!40000 ALTER TABLE `conf_permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_permiso_menu`
--

DROP TABLE IF EXISTS `conf_permiso_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conf_permiso_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `confpermiso_id` int NOT NULL,
  `confmenu_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `conf_permiso_menu_confpermiso_id_confmenu_id_15507891_uniq` (`confpermiso_id`,`confmenu_id`),
  KEY `conf_permiso_menu_confmenu_id_d211447b_fk_conf_menu_id_menu` (`confmenu_id`),
  CONSTRAINT `conf_permiso_menu_confmenu_id_d211447b_fk_conf_menu_id_menu` FOREIGN KEY (`confmenu_id`) REFERENCES `conf_menu` (`id_menu`),
  CONSTRAINT `conf_permiso_menu_confpermiso_id_62c12aa1_fk_conf_perm` FOREIGN KEY (`confpermiso_id`) REFERENCES `conf_permiso` (`id_permiso`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_permiso_menu`
--

LOCK TABLES `conf_permiso_menu` WRITE;
/*!40000 ALTER TABLE `conf_permiso_menu` DISABLE KEYS */;
INSERT INTO `conf_permiso_menu` VALUES (2,1,23),(10,1,24),(11,1,25),(12,1,26),(13,1,27),(14,1,28),(16,1,30),(5,1,32),(3,1,33),(6,1,34),(1,1,35),(22,1,36),(7,1,37),(8,1,38),(9,1,40),(23,1,45),(24,1,46),(25,1,47),(26,1,48),(27,1,49),(28,1,50),(29,1,51),(30,1,52),(31,1,53),(33,1,54),(34,1,55),(36,1,57),(35,1,58),(38,1,60),(39,1,61),(40,1,62),(41,1,63),(42,1,64),(44,1,66),(45,1,67),(46,1,68),(47,1,69),(48,1,70),(56,1,71),(54,1,72),(55,1,73),(51,2,25),(49,2,70),(57,3,27),(58,3,28),(59,3,45);
/*!40000 ALTER TABLE `conf_permiso_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_rol`
--

DROP TABLE IF EXISTS `conf_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conf_rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `id_genr_estado` int NOT NULL,
  PRIMARY KEY (`id_rol`),
  KEY `conf_rol_id_genr_estado_73f22c71_fk_genr_general_idgenr_general` (`id_genr_estado`),
  CONSTRAINT `conf_rol_id_genr_estado_73f22c71_fk_genr_general_idgenr_general` FOREIGN KEY (`id_genr_estado`) REFERENCES `genr_general` (`idgenr_general`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_rol`
--

LOCK TABLES `conf_rol` WRITE;
/*!40000 ALTER TABLE `conf_rol` DISABLE KEYS */;
INSERT INTO `conf_rol` VALUES (3,'001','Administrativo',97),(5,'002','Profesor',97),(6,'003','Estudiantes',97),(7,'004','Representante',97),(8,' ',' ',98);
/*!40000 ALTER TABLE `conf_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_usuario`
--

DROP TABLE IF EXISTS `conf_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conf_usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `id_genr_estado` int NOT NULL,
  `id_genr_tipo_usuario` int NOT NULL,
  `id_persona` int NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usuario` (`usuario`),
  KEY `conf_usuario_id_genr_estado_b989846a_fk_genr_gene` (`id_genr_estado`),
  KEY `conf_usuario_id_genr_tipo_usuario_cd3441b2_fk_genr_gene` (`id_genr_tipo_usuario`),
  KEY `conf_usuario_id_persona_a923aec6_fk_mant_persona_id_persona` (`id_persona`),
  CONSTRAINT `conf_usuario_id_genr_estado_b989846a_fk_genr_gene` FOREIGN KEY (`id_genr_estado`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `conf_usuario_id_genr_tipo_usuario_cd3441b2_fk_genr_gene` FOREIGN KEY (`id_genr_tipo_usuario`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `conf_usuario_id_persona_a923aec6_fk_mant_persona_id_persona` FOREIGN KEY (`id_persona`) REFERENCES `mant_persona` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_usuario`
--

LOCK TABLES `conf_usuario` WRITE;
/*!40000 ALTER TABLE `conf_usuario` DISABLE KEYS */;
INSERT INTO `conf_usuario` VALUES (1,'luisillo21','a41801fb6bc6eca2e22271ae04da2adfb19cdefa',97,21,3),(2,'cristof','021af8a6c1322becec0dca0ecf4037a85b6a126a',97,21,3),(3,'Anderson','ce7553052eeef5e7dd3eaf0cb9583e69e54ac8b7',97,20,9),(4,'anthony','ff0f0465d12e159780c8f176828f3d3ed22b69f0',97,19,42),(5,'saber14','ff0f0465d12e159780c8f176828f3d3ed22b69f0',97,22,42),(6,'saber01','c3d5252c82a827dbcba386ebb0bec4dd10c1b8dd',98,20,42),(7,'saber02','c3d5252c82a827dbcba386ebb0bec4dd10c1b8dd',98,20,42),(8,'Saber15','a41801fb6bc6eca2e22271ae04da2adfb19cdefa',97,20,12);
/*!40000 ALTER TABLE `conf_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_usuario_rol`
--

DROP TABLE IF EXISTS `conf_usuario_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conf_usuario_rol` (
  `id` int NOT NULL AUTO_INCREMENT,
  `confusuario_id` int NOT NULL,
  `confrol_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `conf_usuario_rol_confusuario_id_confrol_id_e79f5226_uniq` (`confusuario_id`,`confrol_id`),
  KEY `conf_usuario_rol_confrol_id_dfb3f537_fk_conf_rol_id_rol` (`confrol_id`),
  CONSTRAINT `conf_usuario_rol_confrol_id_dfb3f537_fk_conf_rol_id_rol` FOREIGN KEY (`confrol_id`) REFERENCES `conf_rol` (`id_rol`),
  CONSTRAINT `conf_usuario_rol_confusuario_id_eff85f64_fk_conf_usua` FOREIGN KEY (`confusuario_id`) REFERENCES `conf_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_usuario_rol`
--

LOCK TABLES `conf_usuario_rol` WRITE;
/*!40000 ALTER TABLE `conf_usuario_rol` DISABLE KEYS */;
INSERT INTO `conf_usuario_rol` VALUES (1,1,3),(2,2,3),(3,3,5),(4,4,6),(5,5,7),(6,6,5),(7,7,5),(8,8,5);
/*!40000 ALTER TABLE `conf_usuario_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_usuarios_temp`
--

DROP TABLE IF EXISTS `conf_usuarios_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conf_usuarios_temp` (
  `id_usuario_temp` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `fecha_limite` date DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `correo` varchar(254) NOT NULL,
  `id_persona` int DEFAULT NULL,
  `id_rol` int NOT NULL,
  PRIMARY KEY (`id_usuario_temp`),
  UNIQUE KEY `usuario` (`usuario`),
  KEY `conf_usuarios_temp_id_persona_e8404d96_fk_mant_pers` (`id_persona`),
  KEY `conf_usuarios_temp_id_rol_acab50dd_fk_conf_rol_id_rol` (`id_rol`),
  CONSTRAINT `conf_usuarios_temp_id_persona_e8404d96_fk_mant_pers` FOREIGN KEY (`id_persona`) REFERENCES `mant_persona` (`id_persona`),
  CONSTRAINT `conf_usuarios_temp_id_rol_acab50dd_fk_conf_rol_id_rol` FOREIGN KEY (`id_rol`) REFERENCES `conf_rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_usuarios_temp`
--

LOCK TABLES `conf_usuarios_temp` WRITE;
/*!40000 ALTER TABLE `conf_usuarios_temp` DISABLE KEYS */;
INSERT INTO `conf_usuarios_temp` VALUES (1,'holitas','021af8a6c1322becec0dca0ecf4037a85b6a126a','2021-04-26','2021-04-26','chrisbryan@hotmail.com',10,8);
/*!40000 ALTER TABLE `conf_usuarios_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-11-06 00:09:02.258645','8','Anderson',3,'',15,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(33,'GestionAcademica','confaccion'),(32,'GestionAcademica','confcorreossmpt'),(31,'GestionAcademica','confempresa'),(7,'GestionAcademica','confmenu'),(8,'GestionAcademica','confmodulo'),(30,'GestionAcademica','confmodulo_menu'),(29,'GestionAcademica','confpermiso'),(9,'GestionAcademica','confrol'),(10,'GestionAcademica','confusuario'),(11,'GestionAcademica','genrgeneral'),(28,'GestionAcademica','genrhistorial'),(12,'GestionAcademica','mantaniolectivo'),(13,'GestionAcademica','mantempleado'),(14,'GestionAcademica','mantestudiante'),(15,'GestionAcademica','mantpersona'),(27,'GestionAcademica','mantrepresentante'),(16,'GestionAcademica','mov_aniolectivo_curso'),(26,'GestionAcademica','mov_horario_materia'),(25,'GestionAcademica','mov_horas_docente'),(17,'GestionAcademica','mov_materia_profesor'),(24,'GestionAcademica','movadmision'),(23,'GestionAcademica','movcabcurso'),(22,'GestionAcademica','movcabregistronotas'),(21,'GestionAcademica','movdetallemateriacurso'),(20,'GestionAcademica','movdetalleregistronotas'),(19,'GestionAcademica','movmatriculacionestudiante'),(18,'GestionAcademica','usuariotemp'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'GestionAcademica','0001_initial','2021-03-20 15:27:37.985587'),(2,'contenttypes','0001_initial','2021-03-20 15:28:14.433548'),(3,'auth','0001_initial','2021-03-20 15:28:15.082550'),(4,'admin','0001_initial','2021-03-20 15:28:17.218399'),(5,'admin','0002_logentry_remove_auto_add','2021-03-20 15:28:17.877404'),(6,'admin','0003_logentry_add_action_flag_choices','2021-03-20 15:28:17.924401'),(7,'contenttypes','0002_remove_content_type_name','2021-03-20 15:28:18.708401'),(8,'auth','0002_alter_permission_name_max_length','2021-03-20 15:28:19.030403'),(9,'auth','0003_alter_user_email_max_length','2021-03-20 15:28:19.158400'),(10,'auth','0004_alter_user_username_opts','2021-03-20 15:28:19.192400'),(11,'auth','0005_alter_user_last_login_null','2021-03-20 15:28:19.764401'),(12,'auth','0006_require_contenttypes_0002','2021-03-20 15:28:19.790400'),(13,'auth','0007_alter_validators_add_error_messages','2021-03-20 15:28:19.828407'),(14,'auth','0008_alter_user_username_max_length','2021-03-20 15:28:20.134400'),(15,'auth','0009_alter_user_last_name_max_length','2021-03-20 15:28:20.455400'),(16,'auth','0010_alter_group_name_max_length','2021-03-20 15:28:20.529401'),(17,'auth','0011_update_proxy_permissions','2021-03-20 15:28:20.627403'),(18,'sessions','0001_initial','2021-03-20 15:28:20.732398'),(19,'GestionAcademica','0002_auto_20210425_1651','2021-04-26 05:09:51.942453'),(20,'GestionAcademica','0003_auto_20210426_0037','2021-04-26 05:39:30.221390'),(21,'GestionAcademica','0004_auto_20210426_0222','2021-04-26 07:23:08.814184'),(22,'GestionAcademica','0005_auto_20210426_1829','2021-04-26 23:35:27.415167');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0kcjhss7v5asgq0mhv2ro8g6njx2jozq','NzU2MmUyODBiMzZiNjVhNTE5ODY1ZTc3MDU0NmYxYmRiNzMyMGJlZTp7InVzdWFyaW8iOjF9','2021-04-02 01:50:16.112685'),('1n5zhvx31itpqwuvgneq6ote7n9347z2','NzU2MmUyODBiMzZiNjVhNTE5ODY1ZTc3MDU0NmYxYmRiNzMyMGJlZTp7InVzdWFyaW8iOjF9','2021-04-06 00:26:21.866528'),('5vknxxq5j63pisg9rbputzw3kdmnpa6c','NzU2MmUyODBiMzZiNjVhNTE5ODY1ZTc3MDU0NmYxYmRiNzMyMGJlZTp7InVzdWFyaW8iOjF9','2021-03-18 07:55:16.442013'),('784bl47ibngl9582tl78kl514os2wc04','MmFkOGM0YTBkZGJjZjk0NGI5NThkOGZiNDBiMmMwZTRlM2YwMDE1Njp7InVzdWFyaW8iOjIsInZhbCI6ZmFsc2V9','2021-04-14 13:12:59.952858'),('9riviq9cksympmptigo5ezjlxm96qx76','M2E0NDg0ZWE1ZDAwMmNjZDBjYWRhNzE0YzBjOTE0NjE3OWY2NWE0Yzp7InVzdWFyaW8iOjIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZjJlMGZmZDZmYzM4NzM1NDhjYWRlYTdhOTRkZGMyMWUwYjkwODZkIn0=','2020-11-06 05:56:41.290827'),('bfqwuf65jejzeevct7hnunswk1dmitwo','NzU2MmUyODBiMzZiNjVhNTE5ODY1ZTc3MDU0NmYxYmRiNzMyMGJlZTp7InVzdWFyaW8iOjF9','2021-04-08 23:50:21.211380'),('e9u7s7mdl95323mnyz1pp5kx5j2eu219','NzU2MmUyODBiMzZiNjVhNTE5ODY1ZTc3MDU0NmYxYmRiNzMyMGJlZTp7InVzdWFyaW8iOjF9','2021-04-01 10:19:18.386137'),('fpqxg2t2y2txa9pesobidocxu2u6h6c4','MmFkOGM0YTBkZGJjZjk0NGI5NThkOGZiNDBiMmMwZTRlM2YwMDE1Njp7InVzdWFyaW8iOjIsInZhbCI6ZmFsc2V9','2021-04-27 10:49:58.116074'),('gu4nsits8ssftssujkdikp7dir2po3au','MmFkOGM0YTBkZGJjZjk0NGI5NThkOGZiNDBiMmMwZTRlM2YwMDE1Njp7InVzdWFyaW8iOjIsInZhbCI6ZmFsc2V9','2021-04-27 13:09:07.848610'),('ipnuvzg6mi8ru3m8l9cwbpf320skr6ff','NzU2MmUyODBiMzZiNjVhNTE5ODY1ZTc3MDU0NmYxYmRiNzMyMGJlZTp7InVzdWFyaW8iOjF9','2021-02-18 08:55:35.171292'),('jw4rj7h17xxkk46tsewhr3fwn00365h2','MmFkOGM0YTBkZGJjZjk0NGI5NThkOGZiNDBiMmMwZTRlM2YwMDE1Njp7InVzdWFyaW8iOjIsInZhbCI6ZmFsc2V9','2021-04-27 10:41:52.454729'),('jy3e9bwpnof5lm6ofu9szfujzpcl8dt3','NzU2MmUyODBiMzZiNjVhNTE5ODY1ZTc3MDU0NmYxYmRiNzMyMGJlZTp7InVzdWFyaW8iOjF9','2021-03-30 00:32:54.202735'),('kox1gg9vfqpjsbzjdtzh4nlt04zja1r1','NzU2MmUyODBiMzZiNjVhNTE5ODY1ZTc3MDU0NmYxYmRiNzMyMGJlZTp7InVzdWFyaW8iOjF9','2021-03-31 00:57:54.944346'),('lrzotlf5ouuti1crcbne9c93lmxn5p6c','NjkyYjY4MmYyYzk2ZTJlZTJiZTE0Yzc4ZTRmZTQ5ZDMwZjc2M2NiZjp7InZhbCI6ZmFsc2UsInVzdWFyaW8iOjJ9','2021-04-26 17:58:38.774353'),('n7zhuf3r7xihnjv0hgz074xf5l8ix68f','NzU2MmUyODBiMzZiNjVhNTE5ODY1ZTc3MDU0NmYxYmRiNzMyMGJlZTp7InVzdWFyaW8iOjF9','2021-03-31 20:52:30.929220'),('qdvjloqb4vbbqzv9rprezahz4ndh1arq','MmFkOGM0YTBkZGJjZjk0NGI5NThkOGZiNDBiMmMwZTRlM2YwMDE1Njp7InVzdWFyaW8iOjIsInZhbCI6ZmFsc2V9','2021-04-14 10:54:01.254785'),('s6rg0ybcyre4wzffo8w5q6bkswjhvaja','NzU2MmUyODBiMzZiNjVhNTE5ODY1ZTc3MDU0NmYxYmRiNzMyMGJlZTp7InVzdWFyaW8iOjF9','2021-03-03 08:34:20.271030'),('uynsd62sukq6c1abng2uw311wzyye7k0','NzU2MmUyODBiMzZiNjVhNTE5ODY1ZTc3MDU0NmYxYmRiNzMyMGJlZTp7InVzdWFyaW8iOjF9','2021-03-29 22:06:58.959822'),('x0edazkfn82fu6h2z7klqqz2fd9ezc9l','NzU2MmUyODBiMzZiNjVhNTE5ODY1ZTc3MDU0NmYxYmRiNzMyMGJlZTp7InVzdWFyaW8iOjF9','2021-03-30 20:44:20.760346'),('yp9ldj6rkf6wfcfjcxr4v3uhiypn1amv','MjBlNjQ0MGU1ZTc2YTQ3YTdiNzgxOGZlZGJmNjQxMTllYzgwNjY0ZDp7InVzdWFyaW8iOjh9','2021-04-05 20:38:01.610201'),('z68d4ifdkxnsvulhxr5y2j1cvfw5hu5b','YTZhOTU5YWYyNTk2ZWI3ZTkzNTNjMzNhMDhjMGUzYzNhODBiZTAyMzp7fQ==','2021-04-01 19:38:26.143345');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genr_general`
--

DROP TABLE IF EXISTS `genr_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genr_general` (
  `idgenr_general` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idgenr_general`)
) ENGINE=InnoDB AUTO_INCREMENT=1786 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genr_general`
--

LOCK TABLES `genr_general` WRITE;
/*!40000 ALTER TABLE `genr_general` DISABLE KEYS */;
INSERT INTO `genr_general` VALUES (1,'TIP','GEN','Genero'),(2,'TIP','EST','Estado civil'),(3,'GEN','001','FEMENINO'),(4,'GEN','002','MASCULINO'),(5,'EST','001','CASADO'),(6,'EST','002','SOLTERO'),(7,'TIP','TID','TIPO IDENTIFICACION'),(8,'TID','C','CEDULA'),(9,'TID','R','RUC'),(10,'TID','P','PASAPORTE'),(11,'TIP','TPA','PAISES'),(12,'TPA','016','AMERICA SAMOA'),(13,'TPA','074','BOUVET ISLAND'),(14,'TPA','593','ECUADOR'),(15,'TPA','110','ESTADOS UNIDOS'),(16,'TPA','126','VENEZUELA'),(17,'TPA','105','COLOMBIA'),(18,'TIP','TUS','TIPO DE USUARIO'),(19,'TUS','EST','ROL ESTUDIANTE'),(20,'TUS','PRO','ROL PROFESOR'),(21,'TUS','ADM','ROL ADMINISTRATIVO'),(22,'TUS','REP','ROL REPRESENTANTE'),(23,'TIP','MAT','MATERIAS'),(24,'MAT','001','MATEMATICAS'),(25,'MAT','002','INGLES'),(26,'MAT','003','SOCIALES'),(27,'TIP','QUI','QUIMESTRE'),(28,'QUI','Q01','PRIMER QUIMESTRE'),(29,'QUI','Q02','SEGUNDO QUIMESTRE'),(30,'TIP','PER','PERFIL'),(31,'PER','PRO','PERFIL PROFESOR'),(32,'PER','ADM','PERFIL ADMINISTRATIVO'),(33,'593','GUA','GUAYAS'),(34,'593','PIC','PICHINCHA'),(35,'GUA','GUY','GUAYAQUIL'),(36,'GUA','DUR','DURAN'),(37,'PIC','QUI','QUITO'),(38,'PIC','PIM','PIMANPIRO'),(39,'TIP','JOR','JORNADA'),(40,'JOR ','JMA','MATUTINO'),(41,'JOR','JVE','VESPERTINO'),(42,'JOR ','JNO','NOCTURNO'),(43,'TIP','ETN','ETNIA INDIGENA'),(44,'ETN','IND','INDIGENA'),(45,'ETN ','AFR','ADROECUATORIANO'),(46,'ETN','NEG','NEGRO'),(47,'ETN','MUL','MULATO'),(48,'ETN ','MON','MONTUVIO'),(49,'ETN','MEZ','MESTIZO'),(50,'ETN','BLA','BLANCO'),(51,'TIP','IDA','IDIOMA ANCESTRAL'),(52,'IDA','ACH','ACHUAR CHICHAM'),(53,'IDA','AND','ANDOA'),(54,'IDA','AWA','AWAPIT'),(55,'IDA','CHA','CHA PALAA'),(56,'IDA','HUA','HUAO TEDEO'),(57,'IDA','ING','INGAE'),(58,'IDA','KIC','KICHWA'),(59,'IDA','NIN','NINGUNO'),(60,'IDA','PAI','PAICOCA'),(61,'IDA','SHI','SHIWIAR CHICHAM'),(62,'IDA','SHU','SHUAR CHICHAM'),(63,'IDA','SIA','SIAPEDE'),(64,'IDA','TSA','TSA\'FIQUI'),(65,'IDA','ZAP','ZAPARA'),(66,'TIP','CMI','CATEGORIA MIGRATORIA'),(67,'CMI','PER','RESIDENTE PERMANENTE'),(68,'CMI','DET','RESIDENTE DE TRANSITO O NO RESIDENTE'),(69,'CMI','TEM','RESIDENTE TEMPORAL'),(70,'CMI','REF','REFUGIADO'),(71,'CMI','NIN','NINGUNA'),(76,'TIP','NFO','NIVEL DE FORMACION PADRES'),(77,'NFO','CAL','CENTRO DE ALFABETIZACION'),(78,'NFO','JIN','JARDIN DE INFANTES'),(79,'NFO','PRI','PRIMARIA (1RO A 7MO GRADO)'),(80,'NFO','EBA','EDUCACION BASICA (8VO A 10MO GRADO)'),(81,'NFO','SEC','SECUNDARIA (NO CULMINO EL BACHILLER)'),(82,'NFO','EME','EDUCACION MEDIA (SI CULMINO EL BACHILLER)'),(83,'NFO','SUN','SUPERIOR NO UNIVERSITARIA (TECNICO - TECNOLOG'),(84,'NFO','SUU','SUPERIOR UNIVERSITARIA (3ER NIVEL)'),(85,'NFO','POG','POST-GRADO (4TO NIVEL)'),(86,'TIP','TSA','TIPO DE SANGRE'),(87,'TSA','SA1','O-'),(88,'TSA','SA2','O+'),(89,'TSA','SA3','A-'),(90,'TSA','SA4','A+'),(91,'TSA','SA5','B-'),(92,'TSA','SA6','B+'),(93,'TSA','SA7','AB-'),(94,'TSA','SA8','AB+'),(96,'TIP','STA','ESTADOS'),(97,'STA','1','ACTIVO'),(98,'STA','0','INACTIVO'),(99,'STA','2','EN PROCESO'),(100,'593','01','AZUAY'),(101,'593','02','BOLIVAR'),(102,'593','03','CAÑAR'),(103,'593','04','CARCHI'),(104,'593','05','COTOPAXI'),(105,'593','06','CHIMBORAZO'),(106,'593','07','EL ORO'),(107,'593','08','ESMERALDAS'),(108,'593','09','GUAYAS'),(109,'593','10','IMBABURA'),(110,'593','11','LOJA'),(111,'593','12','LOS RIOS'),(112,'593','13','MANABI'),(113,'593','14','MORONA SANTIAGO'),(114,'593','15','NAPO'),(115,'593','16','PASTAZA'),(116,'593','17','PICHINCHA'),(117,'593','18','TUNGURAHUA'),(118,'593','19','ZAMORA CHINCHIPE'),(119,'593','20','GALAPAGOS'),(120,'593','21','SUCUMBIOS'),(121,'593','22','ORELLANA'),(122,'593','23','SANTO DOMINGO DE LOS TSACHILAS'),(123,'593','24','SANTA ELENA'),(124,'593','90','ZONAS NO DELIMITADAS'),(125,'01','0101','CUENCA'),(126,'01','0102','GIRÓN'),(127,'01','0103','GUALACEO'),(128,'01','0104','NABÓN'),(129,'01','0105','PAUTE'),(130,'01','0106','PUCARA'),(131,'01','0107','SAN FERNANDO'),(132,'01','0108','SANTA ISABEL'),(133,'01','0109','SIGSIG'),(134,'01','0110','OÑA'),(135,'01','0111','CHORDELEG'),(136,'01','0112','EL PAN'),(137,'01','0113','SEVILLA DE ORO'),(138,'01','0114','GUACHAPALA'),(139,'01','0115','CAMILO PONCE ENRÍQUEZ'),(140,'02','0201','GUARANDA'),(141,'02','0202','CHILLANES'),(142,'02','0203','CHIMBO'),(143,'02','0204','ECHEANDÍA'),(144,'02','0205','SAN MIGUEL'),(145,'02','0206','CALUMA'),(146,'02','0207','LAS NAVES'),(147,'03','0301','AZOGUES'),(148,'03','0302','BIBLIÁN'),(149,'03','0303','CAÑAR'),(150,'03','0304','LA TRONCAL'),(151,'03','0305','EL TAMBO'),(152,'03','0306','DÉLEG'),(153,'03','0307','SUSCAL'),(154,'04','0401','TULCÁN'),(155,'04','0402','BOLÍVAR'),(156,'04','0403','ESPEJO'),(157,'04','0404','MIRA'),(158,'04','0405','MONTÚFAR'),(159,'04','0406','SAN PEDRO DE HUACA'),(160,'05','0501','LATACUNGA'),(161,'05','0502','LA MANÁ'),(162,'05','0503','PANGUA'),(163,'05','0504','PUJILI'),(164,'05','0505','SALCEDO'),(165,'05','0506','SAQUISILÍ'),(166,'05','0507','SIGCHOS'),(167,'06','0601','RIOBAMBA'),(168,'06','0602','ALAUSI'),(169,'06','0603','COLTA'),(170,'06','0604','CHAMBO'),(171,'06','0605','CHUNCHI'),(172,'06','0606','GUAMOTE'),(173,'06','0607','GUANO'),(174,'06','0608','PALLATANGA'),(175,'06','0609','PENIPE'),(176,'06','0610','CUMANDÁ'),(177,'07','0701','MACHALA'),(178,'07','0702','ARENILLAS'),(179,'07','0703','ATAHUALPA'),(180,'07','0704','BALSAS'),(181,'07','0705','CHILLA'),(182,'07','0706','EL GUABO'),(183,'07','0707','HUAQUILLAS'),(184,'07','0708','MARCABELÍ'),(185,'07','0709','PASAJE'),(186,'07','0710','PIÑAS'),(187,'07','0711','PORTOVELO'),(188,'07','0712','SANTA ROSA'),(189,'07','0713','ZARUMA'),(190,'07','0714','LAS LAJAS'),(191,'08','0801','ESMERALDAS'),(192,'08','0802','ELOY ALFARO'),(193,'08','0803','MUISNE'),(194,'08','0804','QUININDÉ'),(195,'08','0805','SAN LORENZO'),(196,'08','0806','ATACAMES'),(197,'08','0807','RIOVERDE'),(198,'08','0808','LA CONCORDIA'),(199,'09','0901','GUAYAQUIL'),(200,'09','0902','ALFREDO BAQUERIZO MORENO (JUJÁN)'),(201,'09','0903','BALAO'),(202,'09','0904','BALZAR'),(203,'09','0905','COLIMES'),(204,'09','0906','DAULE'),(205,'09','0907','DURÁN'),(206,'09','0908','EL EMPALME'),(207,'09','0909','EL TRIUNFO'),(208,'09','0910','MILAGRO'),(209,'09','0911','NARANJAL'),(210,'09','0912','NARANJITO'),(211,'09','0913','PALESTINA'),(212,'09','0914','PEDRO CARBO'),(213,'09','0916','SAMBORONDÓN'),(214,'09','0918','SANTA LUCÍA'),(215,'09','0919','SALITRE (URBINA JADO)'),(216,'09','0920','SAN JACINTO DE YAGUACHI'),(217,'09','0921','PLAYAS'),(218,'09','0922','SIMÓN BOLÍVAR'),(219,'09','0923','CORONEL MARCELINO MARIDUEÑA'),(220,'09','0924','LOMAS DE SARGENTILLO'),(221,'09','0925','NOBOL'),(222,'09','0927','GENERAL ANTONIO ELIZALDE'),(223,'09','0928','ISIDRO AYORA'),(224,'10','1001','IBARRA'),(225,'10','1002','ANTONIO ANTE'),(226,'10','1003','COTACACHI'),(227,'10','1004','OTAVALO'),(228,'10','1005','PIMAMPIRO'),(229,'10','1006','SAN MIGUEL DE URCUQUÍ'),(230,'11','1101','LOJA'),(231,'11','1102','CALVAS'),(232,'11','1103','CATAMAYO'),(233,'11','1104','CELICA'),(234,'11','1105','CHAGUARPAMBA'),(235,'11','1106','ESPÍNDOLA'),(236,'11','1107','GONZANAMÁ'),(237,'11','1108','MACARÁ'),(238,'11','1109','PALTAS'),(239,'11','1110','PUYANGO'),(240,'11','1111','SARAGURO'),(241,'11','1112','SOZORANGA'),(242,'11','1113','ZAPOTILLO'),(243,'11','1114','PINDAL'),(244,'11','1115','QUILANGA'),(245,'11','1116','OLMEDO'),(246,'12','1201','BABAHOYO'),(247,'12','1202','BABA'),(248,'12','1203','MONTALVO'),(249,'12','1204','PUEBLOVIEJO'),(250,'12','1205','QUEVEDO'),(251,'12','1206','URDANETA'),(252,'12','1207','VENTANAS'),(253,'12','1208','VÍNCES'),(254,'12','1209','PALENQUE'),(255,'12','1210','BUENA FÉ'),(256,'12','1211','VALENCIA'),(257,'12','1212','MOCACHE'),(258,'12','1213','QUINSALOMA'),(259,'13','1301','PORTOVIEJO'),(260,'13','1302','BOLÍVAR'),(261,'13','1303','CHONE'),(262,'13','1304','EL CARMEN'),(263,'13','1305','FLAVIO ALFARO'),(264,'13','1306','JIPIJAPA'),(265,'13','1307','JUNÍN'),(266,'13','1308','MANTA'),(267,'13','1309','MONTECRISTI'),(268,'13','1310','PAJÁN'),(269,'13','1311','PICHINCHA'),(270,'13','1312','ROCAFUERTE'),(271,'13','1313','SANTA ANA'),(272,'13','1314','SUCRE'),(273,'13','1315','TOSAGUA'),(274,'13','1316','24 DE MAYO'),(275,'13','1317','PEDERNALES'),(276,'13','1318','OLMEDO'),(277,'13','1319','PUERTO LÓPEZ'),(278,'13','1320','JAMA'),(279,'13','1321','JARAMIJÓ'),(280,'13','1322','SAN VICENTE'),(281,'14','1401','MORONA'),(282,'14','1402','GUALAQUIZA'),(283,'14','1403','LIMÓN INDANZA'),(284,'14','1404','PALORA'),(285,'14','1405','SANTIAGO'),(286,'14','1406','SUCÚA'),(287,'14','1407','HUAMBOYA'),(288,'14','1408','SAN JUAN BOSCO'),(289,'14','1409','TAISHA'),(290,'14','1410','LOGROÑO'),(291,'14','1411','PABLO SEXTO'),(292,'14','1412','TIWINTZA'),(293,'15','1501','TENA'),(294,'15','1503','ARCHIDONA'),(295,'15','1504','EL CHACO'),(296,'15','1507','QUIJOS'),(297,'15','1509','CARLOS JULIO AROSEMENA TOLA'),(298,'16','1601','PASTAZA'),(299,'16','1602','MERA'),(300,'16','1603','SANTA CLARA'),(301,'16','1604','ARAJUNO'),(302,'17','1701','QUITO'),(303,'17','1702','CAYAMBE'),(304,'17','1703','MEJIA'),(305,'17','1704','PEDRO MONCAYO'),(306,'17','1705','RUMIÑAHUI'),(307,'17','1707','SAN MIGUEL DE LOS BANCOS'),(308,'17','1708','PEDRO VICENTE MALDONADO'),(309,'17','1709','PUERTO QUITO'),(310,'18','1801','AMBATO'),(311,'18','1802','BAÑOS DE AGUA SANTA'),(312,'18','1803','CEVALLOS'),(313,'18','1804','MOCHA'),(314,'18','1805','PATATE'),(315,'18','1806','QUERO'),(316,'18','1807','SAN PEDRO DE PELILEO'),(317,'18','1808','SANTIAGO DE PÍLLARO'),(318,'18','1809','TISALEO'),(319,'19','1901','ZAMORA'),(320,'19','1902','CHINCHIPE'),(321,'19','1903','NANGARITZA'),(322,'19','1904','YACUAMBI'),(323,'19','1905','YANTZAZA (YANZATZA)'),(324,'19','1906','EL PANGUI'),(325,'19','1907','CENTINELA DEL CÓNDOR'),(326,'19','1908','PALANDA'),(327,'19','1909','PAQUISHA'),(328,'20','2001','SAN CRISTÓBAL'),(329,'20','2002','ISABELA'),(330,'20','2003','SANTA CRUZ'),(331,'21','2101','LAGO AGRIO'),(332,'21','2102','GONZALO PIZARRO'),(333,'21','2103','PUTUMAYO'),(334,'21','2104','SHUSHUFINDI'),(335,'21','2105','SUCUMBÍOS'),(336,'21','2106','CASCALES'),(337,'21','2107','CUYABENO'),(338,'22','2201','ORELLANA'),(339,'22','2202','AGUARICO'),(340,'22','2203','LA JOYA DE LOS SACHAS'),(341,'22','2204','LORETO'),(342,'23','2301','SANTO DOMINGO'),(343,'24','2401','SANTA ELENA'),(344,'24','2402','LA LIBERTAD'),(345,'24','2403','SALINAS'),(346,'90','9001','LAS GOLONDRINAS'),(347,'90','9003','MANGA DEL CURA'),(348,'90','9004','EL PIEDRERO'),(349,'0101','010101','BELLAVISTA'),(350,'0101','010102','CAÑARIBAMBA'),(351,'0101','010103','EL BATÁN'),(352,'0101','010104','EL SAGRARIO'),(353,'0101','010105','EL VECINO'),(354,'0101','010106','GIL RAMÍREZ DÁVALOS'),(355,'0101','010107','HUAYNACÁPAC'),(356,'0101','010108','MACHÁNGARA'),(357,'0101','010109','MONAY'),(358,'0101','010110','SAN BLAS'),(359,'0101','010111','SAN SEBASTIÁN'),(360,'0101','010112','SUCRE'),(361,'0101','010113','TOTORACOCHA'),(362,'0101','010114','YANUNCAY'),(363,'0101','010115','HERMANO MIGUEL'),(364,'0101','010150','CUENCA'),(365,'0101','010151','BAÑOS'),(366,'0101','010152','CUMBE'),(367,'0101','010153','CHAUCHA'),(368,'0101','010154','CHECA (JIDCAY)'),(369,'0101','010155','CHIQUINTAD'),(370,'0101','010156','LLACAO'),(371,'0101','010157','MOLLETURO'),(372,'0101','010158','NULTI'),(373,'0101','010159','OCTAVIO CORDERO PALACIOS (SANTA ROSA)'),(374,'0101','010160','PACCHA'),(375,'0101','010161','QUINGEO'),(376,'0101','010162','RICAURTE'),(377,'0101','010163','SAN JOAQUÍN'),(378,'0101','010164','SANTA ANA'),(379,'0101','010165','SAYAUSÍ'),(380,'0101','010166','SIDCAY'),(381,'0101','010167','SININCAY'),(382,'0101','010168','TARQUI'),(383,'0101','010169','TURI'),(384,'0101','010170','VALLE'),(385,'0101','010171','VICTORIA DEL PORTETE (IRQUIS)'),(386,'0102','010250','GIRÓN'),(387,'0102','010251','ASUNCIÓN'),(388,'0102','010252','SAN GERARDO'),(389,'0103','010350','GUALACEO'),(390,'0103','010351','CHORDELEG'),(391,'0103','010352','DANIEL CÓRDOVA TORAL (EL ORIENTE)'),(392,'0103','010353','JADÁN'),(393,'0103','010354','MARIANO MORENO'),(394,'0103','010355','PRINCIPAL'),(395,'0103','010356','REMIGIO CRESPO TORAL (GÚLAG)'),(396,'0103','010357','SAN JUAN'),(397,'0103','010358','ZHIDMAD'),(398,'0103','010359','LUIS CORDERO VEGA'),(399,'0103','010360','SIMÓN BOLÍVAR (CAB. EN GAÑANZOL)'),(400,'0104','010450','NABÓN'),(401,'0104','010451','COCHAPATA'),(402,'0104','010452','EL PROGRESO (CAB.EN ZHOTA)'),(403,'0104','010453','LAS NIEVES (CHAYA)'),(404,'0104','010454','OÑA'),(405,'0105','010550','PAUTE'),(406,'0105','010551','AMALUZA'),(407,'0105','010552','BULÁN (JOSÉ VÍCTOR IZQUIERDO)'),(408,'0105','010553','CHICÁN (GUILLERMO ORTEGA)'),(409,'0105','010554','EL CABO'),(410,'0105','010555','GUACHAPALA'),(411,'0105','010556','GUARAINAG'),(412,'0105','010557','PALMAS'),(413,'0105','010558','PAN'),(414,'0105','010559','SAN CRISTÓBAL (CARLOS ORDÓÑEZ LAZO)'),(415,'0105','010560','SEVILLA DE ORO'),(416,'0105','010561','TOMEBAMBA'),(417,'0105','010562','DUG DUG'),(418,'0106','010650','PUCARÁ'),(419,'0106','010651','CAMILO PONCE ENRÍQUEZ (CAB. EN RÍO 7 DE MOLLE'),(420,'0106','010652','SAN RAFAEL DE SHARUG'),(421,'0107','010750','SAN FERNANDO'),(422,'0107','010751','CHUMBLÍN'),(423,'0108','010850','SANTA ISABEL (CHAGUARURCO)'),(424,'0108','010851','ABDÓN CALDERÓN (LA UNIÓN)'),(425,'0108','010852','EL CARMEN DE PIJILÍ'),(426,'0108','010853','ZHAGLLI (SHAGLLI)'),(427,'0108','010854','SAN SALVADOR DE CAÑARIBAMBA'),(428,'0109','010950','SIGSIG'),(429,'0109','010951','CUCHIL (CUTCHIL)'),(430,'0109','010952','GIMA'),(431,'0109','010953','GUEL'),(432,'0109','010954','LUDO'),(433,'0109','010955','SAN BARTOLOMÉ'),(434,'0109','010956','SAN JOSÉ DE RARANGA'),(435,'0110','011050','SAN FELIPE DE OÑA CABECERA CANTONAL'),(436,'0110','011051','SUSUDEL'),(437,'0111','011150','CHORDELEG'),(438,'0111','011151','PRINCIPAL'),(439,'0111','011152','LA UNIÓN'),(440,'0111','011153','LUIS GALARZA ORELLANA (CAB.EN DELEGSOL)'),(441,'0111','011154','SAN MARTÍN DE PUZHIO'),(442,'0112','011250','EL PAN'),(443,'0112','011251','AMALUZA'),(444,'0112','011252','PALMAS'),(445,'0112','011253','SAN VICENTE'),(446,'0113','011350','SEVILLA DE ORO'),(447,'0113','011351','AMALUZA'),(448,'0113','011352','PALMAS'),(449,'0114','011450','GUACHAPALA'),(450,'0115','011550','CAMILO PONCE ENRÍQUEZ'),(451,'0115','011551','EL CARMEN DE PIJILÍ'),(452,'0201','020101','ÁNGEL POLIBIO CHÁVES'),(453,'0201','020102','GABRIEL IGNACIO VEINTIMILLA'),(454,'0201','020103','GUANUJO'),(455,'0201','020150','GUARANDA'),(456,'0201','020151','FACUNDO VELA'),(457,'0201','020152','GUANUJO'),(458,'0201','020153','JULIO E. MORENO (CATANAHUÁN GRANDE)'),(459,'0201','020154','LAS NAVES'),(460,'0201','020155','SALINAS'),(461,'0201','020156','SAN LORENZO'),(462,'0201','020157','SAN SIMÓN (YACOTO)'),(463,'0201','020158','SANTA FÉ (SANTA FÉ)'),(464,'0201','020159','SIMIÁTUG'),(465,'0201','020160','SAN LUIS DE PAMBIL'),(466,'0202','020250','CHILLANES'),(467,'0202','020251','SAN JOSÉ DEL TAMBO (TAMBOPAMBA)'),(468,'0203','020350','SAN JOSÉ DE CHIMBO'),(469,'0203','020351','ASUNCIÓN (ASANCOTO)'),(470,'0203','020352','CALUMA'),(471,'0203','020353','MAGDALENA (CHAPACOTO)'),(472,'0203','020354','SAN SEBASTIÁN'),(473,'0203','020355','TELIMBELA'),(474,'0204','020450','ECHEANDÍA'),(475,'0205','020550','SAN MIGUEL'),(476,'0205','020551','BALSAPAMBA'),(477,'0205','020552','BILOVÁN'),(478,'0205','020553','RÉGULO DE MORA'),(479,'0205','020554','SAN PABLO (SAN PABLO DE ATENAS)'),(480,'0205','020555','SANTIAGO'),(481,'0205','020556','SAN VICENTE'),(482,'0206','020650','CALUMA'),(483,'0207','020701','LAS MERCEDES'),(484,'0207','020702','LAS NAVES'),(485,'0207','020750','LAS NAVES'),(486,'0301','030101','AURELIO BAYAS MARTÍNEZ'),(487,'0301','030102','AZOGUES'),(488,'0301','030103','BORRERO'),(489,'0301','030104','SAN FRANCISCO'),(490,'0301','030150','AZOGUES'),(491,'0301','030151','COJITAMBO'),(492,'0301','030152','DÉLEG'),(493,'0301','030153','GUAPÁN'),(494,'0301','030154','JAVIER LOYOLA (CHUQUIPATA)'),(495,'0301','030155','LUIS CORDERO'),(496,'0301','030156','PINDILIG'),(497,'0301','030157','RIVERA'),(498,'0301','030158','SAN MIGUEL'),(499,'0301','030159','SOLANO'),(500,'0301','030160','TADAY'),(501,'0302','030250','BIBLIÁN'),(502,'0302','030251','NAZÓN (CAB. EN PAMPA DE DOMÍNGUEZ)'),(503,'0302','030252','SAN FRANCISCO DE SAGEO'),(504,'0302','030253','TURUPAMBA'),(505,'0302','030254','JERUSALÉN'),(506,'0303','030350','CAÑAR'),(507,'0303','030351','CHONTAMARCA'),(508,'0303','030352','CHOROCOPTE'),(509,'0303','030353','GENERAL MORALES (SOCARTE)'),(510,'0303','030354','GUALLETURO'),(511,'0303','030355','HONORATO VÁSQUEZ (TAMBO VIEJO)'),(512,'0303','030356','INGAPIRCA'),(513,'0303','030357','JUNCAL'),(514,'0303','030358','SAN ANTONIO'),(515,'0303','030359','SUSCAL'),(516,'0303','030360','TAMBO'),(517,'0303','030361','ZHUD'),(518,'0303','030362','VENTURA'),(519,'0303','030363','DUCUR'),(520,'0304','030450','LA TRONCAL'),(521,'0304','030451','MANUEL J. CALLE'),(522,'0304','030452','PANCHO NEGRO'),(523,'0305','030550','EL TAMBO'),(524,'0306','030650','DÉLEG'),(525,'0306','030651','SOLANO'),(526,'0307','030750','SUSCAL'),(527,'0401','040101','GONZÁLEZ SUÁREZ'),(528,'0401','040102','TULCÁN'),(529,'0401','040150','TULCÁN'),(530,'0401','040151','EL CARMELO (EL PUN)'),(531,'0401','040152','HUACA'),(532,'0401','040153','JULIO ANDRADE (OREJUELA)'),(533,'0401','040154','MALDONADO'),(534,'0401','040155','PIOTER'),(535,'0401','040156','TOBAR DONOSO (LA BOCANA DE CAMUMBÍ)'),(536,'0401','040157','TUFIÑO'),(537,'0401','040158','URBINA (TAYA)'),(538,'0401','040159','EL CHICAL'),(539,'0401','040160','MARISCAL SUCRE'),(540,'0401','040161','SANTA MARTHA DE CUBA'),(541,'0402','040250','BOLÍVAR'),(542,'0402','040251','GARCÍA MORENO'),(543,'0402','040252','LOS ANDES'),(544,'0402','040253','MONTE OLIVO'),(545,'0402','040254','SAN VICENTE DE PUSIR'),(546,'0402','040255','SAN RAFAEL'),(547,'0403','040301','EL ÁNGEL'),(548,'0403','040302','27 DE SEPTIEMBRE'),(549,'0403','040350','EL ANGEL'),(550,'0403','040351','EL GOALTAL'),(551,'0403','040352','LA LIBERTAD (ALIZO)'),(552,'0403','040353','SAN ISIDRO'),(553,'0404','040450','MIRA (CHONTAHUASI)'),(554,'0404','040451','CONCEPCIÓN'),(555,'0404','040452','JIJÓN Y CAAMAÑO (CAB. EN RÍO BLANCO)'),(556,'0404','040453','JUAN MONTALVO (SAN IGNACIO DE QUIL)'),(557,'0405','040501','GONZÁLEZ SUÁREZ'),(558,'0405','040502','SAN JOSÉ'),(559,'0405','040550','SAN GABRIEL'),(560,'0405','040551','CRISTÓBAL COLÓN'),(561,'0405','040552','CHITÁN DE NAVARRETE'),(562,'0405','040553','FERNÁNDEZ SALVADOR'),(563,'0405','040554','LA PAZ'),(564,'0405','040555','PIARTAL'),(565,'0406','040650','HUACA'),(566,'0406','040651','MARISCAL SUCRE'),(567,'0501','050101','ELOY ALFARO (SAN FELIPE)'),(568,'0501','050102','IGNACIO FLORES (PARQUE FLORES)'),(569,'0501','050103','JUAN MONTALVO (SAN SEBASTIÁN)'),(570,'0501','050104','LA MATRIZ'),(571,'0501','050105','SAN BUENAVENTURA'),(572,'0501','050150','LATACUNGA'),(573,'0501','050151','ALAQUES (ALÁQUEZ)'),(574,'0501','050152','BELISARIO QUEVEDO (GUANAILÍN)'),(575,'0501','050153','GUAITACAMA (GUAYTACAMA)'),(576,'0501','050154','JOSEGUANGO BAJO'),(577,'0501','050155','LAS PAMPAS'),(578,'0501','050156','MULALÓ'),(579,'0501','050157','11 DE NOVIEMBRE (ILINCHISI)'),(580,'0501','050158','POALÓ'),(581,'0501','050159','SAN JUAN DE PASTOCALLE'),(582,'0501','050160','SIGCHOS'),(583,'0501','050161','TANICUCHÍ'),(584,'0501','050162','TOACASO'),(585,'0501','050163','PALO QUEMADO'),(586,'0502','050201','EL CARMEN'),(587,'0502','050202','LA MANÁ'),(588,'0502','050203','EL TRIUNFO'),(589,'0502','050250','LA MANÁ'),(590,'0502','050251','GUASAGANDA (CAB.EN GUASAGANDA'),(591,'0502','050252','PUCAYACU'),(592,'0503','050350','EL CORAZÓN'),(593,'0503','050351','MORASPUNGO'),(594,'0503','050352','PINLLOPATA'),(595,'0503','050353','RAMÓN CAMPAÑA'),(596,'0504','050450','PUJILÍ'),(597,'0504','050451','ANGAMARCA'),(598,'0504','050452','CHUCCHILÁN (CHUGCHILÁN)'),(599,'0504','050453','GUANGAJE'),(600,'0504','050454','ISINLIBÍ (ISINLIVÍ)'),(601,'0504','050455','LA VICTORIA'),(602,'0504','050456','PILALÓ'),(603,'0504','050457','TINGO'),(604,'0504','050458','ZUMBAHUA'),(605,'0505','050550','SAN MIGUEL'),(606,'0505','050551','ANTONIO JOSÉ HOLGUÍN (SANTA LUCÍA)'),(607,'0505','050552','CUSUBAMBA'),(608,'0505','050553','MULALILLO'),(609,'0505','050554','MULLIQUINDIL (SANTA ANA)'),(610,'0505','050555','PANSALEO'),(611,'0506','050650','SAQUISILÍ'),(612,'0506','050651','CANCHAGUA'),(613,'0506','050652','CHANTILÍN'),(614,'0506','050653','COCHAPAMBA'),(615,'0507','050750','SIGCHOS'),(616,'0507','050751','CHUGCHILLÁN'),(617,'0507','050752','ISINLIVÍ'),(618,'0507','050753','LAS PAMPAS'),(619,'0507','050754','PALO QUEMADO'),(620,'0601','060101','LIZARZABURU'),(621,'0601','060102','MALDONADO'),(622,'0601','060103','VELASCO'),(623,'0601','060104','VELOZ'),(624,'0601','060105','YARUQUÍES'),(625,'0601','060150','RIOBAMBA'),(626,'0601','060151','CACHA (CAB. EN MACHÁNGARA)'),(627,'0601','060152','CALPI'),(628,'0601','060153','CUBIJÍES'),(629,'0601','060154','FLORES'),(630,'0601','060155','LICÁN'),(631,'0601','060156','LICTO'),(632,'0601','060157','PUNGALÁ'),(633,'0601','060158','PUNÍN'),(634,'0601','060159','QUIMIAG'),(635,'0601','060160','SAN JUAN'),(636,'0601','060161','SAN LUIS'),(637,'0602','060250','ALAUSÍ'),(638,'0602','060251','ACHUPALLAS'),(639,'0602','060252','CUMANDÁ'),(640,'0602','060253','GUASUNTOS'),(641,'0602','060254','HUIGRA'),(642,'0602','060255','MULTITUD'),(643,'0602','060256','PISTISHÍ (NARIZ DEL DIABLO)'),(644,'0602','060257','PUMALLACTA'),(645,'0602','060258','SEVILLA'),(646,'0602','060259','SIBAMBE'),(647,'0602','060260','TIXÁN'),(648,'0603','060301','CAJABAMBA'),(649,'0603','060302','SICALPA'),(650,'0603','060350','VILLA LA UNIÓN (CAJABAMBA)'),(651,'0603','060351','CAÑI'),(652,'0603','060352','COLUMBE'),(653,'0603','060353','JUAN DE VELASCO (PANGOR)'),(654,'0603','060354','SANTIAGO DE QUITO (CAB. EN SAN ANTONIO DE QUI'),(655,'0604','060450','CHAMBO'),(656,'0605','060550','CHUNCHI'),(657,'0605','060551','CAPZOL'),(658,'0605','060552','COMPUD'),(659,'0605','060553','GONZOL'),(660,'0605','060554','LLAGOS'),(661,'0606','060650','GUAMOTE'),(662,'0606','060651','CEBADAS'),(663,'0606','060652','PALMIRA'),(664,'0607','060701','EL ROSARIO'),(665,'0607','060702','LA MATRIZ'),(666,'0607','060750','GUANO'),(667,'0607','060751','GUANANDO'),(668,'0607','060752','ILAPO'),(669,'0607','060753','LA PROVIDENCIA'),(670,'0607','060754','SAN ANDRÉS'),(671,'0607','060755','SAN GERARDO DE PACAICAGUÁN'),(672,'0607','060756','SAN ISIDRO DE PATULÚ'),(673,'0607','060757','SAN JOSÉ DEL CHAZO'),(674,'0607','060758','SANTA FÉ DE GALÁN'),(675,'0607','060759','VALPARAÍSO'),(676,'0608','060850','PALLATANGA'),(677,'0609','060950','PENIPE'),(678,'0609','060951','EL ALTAR'),(679,'0609','060952','MATUS'),(680,'0609','060953','PUELA'),(681,'0609','060954','SAN ANTONIO DE BAYUSHIG'),(682,'0609','060955','LA CANDELARIA'),(683,'0609','060956','BILBAO (CAB.EN QUILLUYACU)'),(684,'0610','061050','CUMANDÁ'),(685,'0701','070101','LA PROVIDENCIA'),(686,'0701','070102','MACHALA'),(687,'0701','070103','PUERTO BOLÍVAR'),(688,'0701','070104','NUEVE DE MAYO'),(689,'0701','070105','EL CAMBIO'),(690,'0701','070150','MACHALA'),(691,'0701','070151','EL CAMBIO'),(692,'0701','070152','EL RETIRO'),(693,'0702','070250','ARENILLAS'),(694,'0702','070251','CHACRAS'),(695,'0702','070252','LA LIBERTAD'),(696,'0702','070253','LAS LAJAS (CAB. EN LA VICTORIA)'),(697,'0702','070254','PALMALES'),(698,'0702','070255','CARCABÓN'),(699,'0703','070350','PACCHA'),(700,'0703','070351','AYAPAMBA'),(701,'0703','070352','CORDONCILLO'),(702,'0703','070353','MILAGRO'),(703,'0703','070354','SAN JOSÉ'),(704,'0703','070355','SAN JUAN DE CERRO AZUL'),(705,'0704','070450','BALSAS'),(706,'0704','070451','BELLAMARÍA'),(707,'0705','070550','CHILLA'),(708,'0706','070650','EL GUABO'),(709,'0706','070651','BARBONES (SUCRE)'),(710,'0706','070652','LA IBERIA'),(711,'0706','070653','TENDALES (CAB.EN PUERTO TENDALES)'),(712,'0706','070654','RÍO BONITO'),(713,'0707','070701','ECUADOR'),(714,'0707','070702','EL PARAÍSO'),(715,'0707','070703','HUALTACO'),(716,'0707','070704','MILTON REYES'),(717,'0707','070705','UNIÓN LOJANA'),(718,'0707','070750','HUAQUILLAS'),(719,'0708','070850','MARCABELÍ'),(720,'0708','070851','EL INGENIO'),(721,'0709','070901','BOLÍVAR'),(722,'0709','070902','LOMA DE FRANCO'),(723,'0709','070903','OCHOA LEÓN (MATRIZ)'),(724,'0709','070904','TRES CERRITOS'),(725,'0709','070950','PASAJE'),(726,'0709','070951','BUENAVISTA'),(727,'0709','070952','CASACAY'),(728,'0709','070953','LA PEAÑA'),(729,'0709','070954','PROGRESO'),(730,'0709','070955','UZHCURRUMI'),(731,'0709','070956','CAÑAQUEMADA'),(732,'0710','071001','LA MATRIZ'),(733,'0710','071002','LA SUSAYA'),(734,'0710','071003','PIÑAS GRANDE'),(735,'0710','071050','PIÑAS'),(736,'0710','071051','CAPIRO (CAB. EN LA CAPILLA DE CAPIRO)'),(737,'0710','071052','LA BOCANA'),(738,'0710','071053','MOROMORO (CAB. EN EL VADO)'),(739,'0710','071054','PIEDRAS'),(740,'0710','071055','SAN ROQUE (AMBROSIO MALDONADO)'),(741,'0710','071056','SARACAY'),(742,'0711','071150','PORTOVELO'),(743,'0711','071151','CURTINCAPA'),(744,'0711','071152','MORALES'),(745,'0711','071153','SALATÍ'),(746,'0712','071201','SANTA ROSA'),(747,'0712','071202','PUERTO JELÍ'),(748,'0712','071203','BALNEARIO JAMBELÍ (SATÉLITE)'),(749,'0712','071204','JUMÓN (SATÉLITE)'),(750,'0712','071205','NUEVO SANTA ROSA'),(751,'0712','071250','SANTA ROSA'),(752,'0712','071251','BELLAVISTA'),(753,'0712','071252','JAMBELÍ'),(754,'0712','071253','LA AVANZADA'),(755,'0712','071254','SAN ANTONIO'),(756,'0712','071255','TORATA'),(757,'0712','071256','VICTORIA'),(758,'0712','071257','BELLAMARÍA'),(759,'0713','071350','ZARUMA'),(760,'0713','071351','ABAÑÍN'),(761,'0713','071352','ARCAPAMBA'),(762,'0713','071353','GUANAZÁN'),(763,'0713','071354','GUIZHAGUIÑA'),(764,'0713','071355','HUERTAS'),(765,'0713','071356','MALVAS'),(766,'0713','071357','MULUNCAY GRANDE'),(767,'0713','071358','SINSAO'),(768,'0713','071359','SALVIAS'),(769,'0714','071401','LA VICTORIA'),(770,'0714','071402','PLATANILLOS'),(771,'0714','071403','VALLE HERMOSO'),(772,'0714','071450','LA VICTORIA'),(773,'0714','071451','LA LIBERTAD'),(774,'0714','071452','EL PARAÍSO'),(775,'0714','071453','SAN ISIDRO'),(776,'0801','080101','BARTOLOMÉ RUIZ (CÉSAR FRANCO CARRIÓN)'),(777,'0801','080102','5 DE AGOSTO'),(778,'0801','080103','ESMERALDAS'),(779,'0801','080104','LUIS TELLO (LAS PALMAS)'),(780,'0801','080105','SIMÓN PLATA TORRES'),(781,'0801','080150','ESMERALDAS'),(782,'0801','080151','ATACAMES'),(783,'0801','080152','CAMARONES (CAB. EN SAN VICENTE)'),(784,'0801','080153','CRNEL. CARLOS CONCHA TORRES (CAB.EN HUELE)'),(785,'0801','080154','CHINCA'),(786,'0801','080155','CHONTADURO'),(787,'0801','080156','CHUMUNDÉ'),(788,'0801','080157','LAGARTO'),(789,'0801','080158','LA UNIÓN'),(790,'0801','080159','MAJUA'),(791,'0801','080160','MONTALVO (CAB. EN HORQUETA)'),(792,'0801','080161','RÍO VERDE'),(793,'0801','080162','ROCAFUERTE'),(794,'0801','080163','SAN MATEO'),(795,'0801','080164','SÚA (CAB. EN LA BOCANA)'),(796,'0801','080165','TABIAZO'),(797,'0801','080166','TACHINA'),(798,'0801','080167','TONCHIGÜE'),(799,'0801','080168','VUELTA LARGA'),(800,'0802','080250','VALDEZ (LIMONES)'),(801,'0802','080251','ANCHAYACU'),(802,'0802','080252','ATAHUALPA (CAB. EN CAMARONES)'),(803,'0802','080253','BORBÓN'),(804,'0802','080254','LA TOLA'),(805,'0802','080255','LUIS VARGAS TORRES (CAB. EN PLAYA DE ORO)'),(806,'0802','080256','MALDONADO'),(807,'0802','080257','PAMPANAL DE BOLÍVAR'),(808,'0802','080258','SAN FRANCISCO DE ONZOLE'),(809,'0802','080259','SANTO DOMINGO DE ONZOLE'),(810,'0802','080260','SELVA ALEGRE'),(811,'0802','080261','TELEMBÍ'),(812,'0802','080262','COLÓN ELOY DEL MARÍA'),(813,'0802','080263','SAN JOSÉ DE CAYAPAS'),(814,'0802','080264','TIMBIRÉ'),(815,'0803','080350','MUISNE'),(816,'0803','080351','BOLÍVAR'),(817,'0803','080352','DAULE'),(818,'0803','080353','GALERA'),(819,'0803','080354','QUINGUE (OLMEDO PERDOMO FRANCO)'),(820,'0803','080355','SALIMA'),(821,'0803','080356','SAN FRANCISCO'),(822,'0803','080357','SAN GREGORIO'),(823,'0803','080358','SAN JOSÉ DE CHAMANGA (CAB.EN CHAMANGA)'),(824,'0804','080450','ROSA ZÁRATE (QUININDÉ)'),(825,'0804','080451','CUBE'),(826,'0804','080452','CHURA (CHANCAMA) (CAB. EN EL YERBERO)'),(827,'0804','080453','MALIMPIA'),(828,'0804','080454','VICHE'),(829,'0804','080455','LA UNIÓN'),(830,'0805','080550','SAN LORENZO'),(831,'0805','080551','ALTO TAMBO (CAB. EN GUADUAL)'),(832,'0805','080552','ANCÓN (PICHANGAL) (CAB. EN PALMA REAL)'),(833,'0805','080553','CALDERÓN'),(834,'0805','080554','CARONDELET'),(835,'0805','080555','5 DE JUNIO (CAB. EN UIMBI)'),(836,'0805','080556','CONCEPCIÓN'),(837,'0805','080557','MATAJE (CAB. EN SANTANDER)'),(838,'0805','080558','SAN JAVIER DE CACHAVÍ (CAB. EN SAN JAVIER)'),(839,'0805','080559','SANTA RITA'),(840,'0805','080560','TAMBILLO'),(841,'0805','080561','TULULBÍ (CAB. EN RICAURTE)'),(842,'0805','080562','URBINA'),(843,'0806','080650','ATACAMES'),(844,'0806','080651','LA UNIÓN'),(845,'0806','080652','SÚA (CAB. EN LA BOCANA)'),(846,'0806','080653','TONCHIGÜE'),(847,'0806','080654','TONSUPA'),(848,'0807','080750','RIOVERDE'),(849,'0807','080751','CHONTADURO'),(850,'0807','080752','CHUMUNDÉ'),(851,'0807','080753','LAGARTO'),(852,'0807','080754','MONTALVO (CAB. EN HORQUETA)'),(853,'0807','080755','ROCAFUERTE'),(854,'0808','080850','LA CONCORDIA'),(855,'0808','080851','MONTERREY'),(856,'0808','080852','LA VILLEGAS'),(857,'0808','080853','PLAN PILOTO'),(858,'0901','090101','AYACUCHO'),(859,'0901','090102','BOLÍVAR (SAGRARIO)'),(860,'0901','090103','CARBO (CONCEPCIÓN)'),(861,'0901','090104','FEBRES CORDERO'),(862,'0901','090105','GARCÍA MORENO'),(863,'0901','090106','LETAMENDI'),(864,'0901','090107','NUEVE DE OCTUBRE'),(865,'0901','090108','OLMEDO (SAN ALEJO)'),(866,'0901','090109','ROCA'),(867,'0901','090110','ROCAFUERTE'),(868,'0901','090111','SUCRE'),(869,'0901','090112','TARQUI'),(870,'0901','090113','URDANETA'),(871,'0901','090114','XIMENA'),(872,'0901','090115','PASCUALES'),(873,'0901','090150','GUAYAQUIL'),(874,'0901','090151','CHONGÓN'),(875,'0901','090152','JUAN GÓMEZ RENDÓN (PROGRESO)'),(876,'0901','090153','MORRO'),(877,'0901','090154','PASCUALES'),(878,'0901','090155','PLAYAS (GRAL. VILLAMIL)'),(879,'0901','090156','POSORJA'),(880,'0901','090157','PUNÁ'),(881,'0901','090158','TENGUEL'),(882,'0902','090250','ALFREDO BAQUERIZO MORENO (JUJÁN)'),(883,'0903','090350','BALAO'),(884,'0904','090450','BALZAR'),(885,'0905','090550','COLIMES'),(886,'0905','090551','SAN JACINTO'),(887,'0906','090601','DAULE'),(888,'0906','090602','LA AURORA (SATÉLITE)'),(889,'0906','090603','BANIFE'),(890,'0906','090604','EMILIANO CAICEDO MARCOS'),(891,'0906','090605','MAGRO'),(892,'0906','090606','PADRE JUAN BAUTISTA AGUIRRE'),(893,'0906','090607','SANTA CLARA'),(894,'0906','090608','VICENTE PIEDRAHITA'),(895,'0906','090650','DAULE'),(896,'0906','090651','ISIDRO AYORA (SOLEDAD)'),(897,'0906','090652','JUAN BAUTISTA AGUIRRE (LOS TINTOS)'),(898,'0906','090653','LAUREL'),(899,'0906','090654','LIMONAL'),(900,'0906','090655','LOMAS DE SARGENTILLO'),(901,'0906','090656','LOS LOJAS (ENRIQUE BAQUERIZO MORENO)'),(902,'0906','090657','PIEDRAHITA (NOBOL)'),(903,'0907','090701','ELOY ALFARO (DURÁN)'),(904,'0907','090702','EL RECREO'),(905,'0907','090750','ELOY ALFARO (DURÁN)'),(906,'0908','090850','VELASCO IBARRA (EL EMPALME)'),(907,'0908','090851','GUAYAS (PUEBLO NUEVO)'),(908,'0908','090852','EL ROSARIO'),(909,'0909','090950','EL TRIUNFO'),(910,'0910','091050','MILAGRO'),(911,'0910','091051','CHOBO'),(912,'0910','091052','GENERAL ELIZALDE (BUCAY)'),(913,'0910','091053','MARISCAL SUCRE (HUAQUES)'),(914,'0910','091054','ROBERTO ASTUDILLO (CAB. EN CRUCE DE VENECIA)'),(915,'0911','091150','NARANJAL'),(916,'0911','091151','JESÚS MARÍA'),(917,'0911','091152','SAN CARLOS'),(918,'0911','091153','SANTA ROSA DE FLANDES'),(919,'0911','091154','TAURA'),(920,'0912','091250','NARANJITO'),(921,'0913','091350','PALESTINA'),(922,'0914','091450','PEDRO CARBO'),(923,'0914','091451','VALLE DE LA VIRGEN'),(924,'0914','091452','SABANILLA'),(925,'0916','091601','SAMBORONDÓN'),(926,'0916','091602','LA PUNTILLA (SATÉLITE)'),(927,'0916','091650','SAMBORONDÓN'),(928,'0916','091651','TARIFA'),(929,'0918','091850','SANTA LUCÍA'),(930,'0919','091901','BOCANA'),(931,'0919','091902','CANDILEJOS'),(932,'0919','091903','CENTRAL'),(933,'0919','091904','PARAÍSO'),(934,'0919','091905','SAN MATEO'),(935,'0919','091950','EL SALITRE (LAS RAMAS)'),(936,'0919','091951','GRAL. VERNAZA (DOS ESTEROS)'),(937,'0919','091952','LA VICTORIA (ÑAUZA)'),(938,'0919','091953','JUNQUILLAL'),(939,'0920','092050','SAN JACINTO DE YAGUACHI'),(940,'0920','092051','CRNEL. LORENZO DE GARAICOA (PEDREGAL)'),(941,'0920','092052','CRNEL. MARCELINO MARIDUEÑA (SAN CARLOS)'),(942,'0920','092053','GRAL. PEDRO J. MONTERO (BOLICHE)'),(943,'0920','092054','SIMÓN BOLÍVAR'),(944,'0920','092055','YAGUACHI VIEJO (CONE)'),(945,'0920','092056','VIRGEN DE FÁTIMA'),(946,'0921','092150','GENERAL VILLAMIL (PLAYAS)'),(947,'0922','092250','SIMÓN BOLÍVAR'),(948,'0922','092251','CRNEL.LORENZO DE GARAICOA (PEDREGAL)'),(949,'0923','092350','CORONEL MARCELINO MARIDUEÑA (SAN CARLOS)'),(950,'0924','092450','LOMAS DE SARGENTILLO'),(951,'0924','092451','ISIDRO AYORA (SOLEDAD)'),(952,'0925','092550','NARCISA DE JESÚS'),(953,'0927','092750','GENERAL ANTONIO ELIZALDE (BUCAY)'),(954,'0928','092850','ISIDRO AYORA'),(955,'1001','100101','CARANQUI'),(956,'1001','100102','GUAYAQUIL DE ALPACHACA'),(957,'1001','100103','SAGRARIO'),(958,'1001','100104','SAN FRANCISCO'),(959,'1001','100105','LA DOLOROSA DEL PRIORATO'),(960,'1001','100150','SAN MIGUEL DE IBARRA'),(961,'1001','100151','AMBUQUÍ'),(962,'1001','100152','ANGOCHAGUA'),(963,'1001','100153','CAROLINA'),(964,'1001','100154','LA ESPERANZA'),(965,'1001','100155','LITA'),(966,'1001','100156','SALINAS'),(967,'1001','100157','SAN ANTONIO'),(968,'1002','100201','ANDRADE MARÍN (LOURDES)'),(969,'1002','100202','ATUNTAQUI'),(970,'1002','100250','ATUNTAQUI'),(971,'1002','100251','IMBAYA (SAN LUIS DE COBUENDO)'),(972,'1002','100252','SAN FRANCISCO DE NATABUELA'),(973,'1002','100253','SAN JOSÉ DE CHALTURA'),(974,'1002','100254','SAN ROQUE'),(975,'1003','100301','SAGRARIO'),(976,'1003','100302','SAN FRANCISCO'),(977,'1003','100350','COTACACHI'),(978,'1003','100351','APUELA'),(979,'1003','100352','GARCÍA MORENO (LLURIMAGUA)'),(980,'1003','100353','IMANTAG'),(981,'1003','100354','PEÑAHERRERA'),(982,'1003','100355','PLAZA GUTIÉRREZ (CALVARIO)'),(983,'1003','100356','QUIROGA'),(984,'1003','100357','6 DE JULIO DE CUELLAJE (CAB. EN CUELLAJE)'),(985,'1003','100358','VACAS GALINDO (EL CHURO) (CAB.EN SAN MIGUEL A'),(986,'1004','100401','JORDÁN'),(987,'1004','100402','SAN LUIS'),(988,'1004','100450','OTAVALO'),(989,'1004','100451','DR. MIGUEL EGAS CABEZAS (PEGUCHE)'),(990,'1004','100452','EUGENIO ESPEJO (CALPAQUÍ)'),(991,'1004','100453','GONZÁLEZ SUÁREZ'),(992,'1004','100454','PATAQUÍ'),(993,'1004','100455','SAN JOSÉ DE QUICHINCHE'),(994,'1004','100456','SAN JUAN DE ILUMÁN'),(995,'1004','100457','SAN PABLO'),(996,'1004','100458','SAN RAFAEL'),(997,'1004','100459','SELVA ALEGRE (CAB.EN SAN MIGUEL DE PAMPLONA)'),(998,'1005','100550','PIMAMPIRO'),(999,'1005','100551','CHUGÁ'),(1000,'1005','100552','MARIANO ACOSTA'),(1001,'1005','100553','SAN FRANCISCO DE SIGSIPAMBA'),(1002,'1006','100650','URCUQUÍ CABECERA CANTONAL'),(1003,'1006','100651','CAHUASQUÍ'),(1004,'1006','100652','LA MERCED DE BUENOS AIRES'),(1005,'1006','100653','PABLO ARENAS'),(1006,'1006','100654','SAN BLAS'),(1007,'1006','100655','TUMBABIRO'),(1008,'1101','110101','EL SAGRARIO'),(1009,'1101','110102','SAN SEBASTIÁN'),(1010,'1101','110103','SUCRE'),(1011,'1101','110104','VALLE'),(1012,'1101','110150','LOJA'),(1013,'1101','110151','CHANTACO'),(1014,'1101','110152','CHUQUIRIBAMBA'),(1015,'1101','110153','EL CISNE'),(1016,'1101','110154','GUALEL'),(1017,'1101','110155','JIMBILLA'),(1018,'1101','110156','MALACATOS (VALLADOLID)'),(1019,'1101','110157','SAN LUCAS'),(1020,'1101','110158','SAN PEDRO DE VILCABAMBA'),(1021,'1101','110159','SANTIAGO'),(1022,'1101','110160','TAQUIL (MIGUEL RIOFRÍO)'),(1023,'1101','110161','VILCABAMBA (VICTORIA)'),(1024,'1101','110162','YANGANA (ARSENIO CASTILLO)'),(1025,'1101','110163','QUINARA'),(1026,'1102','110201','CARIAMANGA'),(1027,'1102','110202','CHILE'),(1028,'1102','110203','SAN VICENTE'),(1029,'1102','110250','CARIAMANGA'),(1030,'1102','110251','COLAISACA'),(1031,'1102','110252','EL LUCERO'),(1032,'1102','110253','UTUANA'),(1033,'1102','110254','SANGUILLÍN'),(1034,'1103','110301','CATAMAYO'),(1035,'1103','110302','SAN JOSÉ'),(1036,'1103','110350','CATAMAYO (LA TOMA)'),(1037,'1103','110351','EL TAMBO'),(1038,'1103','110352','GUAYQUICHUMA'),(1039,'1103','110353','SAN PEDRO DE LA BENDITA'),(1040,'1103','110354','ZAMBI'),(1041,'1104','110450','CELICA'),(1042,'1104','110451','CRUZPAMBA (CAB. EN CARLOS BUSTAMANTE)'),(1043,'1104','110452','CHAQUINAL'),(1044,'1104','110453','12 DE DICIEMBRE (CAB. EN ACHIOTES)'),(1045,'1104','110454','PINDAL (FEDERICO PÁEZ)'),(1046,'1104','110455','POZUL (SAN JUAN DE POZUL)'),(1047,'1104','110456','SABANILLA'),(1048,'1104','110457','TNTE. MAXIMILIANO RODRÍGUEZ LOAIZA'),(1049,'1105','110550','CHAGUARPAMBA'),(1050,'1105','110551','BUENAVISTA'),(1051,'1105','110552','EL ROSARIO'),(1052,'1105','110553','SANTA RUFINA'),(1053,'1105','110554','AMARILLOS'),(1054,'1106','110650','AMALUZA'),(1055,'1106','110651','BELLAVISTA'),(1056,'1106','110652','JIMBURA'),(1057,'1106','110653','SANTA TERESITA'),(1058,'1106','110654','27 DE ABRIL (CAB. EN LA NARANJA)'),(1059,'1106','110655','EL INGENIO'),(1060,'1106','110656','EL AIRO'),(1061,'1107','110750','GONZANAMÁ'),(1062,'1107','110751','CHANGAIMINA (LA LIBERTAD)'),(1063,'1107','110752','FUNDOCHAMBA'),(1064,'1107','110753','NAMBACOLA'),(1065,'1107','110754','PURUNUMA (EGUIGUREN)'),(1066,'1107','110755','QUILANGA (LA PAZ)'),(1067,'1107','110756','SACAPALCA'),(1068,'1107','110757','SAN ANTONIO DE LAS ARADAS (CAB. EN LAS ARADAS'),(1069,'1108','110801','GENERAL ELOY ALFARO (SAN SEBASTIÁN)'),(1070,'1108','110802','MACARÁ (MANUEL ENRIQUE RENGEL SUQUILANDA)'),(1071,'1108','110850','MACARÁ'),(1072,'1108','110851','LARAMA'),(1073,'1108','110852','LA VICTORIA'),(1074,'1108','110853','SABIANGO (LA CAPILLA)'),(1075,'1109','110901','CATACOCHA'),(1076,'1109','110902','LOURDES'),(1077,'1109','110950','CATACOCHA'),(1078,'1109','110951','CANGONAMÁ'),(1079,'1109','110952','GUACHANAMÁ'),(1080,'1109','110953','LA TINGUE'),(1081,'1109','110954','LAURO GUERRERO'),(1082,'1109','110955','OLMEDO (SANTA BÁRBARA)'),(1083,'1109','110956','ORIANGA'),(1084,'1109','110957','SAN ANTONIO'),(1085,'1109','110958','CASANGA'),(1086,'1109','110959','YAMANA'),(1087,'1110','111050','ALAMOR'),(1088,'1110','111051','CIANO'),(1089,'1110','111052','EL ARENAL'),(1090,'1110','111053','EL LIMO (MARIANA DE JESÚS)'),(1091,'1110','111054','MERCADILLO'),(1092,'1110','111055','VICENTINO'),(1093,'1111','111150','SARAGURO'),(1094,'1111','111151','EL PARAÍSO DE CELÉN'),(1095,'1111','111152','EL TABLÓN'),(1096,'1111','111153','LLUZHAPA'),(1097,'1111','111154','MANÚ'),(1098,'1111','111155','SAN ANTONIO DE QUMBE (CUMBE)'),(1099,'1111','111156','SAN PABLO DE TENTA'),(1100,'1111','111157','SAN SEBASTIÁN DE YÚLUC'),(1101,'1111','111158','SELVA ALEGRE'),(1102,'1111','111159','URDANETA (PAQUISHAPA)'),(1103,'1111','111160','SUMAYPAMBA'),(1104,'1112','111250','SOZORANGA'),(1105,'1112','111251','NUEVA FÁTIMA'),(1106,'1112','111252','TACAMOROS'),(1107,'1113','111350','ZAPOTILLO'),(1108,'1113','111351','MANGAHURCO (CAZADEROS)'),(1109,'1113','111352','GARZAREAL'),(1110,'1113','111353','LIMONES'),(1111,'1113','111354','PALETILLAS'),(1112,'1113','111355','BOLASPAMBA'),(1113,'1114','111450','PINDAL'),(1114,'1114','111451','CHAQUINAL'),(1115,'1114','111452','12 DE DICIEMBRE (CAB.EN ACHIOTES)'),(1116,'1114','111453','MILAGROS'),(1117,'1115','111550','QUILANGA'),(1118,'1115','111551','FUNDOCHAMBA'),(1119,'1115','111552','SAN ANTONIO DE LAS ARADAS (CAB. EN LAS ARADAS'),(1120,'1116','111650','OLMEDO'),(1121,'1116','111651','LA TINGUE'),(1122,'1201','120101','CLEMENTE BAQUERIZO'),(1123,'1201','120102','DR. CAMILO PONCE'),(1124,'1201','120103','BARREIRO'),(1125,'1201','120104','EL SALTO'),(1126,'1201','120150','BABAHOYO'),(1127,'1201','120151','BARREIRO (SANTA RITA)'),(1128,'1201','120152','CARACOL'),(1129,'1201','120153','FEBRES CORDERO (LAS JUNTAS)'),(1130,'1201','120154','PIMOCHA'),(1131,'1201','120155','LA UNIÓN'),(1132,'1202','120250','BABA'),(1133,'1202','120251','GUARE'),(1134,'1202','120252','ISLA DE BEJUCAL'),(1135,'1203','120350','MONTALVO'),(1136,'1204','120450','PUEBLOVIEJO'),(1137,'1204','120451','PUERTO PECHICHE'),(1138,'1204','120452','SAN JUAN'),(1139,'1205','120501','QUEVEDO'),(1140,'1205','120502','SAN CAMILO'),(1141,'1205','120503','SAN JOSÉ'),(1142,'1205','120504','GUAYACÁN'),(1143,'1205','120505','NICOLÁS INFANTE DÍAZ'),(1144,'1205','120506','SAN CRISTÓBAL'),(1145,'1205','120507','SIETE DE OCTUBRE'),(1146,'1205','120508','24 DE MAYO'),(1147,'1205','120509','VENUS DEL RÍO QUEVEDO'),(1148,'1205','120510','VIVA ALFARO'),(1149,'1205','120550','QUEVEDO'),(1150,'1205','120551','BUENA FÉ'),(1151,'1205','120552','MOCACHE'),(1152,'1205','120553','SAN CARLOS'),(1153,'1205','120554','VALENCIA'),(1154,'1205','120555','LA ESPERANZA'),(1155,'1206','120650','CATARAMA'),(1156,'1206','120651','RICAURTE'),(1157,'1207','120701','10 DE NOVIEMBRE'),(1158,'1207','120750','VENTANAS'),(1159,'1207','120751','QUINSALOMA'),(1160,'1207','120752','ZAPOTAL'),(1161,'1207','120753','CHACARITA'),(1162,'1207','120754','LOS ÁNGELES'),(1163,'1208','120850','VINCES'),(1164,'1208','120851','ANTONIO SOTOMAYOR (CAB. EN PLAYAS DE VINCES)'),(1165,'1208','120852','PALENQUE'),(1166,'1209','120950','PALENQUE'),(1167,'1210','121001','SAN JACINTO DE BUENA FÉ'),(1168,'1210','121002','7 DE AGOSTO'),(1169,'1210','121003','11 DE OCTUBRE'),(1170,'1210','121050','SAN JACINTO DE BUENA FÉ'),(1171,'1210','121051','PATRICIA PILAR'),(1172,'1211','121150','VALENCIA'),(1173,'1212','121250','MOCACHE'),(1174,'1213','121350','QUINSALOMA'),(1175,'1301','130101','PORTOVIEJO'),(1176,'1301','130102','12 DE MARZO'),(1177,'1301','130103','COLÓN'),(1178,'1301','130104','PICOAZÁ'),(1179,'1301','130105','SAN PABLO'),(1180,'1301','130106','ANDRÉS DE VERA'),(1181,'1301','130107','FRANCISCO PACHECO'),(1182,'1301','130108','18 DE OCTUBRE'),(1183,'1301','130109','SIMÓN BOLÍVAR'),(1184,'1301','130150','PORTOVIEJO'),(1185,'1301','130151','ABDÓN CALDERÓN (SAN FRANCISCO)'),(1186,'1301','130152','ALHAJUELA (BAJO GRANDE)'),(1187,'1301','130153','CRUCITA'),(1188,'1301','130154','PUEBLO NUEVO'),(1189,'1301','130155','RIOCHICO (RÍO CHICO)'),(1190,'1301','130156','SAN PLÁCIDO'),(1191,'1301','130157','CHIRIJOS'),(1192,'1302','130250','CALCETA'),(1193,'1302','130251','MEMBRILLO'),(1194,'1302','130252','QUIROGA'),(1195,'1303','130301','CHONE'),(1196,'1303','130302','SANTA RITA'),(1197,'1303','130350','CHONE'),(1198,'1303','130351','BOYACÁ'),(1199,'1303','130352','CANUTO'),(1200,'1303','130353','CONVENTO'),(1201,'1303','130354','CHIBUNGA'),(1202,'1303','130355','ELOY ALFARO'),(1203,'1303','130356','RICAURTE'),(1204,'1303','130357','SAN ANTONIO'),(1205,'1304','130401','EL CARMEN'),(1206,'1304','130402','4 DE DICIEMBRE'),(1207,'1304','130450','EL CARMEN'),(1208,'1304','130451','WILFRIDO LOOR MOREIRA (MAICITO)'),(1209,'1304','130452','SAN PEDRO DE SUMA'),(1210,'1305','130550','FLAVIO ALFARO'),(1211,'1305','130551','SAN FRANCISCO DE NOVILLO (CAB. EN'),(1212,'1305','130552','ZAPALLO'),(1213,'1306','130601','DR. MIGUEL MORÁN LUCIO'),(1214,'1306','130602','MANUEL INOCENCIO PARRALES Y GUALE'),(1215,'1306','130603','SAN LORENZO DE JIPIJAPA'),(1216,'1306','130650','JIPIJAPA'),(1217,'1306','130651','AMÉRICA'),(1218,'1306','130652','EL ANEGADO (CAB. EN ELOY ALFARO)'),(1219,'1306','130653','JULCUY'),(1220,'1306','130654','LA UNIÓN'),(1221,'1306','130655','MACHALILLA'),(1222,'1306','130656','MEMBRILLAL'),(1223,'1306','130657','PEDRO PABLO GÓMEZ'),(1224,'1306','130658','PUERTO DE CAYO'),(1225,'1306','130659','PUERTO LÓPEZ'),(1226,'1307','130750','JUNÍN'),(1227,'1308','130801','LOS ESTEROS'),(1228,'1308','130802','MANTA'),(1229,'1308','130803','SAN MATEO'),(1230,'1308','130804','TARQUI'),(1231,'1308','130805','ELOY ALFARO'),(1232,'1308','130850','MANTA'),(1233,'1308','130851','SAN LORENZO'),(1234,'1308','130852','SANTA MARIANITA (BOCA DE PACOCHE)'),(1235,'1309','130901','ANIBAL SAN ANDRÉS'),(1236,'1309','130902','MONTECRISTI'),(1237,'1309','130903','EL COLORADO'),(1238,'1309','130904','GENERAL ELOY ALFARO'),(1239,'1309','130905','LEONIDAS PROAÑO'),(1240,'1309','130950','MONTECRISTI'),(1241,'1309','130951','JARAMIJÓ'),(1242,'1309','130952','LA PILA'),(1243,'1310','131050','PAJÁN'),(1244,'1310','131051','CAMPOZANO (LA PALMA DE PAJÁN)'),(1245,'1310','131052','CASCOL'),(1246,'1310','131053','GUALE'),(1247,'1310','131054','LASCANO'),(1248,'1311','131150','PICHINCHA'),(1249,'1311','131151','BARRAGANETE'),(1250,'1311','131152','SAN SEBASTIÁN'),(1251,'1312','131250','ROCAFUERTE'),(1252,'1313','131301','SANTA ANA'),(1253,'1313','131302','LODANA'),(1254,'1313','131350','SANTA ANA DE VUELTA LARGA'),(1255,'1313','131351','AYACUCHO'),(1256,'1313','131352','HONORATO VÁSQUEZ (CAB. EN VÁSQUEZ)'),(1257,'1313','131353','LA UNIÓN'),(1258,'1313','131354','OLMEDO'),(1259,'1313','131355','SAN PABLO (CAB. EN PUEBLO NUEVO)'),(1260,'1314','131401','BAHÍA DE CARÁQUEZ'),(1261,'1314','131402','LEONIDAS PLAZA GUTIÉRREZ'),(1262,'1314','131450','BAHÍA DE CARÁQUEZ'),(1263,'1314','131451','CANOA'),(1264,'1314','131452','COJIMÍES'),(1265,'1314','131453','CHARAPOTÓ'),(1266,'1314','131454','10 DE AGOSTO'),(1267,'1314','131455','JAMA'),(1268,'1314','131456','PEDERNALES'),(1269,'1314','131457','SAN ISIDRO'),(1270,'1314','131458','SAN VICENTE'),(1271,'1315','131550','TOSAGUA'),(1272,'1315','131551','BACHILLERO'),(1273,'1315','131552','ANGEL PEDRO GILER (LA ESTANCILLA)'),(1274,'1316','131650','SUCRE'),(1275,'1316','131651','BELLAVISTA'),(1276,'1316','131652','NOBOA'),(1277,'1316','131653','ARQ. SIXTO DURÁN BALLÉN'),(1278,'1317','131750','PEDERNALES'),(1279,'1317','131751','COJIMÍES'),(1280,'1317','131752','10 DE AGOSTO'),(1281,'1317','131753','ATAHUALPA'),(1282,'1318','131850','OLMEDO'),(1283,'1319','131950','PUERTO LÓPEZ'),(1284,'1319','131951','MACHALILLA'),(1285,'1319','131952','SALANGO'),(1286,'1320','132050','JAMA'),(1287,'1321','132150','JARAMIJÓ'),(1288,'1322','132250','SAN VICENTE'),(1289,'1322','132251','CANOA'),(1290,'1401','140150','MACAS'),(1291,'1401','140151','ALSHI (CAB. EN 9 DE OCTUBRE)'),(1292,'1401','140152','CHIGUAZA'),(1293,'1401','140153','GENERAL PROAÑO'),(1294,'1401','140154','HUASAGA (CAB.EN WAMPUIK)'),(1295,'1401','140155','MACUMA'),(1296,'1401','140156','SAN ISIDRO'),(1297,'1401','140157','SEVILLA DON BOSCO'),(1298,'1401','140158','SINAÍ'),(1299,'1401','140159','TAISHA'),(1300,'1401','140160','ZUÑA (ZÚÑAC)'),(1301,'1401','140161','TUUTINENTZA'),(1302,'1401','140162','CUCHAENTZA'),(1303,'1401','140163','SAN JOSÉ DE MORONA'),(1304,'1401','140164','RÍO BLANCO'),(1305,'1402','140201','GUALAQUIZA'),(1306,'1402','140202','MERCEDES MOLINA'),(1307,'1402','140250','GUALAQUIZA'),(1308,'1402','140251','AMAZONAS (ROSARIO DE CUYES)'),(1309,'1402','140252','BERMEJOS'),(1310,'1402','140253','BOMBOIZA'),(1311,'1402','140254','CHIGÜINDA'),(1312,'1402','140255','EL ROSARIO'),(1313,'1402','140256','NUEVA TARQUI'),(1314,'1402','140257','SAN MIGUEL DE CUYES'),(1315,'1402','140258','EL IDEAL'),(1316,'1403','140350','GENERAL LEONIDAS PLAZA GUTIÉRREZ (LIMÓN)'),(1317,'1403','140351','INDANZA'),(1318,'1403','140352','PAN DE AZÚCAR'),(1319,'1403','140353','SAN ANTONIO (CAB. EN SAN ANTONIO CENTRO'),(1320,'1403','140354','SAN CARLOS DE LIMÓN (SAN CARLOS DEL'),(1321,'1403','140355','SAN JUAN BOSCO'),(1322,'1403','140356','SAN MIGUEL DE CONCHAY'),(1323,'1403','140357','SANTA SUSANA DE CHIVIAZA (CAB. EN CHIVIAZA)'),(1324,'1403','140358','YUNGANZA (CAB. EN EL ROSARIO)'),(1325,'1404','140450','PALORA (METZERA)'),(1326,'1404','140451','ARAPICOS'),(1327,'1404','140452','CUMANDÁ (CAB. EN COLONIA AGRÍCOLA SEVILLA DEL'),(1328,'1404','140453','HUAMBOYA'),(1329,'1404','140454','SANGAY (CAB. EN NAYAMANACA)'),(1330,'1405','140550','SANTIAGO DE MÉNDEZ'),(1331,'1405','140551','COPAL'),(1332,'1405','140552','CHUPIANZA'),(1333,'1405','140553','PATUCA'),(1334,'1405','140554','SAN LUIS DE EL ACHO (CAB. EN EL ACHO)'),(1335,'1405','140555','SANTIAGO'),(1336,'1405','140556','TAYUZA'),(1337,'1405','140557','SAN FRANCISCO DE CHINIMBIMI'),(1338,'1406','140650','SUCÚA'),(1339,'1406','140651','ASUNCIÓN'),(1340,'1406','140652','HUAMBI'),(1341,'1406','140653','LOGROÑO'),(1342,'1406','140654','YAUPI'),(1343,'1406','140655','SANTA MARIANITA DE JESÚS'),(1344,'1407','140750','HUAMBOYA'),(1345,'1407','140751','CHIGUAZA'),(1346,'1407','140752','PABLO SEXTO'),(1347,'1408','140850','SAN JUAN BOSCO'),(1348,'1408','140851','PAN DE AZÚCAR'),(1349,'1408','140852','SAN CARLOS DE LIMÓN'),(1350,'1408','140853','SAN JACINTO DE WAKAMBEIS'),(1351,'1408','140854','SANTIAGO DE PANANZA'),(1352,'1409','140950','TAISHA'),(1353,'1409','140951','HUASAGA (CAB. EN WAMPUIK)'),(1354,'1409','140952','MACUMA'),(1355,'1409','140953','TUUTINENTZA'),(1356,'1409','140954','PUMPUENTSA'),(1357,'1410','141050','LOGROÑO'),(1358,'1410','141051','YAUPI'),(1359,'1410','141052','SHIMPIS'),(1360,'1411','141150','PABLO SEXTO'),(1361,'1412','141250','SANTIAGO'),(1362,'1412','141251','SAN JOSÉ DE MORONA'),(1363,'1501','150150','TENA'),(1364,'1501','150151','AHUANO'),(1365,'1501','150152','CARLOS JULIO AROSEMENA TOLA (ZATZA-YACU)'),(1366,'1501','150153','CHONTAPUNTA'),(1367,'1501','150154','PANO'),(1368,'1501','150155','PUERTO MISAHUALLI'),(1369,'1501','150156','PUERTO NAPO'),(1370,'1501','150157','TÁLAG'),(1371,'1501','150158','SAN JUAN DE MUYUNA'),(1372,'1503','150350','ARCHIDONA'),(1373,'1503','150351','AVILA'),(1374,'1503','150352','COTUNDO'),(1375,'1503','150353','LORETO'),(1376,'1503','150354','SAN PABLO DE USHPAYACU'),(1377,'1503','150355','PUERTO MURIALDO'),(1378,'1504','150450','EL CHACO'),(1379,'1504','150451','GONZALO DíAZ DE PINEDA (EL BOMBÓN)'),(1380,'1504','150452','LINARES'),(1381,'1504','150453','OYACACHI'),(1382,'1504','150454','SANTA ROSA'),(1383,'1504','150455','SARDINAS'),(1384,'1507','150750','BAEZA'),(1385,'1507','150751','COSANGA'),(1386,'1507','150752','CUYUJA'),(1387,'1507','150753','PAPALLACTA'),(1388,'1507','150754','SAN FRANCISCO DE BORJA (VIRGILIO DÁVILA)'),(1389,'1507','150755','SAN JOSÉ DEL PAYAMINO'),(1390,'1507','150756','SUMACO'),(1391,'1509','150950','CARLOS JULIO AROSEMENA TOLA'),(1392,'1601','160150','PUYO'),(1393,'1601','160151','ARAJUNO'),(1394,'1601','160152','CANELOS'),(1395,'1601','160153','CURARAY'),(1396,'1601','160154','DIEZ DE AGOSTO'),(1397,'1601','160155','FÁTIMA'),(1398,'1601','160156','MONTALVO (ANDOAS)'),(1399,'1601','160157','POMONA'),(1400,'1601','160158','RÍO CORRIENTES'),(1401,'1601','160159','RÍO TIGRE'),(1402,'1601','160160','SANTA CLARA'),(1403,'1601','160161','SARAYACU'),(1404,'1601','160162','SIMÓN BOLÍVAR (CAB. EN MUSHULLACTA)'),(1405,'1601','160163','TARQUI'),(1406,'1601','160164','TENIENTE HUGO ORTIZ'),(1407,'1601','160165','VERACRUZ (INDILLAMA) (CAB. EN INDILLAMA)'),(1408,'1601','160166','EL TRIUNFO'),(1409,'1602','160250','MERA'),(1410,'1602','160251','MADRE TIERRA'),(1411,'1602','160252','SHELL'),(1412,'1603','160350','SANTA CLARA'),(1413,'1603','160351','SAN JOSÉ'),(1414,'1604','160450','ARAJUNO'),(1415,'1604','160451','CURARAY'),(1416,'1701','170101','BELISARIO QUEVEDO'),(1417,'1701','170102','CARCELÉN'),(1418,'1701','170103','CENTRO HISTÓRICO'),(1419,'1701','170104','COCHAPAMBA'),(1420,'1701','170105','COMITÉ DEL PUEBLO'),(1421,'1701','170106','COTOCOLLAO'),(1422,'1701','170107','CHILIBULO'),(1423,'1701','170108','CHILLOGALLO'),(1424,'1701','170109','CHIMBACALLE'),(1425,'1701','170110','EL CONDADO'),(1426,'1701','170111','GUAMANÍ'),(1427,'1701','170112','IÑAQUITO'),(1428,'1701','170113','ITCHIMBÍA'),(1429,'1701','170114','JIPIJAPA'),(1430,'1701','170115','KENNEDY'),(1431,'1701','170116','LA ARGELIA'),(1432,'1701','170117','LA CONCEPCIÓN'),(1433,'1701','170118','LA ECUATORIANA'),(1434,'1701','170119','LA FERROVIARIA'),(1435,'1701','170120','LA LIBERTAD'),(1436,'1701','170121','LA MAGDALENA'),(1437,'1701','170122','LA MENA'),(1438,'1701','170123','MARISCAL SUCRE'),(1439,'1701','170124','PONCEANO'),(1440,'1701','170125','PUENGASÍ'),(1441,'1701','170126','QUITUMBE'),(1442,'1701','170127','RUMIPAMBA'),(1443,'1701','170128','SAN BARTOLO'),(1444,'1701','170129','SAN ISIDRO DEL INCA'),(1445,'1701','170130','SAN JUAN'),(1446,'1701','170131','SOLANDA'),(1447,'1701','170132','TURUBAMBA'),(1448,'1701','170150','QUITO DISTRITO METROPOLITANO'),(1449,'1701','170151','ALANGASÍ'),(1450,'1701','170152','AMAGUAÑA'),(1451,'1701','170153','ATAHUALPA'),(1452,'1701','170154','CALACALÍ'),(1453,'1701','170155','CALDERÓN'),(1454,'1701','170156','CONOCOTO'),(1455,'1701','170157','CUMBAYÁ'),(1456,'1701','170158','CHAVEZPAMBA'),(1457,'1701','170159','CHECA'),(1458,'1701','170160','EL QUINCHE'),(1459,'1701','170161','GUALEA'),(1460,'1701','170162','GUANGOPOLO'),(1461,'1701','170163','GUAYLLABAMBA'),(1462,'1701','170164','LA MERCED'),(1463,'1701','170165','LLANO CHICO'),(1464,'1701','170166','LLOA'),(1465,'1701','170167','MINDO'),(1466,'1701','170168','NANEGAL'),(1467,'1701','170169','NANEGALITO'),(1468,'1701','170170','NAYÓN'),(1469,'1701','170171','NONO'),(1470,'1701','170172','PACTO'),(1471,'1701','170173','PEDRO VICENTE MALDONADO'),(1472,'1701','170174','PERUCHO'),(1473,'1701','170175','PIFO'),(1474,'1701','170176','PÍNTAG'),(1475,'1701','170177','POMASQUI'),(1476,'1701','170178','PUÉLLARO'),(1477,'1701','170179','PUEMBO'),(1478,'1701','170180','SAN ANTONIO'),(1479,'1701','170181','SAN JOSÉ DE MINAS'),(1480,'1701','170182','SAN MIGUEL DE LOS BANCOS'),(1481,'1701','170183','TABABELA'),(1482,'1701','170184','TUMBACO'),(1483,'1701','170185','YARUQUÍ'),(1484,'1701','170186','ZAMBIZA'),(1485,'1701','170187','PUERTO QUITO'),(1486,'1702','170201','AYORA'),(1487,'1702','170202','CAYAMBE'),(1488,'1702','170203','JUAN MONTALVO'),(1489,'1702','170250','CAYAMBE'),(1490,'1702','170251','ASCÁZUBI'),(1491,'1702','170252','CANGAHUA'),(1492,'1702','170253','OLMEDO (PESILLO)'),(1493,'1702','170254','OTÓN'),(1494,'1702','170255','SANTA ROSA DE CUZUBAMBA'),(1495,'1703','170350','MACHACHI'),(1496,'1703','170351','ALÓAG'),(1497,'1703','170352','ALOASÍ'),(1498,'1703','170353','CUTUGLAHUA'),(1499,'1703','170354','EL CHAUPI'),(1500,'1703','170355','MANUEL CORNEJO ASTORGA (TANDAPI)'),(1501,'1703','170356','TAMBILLO'),(1502,'1703','170357','UYUMBICHO'),(1503,'1704','170450','TABACUNDO'),(1504,'1704','170451','LA ESPERANZA'),(1505,'1704','170452','MALCHINGUÍ'),(1506,'1704','170453','TOCACHI'),(1507,'1704','170454','TUPIGACHI'),(1508,'1705','170501','SANGOLQUÍ'),(1509,'1705','170502','SAN PEDRO DE TABOADA'),(1510,'1705','170503','SAN RAFAEL'),(1511,'1705','170550','SANGOLQUI'),(1512,'1705','170551','COTOGCHOA'),(1513,'1705','170552','RUMIPAMBA'),(1514,'1707','170750','SAN MIGUEL DE LOS BANCOS'),(1515,'1707','170751','MINDO'),(1516,'1707','170752','PEDRO VICENTE MALDONADO'),(1517,'1707','170753','PUERTO QUITO'),(1518,'1708','170850','PEDRO VICENTE MALDONADO'),(1519,'1709','170950','PUERTO QUITO'),(1520,'1801','180101','ATOCHA – FICOA'),(1521,'1801','180102','CELIANO MONGE'),(1522,'1801','180103','HUACHI CHICO'),(1523,'1801','180104','HUACHI LORETO'),(1524,'1801','180105','LA MERCED'),(1525,'1801','180106','LA PENÍNSULA'),(1526,'1801','180107','MATRIZ'),(1527,'1801','180108','PISHILATA'),(1528,'1801','180109','SAN FRANCISCO'),(1529,'1801','180150','AMBATO'),(1530,'1801','180151','AMBATILLO'),(1531,'1801','180152','ATAHUALPA (CHISALATA)'),(1532,'1801','180153','AUGUSTO N. MARTÍNEZ (MUNDUGLEO)'),(1533,'1801','180154','CONSTANTINO FERNÁNDEZ (CAB. EN CULLITAHUA)'),(1534,'1801','180155','HUACHI GRANDE'),(1535,'1801','180156','IZAMBA'),(1536,'1801','180157','JUAN BENIGNO VELA'),(1537,'1801','180158','MONTALVO'),(1538,'1801','180159','PASA'),(1539,'1801','180160','PICAIGUA'),(1540,'1801','180161','PILAGÜÍN (PILAHÜÍN)'),(1541,'1801','180162','QUISAPINCHA (QUIZAPINCHA)'),(1542,'1801','180163','SAN BARTOLOMÉ DE PINLLOG'),(1543,'1801','180164','SAN FERNANDO (PASA SAN FERNANDO)'),(1544,'1801','180165','SANTA ROSA'),(1545,'1801','180166','TOTORAS'),(1546,'1801','180167','CUNCHIBAMBA'),(1547,'1801','180168','UNAMUNCHO'),(1548,'1802','180250','BAÑOS DE AGUA SANTA'),(1549,'1802','180251','LLIGUA'),(1550,'1802','180252','RÍO NEGRO'),(1551,'1802','180253','RÍO VERDE'),(1552,'1802','180254','ULBA'),(1553,'1803','180350','CEVALLOS'),(1554,'1804','180450','MOCHA'),(1555,'1804','180451','PINGUILÍ'),(1556,'1805','180550','PATATE'),(1557,'1805','180551','EL TRIUNFO'),(1558,'1805','180552','LOS ANDES (CAB. EN POATUG)'),(1559,'1805','180553','SUCRE (CAB. EN SUCRE-PATATE URCU)'),(1560,'1806','180650','QUERO'),(1561,'1806','180651','RUMIPAMBA'),(1562,'1806','180652','YANAYACU - MOCHAPATA (CAB. EN YANAYACU)'),(1563,'1807','180701','PELILEO'),(1564,'1807','180702','PELILEO GRANDE'),(1565,'1807','180750','PELILEO'),(1566,'1807','180751','BENÍTEZ (PACHANLICA)'),(1567,'1807','180752','BOLÍVAR'),(1568,'1807','180753','COTALÓ'),(1569,'1807','180754','CHIQUICHA (CAB. EN CHIQUICHA GRANDE)'),(1570,'1807','180755','EL ROSARIO (RUMICHACA)'),(1571,'1807','180756','GARCÍA MORENO (CHUMAQUI)'),(1572,'1807','180757','GUAMBALÓ (HUAMBALÓ)'),(1573,'1807','180758','SALASACA'),(1574,'1808','180801','CIUDAD NUEVA'),(1575,'1808','180802','PÍLLARO'),(1576,'1808','180850','PÍLLARO'),(1577,'1808','180851','BAQUERIZO MORENO'),(1578,'1808','180852','EMILIO MARÍA TERÁN (RUMIPAMBA)'),(1579,'1808','180853','MARCOS ESPINEL (CHACATA)'),(1580,'1808','180854','PRESIDENTE URBINA (CHAGRAPAMBA -PATZUCUL)'),(1581,'1808','180855','SAN ANDRÉS'),(1582,'1808','180856','SAN JOSÉ DE POALÓ'),(1583,'1808','180857','SAN MIGUELITO'),(1584,'1809','180950','TISALEO'),(1585,'1809','180951','QUINCHICOTO'),(1586,'1901','190101','EL LIMÓN'),(1587,'1901','190102','ZAMORA'),(1588,'1901','190150','ZAMORA'),(1589,'1901','190151','CUMBARATZA'),(1590,'1901','190152','GUADALUPE'),(1591,'1901','190153','IMBANA (LA VICTORIA DE IMBANA)'),(1592,'1901','190154','PAQUISHA'),(1593,'1901','190155','SABANILLA'),(1594,'1901','190156','TIMBARA'),(1595,'1901','190157','ZUMBI'),(1596,'1901','190158','SAN CARLOS DE LAS MINAS'),(1597,'1902','190250','ZUMBA'),(1598,'1902','190251','CHITO'),(1599,'1902','190252','EL CHORRO'),(1600,'1902','190253','EL PORVENIR DEL CARMEN'),(1601,'1902','190254','LA CHONTA'),(1602,'1902','190255','PALANDA'),(1603,'1902','190256','PUCAPAMBA'),(1604,'1902','190257','SAN FRANCISCO DEL VERGEL'),(1605,'1902','190258','VALLADOLID'),(1606,'1902','190259','SAN ANDRÉS'),(1607,'1903','190350','GUAYZIMI'),(1608,'1903','190351','ZURMI'),(1609,'1903','190352','NUEVO PARAÍSO'),(1610,'1904','190450','28 DE MAYO (SAN JOSÉ DE YACUAMBI)'),(1611,'1904','190451','LA PAZ'),(1612,'1904','190452','TUTUPALI'),(1613,'1905','190550','YANTZAZA (YANZATZA)'),(1614,'1905','190551','CHICAÑA'),(1615,'1905','190552','EL PANGUI'),(1616,'1905','190553','LOS ENCUENTROS'),(1617,'1906','190650','EL PANGUI'),(1618,'1906','190651','EL GUISME'),(1619,'1906','190652','PACHICUTZA'),(1620,'1906','190653','TUNDAYME'),(1621,'1907','190750','ZUMBI'),(1622,'1907','190751','PAQUISHA'),(1623,'1907','190752','TRIUNFO-DORADO'),(1624,'1907','190753','PANGUINTZA'),(1625,'1908','190850','PALANDA'),(1626,'1908','190851','EL PORVENIR DEL CARMEN'),(1627,'1908','190852','SAN FRANCISCO DEL VERGEL'),(1628,'1908','190853','VALLADOLID'),(1629,'1908','190854','LA CANELA'),(1630,'1909','190950','PAQUISHA'),(1631,'1909','190951','BELLAVISTA'),(1632,'1909','190952','NUEVO QUITO'),(1633,'2001','200150','PUERTO BAQUERIZO MORENO'),(1634,'2001','200151','EL PROGRESO'),(1635,'2001','200152','ISLA SANTA MARÍA (FLOREANA) (CAB. EN PTO. VEL'),(1636,'2002','200250','PUERTO VILLAMIL'),(1637,'2002','200251','TOMÁS DE BERLANGA (SANTO TOMÁS)'),(1638,'2003','200350','PUERTO AYORA'),(1639,'2003','200351','BELLAVISTA'),(1640,'2003','200352','SANTA ROSA (INCLUYE LA ISLA BALTRA)'),(1641,'2101','210150','NUEVA LOJA'),(1642,'2101','210151','CUYABENO'),(1643,'2101','210152','DURENO'),(1644,'2101','210153','GENERAL FARFÁN'),(1645,'2101','210154','TARAPOA'),(1646,'2101','210155','EL ENO'),(1647,'2101','210156','PACAYACU'),(1648,'2101','210157','JAMBELÍ'),(1649,'2101','210158','SANTA CECILIA'),(1650,'2101','210159','AGUAS NEGRAS'),(1651,'2102','210250','EL DORADO DE CASCALES'),(1652,'2102','210251','EL REVENTADOR'),(1653,'2102','210252','GONZALO PIZARRO'),(1654,'2102','210253','LUMBAQUÍ'),(1655,'2102','210254','PUERTO LIBRE'),(1656,'2102','210255','SANTA ROSA DE SUCUMBÍOS'),(1657,'2103','210350','PUERTO EL CARMEN DEL PUTUMAYO'),(1658,'2103','210351','PALMA ROJA'),(1659,'2103','210352','PUERTO BOLÍVAR (PUERTO MONTÚFAR)'),(1660,'2103','210353','PUERTO RODRÍGUEZ'),(1661,'2103','210354','SANTA ELENA'),(1662,'2104','210450','SHUSHUFINDI'),(1663,'2104','210451','LIMONCOCHA'),(1664,'2104','210452','PAÑACOCHA'),(1665,'2104','210453','SAN ROQUE (CAB. EN SAN VICENTE)'),(1666,'2104','210454','SAN PEDRO DE LOS COFANES'),(1667,'2104','210455','SIETE DE JULIO'),(1668,'2105','210550','LA BONITA'),(1669,'2105','210551','EL PLAYÓN DE SAN FRANCISCO'),(1670,'2105','210552','LA SOFÍA'),(1671,'2105','210553','ROSA FLORIDA'),(1672,'2105','210554','SANTA BÁRBARA'),(1673,'2106','210650','EL DORADO DE CASCALES'),(1674,'2106','210651','SANTA ROSA DE SUCUMBÍOS'),(1675,'2106','210652','SEVILLA'),(1676,'2107','210750','TARAPOA'),(1677,'2107','210751','CUYABENO'),(1678,'2107','210752','AGUAS NEGRAS'),(1679,'2201','220150','PUERTO FRANCISCO DE ORELLANA (EL COCA)'),(1680,'2201','220151','DAYUMA'),(1681,'2201','220152','TARACOA (NUEVA ESPERANZA: YUCA)'),(1682,'2201','220153','ALEJANDRO LABAKA'),(1683,'2201','220154','EL DORADO'),(1684,'2201','220155','EL EDÉN'),(1685,'2201','220156','GARCÍA MORENO'),(1686,'2201','220157','INÉS ARANGO (CAB. EN WESTERN)'),(1687,'2201','220158','LA BELLEZA'),(1688,'2201','220159','NUEVO PARAÍSO (CAB. EN UNIÓN'),(1689,'2201','220160','SAN JOSÉ DE GUAYUSA'),(1690,'2201','220161','SAN LUIS DE ARMENIA'),(1691,'2202','220201','TIPITINI'),(1692,'2202','220250','NUEVO ROCAFUERTE'),(1693,'2202','220251','CAPITÁN AUGUSTO RIVADENEYRA'),(1694,'2202','220252','CONONACO'),(1695,'2202','220253','SANTA MARÍA DE HUIRIRIMA'),(1696,'2202','220254','TIPUTINI'),(1697,'2202','220255','YASUNÍ'),(1698,'2203','220350','LA JOYA DE LOS SACHAS'),(1699,'2203','220351','ENOKANQUI'),(1700,'2203','220352','POMPEYA'),(1701,'2203','220353','SAN CARLOS'),(1702,'2203','220354','SAN SEBASTIÁN DEL COCA'),(1703,'2203','220355','LAGO SAN PEDRO'),(1704,'2203','220356','RUMIPAMBA'),(1705,'2203','220357','TRES DE NOVIEMBRE'),(1706,'2203','220358','UNIÓN MILAGREÑA'),(1707,'2204','220450','LORETO'),(1708,'2204','220451','AVILA (CAB. EN HUIRUNO)'),(1709,'2204','220452','PUERTO MURIALDO'),(1710,'2204','220453','SAN JOSÉ DE PAYAMINO'),(1711,'2204','220454','SAN JOSÉ DE DAHUANO'),(1712,'2204','220455','SAN VICENTE DE HUATICOCHA'),(1713,'2301','230101','ABRAHAM CALAZACÓN'),(1714,'2301','230102','BOMBOLÍ'),(1715,'2301','230103','CHIGUILPE'),(1716,'2301','230104','RÍO TOACHI'),(1717,'2301','230105','RÍO VERDE'),(1718,'2301','230106','SANTO DOMINGO DE LOS COLORADOS'),(1719,'2301','230107','ZARACAY'),(1720,'2301','230150','SANTO DOMINGO DE LOS COLORADOS'),(1721,'2301','230151','ALLURIQUÍN'),(1722,'2301','230152','PUERTO LIMÓN'),(1723,'2301','230153','LUZ DE AMÉRICA'),(1724,'2301','230154','SAN JACINTO DEL BÚA'),(1725,'2301','230155','VALLE HERMOSO'),(1726,'2301','230156','EL ESFUERZO'),(1727,'2301','230157','SANTA MARÍA DEL TOACHI'),(1728,'2401','240101','BALLENITA'),(1729,'2401','240102','SANTA ELENA'),(1730,'2401','240150','SANTA ELENA'),(1731,'2401','240151','ATAHUALPA'),(1732,'2401','240152','COLONCHE'),(1733,'2401','240153','CHANDUY'),(1734,'2401','240154','MANGLARALTO'),(1735,'2401','240155','SIMÓN BOLÍVAR (JULIO MORENO)'),(1736,'2401','240156','SAN JOSÉ DE ANCÓN'),(1737,'2402','240250','LA LIBERTAD'),(1738,'2403','240301','CARLOS ESPINOZA LARREA'),(1739,'2403','240302','GRAL. ALBERTO ENRÍQUEZ GALLO'),(1740,'2403','240303','VICENTE ROCAFUERTE'),(1741,'2403','240304','SANTA ROSA'),(1742,'2403','240350','SALINAS'),(1743,'2403','240351','ANCONCITO'),(1744,'2403','240352','JOSÉ LUIS TAMAYO (MUEY)'),(1745,'9001','900151','LAS GOLONDRINAS'),(1746,'9003','900351','MANGA DEL CURA'),(1747,'9004','900451','EL PIEDRERO'),(1748,'TIP','ESTL','Estado Laboral'),(1749,'ESTL','01','Ninguno'),(1750,'TIP','NIV','NIVELES'),(1751,'NIV','001','EDUCACION GENERAL BASICA -  PREPARATORIA'),(1752,'NIV','002','EDUCACION GENERAL BASICA - ELEMENTAL'),(1753,'NIV','003','EDUCACION GENERAL BASICA - MEDIA'),(1754,'NIV','004','EDUCACION GENERAL BASICA - SUPERIOR'),(1755,'NIV','005','BACHILLERATO GENERAL UNIFICADO'),(1756,'TIP','MOD','MODALIDAD'),(1757,'MOD','001','ONLINE'),(1758,'MOD','002','PRESENCIAL'),(1759,'MOD','003','SEMI-PRESENCIAL'),(1760,'TIP','TED','TIPO EDUCACION'),(1761,'TED','001','ORDINARIA'),(1762,'TED','002','EXTRAORDINARIA'),(1763,'TIP','TRE','REGIMEN'),(1764,'TRE','COS','COSTA'),(1765,'TRE','SIE','SIERRA'),(1766,'TRE','AMZ','AMAZONIA'),(1767,'TRE','INS','INSULAR'),(1768,'TIP','TIC','CURSO'),(1769,'TIC','PC','PRIMERO'),(1770,'TIC','SC','SEGUNDO'),(1771,'TIC','TC','TERCERO'),(1772,'TIC','CC','CUARTO'),(1773,'TIC','QC','QUINTO'),(1774,'TIC','SC','SEXTO'),(1775,'TIC','SPC','SEPTIMO'),(1776,'TIP','TPL','PARALELOS'),(1777,'TPL','A','A'),(1778,'TPL','B','B'),(1779,'TPL','C','C'),(1780,'TPL','D','D'),(1781,'TPL','E','E'),(1782,'TPL','F','F'),(1783,'TPL','G','G'),(1784,'STA','MTR','MATRICULADO'),(1785,'IDA','NIN','FUERA');
/*!40000 ALTER TABLE `genr_general` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genr_historial`
--

DROP TABLE IF EXISTS `genr_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genr_historial` (
  `id_historial` int NOT NULL AUTO_INCREMENT,
  `modulo` varchar(50) NOT NULL,
  `accion` varchar(50) NOT NULL,
  `usuario_mod` varchar(50) NOT NULL,
  `terminal_mod` varchar(50) NOT NULL,
  `fecha_mod` date NOT NULL,
  `id_menu` int NOT NULL,
  PRIMARY KEY (`id_historial`),
  KEY `genr_historial_id_menu_32224d38_fk_conf_menu_id_menu` (`id_menu`),
  CONSTRAINT `genr_historial_id_menu_32224d38_fk_conf_menu_id_menu` FOREIGN KEY (`id_menu`) REFERENCES `conf_menu` (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genr_historial`
--

LOCK TABLES `genr_historial` WRITE;
/*!40000 ALTER TABLE `genr_historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `genr_historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mant_anio_lectivo`
--

DROP TABLE IF EXISTS `mant_anio_lectivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mant_anio_lectivo` (
  `id_anio_lectivo` int NOT NULL AUTO_INCREMENT,
  `anio` int NOT NULL,
  `ciclo` int NOT NULL,
  `fecha_incio_ciclo` date NOT NULL,
  `fecha_fin_ciclo` date NOT NULL,
  `id_genr_estado` int NOT NULL,
  PRIMARY KEY (`id_anio_lectivo`),
  UNIQUE KEY `anio` (`anio`),
  UNIQUE KEY `ciclo` (`ciclo`),
  KEY `mant_anio_lectivo_id_genr_estado_cec5b50c_fk_genr_gene` (`id_genr_estado`),
  CONSTRAINT `mant_anio_lectivo_id_genr_estado_cec5b50c_fk_genr_gene` FOREIGN KEY (`id_genr_estado`) REFERENCES `genr_general` (`idgenr_general`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mant_anio_lectivo`
--

LOCK TABLES `mant_anio_lectivo` WRITE;
/*!40000 ALTER TABLE `mant_anio_lectivo` DISABLE KEYS */;
INSERT INTO `mant_anio_lectivo` VALUES (1,2019,1,'2000-12-12','2001-12-12',98),(2,2020,2,'2013-12-12','2014-12-12',1784);
/*!40000 ALTER TABLE `mant_anio_lectivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mant_empleado`
--

DROP TABLE IF EXISTS `mant_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mant_empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `fecha_ingreso` datetime(6) DEFAULT NULL,
  `usuario_ing` varchar(45) NOT NULL,
  `terminal_ing` varchar(45) NOT NULL,
  `id_anio_lectivo` int NOT NULL,
  `id_persona` int NOT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `mant_empleado_id_anio_lectivo_8e86b683_fk_mant_anio` (`id_anio_lectivo`),
  KEY `mant_empleado_id_persona_b0b32e94_fk_mant_persona_id_persona` (`id_persona`),
  KEY `mant_empleado_id_usuario_2929f7e1_fk_conf_usuario_id_usuario` (`id_usuario`),
  CONSTRAINT `mant_empleado_id_anio_lectivo_8e86b683_fk_mant_anio` FOREIGN KEY (`id_anio_lectivo`) REFERENCES `mant_anio_lectivo` (`id_anio_lectivo`),
  CONSTRAINT `mant_empleado_id_persona_b0b32e94_fk_mant_persona_id_persona` FOREIGN KEY (`id_persona`) REFERENCES `mant_persona` (`id_persona`),
  CONSTRAINT `mant_empleado_id_usuario_2929f7e1_fk_conf_usuario_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `conf_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mant_empleado`
--

LOCK TABLES `mant_empleado` WRITE;
/*!40000 ALTER TABLE `mant_empleado` DISABLE KEYS */;
INSERT INTO `mant_empleado` VALUES (2,'2020-11-06 00:13:08.670257','cristof','anderson-HP-Laptop-15-db1xxx',2,9,NULL),(3,'2021-02-17 22:38:20.934607','luisillo21','eliot-MrBot',2,41,NULL),(4,'2021-03-30 21:30:08.992357','luisillo21','Saber',2,42,NULL);
/*!40000 ALTER TABLE `mant_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mant_estudiante`
--

DROP TABLE IF EXISTS `mant_estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mant_estudiante` (
  `id_estudiante` int NOT NULL AUTO_INCREMENT,
  `tipo_estudiante` varchar(45) NOT NULL,
  `fecha_ingreso` datetime(6) DEFAULT NULL,
  `usuario_ing` varchar(45) NOT NULL,
  `terminal_ing` varchar(45) NOT NULL,
  `id_persona` int NOT NULL,
  PRIMARY KEY (`id_estudiante`),
  KEY `mant_estudiante_id_persona_876bb4bc_fk_mant_persona_id_persona` (`id_persona`),
  CONSTRAINT `mant_estudiante_id_persona_876bb4bc_fk_mant_persona_id_persona` FOREIGN KEY (`id_persona`) REFERENCES `mant_persona` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mant_estudiante`
--

LOCK TABLES `mant_estudiante` WRITE;
/*!40000 ALTER TABLE `mant_estudiante` DISABLE KEYS */;
INSERT INTO `mant_estudiante` VALUES (1,'Asignado','2020-11-06 02:32:31.969975','cristof','anderson-HP-Laptop-15-db1xxx',10),(2,'Asignado','2020-11-06 02:32:32.605889','cristof','anderson-HP-Laptop-15-db1xxx',11),(3,'Asignado','2020-11-06 02:32:33.011349','cristof','anderson-HP-Laptop-15-db1xxx',12),(4,'Asignado','2020-11-06 02:32:33.304253','cristof','anderson-HP-Laptop-15-db1xxx',13),(5,'Asignado','2020-11-06 02:32:33.666097','cristof','anderson-HP-Laptop-15-db1xxx',14),(6,'Asignado','2020-11-06 02:32:33.913286','cristof','anderson-HP-Laptop-15-db1xxx',15),(7,'Asignado','2020-11-06 02:32:34.185507','cristof','anderson-HP-Laptop-15-db1xxx',16),(8,'Asignado','2020-11-06 02:32:34.556730','cristof','anderson-HP-Laptop-15-db1xxx',17),(9,'Asignado','2020-11-06 02:32:34.906093','cristof','anderson-HP-Laptop-15-db1xxx',18),(10,'Asignado','2020-11-06 02:32:35.189002','cristof','anderson-HP-Laptop-15-db1xxx',19),(11,'Asignado','2020-11-06 02:32:35.495922','cristof','anderson-HP-Laptop-15-db1xxx',20),(12,'Asignado','2020-11-06 02:32:35.809866','cristof','anderson-HP-Laptop-15-db1xxx',21),(13,'Asignado','2020-11-06 02:32:36.113127','cristof','anderson-HP-Laptop-15-db1xxx',22),(14,'Asignado','2020-11-06 02:32:36.510034','cristof','anderson-HP-Laptop-15-db1xxx',23),(15,'Asignado','2020-11-06 02:32:36.782176','cristof','anderson-HP-Laptop-15-db1xxx',24),(16,'Asignado','2020-11-06 02:32:37.089057','cristof','anderson-HP-Laptop-15-db1xxx',25),(17,'Asignado','2020-11-06 02:32:37.347357','cristof','anderson-HP-Laptop-15-db1xxx',26),(18,'Asignado','2020-11-06 02:32:37.593375','cristof','anderson-HP-Laptop-15-db1xxx',27),(19,'Asignado','2020-11-06 02:32:37.865643','cristof','anderson-HP-Laptop-15-db1xxx',28),(20,'Asignado','2020-11-06 02:32:38.224354','cristof','anderson-HP-Laptop-15-db1xxx',29),(21,'Asignado','2020-11-06 02:32:38.509451','cristof','anderson-HP-Laptop-15-db1xxx',30),(22,'Asignado','2020-11-06 02:32:38.792150','cristof','anderson-HP-Laptop-15-db1xxx',31),(23,'Asignado','2020-11-06 02:32:39.061220','cristof','anderson-HP-Laptop-15-db1xxx',32),(24,'Asignado','2020-11-06 02:32:39.355633','cristof','anderson-HP-Laptop-15-db1xxx',33),(25,'Asignado','2020-11-06 02:32:39.625952','cristof','anderson-HP-Laptop-15-db1xxx',34),(26,'Asignado','2020-11-06 02:32:39.975586','cristof','anderson-HP-Laptop-15-db1xxx',35),(27,'Asignado','2020-11-06 02:32:40.225187','cristof','anderson-HP-Laptop-15-db1xxx',36),(28,'Asignado','2020-11-06 02:32:40.517949','cristof','anderson-HP-Laptop-15-db1xxx',37),(29,'Asignado','2020-11-06 02:32:40.789473','cristof','anderson-HP-Laptop-15-db1xxx',38),(30,'Asignado','2020-11-06 02:32:41.068479','cristof','anderson-HP-Laptop-15-db1xxx',39),(31,'Asignado','2020-11-06 02:32:41.335706','cristof','anderson-HP-Laptop-15-db1xxx',40),(32,'Asignado','2021-04-01 04:18:03.786253','luisillo21','Saber',43),(33,'Asignado','2021-04-01 22:54:52.073173','saber14','Saber',44),(34,'Asignado','2021-04-26 05:22:25.545218','cristof','DESKTOP-4TCP6L4',45),(35,'Asignado','2021-04-26 07:57:11.216928','luisillo21','DESKTOP-4TCP6L4',46),(36,'Asignado','2021-04-27 02:57:41.668812','cristof','DESKTOP-4TCP6L4',47);
/*!40000 ALTER TABLE `mant_estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mant_persona`
--

DROP TABLE IF EXISTS `mant_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mant_persona` (
  `id_persona` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `identificacion` varchar(50) NOT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `lugar_nacimiento` varchar(45) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `fecha_ingreso` datetime(6) DEFAULT NULL,
  `usuario_ing` varchar(60) NOT NULL,
  `terminal_ing` varchar(60) NOT NULL,
  `discapacidad` tinyint(1) DEFAULT NULL,
  `discapacidad_renal` tinyint(1) DEFAULT NULL,
  `discapacidad_neurologica` tinyint(1) DEFAULT NULL,
  `enfermedad_alergica` tinyint(1) DEFAULT NULL,
  `asma` tinyint(1) DEFAULT NULL,
  `epilepsia` tinyint(1) DEFAULT NULL,
  `enfermedad_congenita` tinyint(1) DEFAULT NULL,
  `enfermedad_respiratoria` tinyint(1) DEFAULT NULL,
  `atencion_psicologica` tinyint(1) DEFAULT NULL,
  `pnombres` varchar(45) DEFAULT NULL,
  `papellidos` varchar(45) DEFAULT NULL,
  `pidentificacion` varchar(15) DEFAULT NULL,
  `pdireccion` varchar(45) DEFAULT NULL,
  `ptelefono` varchar(45) DEFAULT NULL,
  `pvive_con_usted` tinyint(1) DEFAULT NULL,
  `mnombres` varchar(45) DEFAULT NULL,
  `mapellidos` varchar(45) DEFAULT NULL,
  `midentificacion` varchar(15) DEFAULT NULL,
  `mdireccion` varchar(45) DEFAULT NULL,
  `mtelefono` varchar(45) DEFAULT NULL,
  `mvive_con_usted` tinyint(1) DEFAULT NULL,
  `bono_solidario` tinyint(1) DEFAULT NULL,
  `rnombres` varchar(45) DEFAULT NULL,
  `rapellidos` varchar(45) DEFAULT NULL,
  `rtelefono` varchar(45) DEFAULT NULL,
  `ridentificacion` varchar(13) DEFAULT NULL,
  `tipo_parentesco` varchar(200) DEFAULT NULL,
  `rvive_con_usted` tinyint(1) DEFAULT NULL,
  `rdireccion_trabajo` varchar(200) DEFAULT NULL,
  `rtelefono_trabajo` varchar(20) DEFAULT NULL,
  `rcorreo` varchar(50) DEFAULT NULL,
  `rhorario_laboral` varchar(40) DEFAULT NULL,
  `mienbros_hogar` int DEFAULT NULL,
  `estado` int NOT NULL,
  `id_genr_categoria_migratoria` int DEFAULT NULL,
  `id_genr_ciudad` int DEFAULT NULL,
  `id_genr_estado_civil` int DEFAULT NULL,
  `id_genr_estado_laboralm` int DEFAULT NULL,
  `id_genr_estado_laboralp` int DEFAULT NULL,
  `id_genr_etnia` int DEFAULT NULL,
  `id_genr_genero` int DEFAULT NULL,
  `id_genr_idioma_ancestral` int DEFAULT NULL,
  `id_genr_indigena` int DEFAULT NULL,
  `id_genr_jornada` int DEFAULT NULL,
  `id_genr_pais` int DEFAULT NULL,
  `id_genr_provincia` int DEFAULT NULL,
  `id_genr_tipo_identificacion` int DEFAULT NULL,
  `id_genr_tipo_sangre` int DEFAULT NULL,
  `id_genr_tipo_usuario` int NOT NULL,
  `ciudadMam` int DEFAULT NULL,
  `ciudadPap` int DEFAULT NULL,
  `ciudadRe` int DEFAULT NULL,
  `correo_elMam` varchar(50) DEFAULT NULL,
  `correo_elPap` varchar(50) DEFAULT NULL,
  `correo_elest` varchar(100) DEFAULT NULL,
  `direccionRe` varchar(200) DEFAULT NULL,
  `edadEst` int DEFAULT NULL,
  `edadMam` int DEFAULT NULL,
  `edadPap` int DEFAULT NULL,
  `edadRe` int DEFAULT NULL,
  `fecha_nacimientoMa` date DEFAULT NULL,
  `fecha_nacimientoPap` date DEFAULT NULL,
  `fecha_nacimientoRe` date DEFAULT NULL,
  `generoMam` int DEFAULT NULL,
  `generoPap` int DEFAULT NULL,
  `generoRe` int DEFAULT NULL,
  `lugardetrabajoRe` varchar(200) DEFAULT NULL,
  `nacionalidadEst` int DEFAULT NULL,
  `paisMam` int DEFAULT NULL,
  `paisPap` int DEFAULT NULL,
  `paisRe` int DEFAULT NULL,
  `plantel_procedenciaEst` varchar(150) DEFAULT NULL,
  `profesionRe` varchar(100) DEFAULT NULL,
  `referenciadeubicacion` varchar(200) DEFAULT NULL,
  `sector` int DEFAULT NULL,
  `cod_alfnum` int DEFAULT NULL,
  PRIMARY KEY (`id_persona`),
  KEY `mant_persona_estado_a8421edb_fk_genr_general_idgenr_general` (`estado`),
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
  KEY `mant_persona_id_genr_tipo_sangre_ba558316_fk_genr_gene` (`id_genr_tipo_sangre`),
  KEY `mant_persona_id_genr_tipo_usuario_9a359f1a_fk_genr_gene` (`id_genr_tipo_usuario`),
  KEY `mant_persona_ciudadMam_a3a3da59_fk_genr_general_idgenr_general` (`ciudadMam`),
  KEY `mant_persona_ciudadPap_7803df31_fk_genr_general_idgenr_general` (`ciudadPap`),
  KEY `mant_persona_ciudadRe_0e2b6e5e_fk_genr_general_idgenr_general` (`ciudadRe`),
  KEY `mant_persona_generoMam_422827b6_fk_genr_general_idgenr_general` (`generoMam`),
  KEY `mant_persona_generoPap_fe2e4832_fk_genr_general_idgenr_general` (`generoPap`),
  KEY `mant_persona_generoRe_a6b0d19b_fk_genr_general_idgenr_general` (`generoRe`),
  KEY `mant_persona_nacionalidadEst_d0902ee5_fk_genr_gene` (`nacionalidadEst`),
  KEY `mant_persona_paisMam_37587613_fk_genr_general_idgenr_general` (`paisMam`),
  KEY `mant_persona_paisPap_3b587794_fk_genr_general_idgenr_general` (`paisPap`),
  KEY `mant_persona_paisRe_cb804c96_fk_genr_general_idgenr_general` (`paisRe`),
  KEY `mant_persona_sector_53d4a9df_fk_genr_general_idgenr_general` (`sector`),
  CONSTRAINT `mant_persona_ciudadMam_a3a3da59_fk_genr_general_idgenr_general` FOREIGN KEY (`ciudadMam`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_ciudadPap_7803df31_fk_genr_general_idgenr_general` FOREIGN KEY (`ciudadPap`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_ciudadRe_0e2b6e5e_fk_genr_general_idgenr_general` FOREIGN KEY (`ciudadRe`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_estado_a8421edb_fk_genr_general_idgenr_general` FOREIGN KEY (`estado`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_generoMam_422827b6_fk_genr_general_idgenr_general` FOREIGN KEY (`generoMam`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_generoPap_fe2e4832_fk_genr_general_idgenr_general` FOREIGN KEY (`generoPap`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_generoRe_a6b0d19b_fk_genr_general_idgenr_general` FOREIGN KEY (`generoRe`) REFERENCES `genr_general` (`idgenr_general`),
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
  CONSTRAINT `mant_persona_id_genr_tipo_sangre_ba558316_fk_genr_gene` FOREIGN KEY (`id_genr_tipo_sangre`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_id_genr_tipo_usuario_9a359f1a_fk_genr_gene` FOREIGN KEY (`id_genr_tipo_usuario`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_nacionalidadEst_d0902ee5_fk_genr_gene` FOREIGN KEY (`nacionalidadEst`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_paisMam_37587613_fk_genr_general_idgenr_general` FOREIGN KEY (`paisMam`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_paisPap_3b587794_fk_genr_general_idgenr_general` FOREIGN KEY (`paisPap`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_paisRe_cb804c96_fk_genr_general_idgenr_general` FOREIGN KEY (`paisRe`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_persona_sector_53d4a9df_fk_genr_general_idgenr_general` FOREIGN KEY (`sector`) REFERENCES `genr_general` (`idgenr_general`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mant_persona`
--

LOCK TABLES `mant_persona` WRITE;
/*!40000 ALTER TABLE `mant_persona` DISABLE KEYS */;
INSERT INTO `mant_persona` VALUES (3,'Luis Eduardo','Ardila Macias','1998-04-06','0000-00-00','static/img/user_default_image.svg','0950596353','0963779728','luisardilamacia','2020-03-05 22:18:57.000000','0000-00-00 00:00:00.000000','Admin','Duran',127,0,0,0,0,0,0,0,0,'0','0','0','8','no requerido',0,'no requerido','no requerido','no requerido','0','no requerido',0,0,'no requerido','no requerido','1','no requerido','no requerido',0,'1','no requerido','no requerido','no requerido',0,59,35,6,59,59,49,33,59,59,59,14,33,8,59,90,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'Cristhofer Bryan','Peralta Montero','2000-10-02','0000-00-00','static/img/user_default_image.svg','0948775694','0979364073','asdasd','0000-00-00 00:00:00.000000','0000-00-00 00:00:00.000000','','',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'33',NULL,NULL,NULL,'nombres representante','apellidos representante','33',NULL,NULL,NULL,'33',NULL,'',NULL,0,33,33,33,33,33,33,33,59,59,59,14,33,8,59,90,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'Anderson','Sinaluisa','0953227857','2000-12-13','guayaquil','av casuarina',NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 00:13:08.643572','cristof','anderson-HP-Laptop-15-db1xxx',0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,'afullink@gmail.com',NULL,4,97,67,199,6,NULL,1749,49,4,52,52,41,14,33,8,88,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'JUANITO ALCACHOFA','ALVARADO LAND','0961009545','2000-07-10','Bastion','Guayaquil',NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:31.848355','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante','0999833438',NULL,NULL,NULL,'Bastion Popular Bloque 11 Mz961 S6',NULL,'chrisbryan2000@gmail.com',NULL,NULL,97,68,127,NULL,NULL,1749,44,3,52,63,NULL,14,108,8,92,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,14,14,NULL,NULL,NULL,NULL,NULL),(11,'ALICE MISHELL','ARANA PERALTA','0961359213',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:32.273519','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'DANNA AINHOA','ARELLANO RAMIREZ','0961422862',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:32.923032','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'ELIAS EZEQUIEL','BAUTISTA YAGUAL','0961365590',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:33.214986','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'DANIELA MADELAINE','CASTRO COTTALLAT','0961432655',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:33.542899','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'SELENY SARAHI','CRUEL LOOR','0961166238',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:33.836964','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'DANTE GEOVANNY','GONZALEZ RAMIREZ','0961129160',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:34.084663','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'DANTE GEOVANNY','GONZALEZ RAMIREZ','0961104429',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:34.388660','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'DYLAN MAURICIO','HUACHO ZAPATA','0961060449',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:34.805047','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'WILLIAM ANTONIO','JACOME GONZALEZ','0961376837','2000-07-10','Hospital Luis Bernaza','Daule Laurel',NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:35.106961','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,'Prueba@hotmail.com',NULL,NULL,97,68,127,NULL,NULL,1749,49,4,55,61,NULL,14,106,8,89,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1997-07-10','1998-07-10',NULL,NULL,NULL,NULL,NULL,NULL,14,14,NULL,NULL,NULL,NULL,NULL,191001),(20,'DAFNE ELBA','JARA CEPEDA','0961416716',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:35.419665','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'LUCAS EMILIO','JHONSON BONOZO','0961351541',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:35.703394','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'DONELLY ALEJANDRO','LLERENA RUIZ','0961119914',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:36.007458','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'JEHOVANNA MIKAELA','MACIAS ALTAMIRANO','0961454824',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:36.433321','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'DANTE BENJAMIN','MERO MUNOZ','0961810538',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:36.689377','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'MIA SAMANTHA','MORA MAGALLANES','0961134178',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:37.002439','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'DEIVI EMANUEL','MORA ZAMBRANO','0961209822',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:37.255505','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'SARA CAROLINA','MORALES ESPINOZA','0961189966',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:37.516557','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'KRISTHEL NATASHA','MOREIRA ORTIZ','0961160892',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:37.779678','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'LIAM KEYLETH','PLACENCIO CARRION','0961198710',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:38.129611','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'ABDIAS MATHEO','QUIMI MARIDUENA','0961465291',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:38.430648','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'ISABELLA SAMARA','RIVAS ESPANA','0961038338',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:38.713733','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'DONATO SEBASTIAN','SANTILLAN ECHEVERRIA','0961185972',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:38.981317','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'LUCAS ALEXANDER','SUAREZ PARODI','0960954279',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:39.261080','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,'JOSUE MATIAS','TAPIA GONZALEZ','0932963903',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:39.549747','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,'JOAO GAHEL','TORRES GONZALEZ','0961302981',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:39.894035','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'ANGELA EYLEEN','VERA BURGOS','0961398302',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:40.143205','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'MATTHEW AGUSTIN','VERA MOREIRA','0961137171',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:40.434032','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'SAMARA BETSABE','YANTALEMA ROSERO','0960992634',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:40.698985','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'ARLENY KATALEYA','ZAMBRANO ANGULO','0961320447',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:40.984679','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,'JADIEL STEEVEN','ZURITA SANGA','0961077831',NULL,NULL,NULL,NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2020-11-06 02:32:41.243921','cristof','anderson-HP-Laptop-15-db1xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,'cristofer','Peralta','0953336070','2021-03-06','en un hospital','esto es una direccion',NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2021-02-17 22:38:20.919970','luisillo21','eliot-MrBot',0,1,1,1,1,1,1,1,1,'Sasha','grey','0953336070','esta es otra direccion','0993813175',0,NULL,NULL,NULL,NULL,NULL,NULL,1,'nombres representante','apellidos representante',NULL,NULL,NULL,NULL,NULL,NULL,'sashagrey@hotmail.com',NULL,5,97,67,125,5,NULL,1749,44,3,52,52,41,12,33,8,87,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,'Anthony Alexander','Triguero','0928902519','2021-03-20','dasd','Coop. Nuevo amanecer',NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2021-03-30 21:30:08.647362','luisillo21','Saber',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'nombre representante','apellido representante',NULL,NULL,NULL,NULL,NULL,NULL,'asdasda@gmail.com',NULL,4,97,68,135,5,NULL,1749,44,3,62,62,41,13,112,8,89,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,'Anthony Alexander','Triguero Alvarado','0928902519','2010-02-10','Guayaquil','Colinas martha bucaran de roldos','0957575784','0967675782','../../../static/img/texto-menu.pnguser_default_image.svg','2021-04-01 04:18:03.751254','luisillo21','Saber',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0928902519',NULL,NULL,NULL,NULL,'nombre representante','apellido representante',NULL,NULL,NULL,NULL,NULL,NULL,'anthony.2108@hotmail.com',NULL,NULL,97,68,138,NULL,NULL,1749,46,4,61,62,41,13,115,8,91,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,'Darwin Carlos','Baque Baque','0928902519','1999-01-01','Guayaquil','Colinas martha bucaran de roldos','0957575784','0967675782','../../../static/img/texto-menu.pnguser_default_image.svg','2021-04-01 22:54:52.062178','saber14','Saber',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'nombre representante','apellido representante',NULL,NULL,NULL,NULL,NULL,NULL,'anthony.2108@hotmail.com',NULL,NULL,97,68,138,NULL,NULL,1749,46,4,62,64,NULL,12,104,8,88,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2000-07-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,'Chris','CASTRO COTTALLAT','0958476475','2000-01-26','Hospital Luis Bernaza','Guayaquil',NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2021-04-26 05:22:25.536242','cristof','DESKTOP-4TCP6L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrisbryan2000@gmail.com',NULL,NULL,98,68,134,NULL,NULL,1749,47,4,55,55,NULL,13,108,8,87,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,'ASDASDASD','CASTRO COTTALLAT','0958476475','2021-04-07','Hospital Luis Bernaza','Guayaquil',NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2021-04-26 07:57:11.207943','luisillo21','DESKTOP-4TCP6L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrisbryan2000@gmail.com',NULL,NULL,98,69,135,NULL,NULL,1749,44,4,63,61,NULL,16,111,8,88,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,'Chris','ASDASD','0958476475','2021-04-26','Bastion','Guayaquil',NULL,NULL,'../../../static/img/texto-menu.pnguser_default_image.svg','2021-04-27 02:57:41.653850','cristof','DESKTOP-4TCP6L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrisbryan2000@gmail.com',NULL,NULL,98,68,137,NULL,NULL,1749,44,4,62,62,NULL,16,107,8,88,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,123456);
/*!40000 ALTER TABLE `mant_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mant_representante`
--

DROP TABLE IF EXISTS `mant_representante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mant_representante` (
  `id_representante` int NOT NULL AUTO_INCREMENT,
  `usuario_ing` varchar(45) NOT NULL,
  `fecha_ingreso` datetime(6) NOT NULL,
  `terminal_ing` varchar(45) NOT NULL,
  `ingresos_totales` double NOT NULL,
  `id_usuario` int NOT NULL,
  `id_genr_nivel_formacion` int NOT NULL,
  `id_persona` int NOT NULL,
  PRIMARY KEY (`id_representante`),
  KEY `mant_representante_id_genr_nivel_formac_84cba28b_fk_genr_gene` (`id_genr_nivel_formacion`),
  KEY `mant_representante_id_persona_f06c7605_fk_mant_pers` (`id_persona`),
  CONSTRAINT `mant_representante_id_genr_nivel_formac_84cba28b_fk_genr_gene` FOREIGN KEY (`id_genr_nivel_formacion`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mant_representante_id_persona_f06c7605_fk_mant_pers` FOREIGN KEY (`id_persona`) REFERENCES `mant_persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mov_admision` (
  `id_admision` int NOT NULL AUTO_INCREMENT,
  `tipo_documento` varchar(45) NOT NULL,
  `documento` varchar(45) NOT NULL,
  `id_estudiante` int NOT NULL,
  PRIMARY KEY (`id_admision`),
  KEY `mov_admision_id_estudiante_a4dd1e55_fk_mant_estu` (`id_estudiante`),
  CONSTRAINT `mov_admision_id_estudiante_a4dd1e55_fk_mant_estu` FOREIGN KEY (`id_estudiante`) REFERENCES `mant_estudiante` (`id_estudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_admision`
--

LOCK TABLES `mov_admision` WRITE;
/*!40000 ALTER TABLE `mov_admision` DISABLE KEYS */;
/*!40000 ALTER TABLE `mov_admision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mov_anioelectivo_curso_paralelo`
--

DROP TABLE IF EXISTS `mov_anioelectivo_curso_paralelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mov_anioelectivo_curso_paralelo` (
  `id_mov_anioelectivo_curso` int NOT NULL AUTO_INCREMENT,
  `id_anio_electivo_id` int NOT NULL,
  `id_curso` int NOT NULL,
  `estado` int NOT NULL,
  `id_genr_paralelo_id` int NOT NULL,
  PRIMARY KEY (`id_mov_anioelectivo_curso`),
  KEY `mov_anioelectivo_cur_id_anio_electivo_id_3081375f_fk_mant_anio` (`id_anio_electivo_id`),
  KEY `mov_anioelectivo_cur_id_curso_771ccd20_fk_mov_cab_c` (`id_curso`),
  KEY `mov_anioelectivo_cur_estado_504edf72_fk_genr_gene` (`estado`),
  KEY `mov_anioelectivo_cur_id_genr_paralelo_id_b5bd2e92_fk_genr_gene` (`id_genr_paralelo_id`),
  CONSTRAINT `mov_anioelectivo_cur_estado_504edf72_fk_genr_gene` FOREIGN KEY (`estado`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mov_anioelectivo_cur_id_anio_electivo_id_3081375f_fk_mant_anio` FOREIGN KEY (`id_anio_electivo_id`) REFERENCES `mant_anio_lectivo` (`id_anio_lectivo`),
  CONSTRAINT `mov_anioelectivo_cur_id_curso_771ccd20_fk_mov_cab_c` FOREIGN KEY (`id_curso`) REFERENCES `mov_cab_curso` (`id_curso`),
  CONSTRAINT `mov_anioelectivo_cur_id_genr_paralelo_id_b5bd2e92_fk_genr_gene` FOREIGN KEY (`id_genr_paralelo_id`) REFERENCES `genr_general` (`idgenr_general`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_anioelectivo_curso_paralelo`
--

LOCK TABLES `mov_anioelectivo_curso_paralelo` WRITE;
/*!40000 ALTER TABLE `mov_anioelectivo_curso_paralelo` DISABLE KEYS */;
INSERT INTO `mov_anioelectivo_curso_paralelo` VALUES (1,2,1,97,1777),(2,2,1,97,1778),(3,2,3,97,1777),(4,2,3,97,1780),(5,2,1,97,1780),(6,2,3,97,1778),(7,2,3,97,1779);
/*!40000 ALTER TABLE `mov_anioelectivo_curso_paralelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mov_cab_curso`
--

DROP TABLE IF EXISTS `mov_cab_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mov_cab_curso` (
  `id_curso` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `cupo` int NOT NULL,
  `id_genr_curso` int NOT NULL,
  `id_genr_formacion` int NOT NULL,
  `id_genr_jornada` int NOT NULL,
  `id_genr_modalidad` int NOT NULL,
  `id_genr_regimen` int NOT NULL,
  `id_genr_tipo_educacion` int NOT NULL,
  PRIMARY KEY (`id_curso`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `mov_cab_curso_id_genr_curso_5faf9c55_fk_genr_gene` (`id_genr_curso`),
  KEY `mov_cab_curso_id_genr_formacion_cfb255f5_fk_genr_gene` (`id_genr_formacion`),
  KEY `mov_cab_curso_id_genr_jornada_af275278_fk_genr_gene` (`id_genr_jornada`),
  KEY `mov_cab_curso_id_genr_modalidad_5d26551a_fk_genr_gene` (`id_genr_modalidad`),
  KEY `mov_cab_curso_id_genr_regimen_83bf30cf_fk_genr_gene` (`id_genr_regimen`),
  KEY `mov_cab_curso_id_genr_tipo_educaci_7d9218f8_fk_genr_gene` (`id_genr_tipo_educacion`),
  CONSTRAINT `mov_cab_curso_id_genr_curso_5faf9c55_fk_genr_gene` FOREIGN KEY (`id_genr_curso`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mov_cab_curso_id_genr_formacion_cfb255f5_fk_genr_gene` FOREIGN KEY (`id_genr_formacion`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mov_cab_curso_id_genr_jornada_af275278_fk_genr_gene` FOREIGN KEY (`id_genr_jornada`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mov_cab_curso_id_genr_modalidad_5d26551a_fk_genr_gene` FOREIGN KEY (`id_genr_modalidad`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mov_cab_curso_id_genr_regimen_83bf30cf_fk_genr_gene` FOREIGN KEY (`id_genr_regimen`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mov_cab_curso_id_genr_tipo_educaci_7d9218f8_fk_genr_gene` FOREIGN KEY (`id_genr_tipo_educacion`) REFERENCES `genr_general` (`idgenr_general`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_cab_curso`
--

LOCK TABLES `mov_cab_curso` WRITE;
/*!40000 ALTER TABLE `mov_cab_curso` DISABLE KEYS */;
INSERT INTO `mov_cab_curso` VALUES (1,'006','1',45,1769,1755,41,1757,1764,1762),(2,'002','3',40,1773,1755,41,1758,1764,1761),(3,'003','3',40,1770,1753,41,1758,1764,1761);
/*!40000 ALTER TABLE `mov_cab_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mov_cab_registro_notas`
--

DROP TABLE IF EXISTS `mov_cab_registro_notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mov_cab_registro_notas` (
  `id_registro_notas` int NOT NULL AUTO_INCREMENT,
  `fecha_ingreso` datetime(6) DEFAULT NULL,
  `usuario_ing` varchar(45) DEFAULT NULL,
  `terminal_ing` varchar(45) DEFAULT NULL,
  `id_detalle_registro_notas` int DEFAULT NULL,
  `id_mov_anioelectivo_curso` int DEFAULT NULL,
  PRIMARY KEY (`id_registro_notas`),
  KEY `mov_cab_registro_not_id_detalle_registro__6dfea9c3_fk_mov_detal` (`id_detalle_registro_notas`),
  KEY `mov_cab_registro_not_id_mov_anioelectivo__3d7ffaf2_fk_mov_anioe` (`id_mov_anioelectivo_curso`),
  CONSTRAINT `mov_cab_registro_not_id_detalle_registro__6dfea9c3_fk_mov_detal` FOREIGN KEY (`id_detalle_registro_notas`) REFERENCES `mov_detalle_registro_notas` (`id_detalle_registro_notas`),
  CONSTRAINT `mov_cab_registro_not_id_mov_anioelectivo__3d7ffaf2_fk_mov_anioe` FOREIGN KEY (`id_mov_anioelectivo_curso`) REFERENCES `mov_anioelectivo_curso_paralelo` (`id_mov_anioelectivo_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_cab_registro_notas`
--

LOCK TABLES `mov_cab_registro_notas` WRITE;
/*!40000 ALTER TABLE `mov_cab_registro_notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `mov_cab_registro_notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mov_detalle_materia_curso`
--

DROP TABLE IF EXISTS `mov_detalle_materia_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mov_detalle_materia_curso` (
  `id_detalle_materia_curso` int NOT NULL AUTO_INCREMENT,
  `total_horas` int NOT NULL,
  `estado` int NOT NULL,
  `id_genr_materias` int NOT NULL,
  `id_mov_aniolectivo_curso` int NOT NULL,
  PRIMARY KEY (`id_detalle_materia_curso`),
  KEY `mov_detalle_materia__estado_dd6018f2_fk_genr_gene` (`estado`),
  KEY `mov_detalle_materia__id_genr_materias_089c4fd0_fk_genr_gene` (`id_genr_materias`),
  KEY `mov_detalle_materia__id_mov_aniolectivo_c_09d69f00_fk_mov_anioe` (`id_mov_aniolectivo_curso`),
  CONSTRAINT `mov_detalle_materia__estado_dd6018f2_fk_genr_gene` FOREIGN KEY (`estado`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mov_detalle_materia__id_genr_materias_089c4fd0_fk_genr_gene` FOREIGN KEY (`id_genr_materias`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mov_detalle_materia__id_mov_aniolectivo_c_09d69f00_fk_mov_anioe` FOREIGN KEY (`id_mov_aniolectivo_curso`) REFERENCES `mov_anioelectivo_curso_paralelo` (`id_mov_anioelectivo_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_detalle_materia_curso`
--

LOCK TABLES `mov_detalle_materia_curso` WRITE;
/*!40000 ALTER TABLE `mov_detalle_materia_curso` DISABLE KEYS */;
INSERT INTO `mov_detalle_materia_curso` VALUES (1,25,1,24,1),(2,5,97,24,1),(3,20,97,25,1),(4,20,97,26,1),(5,5,97,24,2),(6,10,97,25,2),(7,2,97,26,2),(8,15,97,24,3),(9,1,97,26,3);
/*!40000 ALTER TABLE `mov_detalle_materia_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mov_detalle_registro_notas`
--

DROP TABLE IF EXISTS `mov_detalle_registro_notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mov_detalle_registro_notas` (
  `id_detalle_registro_notas` int NOT NULL AUTO_INCREMENT,
  `primer_parcial` double DEFAULT NULL,
  `segundo_parcial` double DEFAULT NULL,
  `tercer_parcial` double DEFAULT NULL,
  `promedio_parciales` double DEFAULT NULL,
  `examen` double DEFAULT NULL,
  `primer_parcial_2Q` double DEFAULT NULL,
  `segundo_parcial_2Q` double DEFAULT NULL,
  `tercer_parcial_2Q` double DEFAULT NULL,
  `promedio_parciales_2Q` double DEFAULT NULL,
  `examen_2Q` double DEFAULT NULL,
  `promedio_general_1` double DEFAULT NULL,
  `promedio_general_2` double DEFAULT NULL,
  `total_promedio_general` double DEFAULT NULL,
  `examen_supletorio` double DEFAULT NULL,
  `examen_remedial` double DEFAULT NULL,
  `examen_gracia` double DEFAULT NULL,
  `disciplina` varchar(1) DEFAULT NULL,
  `id_general_quimestre1` int NOT NULL,
  `id_general_quimestre2` int NOT NULL,
  `id_materia_profesor` int NOT NULL,
  `id_matriculacion_estudiante` int NOT NULL,
  `id_mov_anioelectivo_curso` int DEFAULT NULL,
  PRIMARY KEY (`id_detalle_registro_notas`),
  KEY `mov_detalle_registro_id_materia_profesor_6b38bc8b_fk_mov_mater` (`id_materia_profesor`),
  KEY `mov_detalle_registro_id_mov_anioelectivo__16164f35_fk_mov_anioe` (`id_mov_anioelectivo_curso`),
  KEY `mov_detalle_registro_id_general_quimestre_a5c5c735_fk_genr_gene` (`id_general_quimestre2`),
  KEY `mov_detalle_registro_id_general_quimestre_bad21cd9_fk_genr_gene` (`id_general_quimestre1`),
  KEY `mov_detalle_registro_id_matriculacion_est_5c991f31_fk_mov_matri` (`id_matriculacion_estudiante`),
  CONSTRAINT `mov_detalle_registro_id_general_quimestre_a5c5c735_fk_genr_gene` FOREIGN KEY (`id_general_quimestre2`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mov_detalle_registro_id_general_quimestre_bad21cd9_fk_genr_gene` FOREIGN KEY (`id_general_quimestre1`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mov_detalle_registro_id_materia_profesor_6b38bc8b_fk_mov_mater` FOREIGN KEY (`id_materia_profesor`) REFERENCES `mov_materia_profesor` (`id_materia_profesor`),
  CONSTRAINT `mov_detalle_registro_id_matriculacion_est_5c991f31_fk_mov_matri` FOREIGN KEY (`id_matriculacion_estudiante`) REFERENCES `mov_matriculacion_estudiante` (`id_matriculacion_estudiante`),
  CONSTRAINT `mov_detalle_registro_id_mov_anioelectivo__16164f35_fk_mov_anioe` FOREIGN KEY (`id_mov_anioelectivo_curso`) REFERENCES `mov_anioelectivo_curso_paralelo` (`id_mov_anioelectivo_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_detalle_registro_notas`
--

LOCK TABLES `mov_detalle_registro_notas` WRITE;
/*!40000 ALTER TABLE `mov_detalle_registro_notas` DISABLE KEYS */;
INSERT INTO `mov_detalle_registro_notas` VALUES (1,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,'A',28,29,2,1,NULL),(5,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,'A',28,29,2,31,NULL),(6,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,'A',28,29,2,10,NULL),(8,10,10,10,10,10,10,10,10,10,10,10,10,10,NULL,NULL,NULL,NULL,28,29,2,25,NULL),(9,10,10,10,10,10,10,10,10,10,10,10,10,NULL,10,NULL,NULL,NULL,28,29,2,26,NULL),(11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,29,4,28,NULL);
/*!40000 ALTER TABLE `mov_detalle_registro_notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mov_horario_materia`
--

DROP TABLE IF EXISTS `mov_horario_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mov_horario_materia` (
  `id_horario` int NOT NULL AUTO_INCREMENT,
  `hora_inicio` time(6) NOT NULL,
  `hora_fin` time(6) NOT NULL,
  `fecha_ingreso` datetime(6) NOT NULL,
  `usuario_ing` varchar(45) NOT NULL,
  `terminal_ing` varchar(45) NOT NULL,
  `estado` int NOT NULL,
  `id_genr_dia` int NOT NULL,
  `id_materia_profesor` int NOT NULL,
  PRIMARY KEY (`id_horario`),
  KEY `mov_horario_materia_estado_c6bcc572_fk_genr_gene` (`estado`),
  KEY `mov_horario_materia_id_genr_dia_21684097_fk_genr_gene` (`id_genr_dia`),
  KEY `mov_horario_materia_id_materia_profesor_76723fd8_fk_mov_mater` (`id_materia_profesor`),
  CONSTRAINT `mov_horario_materia_estado_c6bcc572_fk_genr_gene` FOREIGN KEY (`estado`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mov_horario_materia_id_genr_dia_21684097_fk_genr_gene` FOREIGN KEY (`id_genr_dia`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mov_horario_materia_id_materia_profesor_76723fd8_fk_mov_mater` FOREIGN KEY (`id_materia_profesor`) REFERENCES `mov_materia_profesor` (`id_materia_profesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_horario_materia`
--

LOCK TABLES `mov_horario_materia` WRITE;
/*!40000 ALTER TABLE `mov_horario_materia` DISABLE KEYS */;
/*!40000 ALTER TABLE `mov_horario_materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mov_horas_docentes`
--

DROP TABLE IF EXISTS `mov_horas_docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mov_horas_docentes` (
  `id_horas_docente` int NOT NULL AUTO_INCREMENT,
  `total_horas` decimal(65,2) NOT NULL,
  `horas_disponible` decimal(65,2) NOT NULL,
  `id_empleado` int NOT NULL,
  PRIMARY KEY (`id_horas_docente`),
  KEY `mov_horas_docentes_id_empleado_b41a7597_fk_mant_empl` (`id_empleado`),
  CONSTRAINT `mov_horas_docentes_id_empleado_b41a7597_fk_mant_empl` FOREIGN KEY (`id_empleado`) REFERENCES `mant_empleado` (`id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_horas_docentes`
--

LOCK TABLES `mov_horas_docentes` WRITE;
/*!40000 ALTER TABLE `mov_horas_docentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mov_horas_docentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mov_materia_profesor`
--

DROP TABLE IF EXISTS `mov_materia_profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mov_materia_profesor` (
  `id_materia_profesor` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int NOT NULL,
  PRIMARY KEY (`id_materia_profesor`),
  KEY `mov_materia_profesor_id_empleado_c8f3fc94_fk_mant_empl` (`id_empleado`),
  CONSTRAINT `mov_materia_profesor_id_empleado_c8f3fc94_fk_mant_empl` FOREIGN KEY (`id_empleado`) REFERENCES `mant_empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_materia_profesor`
--

LOCK TABLES `mov_materia_profesor` WRITE;
/*!40000 ALTER TABLE `mov_materia_profesor` DISABLE KEYS */;
INSERT INTO `mov_materia_profesor` VALUES (2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `mov_materia_profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mov_matriculacion_estudiante`
--

DROP TABLE IF EXISTS `mov_matriculacion_estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mov_matriculacion_estudiante` (
  `id_matriculacion_estudiante` int NOT NULL AUTO_INCREMENT,
  `fecha_ingreso` datetime(6) DEFAULT NULL,
  `usuario_ing` varchar(45) DEFAULT NULL,
  `terminal_ing` varchar(45) DEFAULT NULL,
  `estado` int NOT NULL,
  `id_estudiante` int NOT NULL,
  `id_mov_anioelectivo_curso` int DEFAULT NULL,
  PRIMARY KEY (`id_matriculacion_estudiante`),
  KEY `mov_matriculacion_es_estado_4514511a_fk_genr_gene` (`estado`),
  KEY `mov_matriculacion_es_id_estudiante_919bb5ca_fk_mant_estu` (`id_estudiante`),
  KEY `mov_matriculacion_es_id_mov_anioelectivo__d1f1439a_fk_mov_anioe` (`id_mov_anioelectivo_curso`),
  CONSTRAINT `mov_matriculacion_es_estado_4514511a_fk_genr_gene` FOREIGN KEY (`estado`) REFERENCES `genr_general` (`idgenr_general`),
  CONSTRAINT `mov_matriculacion_es_id_estudiante_919bb5ca_fk_mant_estu` FOREIGN KEY (`id_estudiante`) REFERENCES `mant_estudiante` (`id_estudiante`),
  CONSTRAINT `mov_matriculacion_es_id_mov_anioelectivo__d1f1439a_fk_mov_anioe` FOREIGN KEY (`id_mov_anioelectivo_curso`) REFERENCES `mov_anioelectivo_curso_paralelo` (`id_mov_anioelectivo_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_matriculacion_estudiante`
--

LOCK TABLES `mov_matriculacion_estudiante` WRITE;
/*!40000 ALTER TABLE `mov_matriculacion_estudiante` DISABLE KEYS */;
INSERT INTO `mov_matriculacion_estudiante` VALUES (1,'2020-11-06 02:32:32.141070','cristof','anderson-HP-Laptop-15-db1xxx',98,1,3),(2,'2020-11-06 02:32:32.726898','cristof','anderson-HP-Laptop-15-db1xxx',98,2,3),(3,'2020-11-06 02:32:33.099023','cristof','anderson-HP-Laptop-15-db1xxx',98,3,3),(4,'2020-11-06 02:32:33.427451','cristof','anderson-HP-Laptop-15-db1xxx',98,4,3),(5,'2020-11-06 02:32:33.760352','cristof','anderson-HP-Laptop-15-db1xxx',98,5,3),(6,'2020-11-06 02:32:34.002087','cristof','anderson-HP-Laptop-15-db1xxx',98,6,3),(7,'2020-11-06 02:32:34.281301','cristof','anderson-HP-Laptop-15-db1xxx',98,7,3),(8,'2020-11-06 02:32:34.714066','cristof','anderson-HP-Laptop-15-db1xxx',98,8,3),(9,'2020-11-06 02:32:35.008879','cristof','anderson-HP-Laptop-15-db1xxx',98,9,3),(10,'2020-11-06 02:32:35.311755','cristof','anderson-HP-Laptop-15-db1xxx',98,10,3),(11,'2020-11-06 02:32:35.602274','cristof','anderson-HP-Laptop-15-db1xxx',98,11,3),(12,'2020-11-06 02:32:35.916802','cristof','anderson-HP-Laptop-15-db1xxx',98,12,3),(13,'2020-11-06 02:32:36.305290','cristof','anderson-HP-Laptop-15-db1xxx',98,13,3),(14,'2020-11-06 02:32:36.594243','cristof','anderson-HP-Laptop-15-db1xxx',98,14,3),(15,'2020-11-06 02:32:36.870486','cristof','anderson-HP-Laptop-15-db1xxx',98,15,3),(16,'2020-11-06 02:32:37.179997','cristof','anderson-HP-Laptop-15-db1xxx',98,16,3),(17,'2020-11-06 02:32:37.432890','cristof','anderson-HP-Laptop-15-db1xxx',98,17,3),(18,'2020-11-06 02:32:37.694964','cristof','anderson-HP-Laptop-15-db1xxx',98,18,3),(19,'2020-11-06 02:32:37.949769','cristof','anderson-HP-Laptop-15-db1xxx',98,19,3),(20,'2020-11-06 02:32:38.325140','cristof','anderson-HP-Laptop-15-db1xxx',98,20,3),(21,'2020-11-06 02:32:38.617582','cristof','anderson-HP-Laptop-15-db1xxx',98,21,3),(22,'2020-11-06 02:32:38.877034','cristof','anderson-HP-Laptop-15-db1xxx',98,22,3),(23,'2020-11-06 02:32:39.153033','cristof','anderson-HP-Laptop-15-db1xxx',98,23,3),(24,'2020-11-06 02:32:39.464359','cristof','anderson-HP-Laptop-15-db1xxx',98,24,3),(25,'2020-11-06 02:32:39.724553','cristof','anderson-HP-Laptop-15-db1xxx',98,25,3),(26,'2020-11-06 02:32:40.060848','cristof','anderson-HP-Laptop-15-db1xxx',98,26,3),(27,'2020-11-06 02:32:40.328393','cristof','anderson-HP-Laptop-15-db1xxx',98,27,3),(28,'2020-11-06 02:32:40.602611','cristof','anderson-HP-Laptop-15-db1xxx',98,28,3),(29,'2020-11-06 02:32:40.889492','cristof','anderson-HP-Laptop-15-db1xxx',1784,29,3),(30,'2020-11-06 02:32:41.156367','cristof','anderson-HP-Laptop-15-db1xxx',98,30,3),(31,'2020-11-06 02:32:41.558968','cristof','anderson-HP-Laptop-15-db1xxx',98,31,3);
/*!40000 ALTER TABLE `mov_matriculacion_estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mov_profesor_materiacurso`
--

DROP TABLE IF EXISTS `mov_profesor_materiacurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mov_profesor_materiacurso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mov_materia_profesor_id` int NOT NULL,
  `movdetallemateriacurso_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mov_profesor_materiacurs_mov_materia_profesor_id__7063477f_uniq` (`mov_materia_profesor_id`,`movdetallemateriacurso_id`),
  KEY `mov_profesor_materia_movdetallemateriacur_417ecc60_fk_mov_detal` (`movdetallemateriacurso_id`),
  CONSTRAINT `mov_profesor_materia_mov_materia_profesor_eee0fb0c_fk_mov_mater` FOREIGN KEY (`mov_materia_profesor_id`) REFERENCES `mov_materia_profesor` (`id_materia_profesor`),
  CONSTRAINT `mov_profesor_materia_movdetallemateriacur_417ecc60_fk_mov_detal` FOREIGN KEY (`movdetallemateriacurso_id`) REFERENCES `mov_detalle_materia_curso` (`id_detalle_materia_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_profesor_materiacurso`
--

LOCK TABLES `mov_profesor_materiacurso` WRITE;
/*!40000 ALTER TABLE `mov_profesor_materiacurso` DISABLE KEYS */;
INSERT INTO `mov_profesor_materiacurso` VALUES (1,2,2),(2,2,4),(3,2,7),(4,2,8),(5,2,9),(6,4,3),(7,4,5),(8,4,6);
/*!40000 ALTER TABLE `mov_profesor_materiacurso` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-26 22:11:40
