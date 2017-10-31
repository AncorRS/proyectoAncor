-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-11-2015 a las 11:27:49
-- Versión del servidor: 5.6.20
-- Versión de PHP: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `shop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books`
--

CREATE TABLE IF NOT EXISTS `books` (
`book_id` int(11) NOT NULL,
  `title` varchar(70) DEFAULT NULL,
  `author` varchar(70) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `books`
--

INSERT INTO `books` (`book_id`, `title`, `author`, `price`, `category_id`) VALUES
(1, 'Web Standards', 'Leslie Sikos', 44.99, 1),
(2, 'Getting Started with CSS', 'David Powers', 24.99, 1),
(3, 'The Complete Robot', 'Isaac Asimov', 8.95, 2),
(4, 'Foundation', 'Isaac ASimov', 8.95, 2),
(5, 'Area 7', 'Matthew Reilly', 5.99, 3),
(6, 'Term Limits', 'Vince Flynn', 6.99, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
`category_id` int(11) NOT NULL,
  `category_name` varchar(70) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'Desarrollo Web'),
(2, 'SF'),
(3, 'Novelas de Accion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
`order_id` double NOT NULL,
  `delivery_name` varchar(70) DEFAULT NULL,
  `delivery_address` varchar(70) DEFAULT NULL,
  `cc_name` varchar(70) DEFAULT NULL,
  `cc_number` varchar(32) DEFAULT NULL,
  `cc_expiry` varchar(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1446627493400 ;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`order_id`, `delivery_name`, `delivery_address`, `cc_name`, `cc_number`, `cc_expiry`) VALUES
(1391003579371, '', '', '', '', ''),
(1391003866772, '', '', '', '', ''),
(1446123408564, '', '', '', '', ''),
(1446123447298, '5477', '87657', '786', '', ''),
(1446627321469, '', '', '', '', ''),
(1446627493399, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_details`
--

CREATE TABLE IF NOT EXISTS `order_details` (
`id` double NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `title` varchar(70) DEFAULT NULL,
  `author` varchar(70) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `order_id` double DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `order_details`
--

INSERT INTO `order_details` (`id`, `book_id`, `title`, `author`, `quantity`, `price`, `order_id`) VALUES
(1, 1, 'Web Standards', 'Leslie Sikos', 1, 44.99, 1391003579371),
(2, 6, 'Term Limits', 'Vince Flynn', 1, 6.99, 1391003579371),
(3, 3, 'The Complete Robot', 'Isaac Asimov', 1, 8.95, 1391003579371),
(4, 2, 'Getting Started with CSS', 'David Powers', 1, 24.99, 1391003579371),
(5, 5, 'Area 7', 'Matthew Reilly', 1, 5.99, 1391003866772),
(6, 4, 'Foundation', 'Isaac ASimov', 2, 8.95, 1446123408564),
(7, 3, 'The Complete Robot', 'Isaac Asimov', 2, 8.95, 1446123408564),
(8, 1, 'Web Standards', 'Leslie Sikos', 1, 44.99, 1446123447298),
(9, 5, 'Area 7', 'Matthew Reilly', 1, 5.99, 1446627321469),
(10, 2, 'Getting Started with CSS', 'David Powers', 1, 24.99, 1446627493399);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
`id` mediumint(8) unsigned NOT NULL,
  `usuario` varchar(50) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `clave` varchar(32) COLLATE latin1_spanish_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `clave`) VALUES
(1, 'admin', 'admin'),
(3, 'admin2', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `books`
--
ALTER TABLE `books`
 ADD PRIMARY KEY (`book_id`), ADD UNIQUE KEY `book_id` (`book_id`), ADD KEY `book_id_key` (`book_id`), ADD KEY `category_id` (`category_id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`category_id`), ADD UNIQUE KEY `category_id` (`category_id`), ADD KEY `category_id_key` (`category_id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
 ADD PRIMARY KEY (`order_id`), ADD UNIQUE KEY `order_id` (`order_id`), ADD KEY `order_id_key` (`order_id`);

--
-- Indices de la tabla `order_details`
--
ALTER TABLE `order_details`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`), ADD KEY `order_details_id_key` (`id`), ADD KEY `order_id` (`order_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
 ADD PRIMARY KEY (`id`), ADD KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `books`
--
ALTER TABLE `books`
MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
MODIFY `order_id` double NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1446627493400;
--
-- AUTO_INCREMENT de la tabla `order_details`
--
ALTER TABLE `order_details`
MODIFY `id` double NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `books`
--
ALTER TABLE `books`
ADD CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Filtros para la tabla `order_details`
--
ALTER TABLE `order_details`
ADD CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
