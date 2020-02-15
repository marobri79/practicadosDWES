-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-02-2020 a las 23:18:47
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pracrica2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juguetes`
--

CREATE TABLE `juguetes` (
  `id_juguetes` int(20) NOT NULL,
  `nombre_juguetes` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `precio_juguetes` decimal(10,2) NOT NULL,
  `reyes_juguetes` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `juguetes`
--

INSERT INTO `juguetes` (`id_juguetes`, `nombre_juguetes`, `precio_juguetes`, `reyes_juguetes`) VALUES
(1, 'Aula de ciencia: Rob', '159.95', 1),
(2, 'Carbón', '0.00', 1),
(3, 'Cochecito Classic', '99.95', 1),
(4, 'Consola PS4 1 TB', '349.90', 1),
(5, 'Lego Villa familiar ', '64.99', 2),
(6, 'Magia Borrás Clásica', '150.00', 2),
(7, 'trucos con luz', '32.95', 2),
(8, 'Meccano Excavadora c', '30.99', 2),
(9, 'Nenuco Hace pompas', '29.95', 2),
(10, 'Peluche delfín rosa', '34.00', 3),
(11, 'Pequeordenador', '22.95', 3),
(12, 'Robot Coji', '69.95', 3),
(13, 'Telescopio astronómi', '72.00', 3),
(14, 'Twister', '17.95', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ninos`
--

CREATE TABLE `ninos` (
  `id_ninos` int(20) NOT NULL,
  `nombre_ninos` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `apellidos_ninos` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `fechanacimiento_ninos` date NOT NULL,
  `bueno` varchar(2) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `ninos`
--

INSERT INTO `ninos` (`id_ninos`, `nombre_ninos`, `apellidos_ninos`, `fechanacimiento_ninos`, `bueno`) VALUES
(1, 'Alberto', 'Alcántara', '1994-10-13', 'No'),
(2, 'Beatriz', 'Bueno', '1982-04-18', 'Sí'),
(3, 'Carlos', 'Crepo', '1998-12-01', 'Sí'),
(4, 'Diana', 'Domínguez', '1987-09-02', 'No'),
(5, 'Emilio', 'Enamorado', '1986-08-12', 'Sí'),
(6, 'Francisca', 'Fernández', '1990-07-28', 'Sí');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reparto`
--

CREATE TABLE `reparto` (
  `id_reparto` int(20) NOT NULL,
  `ninos_reparto` int(20) NOT NULL,
  `juguetes_reparto` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `reparto`
--

INSERT INTO `reparto` (`id_reparto`, `ninos_reparto`, `juguetes_reparto`) VALUES
(1, 1, 2),
(2, 2, 2),
(3, 3, 3),
(4, 3, 4),
(5, 4, 2),
(6, 5, 6),
(7, 5, 7),
(8, 6, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reyes`
--

CREATE TABLE `reyes` (
  `id_reyes` int(20) NOT NULL,
  `nombre_reyes` varchar(20) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `reyes`
--

INSERT INTO `reyes` (`id_reyes`, `nombre_reyes`) VALUES
(1, 'Gaspa'),
(2, 'Melchor'),
(3, 'Baltasar');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `juguetes`
--
ALTER TABLE `juguetes`
  ADD PRIMARY KEY (`id_juguetes`),
  ADD KEY `Reyes.Juguetes` (`reyes_juguetes`);

--
-- Indices de la tabla `ninos`
--
ALTER TABLE `ninos`
  ADD PRIMARY KEY (`id_ninos`);

--
-- Indices de la tabla `reparto`
--
ALTER TABLE `reparto`
  ADD PRIMARY KEY (`id_reparto`),
  ADD KEY `Ninos.Reparto` (`ninos_reparto`),
  ADD KEY `Juguetes.Reparto` (`juguetes_reparto`);

--
-- Indices de la tabla `reyes`
--
ALTER TABLE `reyes`
  ADD PRIMARY KEY (`id_reyes`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `juguetes`
--
ALTER TABLE `juguetes`
  ADD CONSTRAINT `juguetes_ibfk_1` FOREIGN KEY (`reyes_juguetes`) REFERENCES `reyes` (`id_reyes`);

--
-- Filtros para la tabla `reparto`
--
ALTER TABLE `reparto`
  ADD CONSTRAINT `reparto_ibfk_1` FOREIGN KEY (`ninos_reparto`) REFERENCES `ninos` (`id_ninos`),
  ADD CONSTRAINT `reparto_ibfk_2` FOREIGN KEY (`juguetes_reparto`) REFERENCES `juguetes` (`id_juguetes`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
