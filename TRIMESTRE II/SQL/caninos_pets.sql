-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-06-2023 a las 22:35:43
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `caninos pets`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso de pagina`
--

CREATE TABLE `acceso de pagina` (
  `Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `acceso de pagina`
--

INSERT INTO `acceso de pagina` (`Id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `Contraseña` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`Contraseña`) VALUES
('0947587'),
('1234344'),
('1526743'),
('23612872'),
('23746827'),
('2764974'),
('346182763'),
('3477346'),
('38478374'),
('446484'),
('74125867'),
('7645283'),
('846756'),
('9374523'),
('9872342');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo`
--

CREATE TABLE `catalogo` (
  `Marca` varchar(50) NOT NULL,
  `Raza` varchar(50) NOT NULL,
  `Tamaño` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `catalogo`
--

INSERT INTO `catalogo` (`Marca`, `Raza`, `Tamaño`) VALUES
('Chunky', 'Chihuhua', 'Pequeño'),
('Dog Show Adultos', 'Pastor almenan', 'Grande'),
('Dog Show cachorros', 'Volpino', 'Pequeño'),
('Dogourmet Cachorros', 'Pug', 'Pequeño'),
('Dogourmet Razas grandes', 'Dogo', 'Grande'),
('Max Adultos', 'Manchester', 'Grande'),
('Max Cachorros', 'Terrier', 'Pequeño'),
('Monello Razas grandes', 'Golden', 'Grande'),
('Monello Razas pequeñas', 'Beagle', 'Pequeño'),
('Nutrecan Adultos', 'Lobo ciberiano', 'Grande'),
('Nutrecan cachorros', 'Schnauzer', 'Pequeño'),
('Nutrecan Razas pequeñas', 'Pomerania', 'Pequeño'),
('Pedigree', 'Pitbull', 'Grande'),
('Pedigree Adulto', 'Pitbull', 'Grande'),
('Pedigree Cachorros', 'Chow Chow', 'Pequeño'),
('Ringo Adultos', 'Alabai', 'Grandes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta administrador`
--

CREATE TABLE `cuenta administrador` (
  `Usuario_unico` varchar(50) NOT NULL,
  `contraseña_unica` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cuenta administrador`
--

INSERT INTO `cuenta administrador` (`Usuario_unico`, `contraseña_unica`) VALUES
('Ana_Gabriel', '987456321'),
('Carolina_Pc', '474783984'),
('Daniel_Lopez', '357159852'),
('Fabian_Gonzales', '025971558'),
('Juan_Garcia', '4483457494'),
('julieth_Sanchez', '123654987'),
('Karoll_Moreno', '579839044'),
('Kevin_Ariza', '75909272'),
('Laura_Benavides', '415795485'),
('Leonel_Messi', '81234565'),
('Maria_Pintor', '982013898'),
('Mateo_Herrera', '1103099289'),
('Sebastian_Rodriguez', '456678678'),
('Shakira_Medina', '951423677'),
('Valentina_Torres', '459756556');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta del usuario`
--

CREATE TABLE `cuenta del usuario` (
  `Cambiar_nombre_usuario` varchar(50) DEFAULT NULL,
  `Modificar_encuesta` varchar(50) DEFAULT NULL,
  `Cambiar_contraseña` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cuenta del usuario`
--

INSERT INTO `cuenta del usuario` (`Cambiar_nombre_usuario`, `Modificar_encuesta`, `Cambiar_contraseña`) VALUES
('', '', ''),
('', '', ''),
('', '', ''),
('', '', ''),
('', '', ''),
('', '', ''),
('', '', ''),
('', '', ''),
('', '', ''),
('', '', ''),
('', '', ''),
('', '', ''),
('', '', ''),
('', '', ''),
('', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestión inventario`
--

CREATE TABLE `gestión inventario` (
  `Entrada_productos` varchar(50) NOT NULL,
  `Salida_productos` varchar(50) NOT NULL,
  `Nombre_Producto` varchar(50) NOT NULL,
  `Fecha_Entrada` varchar(50) NOT NULL,
  `Fecha_Salida` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `gestión inventario`
--

INSERT INTO `gestión inventario` (`Entrada_productos`, `Salida_productos`, `Nombre_Producto`, `Fecha_Entrada`, `Fecha_Salida`) VALUES
('23', '13', 'Chunky', '17/01/2023', '24/01/2023'),
('23', '13', 'Dog Show Adultos', '17/01/2023', '4/01/2023'),
('23', '12', 'Dog Show cachorros', '17/01/2023', '4/01/2023'),
('25', '12', 'Dogourmet Cachorros', '17/01/2023', '4/01/2023'),
('25', '13', 'Dogourmet Razas grandes', '17/01/2023', '4/01/2023'),
('25', '15', 'Max Adultos', '17/01/2023', '4/01/2023'),
('25', '11', 'Max Cachorros', '17/01/2023', '4/01/2023'),
('25', '11', 'Monello', '17/01/2023', '4/01/2023'),
('25', '11', 'Monello Razas pequeñas', '17/01/2023', '4/01/2023'),
('25', '11', 'Nutrecan Adultos', '17/01/2023', '4/01/2023'),
('25', '11', 'Nutrecan cachorros', '17/01/2023', '4/01/2023'),
('25', '11', 'Nutrecan Razas pequeñas', '17/01/2023', '4/01/2023'),
('25', '11', 'Pedigree', '17/01/2023', '4/01/2023'),
('25', '11', 'Pedigree Adulto', '17/01/2023', '4/01/2023'),
('25', '11', 'Pedigree Cachorros', '17/01/2023', '4/01/2023'),
('25', '11', 'Razas grandes', '17/01/2023', '4/01/2023'),
('25', '11', 'Ringo Adultos', '17/01/2023', '4/01/2023');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestión productos`
--

CREATE TABLE `gestión productos` (
  `Lista` varchar(50) NOT NULL,
  `Estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `gestión productos`
--

INSERT INTO `gestión productos` (`Lista`, `Estado`) VALUES
('Chunky adultos', 'Agotado'),
('Chunky cachorros', 'Descontinuado'),
('Dog Show adultos', 'Activo'),
('Dog Show cachorros', 'Descontinuado'),
('dogourmet cachorros', 'Activo'),
('Dogourmet razas grandes', 'Agotado'),
('Max adultos', 'Descontinuado'),
('Max cachorros', 'Descontinuado'),
('Monello razas grandes', 'Agotado'),
('Monello razas pequeñas', 'Activo'),
('Nutrecan adultos', 'Agotado'),
('Nutrecan cachorros', 'Activo'),
('Nutrecan Razas pequeñas', 'Activo'),
('Pedigree adultos', 'Activo'),
('Pedigree cachorros', 'Activo'),
('Ringo adultos', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informe estado`
--

CREATE TABLE `informe estado` (
  `Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `informe estado`
--

INSERT INTO `informe estado` (`Id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `Crear_cuenta` varchar(50) DEFAULT NULL,
  `Contraseña_olvidada` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`Crear_cuenta`, `Contraseña_olvidada`) VALUES
('', ''),
('', ''),
('', ''),
('', ''),
('', ''),
('', ''),
('', ''),
('', ''),
('', ''),
('', ''),
('', ''),
('', ''),
('', ''),
('', ''),
('', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Doc` int(11) NOT NULL,
  `Nombres` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Telefono` int(11) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Contraseña` varchar(50) NOT NULL,
  `Confirmar_Contraseña` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Doc`, `Nombres`, `Apellidos`, `Telefono`, `Correo`, `Contraseña`, `Confirmar_Contraseña`) VALUES
(103439, 'Carolina', 'Pintor', 4456174, 'caropc@soy.sena.edu.co', '1244', ''),
(412354, 'Carolina', 'PC', 15462, 'CarolinaPC@gmail.com', '1234', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceso de pagina`
--
ALTER TABLE `acceso de pagina`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`Contraseña`);

--
-- Indices de la tabla `catalogo`
--
ALTER TABLE `catalogo`
  ADD PRIMARY KEY (`Marca`);

--
-- Indices de la tabla `cuenta administrador`
--
ALTER TABLE `cuenta administrador`
  ADD PRIMARY KEY (`Usuario_unico`,`contraseña_unica`);

--
-- Indices de la tabla `gestión inventario`
--
ALTER TABLE `gestión inventario`
  ADD PRIMARY KEY (`Nombre_Producto`);

--
-- Indices de la tabla `gestión productos`
--
ALTER TABLE `gestión productos`
  ADD PRIMARY KEY (`Lista`);

--
-- Indices de la tabla `informe estado`
--
ALTER TABLE `informe estado`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Doc`,`Correo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
