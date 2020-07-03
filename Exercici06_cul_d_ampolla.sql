-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-07-2020 a las 17:13:09
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cul_d_ampolla`
--
CREATE DATABASE IF NOT EXISTS `cul_d_ampolla` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cul_d_ampolla`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `adreca_carrer` varchar(30) NOT NULL,
  `adreca_num` varchar(8) NOT NULL,
  `adreca_pìs` varchar(4) DEFAULT NULL,
  `adreca_porta` varchar(4) DEFAULT NULL,
  `localitat_id` int(11) NOT NULL,
  `telefon` varchar(12) NOT NULL,
  `email` varchar(30) NOT NULL,
  `data_registre` date NOT NULL,
  `recomenat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id_client`, `nom`, `adreca_carrer`, `adreca_num`, `adreca_pìs`, `adreca_porta`, `localitat_id`, `telefon`, `email`, `data_registre`, `recomenat`) VALUES
(1, 'Bruce Wayne', 'c/ Bat Cave', '236', NULL, NULL, 1, '+345555555', 'bati@gmail.com', '2020-06-08', NULL),
(2, 'Barry Allen', 'c/ Speedforce', '12', 'Atic', NULL, 2, '+346543221', 'rapidin@gmail.com', '2020-06-17', NULL),
(3, 'Clark kent', 'c/ Smallville', '123', '2', 'A', 3, '+33666555555', 'super@gmail.com', '2020-07-01', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleats`
--

CREATE TABLE `empleats` (
  `id_empleat` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleats`
--

INSERT INTO `empleats` (`id_empleat`, `nom`) VALUES
(1, 'Peter Parker'),
(2, 'Mary Jane Watson');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localitats`
--

CREATE TABLE `localitats` (
  `id_localitat` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `codi_postal` varchar(5) NOT NULL,
  `pais` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `localitats`
--

INSERT INTO `localitats` (`id_localitat`, `nom`, `codi_postal`, `pais`) VALUES
(1, 'Barcelona', '08080', 'España'),
(2, 'Lloret de Mar', '17310', 'España'),
(3, 'Carcassone', '11000', 'Francia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marques`
--

CREATE TABLE `marques` (
  `id_marca` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `proveidor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marques`
--

INSERT INTO `marques` (`id_marca`, `nom`, `proveidor_id`) VALUES
(1, 'Ray-Ban', 2),
(2, 'Arnette', 2),
(3, 'Esprit', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidors`
--

CREATE TABLE `proveidors` (
  `id_provdeidor` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `adreca_carrer` varchar(30) NOT NULL,
  `adreca_num` varchar(8) NOT NULL,
  `adreca_pìs` varchar(4) DEFAULT NULL,
  `adreca_porta` varchar(4) DEFAULT NULL,
  `localitat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveidors`
--

INSERT INTO `proveidors` (`id_provdeidor`, `nom`, `adreca_carrer`, `adreca_num`, `adreca_pìs`, `adreca_porta`, `localitat_id`) VALUES
(1, 'Gafas Lennon', 'c/ Beatles', '12', '1', 'B', 1),
(2, 'Hipster Glasses', 'c/ Mira mi barba', '32', '2', NULL, 2),
(3, 'OptiGafas', 'c/ Petit croissant', '203', NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres`
--

CREATE TABLE `ulleres` (
  `id_ullera` int(11) NOT NULL,
  `marca_id` int(11) NOT NULL,
  `tipus_montura` enum('flotant','pasta','metallica','') NOT NULL,
  `color_montura` varchar(20) NOT NULL,
  `color_vidre_dret` varchar(20) NOT NULL,
  `color_vidre_esqu` varchar(20) NOT NULL,
  `preu` float NOT NULL,
  `empleat_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ulleres`
--

INSERT INTO `ulleres` (`id_ullera`, `marca_id`, `tipus_montura`, `color_montura`, `color_vidre_dret`, `color_vidre_esqu`, `preu`, `empleat_id`, `client_id`) VALUES
(1, 1, 'pasta', 'negro', 'negro', 'negro', 600.5, NULL, NULL),
(2, 2, 'metallica', 'negro', 'transparente', 'transparente', 260.95, 1, 3),
(3, 3, 'flotant', 'rojo', 'transparente', 'transparente', 100, 2, 2),
(4, 3, 'flotant', 'rojo', 'transparente', 'transparente', 75, 2, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`),
  ADD KEY `viu_localitat` (`localitat_id`),
  ADD KEY `recomenat_per` (`recomenat`);

--
-- Indices de la tabla `empleats`
--
ALTER TABLE `empleats`
  ADD PRIMARY KEY (`id_empleat`);

--
-- Indices de la tabla `localitats`
--
ALTER TABLE `localitats`
  ADD PRIMARY KEY (`id_localitat`);

--
-- Indices de la tabla `marques`
--
ALTER TABLE `marques`
  ADD PRIMARY KEY (`id_marca`),
  ADD KEY `comprada_a` (`proveidor_id`);

--
-- Indices de la tabla `proveidors`
--
ALTER TABLE `proveidors`
  ADD PRIMARY KEY (`id_provdeidor`),
  ADD KEY `ubicat_localitat` (`localitat_id`);

--
-- Indices de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id_ullera`),
  ADD KEY `de_marca` (`marca_id`),
  ADD KEY `venuda_per` (`empleat_id`),
  ADD KEY `comprada_per` (`client_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `empleats`
--
ALTER TABLE `empleats`
  MODIFY `id_empleat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `localitats`
--
ALTER TABLE `localitats`
  MODIFY `id_localitat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `marques`
--
ALTER TABLE `marques`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `proveidors`
--
ALTER TABLE `proveidors`
  MODIFY `id_provdeidor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `id_ullera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `recomenat_per` FOREIGN KEY (`recomenat`) REFERENCES `clients` (`id_client`),
  ADD CONSTRAINT `viu_localitat` FOREIGN KEY (`localitat_id`) REFERENCES `localitats` (`id_localitat`);

--
-- Filtros para la tabla `marques`
--
ALTER TABLE `marques`
  ADD CONSTRAINT `comprada_a` FOREIGN KEY (`proveidor_id`) REFERENCES `proveidors` (`id_provdeidor`);

--
-- Filtros para la tabla `proveidors`
--
ALTER TABLE `proveidors`
  ADD CONSTRAINT `ubicat_localitat` FOREIGN KEY (`localitat_id`) REFERENCES `localitats` (`id_localitat`);

--
-- Filtros para la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `comprada_per` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id_client`),
  ADD CONSTRAINT `de_marca` FOREIGN KEY (`marca_id`) REFERENCES `marques` (`id_marca`),
  ADD CONSTRAINT `venuda_per` FOREIGN KEY (`empleat_id`) REFERENCES `empleats` (`id_empleat`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
