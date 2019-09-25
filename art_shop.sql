-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-09-2019 a las 01:08:31
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
-- Base de datos: `art_shop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock_client`
--

CREATE TABLE `stock_client` (
  `sold` tinyint(1) NOT NULL,
  `client_name` varchar(30) DEFAULT NULL,
  `client_dni` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock_id`
--

CREATE TABLE `stock_id` (
  `painting_id` varchar(3) NOT NULL,
  `painting_price` decimal(6,0) NOT NULL,
  `painting_author` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `stock_id`
--

INSERT INTO `stock_id` (`painting_id`, `painting_price`, `painting_author`) VALUES
('001', '99', 'Fake Banksy'),
('002', '65', 'Hamparte'),
('003', '83', 'Anonymous'),
('004', '70', 'Random Guy');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock_sales`
--

CREATE TABLE `stock_sales` (
  `painting_id` varchar(3) NOT NULL,
  `sold` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `stock_client`
--
ALTER TABLE `stock_client`
  ADD PRIMARY KEY (`client_dni`),
  ADD KEY `sold` (`sold`);

--
-- Indices de la tabla `stock_id`
--
ALTER TABLE `stock_id`
  ADD PRIMARY KEY (`painting_id`);

--
-- Indices de la tabla `stock_sales`
--
ALTER TABLE `stock_sales`
  ADD PRIMARY KEY (`sold`),
  ADD KEY `painting_id` (`painting_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `stock_client`
--
ALTER TABLE `stock_client`
  ADD CONSTRAINT `stock_client_ibfk_1` FOREIGN KEY (`sold`) REFERENCES `stock_sales` (`sold`);

--
-- Filtros para la tabla `stock_sales`
--
ALTER TABLE `stock_sales`
  ADD CONSTRAINT `stock_sales_ibfk_1` FOREIGN KEY (`painting_id`) REFERENCES `stock_id` (`painting_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
