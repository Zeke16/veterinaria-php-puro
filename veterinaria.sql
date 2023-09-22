-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-09-2023 a las 06:56:47
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `veterinaria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_especies`
--

CREATE TABLE `tbl_especies` (
  `id_especie` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `creado_por` int(11) NOT NULL,
  `actualizado_por` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_actualizacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_especies`
--

INSERT INTO `tbl_especies` (`id_especie`, `nombre`, `estado`, `creado_por`, `actualizado_por`, `fecha`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 'Perros', 1, 1, 1, '2023-09-21', '2023-09-22 05:42:28', '2023-09-22 05:42:28'),
(2, 'Gatos', 1, 2, 2, '2023-09-21', '2023-09-22 05:43:13', '2023-09-22 05:43:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_pacientes`
--

CREATE TABLE `tbl_pacientes` (
  `id_paciente` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `enfermedades` text NOT NULL,
  `vacunas` text NOT NULL,
  `id_raza` int(11) NOT NULL,
  `imagen` text NOT NULL,
  `fecha` date NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_actualizacion` datetime NOT NULL,
  `creado_por` int(11) NOT NULL,
  `actualizado_por` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_pacientes`
--

INSERT INTO `tbl_pacientes` (`id_paciente`, `nombre`, `enfermedades`, `vacunas`, `id_raza`, `imagen`, `fecha`, `fecha_creacion`, `fecha_actualizacion`, `creado_por`, `actualizado_por`) VALUES
(1, 'Manchas', 'Ninguna', 'Antirrábica, parásitos, pulgas', 1, 'imagenes/asfbiha2sd.jpg', '2022-12-20', '2023-09-22 05:45:51', '2023-09-22 05:45:51', 2, 2),
(2, 'Sr gato', 'Moquillo, Sida felino, Sarna', 'Ninguna', 4, 'imagenes/asfbiha2sd.jpg', '2023-09-21', '2023-09-22 05:45:51', '2023-09-22 05:45:51', 2, 2),
(3, 'Manchas', 'Sarna', 'Rabia', 1, 'imagenes/dkrqn6l8mw.ico', '2023-09-22', '2023-09-22 06:55:09', '2023-09-22 06:55:09', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_razas`
--

CREATE TABLE `tbl_razas` (
  `id_raza` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `creado_por` int(11) NOT NULL,
  `actualizado_por` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_actualizacion` datetime NOT NULL,
  `id_especie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_razas`
--

INSERT INTO `tbl_razas` (`id_raza`, `nombre`, `estado`, `creado_por`, `actualizado_por`, `fecha`, `fecha_creacion`, `fecha_actualizacion`, `id_especie`) VALUES
(1, 'Pitbull', 1, 1, 1, '2023-09-21', '2023-09-22 05:43:30', '2023-09-22 05:43:30', 1),
(2, 'Dalmata', 1, 1, 1, '2023-09-21', '2023-09-22 05:43:59', '2023-09-22 05:43:59', 1),
(3, 'Siames', 1, 2, 2, '2023-09-21', '2023-09-22 05:44:11', '2023-09-22 05:44:11', 2),
(4, 'Sphinx', 1, 2, 2, '2023-09-21', '2023-09-22 05:44:11', '2023-09-22 05:44:11', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `id_rol` int(11) NOT NULL,
  `rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_roles`
--

INSERT INTO `tbl_roles` (`id_rol`, `rol`) VALUES
(1, 'administrador'),
(2, 'usuario'),
(3, 'visitante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuarios`
--

CREATE TABLE `tbl_usuarios` (
  `id_usuario` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_usuarios`
--

INSERT INTO `tbl_usuarios` (`id_usuario`, `username`, `password`, `id_rol`) VALUES
(1, 'Admin', '123456', 1),
(2, 'Zeke16', '123456', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_especies`
--
ALTER TABLE `tbl_especies`
  ADD PRIMARY KEY (`id_especie`),
  ADD KEY `actualizado_por` (`actualizado_por`),
  ADD KEY `creado_por` (`creado_por`);

--
-- Indices de la tabla `tbl_pacientes`
--
ALTER TABLE `tbl_pacientes`
  ADD PRIMARY KEY (`id_paciente`),
  ADD KEY `creado_por` (`creado_por`),
  ADD KEY `actualizado_por` (`actualizado_por`),
  ADD KEY `id_raza` (`id_raza`);

--
-- Indices de la tabla `tbl_razas`
--
ALTER TABLE `tbl_razas`
  ADD PRIMARY KEY (`id_raza`),
  ADD KEY `id_especie` (`id_especie`),
  ADD KEY `creado_por` (`creado_por`),
  ADD KEY `actualizado_por` (`actualizado_por`);

--
-- Indices de la tabla `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `tbl_usuarios_ibfk_1` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_especies`
--
ALTER TABLE `tbl_especies`
  MODIFY `id_especie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_pacientes`
--
ALTER TABLE `tbl_pacientes`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_razas`
--
ALTER TABLE `tbl_razas`
  MODIFY `id_raza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_especies`
--
ALTER TABLE `tbl_especies`
  ADD CONSTRAINT `tbl_especies_ibfk_1` FOREIGN KEY (`actualizado_por`) REFERENCES `tbl_usuarios` (`id_usuario`),
  ADD CONSTRAINT `tbl_especies_ibfk_2` FOREIGN KEY (`creado_por`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tbl_pacientes`
--
ALTER TABLE `tbl_pacientes`
  ADD CONSTRAINT `tbl_pacientes_ibfk_1` FOREIGN KEY (`creado_por`) REFERENCES `tbl_usuarios` (`id_usuario`),
  ADD CONSTRAINT `tbl_pacientes_ibfk_2` FOREIGN KEY (`actualizado_por`) REFERENCES `tbl_usuarios` (`id_usuario`),
  ADD CONSTRAINT `tbl_pacientes_ibfk_3` FOREIGN KEY (`id_raza`) REFERENCES `tbl_razas` (`id_raza`);

--
-- Filtros para la tabla `tbl_razas`
--
ALTER TABLE `tbl_razas`
  ADD CONSTRAINT `tbl_razas_ibfk_1` FOREIGN KEY (`id_especie`) REFERENCES `tbl_especies` (`id_especie`),
  ADD CONSTRAINT `tbl_razas_ibfk_2` FOREIGN KEY (`creado_por`) REFERENCES `tbl_usuarios` (`id_usuario`),
  ADD CONSTRAINT `tbl_razas_ibfk_3` FOREIGN KEY (`actualizado_por`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD CONSTRAINT `tbl_usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `tbl_roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
