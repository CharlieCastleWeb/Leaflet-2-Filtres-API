-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-05-2021 a las 19:15:12
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `my_app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurants`
--

CREATE TABLE `restaurants` (
  `id_restaurant` int(11) NOT NULL,
  `name` char(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL,
  `kind_food` set('Marisco','Mediterráneo','Italiano','Asiático','Barbacoa','Español','Oriente medio') DEFAULT NULL,
  `photo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `restaurants`
--

INSERT INTO `restaurants` (`id_restaurant`, `name`, `address`, `lat`, `lng`, `kind_food`, `photo`) VALUES
(1, 'El Xiringo', 'Cr. Sant Carles no23 La Barceloneta', 41.3797, 2.19081, 'Marisco', 'img/0.jpg'),
(2, 'La Patsa Lab', 'Calle Casanova 94', 41.3871, 2.15695, 'Italiano', 'img/1.jpg'),
(3, 'Don Kilo Gourmet', 'Carrer Corsega 398', 41.3999, 2.16398, 'Italiano', 'img/2.jpg'),
(4, 'Babula Bar 1937', 'Calle Pau Claris 139', 41.3938, 2.16569, 'Mediterráneo', 'img/3.jpg'),
(5, 'BelleBuon', 'Travessera de Gracia, 441', 41.4114, 2.17325, 'Italiano', 'img/4.jpg'),
(6, 'Casa Cheli', 'Roger de Flor 226', 41.4014, 2.1698, 'Mediterráneo', 'img/5.jpg'),
(7, 'Sports Bar Italian Food', 'Carrer Ample, 51', 41.3873, 2.18141, 'Italiano', 'img/6.jpg'),
(8, 'La Gastronomica', 'Carrer de Calabria, 118', 41.381, 2.15401, 'Mediterráneo', 'img/7.png'),
(9, 'Sumac & Mambo', 'Carrer D\'enric Granados 30', 41.3906, 2.15928, 'Mediterráneo', 'img/8.png'),
(10, 'Alquimia Barcelona', 'Carrer D\'Aribau, 77', 41.3894, 2.1578, 'Español', 'img/9.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id_restaurant`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id_restaurant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
