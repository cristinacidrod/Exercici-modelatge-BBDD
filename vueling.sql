-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-09-2019 a las 01:08:58
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vueling`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aeroplane_id`
--

CREATE TABLE `aeroplane_id` (
  `plane_id` varchar(3) NOT NULL,
  `plane_capacity` int(3) DEFAULT NULL,
  `plane_model` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aeroplane_id`
--

INSERT INTO `aeroplane_id` (`plane_id`, `plane_capacity`, `plane_model`) VALUES
('001', 220, 'A321'),
('002', 220, 'A321'),
('003', 180, 'A320'),
('004', 156, 'A321');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aeroplane_seats`
--

CREATE TABLE `aeroplane_seats` (
  `plane_id` varchar(3) NOT NULL,
  `plane_seats` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aeroplane_id`
--
ALTER TABLE `aeroplane_id`
  ADD PRIMARY KEY (`plane_id`);

--
-- Indices de la tabla `aeroplane_seats`
--
ALTER TABLE `aeroplane_seats`
  ADD KEY `plane_id` (`plane_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aeroplane_seats`
--
ALTER TABLE `aeroplane_seats`
  ADD CONSTRAINT `aeroplane_seats_ibfk_1` FOREIGN KEY (`plane_id`) REFERENCES `aeroplane_id` (`plane_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
