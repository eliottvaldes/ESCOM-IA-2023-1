DROP DATABASE IF EXISTS `proyecto`;

CREATE DATABASE IF NOT EXISTS `proyecto`;
USE `proyecto`;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 15-06-2023 a las 09:11:04
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba_imports_final`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_clas_con_f_alarma`
--

CREATE TABLE `cat_clas_con_f_alarma` (
  `id_clasificacion` int(11) NOT NULL,
  `clasificacion` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_delegacion`
--

CREATE TABLE `cat_delegacion` (
  `id_delegacion` int(11) NOT NULL,
  `delegacion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_incidente_codigo_cierre`
--

CREATE TABLE `cat_incidente_codigo_cierre` (
  `id_codigo_cierre` int(11) NOT NULL,
  `codigo_cierre` varchar(50) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_incidente_tipo_c4`
--

CREATE TABLE `cat_incidente_tipo_c4` (
  `id_tipo_incidente_c4` int(11) NOT NULL,
  `tipo_incidente` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_incidente_tipo_entrada`
--

CREATE TABLE `cat_incidente_tipo_entrada` (
  `id_tipo_entrada` int(11) NOT NULL,
  `tipo_entrada` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_rango_edad`
--

CREATE TABLE `cat_rango_edad` (
  `id_rango_edad` int(11) NOT NULL,
  `rango` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_sexo`
--

CREATE TABLE `cat_sexo` (
  `id_sexo` int(11) NOT NULL,
  `sexo` enum('H','M') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_delegacion_ocupantes_por_vivienda`
--

CREATE TABLE `t_delegacion_ocupantes_por_vivienda` (
  `id_delegacion` int(11) NOT NULL,
  `ocupantes` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_delegacion_poblacion`
--

CREATE TABLE `t_delegacion_poblacion` (
  `id_delegacion` int(11) NOT NULL,
  `id_sexo` int(11) NOT NULL,
  `id_rango_edad` int(11) NOT NULL,
  `poblacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_incidente`
--

CREATE TABLE `t_incidente` (
  `incidente_folio` varchar(100) NOT NULL,
  `id_delegacion_inicio` int(11) NOT NULL,
  `id_delegacion_cierre` int(11) NOT NULL,
  `id_incidente_c4` int(11) NOT NULL,
  `id_tipo_entrada` int(11) NOT NULL,
  `id_clasificacion` int(11) NOT NULL,
  `id_codigo_cierre` int(11) NOT NULL,
  `timestamp_creacion` datetime NOT NULL,
  `timestamp_cierre` datetime NOT NULL,
  `geopoint` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cat_clas_con_f_alarma`
--
ALTER TABLE `cat_clas_con_f_alarma`
  ADD PRIMARY KEY (`id_clasificacion`);

--
-- Indices de la tabla `cat_delegacion`
--
ALTER TABLE `cat_delegacion`
  ADD PRIMARY KEY (`id_delegacion`);

--
-- Indices de la tabla `cat_incidente_codigo_cierre`
--
ALTER TABLE `cat_incidente_codigo_cierre`
  ADD PRIMARY KEY (`id_codigo_cierre`);

--
-- Indices de la tabla `cat_incidente_tipo_c4`
--
ALTER TABLE `cat_incidente_tipo_c4`
  ADD PRIMARY KEY (`id_tipo_incidente_c4`);

--
-- Indices de la tabla `cat_incidente_tipo_entrada`
--
ALTER TABLE `cat_incidente_tipo_entrada`
  ADD PRIMARY KEY (`id_tipo_entrada`);

--
-- Indices de la tabla `cat_rango_edad`
--
ALTER TABLE `cat_rango_edad`
  ADD PRIMARY KEY (`id_rango_edad`);

--
-- Indices de la tabla `cat_sexo`
--
ALTER TABLE `cat_sexo`
  ADD PRIMARY KEY (`id_sexo`);

--
-- Indices de la tabla `t_delegacion_ocupantes_por_vivienda`
--
ALTER TABLE `t_delegacion_ocupantes_por_vivienda`
  ADD PRIMARY KEY (`id_delegacion`);

--
-- Indices de la tabla `t_delegacion_poblacion`
--
ALTER TABLE `t_delegacion_poblacion`
  ADD PRIMARY KEY (`id_delegacion`,`id_sexo`,`id_rango_edad`),
  ADD KEY `id_sexo` (`id_sexo`),
  ADD KEY `id_rango_edad` (`id_rango_edad`);

--
-- Indices de la tabla `t_incidente`
--
ALTER TABLE `t_incidente`
  ADD PRIMARY KEY (`incidente_folio`),
  ADD KEY `fk_delegacion_inicio_idx` (`id_delegacion_inicio`),
  ADD KEY `fk_delegacion_cierre_idx` (`id_delegacion_cierre`),
  ADD KEY `fk_incidente_c4_idx` (`id_incidente_c4`),
  ADD KEY `fk_tipo_entrada_idx` (`id_tipo_entrada`),
  ADD KEY `fk_clasificacion_idx` (`id_clasificacion`),
  ADD KEY `fk_codigo_cierre_idx` (`id_codigo_cierre`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `t_delegacion_ocupantes_por_vivienda`
--
ALTER TABLE `t_delegacion_ocupantes_por_vivienda`
  ADD CONSTRAINT `t_delegacion_ocupantes_por_vivienda_ibfk_1` FOREIGN KEY (`id_delegacion`) REFERENCES `cat_delegacion` (`id_delegacion`);

--
-- Filtros para la tabla `t_delegacion_poblacion`
--
ALTER TABLE `t_delegacion_poblacion`
  ADD CONSTRAINT `t_delegacion_poblacion_ibfk_1` FOREIGN KEY (`id_delegacion`) REFERENCES `cat_delegacion` (`id_delegacion`),
  ADD CONSTRAINT `t_delegacion_poblacion_ibfk_2` FOREIGN KEY (`id_sexo`) REFERENCES `cat_sexo` (`id_sexo`),
  ADD CONSTRAINT `t_delegacion_poblacion_ibfk_3` FOREIGN KEY (`id_rango_edad`) REFERENCES `cat_rango_edad` (`id_rango_edad`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
