CREATE DATABASE  IF NOT EXISTS `escom-3bv2-bd`;
USE `escom-3bv2-bd`;

--
-- Table structure for table `cat_delegacion`
--

DROP TABLE IF EXISTS `cat_delegacion`;

CREATE TABLE `cat_delegacion` (
  `clave_delegacion` int NOT NULL,
  `delegacion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`clave_delegacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Dumping data for table `cat_delegacion`
--

LOCK TABLES `cat_delegacion` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `cat_fecha_anio`
--

DROP TABLE IF EXISTS `cat_fecha_anio`;

CREATE TABLE `cat_fecha_anio` (
  `clave_anio` int NOT NULL,
  `anio` int NOT NULL,
  PRIMARY KEY (`clave_anio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Dumping data for table `cat_fecha_anio`
--

LOCK TABLES `cat_fecha_anio` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `cat_fecha_dia_semana`
--

DROP TABLE IF EXISTS `cat_fecha_dia_semana`;

CREATE TABLE `cat_fecha_dia_semana` (
  `clave_dia_semana` int NOT NULL,
  `dia_semana` varchar(10) NOT NULL,
  PRIMARY KEY (`clave_dia_semana`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Dumping data for table `cat_fecha_dia_semana`
--

LOCK TABLES `cat_fecha_dia_semana` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `cat_fecha_mes`
--

DROP TABLE IF EXISTS `cat_fecha_mes`;

CREATE TABLE `cat_fecha_mes` (
  `clave_mes` int NOT NULL,
  `mes` varchar(10) NOT NULL,
  PRIMARY KEY (`clave_mes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Dumping data for table `cat_fecha_mes`
--

LOCK TABLES `cat_fecha_mes` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `cat_incidente_clasificacion`
--

DROP TABLE IF EXISTS `cat_incidente_clasificacion`;

CREATE TABLE `cat_incidente_clasificacion` (
  `clave_clasificacion` int NOT NULL,
  `clasificacion` varchar(50) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`clave_clasificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Dumping data for table `cat_incidente_clasificacion`
--

LOCK TABLES `cat_incidente_clasificacion` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `cat_incidente_codigo_cierre`
--

DROP TABLE IF EXISTS `cat_incidente_codigo_cierre`;

CREATE TABLE `cat_incidente_codigo_cierre` (
  `clave_codigo_cierre` int NOT NULL,
  `codigo_cierre` varchar(50) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`clave_codigo_cierre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Dumping data for table `cat_incidente_codigo_cierre`
--

LOCK TABLES `cat_incidente_codigo_cierre` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `cat_incidente_tipo_c4`
--

DROP TABLE IF EXISTS `cat_incidente_tipo_c4`;

CREATE TABLE `cat_incidente_tipo_c4` (
  `clave_tipo_incidente_c4` int NOT NULL,
  `tipo_incidente` varchar(45) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`clave_tipo_incidente_c4`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Dumping data for table `cat_incidente_tipo_c4`
--

LOCK TABLES `cat_incidente_tipo_c4` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `cat_incidente_tipo_entrada`
--

DROP TABLE IF EXISTS `cat_incidente_tipo_entrada`;

CREATE TABLE `cat_incidente_tipo_entrada` (
  `clave_tipo_entrada` int NOT NULL,
  `tipo_entrada` varchar(50) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`clave_tipo_entrada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Dumping data for table `cat_incidente_tipo_entrada`
--

LOCK TABLES `cat_incidente_tipo_entrada` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `cat_inegi_rango_edad`
--

DROP TABLE IF EXISTS `cat_inegi_rango_edad`;

CREATE TABLE `cat_inegi_rango_edad` (
  `clave_rango_edad` int NOT NULL,
  `rango` varchar(45) NOT NULL,
  PRIMARY KEY (`clave_rango_edad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Dumping data for table `cat_inegi_rango_edad`
--

LOCK TABLES `cat_inegi_rango_edad` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `cat_inegi_sexo`
--

DROP TABLE IF EXISTS `cat_inegi_sexo`;

CREATE TABLE `cat_inegi_sexo` (
  `clave_sexo` int NOT NULL,
  `sexo` enum('H','M') NOT NULL,
  `descripcion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`clave_sexo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Dumping data for table `cat_inegi_sexo`
--

LOCK TABLES `cat_inegi_sexo` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `t_delegacion_edad`
--

DROP TABLE IF EXISTS `t_delegacion_edad`;

CREATE TABLE `t_delegacion_edad` (
  `clave_delegacion` int NOT NULL,
  `clave_sexo` int NOT NULL,
  `clave_rango_edad` int NOT NULL,
  `cantidad` double NOT NULL,
  PRIMARY KEY (`clave_delegacion`),
  KEY `fk_sexo_idx` (`clave_sexo`),
  KEY `fk_rango_edad_idx` (`clave_rango_edad`),
  CONSTRAINT `fk_delegacion` FOREIGN KEY (`clave_delegacion`) REFERENCES `cat_delegacion` (`clave_delegacion`),
  CONSTRAINT `fk_rango_edad` FOREIGN KEY (`clave_rango_edad`) REFERENCES `cat_inegi_rango_edad` (`clave_rango_edad`),
  CONSTRAINT `fk_sexo` FOREIGN KEY (`clave_sexo`) REFERENCES `cat_inegi_sexo` (`clave_sexo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Dumping data for table `t_delegacion_edad`
--

LOCK TABLES `t_delegacion_edad` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `t_incidente`
--

DROP TABLE IF EXISTS `t_incidente`;

CREATE TABLE `t_incidente` (
  `incidente_folio` varchar(100) NOT NULL,
  `clave_delegacion_inicio` int NOT NULL,
  `clave_delegacion_cierre` int NOT NULL,
  `clave_incidente_c4` int NOT NULL,
  `clave_tipo_entrada` int NOT NULL,
  `clave_clasificacion` int NOT NULL,
  `clave_codigo_cierre` int NOT NULL,
  `timestamp_creacion` datetime NOT NULL,
  `timestamp_cierre` datetime NOT NULL,
  `latitud` varchar(60) NOT NULL,
  `longitud` varchar(60) NOT NULL,
  PRIMARY KEY (`incidente_folio`),
  KEY `fk_delegacion_inicio_idx` (`clave_delegacion_inicio`),
  KEY `fk_delegacion_cierre_idx` (`clave_delegacion_cierre`),
  KEY `fk_incidente_c4_idx` (`clave_incidente_c4`),
  KEY `fk_tipo_entrada_idx` (`clave_tipo_entrada`),
  KEY `fk_clasificacion_idx` (`clave_clasificacion`),
  KEY `fk_codigo_cierre_idx` (`clave_codigo_cierre`),
  CONSTRAINT `fk_clasificacion` FOREIGN KEY (`clave_clasificacion`) REFERENCES `cat_incidente_clasificacion` (`clave_clasificacion`),
  CONSTRAINT `fk_codigo_cierre` FOREIGN KEY (`clave_codigo_cierre`) REFERENCES `cat_incidente_codigo_cierre` (`clave_codigo_cierre`),
  CONSTRAINT `fk_delegacion_cierre` FOREIGN KEY (`clave_delegacion_cierre`) REFERENCES `cat_delegacion` (`clave_delegacion`),
  CONSTRAINT `fk_delegacion_inicio` FOREIGN KEY (`clave_delegacion_inicio`) REFERENCES `cat_delegacion` (`clave_delegacion`),
  CONSTRAINT `fk_incidente_c4` FOREIGN KEY (`clave_incidente_c4`) REFERENCES `cat_incidente_tipo_c4` (`clave_tipo_incidente_c4`),
  CONSTRAINT `fk_tipo_entrada` FOREIGN KEY (`clave_tipo_entrada`) REFERENCES `cat_incidente_tipo_entrada` (`clave_tipo_entrada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Dumping data for table `t_incidente`
--

LOCK TABLES `t_incidente` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `t_incidente_detalle`
--

DROP TABLE IF EXISTS `t_incidente_detalle`;

CREATE TABLE `t_incidente_detalle` (
  `incidente_folio` varchar(100) NOT NULL,
  `clave_creacion_anio` int NOT NULL,
  `clave_creacion_mes` int NOT NULL,
  `clave_creacion_dia_semana` int NOT NULL,
  `clave_cierre_anio` int NOT NULL,
  `clave_cierre_mes` int NOT NULL,
  `clave_cierre_dia_semana` int NOT NULL,
  `geopoint` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`incidente_folio`),
  KEY `fk_creacion_anio_idx` (`clave_creacion_anio`),
  KEY `fk_creacion_mes_idx` (`clave_creacion_mes`),
  KEY `fk_creacion_dia_semana_idx` (`clave_creacion_dia_semana`),
  KEY `fk_cierre_anio_idx` (`clave_cierre_anio`),
  KEY `fk_cierre_mes_idx` (`clave_cierre_mes`),
  KEY `fk_cierre_dia_semana_idx` (`clave_cierre_dia_semana`),
  CONSTRAINT `fk_inc_det_cierre_anio` FOREIGN KEY (`clave_cierre_anio`) REFERENCES `cat_fecha_anio` (`clave_anio`),
  CONSTRAINT `fk_inc_det_cierre_dia_semana` FOREIGN KEY (`clave_cierre_dia_semana`) REFERENCES `cat_fecha_dia_semana` (`clave_dia_semana`),
  CONSTRAINT `fk_inc_det_cierre_mes` FOREIGN KEY (`clave_cierre_mes`) REFERENCES `cat_fecha_mes` (`clave_mes`),
  CONSTRAINT `fk_inc_det_creacion_anio` FOREIGN KEY (`clave_creacion_anio`) REFERENCES `cat_fecha_anio` (`clave_anio`),
  CONSTRAINT `fk_inc_det_creacion_dia_semana` FOREIGN KEY (`clave_creacion_mes`) REFERENCES `cat_fecha_dia_semana` (`clave_dia_semana`),
  CONSTRAINT `fk_inc_det_creacion_mes` FOREIGN KEY (`clave_creacion_mes`) REFERENCES `cat_fecha_mes` (`clave_mes`),
  CONSTRAINT `fk_incidente_folio` FOREIGN KEY (`incidente_folio`) REFERENCES `t_incidente` (`incidente_folio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Dumping data for table `t_incidente_detalle`
--

LOCK TABLES `t_incidente_detalle` WRITE;
UNLOCK TABLES;


-- Dump completed on 2023-03-29  3:36:52
