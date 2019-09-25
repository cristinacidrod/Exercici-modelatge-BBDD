-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-09-2019 a las 12:14:29
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
-- Base de datos: `cul_dampolla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bills`
--

CREATE TABLE `bills` (
  `bill_id` varchar(3) NOT NULL,
  `bill_number` int(10) NOT NULL,
  `bill_seller` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `product_brand` varchar(3) NOT NULL,
  `suppliers_id` varchar(3) NOT NULL,
  `brand_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `client_id` varchar(3) NOT NULL,
  `client_name` varchar(30) NOT NULL,
  `client_adress` text NOT NULL,
  `client_telephone` int(9) NOT NULL,
  `client_email` varchar(50) NOT NULL,
  `client_registerdate` date NOT NULL,
  `product_id` varchar(3) NOT NULL,
  `bill_id` varchar(3) NOT NULL,
  `client_recomendedby` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `product_id` varchar(3) NOT NULL,
  `product_brand` varchar(30) NOT NULL,
  `product_crystalgraduation_right` decimal(10,0) NOT NULL,
  `product_crystalgraduation_left` decimal(10,0) NOT NULL,
  `product_glassesframe` enum('floating, pasta, metal') NOT NULL,
  `product_glassescolor` varchar(10) NOT NULL,
  `product_crystalcolor_right` varchar(10) NOT NULL,
  `product_crystalcolor_left` varchar(10) NOT NULL,
  `product_price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suppliers`
--

CREATE TABLE `suppliers` (
  `suppliers_id` varchar(3) NOT NULL,
  `suppliers_name` varchar(30) NOT NULL,
  `suppliers_adress` varchar(50) NOT NULL,
  `suppliers_telephone` int(9) NOT NULL,
  `suppliers_fax` int(9) NOT NULL,
  `suppliers_nif` varchar(10) NOT NULL,
  `product_id` varchar(3) NOT NULL,
  `suppliers_street` varchar(30) NOT NULL,
  `suppliers_number` int(3) NOT NULL,
  `suppliers_floor` varchar(3) NOT NULL,
  `suppliers_door` int(2) NOT NULL,
  `suppliers_city` varchar(30) NOT NULL,
  `suppliers_zipcode` int(10) NOT NULL,
  `suppliers_country` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`bill_id`);

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`product_brand`,`suppliers_id`),
  ADD KEY `suppliers_id` (`suppliers_id`);

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `bill_id` (`bill_id`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_brand` (`product_brand`);

--
-- Indices de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`suppliers_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_ibfk_1` FOREIGN KEY (`suppliers_id`) REFERENCES `suppliers` (`suppliers_id`);

--
-- Filtros para la tabla `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`bill_id`);

--
-- Filtros para la tabla `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_brand`) REFERENCES `brands` (`product_brand`);

--
-- Filtros para la tabla `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `suppliers_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
