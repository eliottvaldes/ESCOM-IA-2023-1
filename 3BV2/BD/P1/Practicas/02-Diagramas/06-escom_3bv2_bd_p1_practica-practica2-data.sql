CREATE DATABASE  IF NOT EXISTS `escom-3bv2-bd` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `escom-3bv2-bd`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: escom-3bv2-bd
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `cat_delegacion`
--

DROP TABLE IF EXISTS `cat_delegacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_delegacion` (
  `clave_delegacion` int NOT NULL,
  `delegacion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `descripcion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`clave_delegacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_delegacion`
--

LOCK TABLES `cat_delegacion` WRITE;
/*!40000 ALTER TABLE `cat_delegacion` DISABLE KEYS */;
INSERT INTO `cat_delegacion` VALUES (1,'ALVARO OBREGON',NULL),(2,'AZCAPOTZALCO',NULL),(3,'BENITO JUAREZ',NULL),(4,'COYOACAN',NULL),(5,'CUAUHTEMOC',NULL),(6,'GUSTAVO A. MADERO',NULL),(7,'IZTACALCO',NULL),(8,'IZTAPALAPA',NULL),(9,'MAGDALENA CONTRERAS',NULL),(10,'MIGUEL HIDALGO',NULL),(11,'MILPA ALTA',NULL),(12,'TLAHUAC',NULL),(13,'TLALPAN',NULL),(14,'VENUSTIANO CARRANZA',NULL),(15,'XOCHIMILCO',NULL);
/*!40000 ALTER TABLE `cat_delegacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_fecha`
--

DROP TABLE IF EXISTS `cat_fecha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_fecha` (
  `clave_fecha` int NOT NULL,
  `clave_anio` int NOT NULL,
  `clave_mes` int NOT NULL,
  `clave_dia_semana` int NOT NULL,
  `festividades` varchar(500) DEFAULT NULL,
  `feriado` tinyint DEFAULT NULL,
  PRIMARY KEY (`clave_fecha`),
  UNIQUE KEY `clave_fecha_UNIQUE` (`clave_fecha`),
  KEY `fk_fec_anio_idx` (`clave_anio`),
  KEY `fk_fec_mes_idx` (`clave_mes`),
  KEY `fk_fec_dia_semana_idx` (`clave_dia_semana`),
  CONSTRAINT `fk_fec_anio` FOREIGN KEY (`clave_anio`) REFERENCES `cat_fecha_anio` (`clave_anio`),
  CONSTRAINT `fk_fec_dia_semana` FOREIGN KEY (`clave_dia_semana`) REFERENCES `cat_fecha_dia_semana` (`clave_dia_semana`),
  CONSTRAINT `fk_fec_mes` FOREIGN KEY (`clave_mes`) REFERENCES `cat_fecha_mes` (`clave_mes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_fecha`
--

LOCK TABLES `cat_fecha` WRITE;
/*!40000 ALTER TABLE `cat_fecha` DISABLE KEYS */;
INSERT INTO `cat_fecha` VALUES (85,1,4,7,NULL,NULL),(86,1,4,1,NULL,NULL),(87,1,4,2,NULL,NULL),(88,1,4,3,NULL,NULL),(89,1,4,4,NULL,NULL),(90,1,4,5,NULL,NULL);
/*!40000 ALTER TABLE `cat_fecha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_fecha_anio`
--

DROP TABLE IF EXISTS `cat_fecha_anio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_fecha_anio` (
  `clave_anio` int NOT NULL,
  `anio` int NOT NULL,
  PRIMARY KEY (`clave_anio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_fecha_anio`
--

LOCK TABLES `cat_fecha_anio` WRITE;
/*!40000 ALTER TABLE `cat_fecha_anio` DISABLE KEYS */;
INSERT INTO `cat_fecha_anio` VALUES (1,2023);
/*!40000 ALTER TABLE `cat_fecha_anio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_fecha_dia_semana`
--

DROP TABLE IF EXISTS `cat_fecha_dia_semana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_fecha_dia_semana` (
  `clave_dia_semana` int NOT NULL,
  `dia_semana` varchar(10) NOT NULL,
  PRIMARY KEY (`clave_dia_semana`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_fecha_dia_semana`
--

LOCK TABLES `cat_fecha_dia_semana` WRITE;
/*!40000 ALTER TABLE `cat_fecha_dia_semana` DISABLE KEYS */;
INSERT INTO `cat_fecha_dia_semana` VALUES (1,'LUNES'),(2,'MARTES'),(3,'MIÉRCOLES'),(4,'JUEVES'),(5,'VIERNES'),(6,'SÁBADO'),(7,'DOMINGO');
/*!40000 ALTER TABLE `cat_fecha_dia_semana` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_fecha_mes`
--

DROP TABLE IF EXISTS `cat_fecha_mes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_fecha_mes` (
  `clave_mes` int NOT NULL,
  `mes` varchar(10) NOT NULL,
  PRIMARY KEY (`clave_mes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_fecha_mes`
--

LOCK TABLES `cat_fecha_mes` WRITE;
/*!40000 ALTER TABLE `cat_fecha_mes` DISABLE KEYS */;
INSERT INTO `cat_fecha_mes` VALUES (1,'ENERO'),(2,'FEBRERO'),(3,'MARZO'),(4,'ABRIL'),(5,'MAYO'),(6,'JUNIO'),(7,'JULIO'),(8,'AGOSTO'),(9,'SEPTIEMBRE'),(10,'OCTUBRE'),(11,'NOVIEMBRE'),(12,'DICIEMBRE');
/*!40000 ALTER TABLE `cat_fecha_mes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_incidente_clasificacion`
--

DROP TABLE IF EXISTS `cat_incidente_clasificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_incidente_clasificacion` (
  `clave_clasificacion` int NOT NULL,
  `clasificacion` varchar(50) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`clave_clasificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_incidente_clasificacion`
--

LOCK TABLES `cat_incidente_clasificacion` WRITE;
/*!40000 ALTER TABLE `cat_incidente_clasificacion` DISABLE KEYS */;
INSERT INTO `cat_incidente_clasificacion` VALUES (1,'A','(Afirmativo): Una unidad de atención a emergencias confirmó la emergencia reportada'),(2,'I','(Informativo): Solicitud de información'),(3,'N','(Negativo): Una unidad de atención a emergencias fue despachada, llegó al lugar de los hechos, pero en el sitio del evento nadie confirmo la emergencia ni fue solicitado el apoyo de la unidad'),(4,'D','(Duplicado): El incidente reportado se registró en dos o más ocasiones procediendo a mantener un solo reporte como el original.'),(5,'F','(Falso):  El incidente reportado inicialmente fue considerado como falso en el lugar de los hechos.');
/*!40000 ALTER TABLE `cat_incidente_clasificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_incidente_codigo_cierre`
--

DROP TABLE IF EXISTS `cat_incidente_codigo_cierre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_incidente_codigo_cierre` (
  `clave_codigo_cierre` int NOT NULL,
  `codigo_cierre` varchar(50) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`clave_codigo_cierre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_incidente_codigo_cierre`
--

LOCK TABLES `cat_incidente_codigo_cierre` WRITE;
/*!40000 ALTER TABLE `cat_incidente_codigo_cierre` DISABLE KEYS */;
INSERT INTO `cat_incidente_codigo_cierre` VALUES (1,'A','La unidad de atención a emergencias fue despachada, llegó al lugar de los hechos y confirma la emergencia reportada'),(2,'D','El incidente reportado se registró en dos o más ocasiones procediendo a mantener un único reporte (afirmativo, informativo, negativo o falso) como el identificador para el incidente'),(3,'N','La unidad de atención a emergencias fue despachada, llegó al lugar de los hechos, pero en el sitio del evento nadie solicitó el apoyo de la unidad');
/*!40000 ALTER TABLE `cat_incidente_codigo_cierre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_incidente_tipo_c4`
--

DROP TABLE IF EXISTS `cat_incidente_tipo_c4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_incidente_tipo_c4` (
  `clave_tipo_incidente_c4` int NOT NULL,
  `tipo_incidente` varchar(45) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`clave_tipo_incidente_c4`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_incidente_tipo_c4`
--

LOCK TABLES `cat_incidente_tipo_c4` WRITE;
/*!40000 ALTER TABLE `cat_incidente_tipo_c4` DISABLE KEYS */;
INSERT INTO `cat_incidente_tipo_c4` VALUES (1,'accidente-choque con lesionados',NULL),(2,'accidente-choque sin lesionados',NULL),(3,'accidente-ciclista',NULL),(4,'accidente-motociclista',NULL),(5,'accidente-persona atrapada / desbarrancada',NULL),(6,'accidente-volcadura',NULL),(7,'lesionado-atropellado',NULL),(8,'sismo-choque con lesionados',NULL);
/*!40000 ALTER TABLE `cat_incidente_tipo_c4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_incidente_tipo_entrada`
--

DROP TABLE IF EXISTS `cat_incidente_tipo_entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_incidente_tipo_entrada` (
  `clave_tipo_entrada` int NOT NULL,
  `tipo_entrada` varchar(50) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`clave_tipo_entrada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_incidente_tipo_entrada`
--

LOCK TABLES `cat_incidente_tipo_entrada` WRITE;
/*!40000 ALTER TABLE `cat_incidente_tipo_entrada` DISABLE KEYS */;
INSERT INTO `cat_incidente_tipo_entrada` VALUES (1,'BOTÓN DE AUXILIO',NULL),(2,'LLAMADA APP911',NULL),(3,'LLAMADA DEL 911',NULL),(4,'RADIO',NULL),(5,'REDES',NULL);
/*!40000 ALTER TABLE `cat_incidente_tipo_entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_inegi_rango_edad`
--

DROP TABLE IF EXISTS `cat_inegi_rango_edad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_inegi_rango_edad` (
  `clave_rango_edad` int NOT NULL,
  `rango` varchar(45) NOT NULL,
  PRIMARY KEY (`clave_rango_edad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_inegi_rango_edad`
--

LOCK TABLES `cat_inegi_rango_edad` WRITE;
/*!40000 ALTER TABLE `cat_inegi_rango_edad` DISABLE KEYS */;
INSERT INTO `cat_inegi_rango_edad` VALUES (1,'0-4'),(2,'5-9'),(3,'10-14'),(4,'15-19'),(5,'20-24'),(6,'25-29'),(7,'30-34'),(8,'35-39'),(9,'40-44'),(10,'45-49'),(11,'50-54'),(12,'55-59'),(13,'60-64'),(14,'65-69'),(15,'70-74'),(16,'75-79'),(17,'80-84'),(18,'85-100');
/*!40000 ALTER TABLE `cat_inegi_rango_edad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_inegi_sexo`
--

DROP TABLE IF EXISTS `cat_inegi_sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_inegi_sexo` (
  `clave_sexo` int NOT NULL,
  `sexo` enum('H','M') NOT NULL,
  `descripcion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`clave_sexo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_inegi_sexo`
--

LOCK TABLES `cat_inegi_sexo` WRITE;
/*!40000 ALTER TABLE `cat_inegi_sexo` DISABLE KEYS */;
INSERT INTO `cat_inegi_sexo` VALUES (1,'M','MUJER'),(2,'H','HOMBRE');
/*!40000 ALTER TABLE `cat_inegi_sexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `delegacion_mas_incidentes_y_total_poblacion_mujeres`
--

DROP TABLE IF EXISTS `delegacion_mas_incidentes_y_total_poblacion_mujeres`;
/*!50001 DROP VIEW IF EXISTS `delegacion_mas_incidentes_y_total_poblacion_mujeres`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `delegacion_mas_incidentes_y_total_poblacion_mujeres` AS SELECT 
 1 AS `delegacion`,
 1 AS `cantidad_incidentes`,
 1 AS `total_habitantes`,
 1 AS `sexo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `t_delegacion_habitantes`
--

DROP TABLE IF EXISTS `t_delegacion_habitantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_delegacion_habitantes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clave_delegacion` int NOT NULL,
  `clave_sexo` int NOT NULL,
  `clave_rango_edad` int NOT NULL,
  `cantidad_habitantes` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_delegacion _idx` (`clave_delegacion`),
  KEY `fk_del_hab_sexo_idx` (`clave_sexo`),
  KEY `fk_del_hab_rango_edad_idx` (`clave_rango_edad`),
  CONSTRAINT `fk_del_hab_delegacion` FOREIGN KEY (`clave_delegacion`) REFERENCES `cat_delegacion` (`clave_delegacion`),
  CONSTRAINT `fk_del_hab_rango_edad` FOREIGN KEY (`clave_rango_edad`) REFERENCES `cat_inegi_rango_edad` (`clave_rango_edad`),
  CONSTRAINT `fk_del_hab_sexo` FOREIGN KEY (`clave_sexo`) REFERENCES `cat_inegi_sexo` (`clave_sexo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_delegacion_habitantes`
--

LOCK TABLES `t_delegacion_habitantes` WRITE;
/*!40000 ALTER TABLE `t_delegacion_habitantes` DISABLE KEYS */;
INSERT INTO `t_delegacion_habitantes` VALUES (1,1,1,5,5412554),(2,1,1,6,7896214),(3,1,1,7,894613),(4,1,1,8,798461),(5,1,1,9,1597538),(6,1,2,5,84653),(7,1,2,6,89461),(8,1,2,7,9874236),(9,1,2,8,3248587),(10,1,2,9,85274963),(11,2,1,4,1),(12,2,1,5,1),(13,2,1,6,1),(14,2,1,2,1),(15,2,1,3,1),(16,2,2,4,1),(17,2,2,6,1),(18,2,2,6,1),(19,2,2,12,1),(20,2,2,17,1);
/*!40000 ALTER TABLE `t_delegacion_habitantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_incidentes`
--

DROP TABLE IF EXISTS `t_incidentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_incidentes` (
  `incidente_folio` varchar(100) NOT NULL,
  `clave_delegacion_inicio` int NOT NULL,
  `clave_delegacion_cierre` int NOT NULL,
  `clave_incidente_c4` int NOT NULL,
  `clave_tipo_entrada` int NOT NULL,
  `clave_clasificacion` int NOT NULL,
  `clave_codigo_cierre` int NOT NULL,
  `clave_fecha_creacion` int NOT NULL,
  `clave_fecha_cierre` int NOT NULL,
  `hora_creacion` time NOT NULL,
  `hora_cierre` time NOT NULL,
  `latitud` varchar(100) NOT NULL,
  `longitud` varchar(100) NOT NULL,
  PRIMARY KEY (`incidente_folio`),
  UNIQUE KEY `incidente_folio_UNIQUE` (`incidente_folio`),
  KEY `fk_inc_delegacion_inicio_idx` (`clave_delegacion_inicio`),
  KEY `fk_inc_delegacion_cierre_idx` (`clave_delegacion_cierre`),
  KEY `fk_inc_incidente_c4_idx` (`clave_incidente_c4`),
  KEY `fk_inc_tipo_entrada_idx` (`clave_tipo_entrada`),
  KEY `fk_inc_clasificacion_idx` (`clave_clasificacion`),
  KEY `fk_inc_codigo_cierre_idx` (`clave_codigo_cierre`),
  KEY `fk_inc_creacion_fecha_idx` (`clave_fecha_creacion`),
  KEY `fk_inc_cierre_fecha_idx` (`clave_fecha_cierre`),
  CONSTRAINT `fk_inc_cierre_fecha` FOREIGN KEY (`clave_fecha_cierre`) REFERENCES `cat_fecha` (`clave_fecha`),
  CONSTRAINT `fk_inc_clasificacion` FOREIGN KEY (`clave_clasificacion`) REFERENCES `cat_incidente_clasificacion` (`clave_clasificacion`),
  CONSTRAINT `fk_inc_codigo_cierre` FOREIGN KEY (`clave_codigo_cierre`) REFERENCES `cat_incidente_codigo_cierre` (`clave_codigo_cierre`),
  CONSTRAINT `fk_inc_creacion_fecha` FOREIGN KEY (`clave_fecha_creacion`) REFERENCES `cat_fecha` (`clave_fecha`),
  CONSTRAINT `fk_inc_delegacion_cierre` FOREIGN KEY (`clave_delegacion_cierre`) REFERENCES `cat_delegacion` (`clave_delegacion`),
  CONSTRAINT `fk_inc_delegacion_inicio` FOREIGN KEY (`clave_delegacion_inicio`) REFERENCES `cat_delegacion` (`clave_delegacion`),
  CONSTRAINT `fk_inc_incidente_c4` FOREIGN KEY (`clave_incidente_c4`) REFERENCES `cat_incidente_tipo_c4` (`clave_tipo_incidente_c4`),
  CONSTRAINT `fk_inc_tipo_entrada` FOREIGN KEY (`clave_tipo_entrada`) REFERENCES `cat_incidente_tipo_entrada` (`clave_tipo_entrada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_incidentes`
--

LOCK TABLES `t_incidentes` WRITE;
/*!40000 ALTER TABLE `t_incidentes` DISABLE KEYS */;
INSERT INTO `t_incidentes` VALUES ('AAAAAAA',1,4,7,4,5,1,85,85,'10:05:15','15:05:15','19.46872','-99.10115'),('BBBBBBBB',1,1,6,2,1,2,86,86,'10:05:15','15:05:15','19.35518','-99.21567'),('CCCCCCC',1,4,2,3,4,3,87,87,'10:05:15','15:05:15','19.46884','-99.10153'),('DDDDDDD',1,3,5,5,2,1,88,89,'10:05:15','15:05:15','19.247912','-99.072669'),('EEEEEEEE',1,6,3,1,3,2,89,90,'10:05:15','15:05:15','19.28395','-99.17552'),('FFFFFFF',2,2,3,2,2,1,89,90,'10:05:15','10:05:15','19.28395','-99.17552');
/*!40000 ALTER TABLE `t_incidentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `delegacion_mas_incidentes_y_total_poblacion_mujeres`
--

/*!50001 DROP VIEW IF EXISTS `delegacion_mas_incidentes_y_total_poblacion_mujeres`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `delegacion_mas_incidentes_y_total_poblacion_mujeres` AS select `cat_delegacion`.`delegacion` AS `delegacion`,count(distinct `t_incidentes`.`incidente_folio`) AS `cantidad_incidentes`,sum(`t_delegacion_habitantes`.`cantidad_habitantes`) AS `total_habitantes`,`cat_inegi_sexo`.`sexo` AS `sexo` from (((`t_incidentes` join `cat_delegacion` on((`t_incidentes`.`clave_delegacion_inicio` = `cat_delegacion`.`clave_delegacion`))) join `t_delegacion_habitantes` on((`cat_delegacion`.`clave_delegacion` = `t_delegacion_habitantes`.`clave_delegacion`))) join `cat_inegi_sexo` on((`t_delegacion_habitantes`.`clave_sexo` = `cat_inegi_sexo`.`clave_sexo`))) where (`cat_inegi_sexo`.`sexo` = 'M') group by `cat_delegacion`.`delegacion`,`cat_inegi_sexo`.`sexo` order by `cantidad_incidentes` desc */;
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

-- Dump completed on 2023-03-31 13:05:10
