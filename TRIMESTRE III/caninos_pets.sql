-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-09-2023 a las 20:31:17
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `caninos_pets`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categorias` int(11) NOT NULL,
  `nombre_categoria` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categorias`, `nombre_categoria`) VALUES
(1, 'Cachorros'),
(2, 'Pequeños'),
(3, 'Medianos'),
(4, 'Adultos'),
(5, 'Grandes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `nombre_cliente` varchar(50) NOT NULL,
  `documento_cliente` int(11) NOT NULL,
  `tipo_documento_cliente` int(11) NOT NULL,
  `direccion_cliente` varchar(45) NOT NULL,
  `telefono_cliente` varchar(45) NOT NULL,
  `idsexo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`nombre_cliente`, `documento_cliente`, `tipo_documento_cliente`, `direccion_cliente`, `telefono_cliente`, `idsexo`) VALUES
('mateo', 1, 1, 'cra 23', '21', 1),
('mateo', 2, 1, 'cra 23', '2', 1),
('ma', 123, 2, 'cra123', '4321', 1),
('', 333, 2, 'GFFGGF', '5888', 2),
('Camilo jh de la cruzz', 789, 2, 'cra 22#67', '12345', 1),
('', 12345, 2, 'cll 70 a 113 22', '3167901432', 2),
('', 56564, 1, 'gghgf', '5242', 1),
('', 1027150789, 2, 'cra26#66 A80', '7520077', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas`
--

CREATE TABLE `entradas` (
  `id_entradas` int(11) NOT NULL,
  `fecha_entradas` date NOT NULL,
  `hora_entradas` time NOT NULL,
  `cantidad_entradas` int(11) NOT NULL,
  `valor_entradas` float(10,2) NOT NULL,
  `id_productos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `entradas`
--

INSERT INTO `entradas` (`id_entradas`, `fecha_entradas`, `hora_entradas`, `cantidad_entradas`, `valor_entradas`, `id_productos`) VALUES
(8, '2023-08-03', '20:43:09', 3, 150000.00, 2),
(9, '2023-08-11', '00:03:40', 5, 150000.00, 3),
(10, '2023-09-04', '13:38:11', 80, 63000.00, 2),
(11, '2023-09-04', '13:45:54', 14, 11000.00, 2),
(12, '2023-09-04', '13:46:38', 5, 10000.00, 2),
(13, '2023-09-04', '13:49:03', 5, 444.00, 3),
(14, '2023-09-06', '13:04:16', 9, 50000.00, 2),
(20, '2023-09-08', '13:12:13', 2, 1200000.00, 13),
(45, '2023-09-04', '13:39:10', 10, 32000.00, 2),
(89, '2023-09-08', '13:08:18', 9, 50000.00, 19);

--
-- Disparadores `entradas`
--
DELIMITER $$
CREATE TRIGGER `stock_1` AFTER INSERT ON `entradas` FOR EACH ROW BEGIN
DECLARE idp INT DEFAULT 0;
DECLARE entra INT DEFAULT 0;
SET idp = new.id_productos;
SET entra = new.cantidad_entradas;
UPDATE productos SET productos.stock_productos = productos.stock_productos + entra WHERE productos.id_productos = idp;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `suma_entradas` BEFORE INSERT ON `entradas` FOR EACH ROW BEGIN 
DECLARE idp int DEFAULT 0; 
DECLARE entra int DEFAULT 0;
SET idp = new.id_productos;
SET entra= new.cantidad_entradas;
UPDATE productos SET productos.entrada_productos = productos.entrada_productos+entra WHERE productos.id_productos = idp;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedidos` int(11) NOT NULL,
  `documento_cliente` int(11) NOT NULL,
  `fecha_pedido` date NOT NULL,
  `hora_pedido` time NOT NULL,
  `valor_pedido` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedidos`, `documento_cliente`, `fecha_pedido`, `hora_pedido`, `valor_pedido`) VALUES
(1, 12345, '2023-08-16', '14:09:00', 2000.00),
(2, 12345, '2023-08-02', '14:09:00', 50.00),
(3, 12345, '2023-08-29', '14:10:21', 131000.00),
(4, 333, '2023-08-01', '15:49:00', 2000.00),
(5, 12345, '2023-09-04', '12:55:15', 100000.00),
(6, 12345, '0000-00-00', '00:00:00', 63000.00),
(7, 1027150789, '2023-09-04', '13:58:31', 21000.00),
(8, 12345, '2023-09-06', '13:14:25', 130000.00),
(9, 12345, '2023-09-06', '13:14:58', 130000.00),
(10, 12345, '2023-09-06', '13:15:26', 130000.00),
(13, 12345, '2023-09-06', '13:30:34', 141000.00),
(19, 12345, '2023-09-06', '14:16:04', 82000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `img` text NOT NULL,
  `cod` varchar(50) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `pre` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `img`, `cod`, `nom`, `pre`) VALUES
(1, 'img/dog_adultos.png', 'A1', 'Dow Chow Adultos', 98000.00),
(3, 'img/dog_pequeños.png', 'A2', 'Dow Chow Pequeños', 65000.00),
(4, 'img/dog.png', 'A3', 'Dow Chow Cachorros', 41000.00),
(5, 'img/dogourmet_adultos.png', 'B1', 'Dogourmet Adultos', 100000.00),
(6, 'img/dogourmet.png', 'B2', 'Dogourmet Cachorros', 22000.00),
(7, 'img/hills_grandes.png', 'C1', 'Hills Grandes', 19000.00),
(8, 'img/hills_medianos.png', 'C2', 'Hills Medianos', 22000.00),
(9, 'img/hills_pequeños.png', 'C3', 'hills Pequeños', 34000.00),
(10, 'img/nutrecan_adultos.png', 'D1', 'Nutrecan Adultos', 56000.00),
(11, 'img/nutrecan_medianos.png', 'D2', 'Nutrecan Medianos', 29000.00),
(12, 'img/nutrecan.png', 'D3', 'Nutrecan Cachorros', 67000.00),
(13, 'img/nutribalace_grandes.png', 'E1', 'Nutri Balance Grandes', 90000.00),
(14, 'img/pedigree_adultos.png', 'F1', 'Pedigree Adultos', 67000.00),
(15, 'img/pedigree_pequeños.png', 'F2', 'Pedigree Pequeños', 80000.00),
(16, 'img/pedigree.png', 'F3', 'Pedigree Cachorros', 71000.00),
(17, 'img/pro_grandes.png', 'G1', 'Procan Grandes', 86000.00),
(18, 'img/pro_medianos.png', 'G2', 'Procan Medianos', 99000.00),
(19, 'img/procan_pequeños.png', 'G3', 'Procan Pequeños', 34000.00),
(20, 'img/royal_grandes.png', 'H1', 'Royal Grandes', 66000.00),
(21, 'img/royal_medianos.png', 'H2', 'Royal Medianos', 95000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_productos` int(11) NOT NULL,
  `nombre_productos` varchar(45) NOT NULL,
  `id_categorias` int(11) NOT NULL,
  `entrada_productos` int(11) NOT NULL,
  `salida_productos` int(11) NOT NULL,
  `stock_productos` int(11) NOT NULL,
  `valor_productos` float(10,2) NOT NULL,
  `documento_proveedor` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_productos`, `nombre_productos`, `id_categorias`, `entrada_productos`, `salida_productos`, `stock_productos`, `valor_productos`, `documento_proveedor`) VALUES
(2, 'Nutre can', 4, 119, 135419, -135298, 50000.00, '987654321'),
(3, 'chunky', 3, 10, 7, 3, 80000.00, '10203040'),
(5, 'NutreCan Cachorros', 1, 0, 0, 0, 67000.00, '10203040'),
(6, 'pedigree cachorros', 1, 0, 0, 0, 71000.00, '987654321'),
(7, 'Dog Chow cachorros', 1, 0, 0, 0, 41000.00, '987654321'),
(8, 'dogurmet 3 cereales cachorro', 1, 0, 0, 0, 22000.00, '10203040'),
(9, 'pedigree adultos', 4, 0, 0, 0, 67000.00, '10203040'),
(10, 'dog chow adultos', 4, 0, 0, 0, 98000.00, '10203040'),
(11, 'dogurmet adultos', 4, 0, 0, 0, 100000.00, '987654321'),
(12, 'hills mediano', 3, 0, 0, 0, 22000.00, '10203040'),
(13, 'pedigree pequeño', 2, 2, 1, 1, 80000.00, '10203040'),
(14, 'Hills pequeño', 2, 0, 0, 0, 34000.00, '987654321'),
(15, 'Dog Chow pequeño', 2, 0, 0, 0, 65000.00, '987654321'),
(16, 'Pro can pequeño', 2, 0, 0, 0, 34000.00, '987654321'),
(17, 'pro plan medianos', 3, 0, 0, 0, 99000.00, '987654321'),
(18, 'royal canin', 3, 0, 0, 0, 95000.00, '10247556'),
(19, 'Nutri Balance Grandes', 5, 9, 45, -36, 90000.00, '10203040'),
(20, 'NutreCan medianos', 3, 0, 0, 0, 29000.00, '987654321'),
(21, 'Royal Canin Grandes', 5, 0, 0, 0, 66000.00, '10247556'),
(22, 'Hills Grandes', 5, 0, 0, 0, 19000.00, '10247556'),
(23, 'pro plan grandes', 5, 0, 0, 0, 86000.00, '987654321');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `documento_proveedor` varchar(20) NOT NULL,
  `idtipo_documento` int(11) NOT NULL,
  `nombre_proveedor` varchar(40) NOT NULL,
  `telefono_proveedor` varchar(40) NOT NULL,
  `direccion_proveedor` varchar(40) NOT NULL,
  `nombre_vendedor_proveedor` varchar(40) NOT NULL,
  `telefono_vendedor_proveedor` varchar(40) NOT NULL,
  `producto_proveedor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`documento_proveedor`, `idtipo_documento`, `nombre_proveedor`, `telefono_proveedor`, `direccion_proveedor`, `nombre_vendedor_proveedor`, `telefono_vendedor_proveedor`, `producto_proveedor`) VALUES
('10203040', 4, 'Ana Maria', '311267893', 'avn 34 a 113 27', 'Alejandro Salinas', '3167282546', 'Nutre can'),
('10247556', 2, 'Sergio Pineda', '32045889657', 'cra 40 norte', 'Brandon Ojeda', '3173678378', 'dogurmet'),
('987654321', 1, 'Juan Felipe', '3146782991', 'cll 70 112 B 45', 'Juan pablo', '345515754', 'dogourmet');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salidas`
--

CREATE TABLE `salidas` (
  `id_salidas` int(11) NOT NULL,
  `id_productos` int(11) NOT NULL,
  `numero_ventas` varchar(20) NOT NULL,
  `fecha_salida` date NOT NULL,
  `hora_salida` time NOT NULL,
  `cantidad_salida` int(11) NOT NULL,
  `valor_salida` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `salidas`
--

INSERT INTO `salidas` (`id_salidas`, `id_productos`, `numero_ventas`, `fecha_salida`, `hora_salida`, `cantidad_salida`, `valor_salida`) VALUES
(0, 3, '1.0', '0000-00-00', '00:00:00', 5, 12000.00),
(5, 2, '10', '0000-00-00', '00:00:00', 6, 70000.00),
(7, 2, '1.0', '2023-08-10', '20:48:44', 4, 50000.00),
(8, 3, '2.0', '2023-08-11', '00:11:23', 2, 80000.00),
(9, 2, '3.0', '0000-00-00', '00:00:00', 13, 96000.00),
(10, 2, '30', '2023-09-04', '13:55:35', 7, 4.00),
(17, 19, '40', '2023-09-08', '13:09:46', 3, 3000000.00),
(18, 13, '2', '2023-09-08', '13:13:38', 1, 1000.00);

--
-- Disparadores `salidas`
--
DELIMITER $$
CREATE TRIGGER `stock_2` AFTER INSERT ON `salidas` FOR EACH ROW BEGIN
DECLARE idp INT DEFAULT 0;
DECLARE salida INT DEFAULT 0;
SET idp = new.id_productos;
SET salida = new.cantidad_salida;
UPDATE productos SET productos.stock_productos = productos.stock_productos- salida WHERE productos.id_productos=idp;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `suma_salidas` BEFORE INSERT ON `salidas` FOR EACH ROW BEGIN
DECLARE idp INT DEFAULT 0;
DECLARE salida INT DEFAULT 0;
SET idp = new.id_productos;
SET salida = new.cantidad_salida;
UPDATE productos SET productos.salida_productos = productos.salida_productos + salida WHERE productos.id_productos = idp;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexo`
--

CREATE TABLE `sexo` (
  `idsexo` int(11) NOT NULL,
  `nombre_sexo` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `sexo`
--

INSERT INTO `sexo` (`idsexo`, `nombre_sexo`) VALUES
(1, 'Masculino'),
(2, 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `idtipo_documento` int(11) NOT NULL,
  `nombre_documento` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`idtipo_documento`, `nombre_documento`) VALUES
(1, 'T.I'),
(2, 'C.C'),
(3, 'C.E'),
(4, 'Pasaporte');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(256) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `email` varchar(256) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `clave` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `cargo` varchar(256) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `clave`, `cargo`) VALUES
(2, 'mateo', 'mateo@gmail.com', '202cb962ac59075b964b07152d234b70', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedores`
--

CREATE TABLE `vendedores` (
  `idvendedores` int(11) NOT NULL,
  `nombre_vendedores` varchar(45) NOT NULL,
  `telefono_vendedores` varchar(45) NOT NULL,
  `documento_proveedor` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `vendedores`
--

INSERT INTO `vendedores` (`idvendedores`, `nombre_vendedores`, `telefono_vendedores`, `documento_proveedor`) VALUES
(1, 'Brandon Ojeda', '3173678378', '987654321'),
(2, 'Alejandro Salinas', '3167282546', '10203040'),
(3, 'Juan Pablo', '345515754', '10245385');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categorias`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`documento_cliente`),
  ADD KEY `tipo_documento_cliente_idx2` (`tipo_documento_cliente`),
  ADD KEY `idsexo_idx` (`idsexo`);

--
-- Indices de la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD PRIMARY KEY (`id_entradas`),
  ADD KEY `id_productos_idx` (`id_productos`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedidos`),
  ADD KEY `documento_cliente_idx` (`documento_cliente`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_productos`),
  ADD KEY `documento_proveedor_idx` (`documento_proveedor`),
  ADD KEY `id_categorias_idx` (`id_categorias`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`documento_proveedor`),
  ADD KEY `idtipo_documento_idx` (`idtipo_documento`);

--
-- Indices de la tabla `salidas`
--
ALTER TABLE `salidas`
  ADD PRIMARY KEY (`id_salidas`),
  ADD KEY `id_productos_idx2` (`id_productos`),
  ADD KEY `numero_ventas_idx` (`numero_ventas`);

--
-- Indices de la tabla `sexo`
--
ALTER TABLE `sexo`
  ADD PRIMARY KEY (`idsexo`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`idtipo_documento`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vendedores`
--
ALTER TABLE `vendedores`
  ADD PRIMARY KEY (`idvendedores`),
  ADD KEY `documento_proveedor_idx2` (`documento_proveedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedidos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
