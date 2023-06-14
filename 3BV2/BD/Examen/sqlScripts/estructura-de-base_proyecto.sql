DROP DATABASE IF EXISTS `proyecto`;

CREATE DATABASE IF NOT EXISTS `proyecto`;
USE `proyecto`;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_clas_con_f_alarma`
--

CREATE TABLE `cat_clas_con_f_alarma` (
  `id_clasificacion` int(11) NOT NULL,
  `clasificacion` varchar(50) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cat_clas_con_f_alarma`
--

INSERT INTO `cat_clas_con_f_alarma` (`id_clasificacion`, `clasificacion`, `descripcion`) VALUES
(1, 'A', '(Afirmativo): Una unidad de atención a emergencias confirmó la emergencia reportada'),
(2, 'I', '(Informativo): Solicitud de información'),
(3, 'N', '(Negativo): Una unidad de atención a emergencias fue despachada, llegó al lugar de los hechos, pero en el sitio del evento nadie confirmo la emergencia ni fue solicitado el apoyo de la unidad'),
(4, 'D', '(Duplicado): El incidente reportado se registró en dos o más ocasiones procediendo a mantener un solo reporte como el original.'),
(5, 'F', '(Falso):  El incidente reportado inicialmente fue considerado como falso en el lugar de los hechos.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_delegacion`
--

CREATE TABLE `cat_delegacion` (
  `id_delegacion` int(11) NOT NULL,
  `delegacion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cat_delegacion`
--

INSERT INTO `cat_delegacion` (`id_delegacion`, `delegacion`) VALUES
(1, 'ALVARO OBREGON'),
(2, 'AZCAPOTZALCO'),
(3, 'BENITO JUAREZ'),
(4, 'COYOACAN'),
(5, 'CUAUHTEMOC'),
(6, 'GUSTAVO A. MADERO'),
(7, 'IZTACALCO'),
(8, 'IZTAPALAPA'),
(9, 'MAGDALENA CONTRERAS'),
(10, 'MIGUEL HIDALGO'),
(11, 'MILPA ALTA'),
(12, 'TLAHUAC'),
(13, 'TLALPAN'),
(14, 'VENUSTIANO CARRANZA'),
(15, 'XOCHIMILCO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_incidente_codigo_cierre`
--

CREATE TABLE `cat_incidente_codigo_cierre` (
  `id_codigo_cierre` int(11) NOT NULL,
  `codigo_cierre` varchar(50) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cat_incidente_codigo_cierre`
--

INSERT INTO `cat_incidente_codigo_cierre` (`id_codigo_cierre`, `codigo_cierre`, `descripcion`) VALUES
(1, 'A', 'La unidad de atención a emergencias fue despachada, llegó al lugar de los hechos y confirma la emergencia reportada'),
(2, 'D', 'El incidente reportado se registró en dos o más ocasiones procediendo a mantener un único reporte (afirmativo, informativo, negativo o falso) como el identificador para el incidente'),
(3, 'N', 'La unidad de atención a emergencias fue despachada, llegó al lugar de los hechos, pero en el sitio del evento nadie solicitó el apoyo de la unidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_incidente_tipo_c4`
--

CREATE TABLE `cat_incidente_tipo_c4` (
  `id_tipo_incidente_c4` int(11) NOT NULL,
  `tipo_incidente` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cat_incidente_tipo_c4`
--

INSERT INTO `cat_incidente_tipo_c4` (`id_tipo_incidente_c4`, `tipo_incidente`) VALUES
(1, 'accidente-choque con lesionados'),
(2, 'accidente-choque sin lesionados'),
(3, 'accidente-ciclista'),
(4, 'accidente-motociclista'),
(5, 'accidente-persona atrapada / desbarrancada'),
(6, 'accidente-volcadura'),
(7, 'lesionado-atropellado'),
(8, 'sismo-choque con lesionados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_incidente_tipo_entrada`
--

CREATE TABLE `cat_incidente_tipo_entrada` (
  `id_tipo_entrada` int(11) NOT NULL,
  `tipo_entrada` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cat_incidente_tipo_entrada`
--

INSERT INTO `cat_incidente_tipo_entrada` (`id_tipo_entrada`, `tipo_entrada`) VALUES
(1, 'BOTÓN DE AUXILIO'),
(2, 'LLAMADA APP911'),
(3, 'LLAMADA DEL 911'),
(4, 'RADIO'),
(5, 'REDES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_rango_edad`
--

CREATE TABLE `cat_rango_edad` (
  `id_rango_edad` int(11) NOT NULL,
  `rango` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cat_rango_edad`
--

INSERT INTO `cat_rango_edad` (`id_rango_edad`, `rango`) VALUES
(1, '15-19'),
(2, '20-24'),
(3, '25-29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_sexo`
--

CREATE TABLE `cat_sexo` (
  `id_sexo` int(11) NOT NULL,
  `sexo` enum('H','M') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cat_sexo`
--

INSERT INTO `cat_sexo` (`id_sexo`, `sexo`) VALUES
(1, 'M'),
(2, 'H');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_delegacion_ocupantes_por_vivienda`
--

CREATE TABLE `t_delegacion_ocupantes_por_vivienda` (
  `id_delegacion` int(11) NOT NULL,
  `ocupantes` int(11) DEFAULT NULL
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
  `fecha_creacion` date NOT NULL,
  `hora_creacion` time NOT NULL,
  `fecha_cierre` date NOT NULL,
  `hora_cierre` time NOT NULL,
  `latitud` varchar(60) NOT NULL,
  `longitud` varchar(60) NOT NULL,
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
