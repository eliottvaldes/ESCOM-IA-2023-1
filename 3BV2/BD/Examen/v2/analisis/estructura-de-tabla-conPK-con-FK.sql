USE `proyecto_bd`;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat001_clasificacion_alarma`
--

CREATE TABLE `cat001_clasificacion_alarma` (
  `id_clasificacion` int(3) NOT NULL,
  `clasificacion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat002_codigo_cierre`
--

CREATE TABLE `cat002_codigo_cierre` (
  `id_codigo_cierre` int(3) NOT NULL,
  `codigo_cierre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat003_incidente_c4`
--

CREATE TABLE `cat003_incidente_c4` (
  `id_incidente_c4` int(3) NOT NULL,
  `incidente_c4` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat004_tipo_entrada`
--

CREATE TABLE `cat004_tipo_entrada` (
  `id_tipo_entrada` int(3) NOT NULL,
  `tipo_entrada` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat005_delegacion`
--

CREATE TABLE `cat005_delegacion` (
  `id_delegacion` int(2) NOT NULL,
  `delegacion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat006_rango_edad`
--

CREATE TABLE `cat006_rango_edad` (
  `id_rango_edad` int(3) NOT NULL,
  `rango` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat007_sexo`
--

CREATE TABLE `cat007_sexo` (
  `id_sexo` int(3) NOT NULL,
  `sexo_codigo` varchar(3) NOT NULL,
  `sexo_descripcion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl001_incidente`
--

CREATE TABLE `tbl001_incidente` (
  `incidente_folio` varchar(50) NOT NULL,
  `id_delegacion_inicio` int(2) NOT NULL,
  `id_delegacion_cierre` int(2) NOT NULL,
  `id_incidente_c4` int(2) NOT NULL,
  `id_tipo_entrada` int(2) NOT NULL,
  `id_clasificacion_alarma` int(2) NOT NULL,
  `id_codigo_cierre` int(2) NOT NULL,
  `timestamp_creacion` datetime NOT NULL,
  `timestamp_cierre` datetime NOT NULL,
  `geopoint` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl002_poblacion_por_delegacion`
--

CREATE TABLE `tbl002_poblacion_por_delegacion` (
  `id_delegacion` int(2) NOT NULL,
  `id_sexo` int(2) NOT NULL,
  `id_rango_edad` int(2) NOT NULL,
  `poblacion` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl003_ocupantes_por_vivienda`
--

CREATE TABLE `tbl003_ocupantes_por_vivienda` (
  `id_delegacion` int(2) NOT NULL,
  `ocupantes` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cat001_clasificacion_alarma`
--
ALTER TABLE `cat001_clasificacion_alarma`
  ADD PRIMARY KEY (`id_clasificacion`);

--
-- Indices de la tabla `cat002_codigo_cierre`
--
ALTER TABLE `cat002_codigo_cierre`
  ADD PRIMARY KEY (`id_codigo_cierre`);

--
-- Indices de la tabla `cat003_incidente_c4`
--
ALTER TABLE `cat003_incidente_c4`
  ADD PRIMARY KEY (`id_incidente_c4`);

--
-- Indices de la tabla `cat004_tipo_entrada`
--
ALTER TABLE `cat004_tipo_entrada`
  ADD PRIMARY KEY (`id_tipo_entrada`);

--
-- Indices de la tabla `cat005_delegacion`
--
ALTER TABLE `cat005_delegacion`
  ADD PRIMARY KEY (`id_delegacion`);

--
-- Indices de la tabla `cat006_rango_edad`
--
ALTER TABLE `cat006_rango_edad`
  ADD PRIMARY KEY (`id_rango_edad`);

--
-- Indices de la tabla `cat007_sexo`
--
ALTER TABLE `cat007_sexo`
  ADD PRIMARY KEY (`id_sexo`);

--
-- Indices de la tabla `tbl001_incidente`
--
ALTER TABLE `tbl001_incidente`
  ADD KEY `id_delegacion_inicio` (`id_delegacion_inicio`),
  ADD KEY `id_delegacion_cierre` (`id_delegacion_cierre`),
  ADD KEY `id_incidente_c4` (`id_incidente_c4`),
  ADD KEY `id_tipo_entrada` (`id_tipo_entrada`),
  ADD KEY `id_clasificacion_alarma` (`id_clasificacion_alarma`),
  ADD KEY `id_codigo_cierre` (`id_codigo_cierre`);

--
-- Indices de la tabla `tbl002_poblacion_por_delegacion`
--
ALTER TABLE `tbl002_poblacion_por_delegacion`
  ADD PRIMARY KEY (`id_delegacion`,`id_sexo`,`id_rango_edad`),
  ADD KEY `id_sexo` (`id_sexo`),
  ADD KEY `id_rango_edad` (`id_rango_edad`);

--
-- Indices de la tabla `tbl003_ocupantes_por_vivienda`
--
ALTER TABLE `tbl003_ocupantes_por_vivienda`
  ADD PRIMARY KEY (`id_delegacion`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl001_incidente`
--
ALTER TABLE `tbl001_incidente`
  ADD CONSTRAINT `tbl001_incidente_ibfk_1` FOREIGN KEY (`id_delegacion_inicio`) REFERENCES `cat005_delegacion` (`id_delegacion`),
  ADD CONSTRAINT `tbl001_incidente_ibfk_2` FOREIGN KEY (`id_delegacion_cierre`) REFERENCES `cat005_delegacion` (`id_delegacion`),
  ADD CONSTRAINT `tbl001_incidente_ibfk_3` FOREIGN KEY (`id_incidente_c4`) REFERENCES `cat003_incidente_c4` (`id_incidente_c4`),
  ADD CONSTRAINT `tbl001_incidente_ibfk_4` FOREIGN KEY (`id_tipo_entrada`) REFERENCES `cat004_tipo_entrada` (`id_tipo_entrada`),
  ADD CONSTRAINT `tbl001_incidente_ibfk_5` FOREIGN KEY (`id_clasificacion_alarma`) REFERENCES `cat001_clasificacion_alarma` (`id_clasificacion`),
  ADD CONSTRAINT `tbl001_incidente_ibfk_6` FOREIGN KEY (`id_codigo_cierre`) REFERENCES `cat002_codigo_cierre` (`id_codigo_cierre`);

--
-- Filtros para la tabla `tbl002_poblacion_por_delegacion`
--
ALTER TABLE `tbl002_poblacion_por_delegacion`
  ADD CONSTRAINT `tbl002_poblacion_por_delegacion_ibfk_1` FOREIGN KEY (`id_delegacion`) REFERENCES `cat005_delegacion` (`id_delegacion`),
  ADD CONSTRAINT `tbl002_poblacion_por_delegacion_ibfk_2` FOREIGN KEY (`id_sexo`) REFERENCES `cat007_sexo` (`id_sexo`),
  ADD CONSTRAINT `tbl002_poblacion_por_delegacion_ibfk_3` FOREIGN KEY (`id_rango_edad`) REFERENCES `cat006_rango_edad` (`id_rango_edad`),
  ADD CONSTRAINT `tbl002_poblacion_por_delegacion_ibfk_4` FOREIGN KEY (`id_delegacion`) REFERENCES `cat005_delegacion` (`id_delegacion`);

--
-- Filtros para la tabla `tbl003_ocupantes_por_vivienda`
--
ALTER TABLE `tbl003_ocupantes_por_vivienda`
  ADD CONSTRAINT `tbl003_ocupantes_por_vivienda_ibfk_1` FOREIGN KEY (`id_delegacion`) REFERENCES `cat005_delegacion` (`id_delegacion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
