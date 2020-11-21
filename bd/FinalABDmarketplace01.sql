-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: marketplacebd_test
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `boleta`
--

DROP TABLE IF EXISTS `boleta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boleta` (
  `idboleta` int NOT NULL,
  `cantidad_producto` int NOT NULL,
  `idpago` int NOT NULL,
  PRIMARY KEY (`idboleta`),
  UNIQUE KEY `idBoletaVenta_UNIQUE` (`idboleta`),
  KEY `fk_boleta_pago1_idx` (`idpago`),
  CONSTRAINT `fk_boleta_pago1` FOREIGN KEY (`idpago`) REFERENCES `pago` (`idpago`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boleta`
--

LOCK TABLES `boleta` WRITE;
/*!40000 ALTER TABLE `boleta` DISABLE KEYS */;
/*!40000 ALTER TABLE `boleta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boleta_venta`
--

DROP TABLE IF EXISTS `boleta_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boleta_venta` (
  `idboletaventa` int NOT NULL,
  PRIMARY KEY (`idboletaventa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boleta_venta`
--

LOCK TABLES `boleta_venta` WRITE;
/*!40000 ALTER TABLE `boleta_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `boleta_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `idcarrito` int unsigned NOT NULL,
  `precio_total` double NOT NULL,
  `unidad_por_producto` int NOT NULL,
  `idproducto` bigint NOT NULL,
  `idcupon` int NOT NULL,
  `idusuario` int NOT NULL,
  PRIMARY KEY (`idcarrito`),
  KEY `fk_carrito_producto_producto1_idx` (`idproducto`),
  KEY `fk_carrito_usuario_idx` (`idusuario`),
  KEY `fk_carrito_cupon_idx` (`idcupon`),
  CONSTRAINT `fk_carrito_cupon` FOREIGN KEY (`idcupon`) REFERENCES `cupon_descuento` (`idcupon`),
  CONSTRAINT `fk_carrito_producto_producto1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE,
  CONSTRAINT `fk_carrito_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idcategoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `desrcipcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idcategoria`),
  UNIQUE KEY `idTipoProducto_UNIQUE` (`idcategoria`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Celulares y Telefónos','Equipos portátiles para estar siempre conectado'),(2,'Cámaras y Accesorios','Para capturar todo buen momento'),(3,'Consolas y Videojuegos','Relajamiento'),(4,'Computación ','Para conectarse con el mundo'),(5,'Electrónica, Audio y Video','TV\'s, Radios, accesorios para dj\'s '),(6,'Relojes y joyas','Para estar a la moda');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_producto`
--

DROP TABLE IF EXISTS `categoria_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_producto` (
  `idcategoriaproducto` int NOT NULL AUTO_INCREMENT,
  `idproducto` bigint NOT NULL,
  `idcategoria` int NOT NULL,
  PRIMARY KEY (`idcategoriaproducto`),
  KEY `fk_producto_has_categoria_categoria1_idx` (`idcategoria`),
  KEY `fk_producto_has_categoria_producto1_idx` (`idproducto`),
  CONSTRAINT `fk_producto_has_categoria_categoria1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE CASCADE,
  CONSTRAINT `fk_producto_has_categoria_producto1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_producto`
--

LOCK TABLES `categoria_producto` WRITE;
/*!40000 ALTER TABLE `categoria_producto` DISABLE KEYS */;
INSERT INTO `categoria_producto` VALUES (2,6,6),(3,7,1),(4,8,1),(5,9,1),(6,10,6),(7,11,5),(8,12,5),(9,13,5),(10,14,3),(11,15,3),(12,16,3);
/*!40000 ALTER TABLE `categoria_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_subcategoria`
--

DROP TABLE IF EXISTS `categoria_subcategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_subcategoria` (
  `idcategoriasubcategoria` int NOT NULL AUTO_INCREMENT,
  `idcategoria` int NOT NULL,
  `idsubcategoria` int NOT NULL,
  PRIMARY KEY (`idcategoriasubcategoria`),
  UNIQUE KEY `idcategoriasubcategoria_UNIQUE` (`idcategoriasubcategoria`),
  KEY `fk_categoria_has_categoria_categoria2_idx` (`idsubcategoria`),
  KEY `fk_categoria_has_categoria_categoria1_idx` (`idcategoria`),
  CONSTRAINT `fk_categoria_has_subcategoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE CASCADE,
  CONSTRAINT `fk_subcategoria_has_categoria` FOREIGN KEY (`idsubcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_subcategoria`
--

LOCK TABLES `categoria_subcategoria` WRITE;
/*!40000 ALTER TABLE `categoria_subcategoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_subcategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `idcomentario` int NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `puntaje` tinyint DEFAULT NULL,
  `idusuario` int NOT NULL,
  PRIMARY KEY (`idcomentario`),
  KEY `fk_comentario_usuario1_idx` (`idusuario`),
  CONSTRAINT `fk_comentario_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprador_frecuente`
--

DROP TABLE IF EXISTS `comprador_frecuente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprador_frecuente` (
  `idcompradorfrecuente` int NOT NULL,
  `puntos_acumulados` int DEFAULT NULL,
  `numero_pedidos` int NOT NULL,
  `descuento` float NOT NULL,
  PRIMARY KEY (`idcompradorfrecuente`),
  UNIQUE KEY `idCompradorFrecuente_UNIQUE` (`idcompradorfrecuente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprador_frecuente`
--

LOCK TABLES `comprador_frecuente` WRITE;
/*!40000 ALTER TABLE `comprador_frecuente` DISABLE KEYS */;
INSERT INTO `comprador_frecuente` VALUES (1,37,1,2.1),(2,14,2,2.5);
/*!40000 ALTER TABLE `comprador_frecuente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprobante_venta`
--

DROP TABLE IF EXISTS `comprobante_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprobante_venta` (
  `idcomprobanteventa` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `igv` decimal(4,2) unsigned NOT NULL,
  `subtotal` decimal(4,2) unsigned NOT NULL,
  `numero_ruc` varchar(11) NOT NULL,
  `idboletaventa` int DEFAULT NULL,
  `idfactura` int DEFAULT NULL,
  PRIMARY KEY (`idcomprobanteventa`),
  UNIQUE KEY `numeroRUC_UNIQUE` (`numero_ruc`),
  UNIQUE KEY `idFactura_UNIQUE` (`idcomprobanteventa`),
  KEY `fk_comprobante_boleta_idx` (`idboletaventa`),
  KEY `fk_comprobante_factura_idx` (`idfactura`),
  CONSTRAINT `fk_comprobante_boleta` FOREIGN KEY (`idboletaventa`) REFERENCES `boleta_venta` (`idboletaventa`),
  CONSTRAINT `fk_comprobante_factura` FOREIGN KEY (`idfactura`) REFERENCES `factura` (`idfactura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobante_venta`
--

LOCK TABLES `comprobante_venta` WRITE;
/*!40000 ALTER TABLE `comprobante_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprobante_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contra_reembolso`
--

DROP TABLE IF EXISTS `contra_reembolso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contra_reembolso` (
  `nombre` varchar(20) DEFAULT NULL,
  `numero_cuenta` int DEFAULT NULL,
  `idpago` int NOT NULL,
  `idcontrareembolso` int NOT NULL,
  PRIMARY KEY (`idcontrareembolso`),
  KEY `fk_ContraReembolso_pago1_idx` (`idpago`),
  CONSTRAINT `fk_ContraReembolso_pago1` FOREIGN KEY (`idpago`) REFERENCES `pago` (`idpago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contra_reembolso`
--

LOCK TABLES `contra_reembolso` WRITE;
/*!40000 ALTER TABLE `contra_reembolso` DISABLE KEYS */;
/*!40000 ALTER TABLE `contra_reembolso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupon_descuento`
--

DROP TABLE IF EXISTS `cupon_descuento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupon_descuento` (
  `idcupon` int NOT NULL AUTO_INCREMENT,
  `valor_descuento` decimal(6,2) NOT NULL,
  `idproducto` bigint NOT NULL,
  PRIMARY KEY (`idcupon`),
  UNIQUE KEY `idCuponDescuento_UNIQUE` (`idcupon`),
  KEY `fk_cupon_producto_idx` (`idproducto`),
  CONSTRAINT `fk_cupon_producto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupon_descuento`
--

LOCK TABLES `cupon_descuento` WRITE;
/*!40000 ALTER TABLE `cupon_descuento` DISABLE KEYS */;
/*!40000 ALTER TABLE `cupon_descuento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `iddireccion` int NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `distrito` varchar(45) DEFAULT NULL,
  `codigo_postal` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddireccion`),
  UNIQUE KEY `idDireccion_UNIQUE` (`iddireccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domiciliacion_bancaria`
--

DROP TABLE IF EXISTS `domiciliacion_bancaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domiciliacion_bancaria` (
  `iddomiciliacionbancaria` int NOT NULL,
  `direccion_empresa` varchar(12) DEFAULT NULL,
  `fecha_caducidad` datetime DEFAULT NULL,
  `firma_cliente` varchar(45) DEFAULT NULL,
  `numero_cuenta` varchar(45) DEFAULT NULL,
  `referencia_solicitud` varchar(45) DEFAULT NULL,
  `idpago` int NOT NULL,
  PRIMARY KEY (`iddomiciliacionbancaria`),
  KEY `fk_domiciliacionBancaria_pago1_idx` (`idpago`),
  CONSTRAINT `fk_domiciliacionBancaria_pago1` FOREIGN KEY (`idpago`) REFERENCES `pago` (`idpago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domiciliacion_bancaria`
--

LOCK TABLES `domiciliacion_bancaria` WRITE;
/*!40000 ALTER TABLE `domiciliacion_bancaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `domiciliacion_bancaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `idfactura` int NOT NULL,
  PRIMARY KEY (`idfactura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garantia_producto`
--

DROP TABLE IF EXISTS `garantia_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garantia_producto` (
  `idgarantiaproducto` int NOT NULL AUTO_INCREMENT,
  `inicio_garantia` datetime NOT NULL,
  `final_garantia` datetime NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  PRIMARY KEY (`idgarantiaproducto`),
  UNIQUE KEY `idGarantiaProducto_UNIQUE` (`idgarantiaproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garantia_producto`
--

LOCK TABLES `garantia_producto` WRITE;
/*!40000 ALTER TABLE `garantia_producto` DISABLE KEYS */;
INSERT INTO `garantia_producto` VALUES (1,'2020-12-10 21:20:00','2020-12-10 21:20:00','Producto Garantizadoxdxd');
/*!40000 ALTER TABLE `garantia_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_pedido`
--

DROP TABLE IF EXISTS `historial_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_pedido` (
  `idhistorialpedido` int NOT NULL,
  `fecha` datetime NOT NULL,
  `idproducto` bigint NOT NULL,
  `idpedido` bigint NOT NULL,
  PRIMARY KEY (`idhistorialpedido`),
  UNIQUE KEY `idHistorialPedido_UNIQUE` (`idhistorialpedido`),
  KEY `fk_historial_pedido_producto1_idx` (`idproducto`),
  KEY `fk_historial_pedido_pedido1_idx` (`idpedido`),
  CONSTRAINT `fk_historial_pedido_pedido1` FOREIGN KEY (`idpedido`) REFERENCES `pedido` (`idpedido`) ON DELETE CASCADE,
  CONSTRAINT `fk_historial_pedido_producto1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_pedido`
--

LOCK TABLES `historial_pedido` WRITE;
/*!40000 ALTER TABLE `historial_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagen_producto`
--

DROP TABLE IF EXISTS `imagen_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagen_producto` (
  `idimagenproducto` int NOT NULL AUTO_INCREMENT,
  `direccion` varchar(586) DEFAULT NULL,
  `idproducto` bigint NOT NULL,
  PRIMARY KEY (`idimagenproducto`),
  UNIQUE KEY `idImagenProducto_UNIQUE` (`idimagenproducto`),
  KEY `fk_imagen_producto_producto1_idx` (`idproducto`),
  CONSTRAINT `fk_imagen_producto_producto1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagen_producto`
--

LOCK TABLES `imagen_producto` WRITE;
/*!40000 ALTER TABLE `imagen_producto` DISABLE KEYS */;
INSERT INTO `imagen_producto` VALUES (4,'/img/reloj1.jpg',6),(5,'/img/reloj2.jpg',6),(6,'/img/reloj3.jpg',6),(7,'/img/product2/xiaomi1.png',7),(8,'/img/product2/xiaomi2.png',7),(9,'/img/product2/xiaomi3.png',7),(10,'/img/mando1.jpg',14),(11,'/img/mando2.jpg',14),(12,'/img/mando3.jpg',14),(13,'/img/cable1.jpg',15),(14,'/img/cable2.jpg',15),(15,'/img/cable3.jpg',15),(16,'/img/carga1.jpg',16),(17,'/img/carga2.jpg',16),(18,'/img/carga3.jpg',16);
/*!40000 ALTER TABLE `imagen_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_vendedor`
--

DROP TABLE IF EXISTS `info_vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info_vendedor` (
  `idinfovendedor` int NOT NULL,
  `tiempoderegistro` date NOT NULL,
  `cantidadproductosvendidos` int NOT NULL,
  `calificaciondevendedor` int NOT NULL,
  `nombrevendedor` varchar(45) NOT NULL,
  `apellidovendedor` varchar(45) NOT NULL,
  `telefonovendedor` varchar(9) NOT NULL,
  `correovendedor` varchar(45) NOT NULL,
  `idrol` int NOT NULL,
  PRIMARY KEY (`idinfovendedor`),
  KEY `fk_informacionvendedor_rol1_idx` (`idrol`),
  CONSTRAINT `fk_informacionvendedor_rol1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_vendedor`
--

LOCK TABLES `info_vendedor` WRITE;
/*!40000 ALTER TABLE `info_vendedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro_reclamacion`
--

DROP TABLE IF EXISTS `libro_reclamacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro_reclamacion` (
  `idlibroreclamaciones` int NOT NULL AUTO_INCREMENT,
  `fecha_reclamo` datetime NOT NULL,
  `idproducto` bigint NOT NULL,
  `idpersona` int NOT NULL,
  PRIMARY KEY (`idlibroreclamaciones`),
  UNIQUE KEY `LibroReclamaciones_UNIQUE` (`idlibroreclamaciones`),
  KEY `fk_LibroReclamaciones_persona1_idx` (`idpersona`),
  CONSTRAINT `fk_LibroReclamaciones_persona1` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro_reclamacion`
--

LOCK TABLES `libro_reclamacion` WRITE;
/*!40000 ALTER TABLE `libro_reclamacion` DISABLE KEYS */;
INSERT INTO `libro_reclamacion` VALUES (1,'2020-12-10 21:20:00',1,2);
/*!40000 ALTER TABLE `libro_reclamacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulo` (
  `idmodulo` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `icono` varchar(45) NOT NULL,
  PRIMARY KEY (`idmodulo`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  UNIQUE KEY `idModulo_UNIQUE` (`idmodulo`),
  UNIQUE KEY `icono_UNIQUE` (`icono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacion`
--

DROP TABLE IF EXISTS `notificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificacion` (
  `idnotificacionventa` int NOT NULL,
  `notificacion_pago_realizado` bit(1) NOT NULL,
  `notificacionc_pedido_enviado` bit(1) NOT NULL,
  `notificacion_pedido_nuevo` bit(1) NOT NULL,
  `notificar_deposito_pendiente` bit(1) NOT NULL,
  `notificar_cancelacion_pedidos` bit(1) NOT NULL,
  `notificar_devolucion_pedido` bit(1) NOT NULL,
  `fecha_devolucion` datetime NOT NULL,
  `idpedido` bigint NOT NULL,
  `idpago` int NOT NULL,
  `idpersona` int NOT NULL,
  PRIMARY KEY (`idnotificacionventa`),
  UNIQUE KEY `notificacion_pago_realizado_UNIQUE` (`notificacion_pago_realizado`),
  KEY `idpedido_idx` (`idpedido`) /*!80000 INVISIBLE */,
  KEY `idpago_idx` (`idpago`),
  KEY `fk_persona1_idx` (`idpersona`),
  CONSTRAINT `fk_persona1` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`),
  CONSTRAINT `idpago` FOREIGN KEY (`idpago`) REFERENCES `pago` (`idpago`),
  CONSTRAINT `idpedido` FOREIGN KEY (`idpedido`) REFERENCES `pedido` (`idpedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacion`
--

LOCK TABLES `notificacion` WRITE;
/*!40000 ALTER TABLE `notificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oferta_especial`
--

DROP TABLE IF EXISTS `oferta_especial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oferta_especial` (
  `idofertaespecial` int NOT NULL,
  `precio_descuento` float NOT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_limite` datetime DEFAULT NULL,
  `descripcion_oferta` text,
  `idcompradorfrecuente` int NOT NULL,
  `idproducto` bigint NOT NULL,
  PRIMARY KEY (`idofertaespecial`),
  KEY `fk_oferta_especial_comprador_frecuente1_idx` (`idcompradorfrecuente`),
  KEY `fk_oferta_especial_producto1_idx` (`idproducto`),
  CONSTRAINT `fk_oferta_especial_comprador_frecuente1` FOREIGN KEY (`idcompradorfrecuente`) REFERENCES `comprador_frecuente` (`idcompradorfrecuente`),
  CONSTRAINT `fk_oferta_especial_producto1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oferta_especial`
--

LOCK TABLES `oferta_especial` WRITE;
/*!40000 ALTER TABLE `oferta_especial` DISABLE KEYS */;
/*!40000 ALTER TABLE `oferta_especial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oferta_especial_has_producto`
--

DROP TABLE IF EXISTS `oferta_especial_has_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oferta_especial_has_producto` (
  `oferta_especial_idoferta_especial` int NOT NULL,
  `producto_idproducto` bigint NOT NULL,
  PRIMARY KEY (`oferta_especial_idoferta_especial`,`producto_idproducto`),
  KEY `fk_oferta_especial_has_producto_producto1_idx` (`producto_idproducto`),
  KEY `fk_oferta_especial_has_producto_oferta_especial1_idx` (`oferta_especial_idoferta_especial`),
  CONSTRAINT `fk_oferta_especial_has_producto_oferta_especial1` FOREIGN KEY (`oferta_especial_idoferta_especial`) REFERENCES `oferta_especial` (`idofertaespecial`),
  CONSTRAINT `fk_oferta_especial_has_producto_producto1` FOREIGN KEY (`producto_idproducto`) REFERENCES `producto` (`idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oferta_especial_has_producto`
--

LOCK TABLES `oferta_especial_has_producto` WRITE;
/*!40000 ALTER TABLE `oferta_especial_has_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `oferta_especial_has_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oferta_producto`
--

DROP TABLE IF EXISTS `oferta_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oferta_producto` (
  `idofertaproducto` bigint NOT NULL AUTO_INCREMENT,
  `descripcion` text NOT NULL,
  `precio_oferta` float NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_limite` datetime NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `valoracion_producto` int DEFAULT NULL,
  `idproducto` bigint NOT NULL,
  PRIMARY KEY (`idofertaproducto`),
  KEY `fk_oferta_producto_producto1_idx` (`idproducto`),
  CONSTRAINT `fk_oferta_producto1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oferta_producto`
--

LOCK TABLES `oferta_producto` WRITE;
/*!40000 ALTER TABLE `oferta_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `oferta_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcion`
--

DROP TABLE IF EXISTS `opcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opcion` (
  `idopcion` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `estado` tinyint NOT NULL,
  `idsubmodulo` int NOT NULL,
  PRIMARY KEY (`idopcion`),
  UNIQUE KEY `idOpcion_UNIQUE` (`idopcion`),
  KEY `fk_opcion_sub_modulo1_idx` (`idsubmodulo`),
  CONSTRAINT `fk_opcion_sub_modulo1` FOREIGN KEY (`idsubmodulo`) REFERENCES `sub_modulo` (`idsubmodulo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcion`
--

LOCK TABLES `opcion` WRITE;
/*!40000 ALTER TABLE `opcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `opcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `idpago` int NOT NULL AUTO_INCREMENT,
  `tipo_pago` varchar(45) NOT NULL,
  `fecha_pago` datetime NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `impuesto` decimal(10,2) NOT NULL,
  `idtarjeta` int unsigned NOT NULL,
  PRIMARY KEY (`idpago`),
  UNIQUE KEY `idPago_UNIQUE` (`idpago`),
  KEY `fk_tarjeta1_idx` (`idtarjeta`),
  CONSTRAINT `fk_tarjeta1` FOREIGN KEY (`idtarjeta`) REFERENCES `tarjeta` (`idtarjeta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago_paypal`
--

DROP TABLE IF EXISTS `pago_paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago_paypal` (
  `idpagopaypal` int NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `direccion_correo` varchar(45) DEFAULT NULL,
  `idpago` int NOT NULL,
  PRIMARY KEY (`idpagopaypal`),
  KEY `fk_PagoPaypal_pago1_idx` (`idpago`),
  CONSTRAINT `fk_PagoPaypal_pago1` FOREIGN KEY (`idpago`) REFERENCES `pago` (`idpago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago_paypal`
--

LOCK TABLES `pago_paypal` WRITE;
/*!40000 ALTER TABLE `pago_paypal` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago_paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idpedido` bigint NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `direccion_entrega` varchar(200) NOT NULL,
  `cantidad_producto` int NOT NULL,
  `estado_pedido` tinyint NOT NULL DEFAULT '0',
  `precio_producto` decimal(10,0) NOT NULL,
  `descuento_producto` decimal(10,0) NOT NULL,
  `pago_pendiente` varchar(50) NOT NULL,
  `idpago` int DEFAULT NULL,
  `idusuario` int NOT NULL,
  `idcomprobanteventa` int DEFAULT NULL,
  `idcompradorfrecuente` int NOT NULL,
  `idseguimientopedido` int NOT NULL,
  PRIMARY KEY (`idpedido`),
  UNIQUE KEY `codigoPedido_UNIQUE` (`codigo`),
  UNIQUE KEY `idPedido_UNIQUE` (`idpedido`),
  KEY `fk_pedido_pago1_idx` (`idpago`),
  KEY `fk_pedido_usuario1_idx` (`idusuario`),
  KEY `fk_pedidio_factura1_idx` (`idcomprobanteventa`),
  KEY `fk_pedido_comprador_frecuente1_idx` (`idcompradorfrecuente`),
  KEY `fk_seguimiento_pedido1_idx` (`idseguimientopedido`),
  CONSTRAINT `fk_pedidio_comprobante` FOREIGN KEY (`idcomprobanteventa`) REFERENCES `comprobante_venta` (`idcomprobanteventa`),
  CONSTRAINT `fk_pedido_comprador_frecuente1` FOREIGN KEY (`idcompradorfrecuente`) REFERENCES `comprador_frecuente` (`idcompradorfrecuente`),
  CONSTRAINT `fk_pedido_pago1` FOREIGN KEY (`idpago`) REFERENCES `pago` (`idpago`) ON DELETE CASCADE,
  CONSTRAINT `fk_pedido_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE,
  CONSTRAINT `fk_seguimiento_pedido1` FOREIGN KEY (`idseguimientopedido`) REFERENCES `seguimiento_pedido` (`idseguimientopedido`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `idpersona` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `foto` varchar(45) DEFAULT NULL,
  `correo` varchar(45) NOT NULL,
  `idusuario` int NOT NULL,
  PRIMARY KEY (`idpersona`),
  KEY `fk_usuario2_idx` (`idusuario`),
  CONSTRAINT `fk_usuario2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (2,'Pablo','Lepzilin','961090046','prueba','pablito@gmail.com',1),(3,'Juan','Mendoza','985425789','prueba','juan@gmail.com',2),(4,'Lorenzo','Prado','987461233','prueba','lorenzo@gmail.com',3),(5,'Lina','Frozen','987456235','prueba','lina@outlook.com',4),(6,'Akasha','Queen','915948753','prueba','aksha@gmail.com',5);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona_direccion`
--

DROP TABLE IF EXISTS `persona_direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona_direccion` (
  `idpersonadireccion` int NOT NULL,
  `iddireccion` int NOT NULL,
  `idpersona` int NOT NULL,
  PRIMARY KEY (`idpersonadireccion`),
  KEY `fk_persona_direccion_direccion1_idx` (`iddireccion`),
  KEY `fk_persona_direccion_persona1_idx` (`idpersona`),
  CONSTRAINT `fk_persona_direccion_direccion1` FOREIGN KEY (`iddireccion`) REFERENCES `direccion` (`iddireccion`) ON DELETE CASCADE,
  CONSTRAINT `fk_persona_direccion_persona1` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_direccion`
--

LOCK TABLES `persona_direccion` WRITE;
/*!40000 ALTER TABLE `persona_direccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona_direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `premio`
--

DROP TABLE IF EXISTS `premio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `premio` (
  `idpremio` int NOT NULL,
  `descripcion_premio` varchar(100) DEFAULT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  `idcompradorfrecuente` int NOT NULL,
  PRIMARY KEY (`idpremio`),
  KEY `fk_premio_comprador_frecuente1_idx` (`idcompradorfrecuente`),
  CONSTRAINT `fk_premio_comprador_frecuente1` FOREIGN KEY (`idcompradorfrecuente`) REFERENCES `comprador_frecuente` (`idcompradorfrecuente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premio`
--

LOCK TABLES `premio` WRITE;
/*!40000 ALTER TABLE `premio` DISABLE KEYS */;
/*!40000 ALTER TABLE `premio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idproducto` bigint NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `cantidad` tinyint NOT NULL,
  `estadoseleccionoferta` tinyint(1) NOT NULL DEFAULT '0',
  `destacado` bit(1) DEFAULT NULL,
  `marca` varchar(45) NOT NULL,
  `cantidadventas` int NOT NULL,
  `idlibroreclamaciones` int NOT NULL,
  `idgarantiaproducto` int NOT NULL,
  `idpersona` int DEFAULT NULL,
  PRIMARY KEY (`idproducto`),
  UNIQUE KEY `idProducto_UNIQUE` (`idproducto`),
  UNIQUE KEY `codigoProducto_UNIQUE` (`codigo`),
  KEY `fk_producto_garantia_producto1_idx` (`idgarantiaproducto`),
  KEY `fk_producto_persona1_idx` (`idpersona`),
  KEY `fk_producto_LibroReclamaciones1_idx` (`idlibroreclamaciones`),
  CONSTRAINT `fk_producto_garantia_producto1` FOREIGN KEY (`idgarantiaproducto`) REFERENCES `garantia_producto` (`idgarantiaproducto`) ON DELETE CASCADE,
  CONSTRAINT `fk_producto_LibroReclamaciones1` FOREIGN KEY (`idlibroreclamaciones`) REFERENCES `libro_reclamacion` (`idlibroreclamaciones`),
  CONSTRAINT `fk_producto_persona1` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (6,'RF3','ProductoA','El mejor producto para acabar con la ansiedad',15.00,15,1,_binary '','paltomiel',12,1,1,2),(7,'RF4','Xiaomi Redmi Note 9','128gb 4gb Ram Version Global Sellado',799.00,40,1,_binary '','Xiaomi',4,1,1,2),(8,'RF5','Samsung Galaxy M11','velocidad del CPU 1.8GHz',529.00,12,1,_binary '','Samsung',2,1,1,2),(9,'RF6','Apple iPhone 11 64gb','Apple iPhone 11 64gb',2799.00,10,1,_binary '','Apple',3,1,1,2),(10,'RF7','Smartwatch Apple Watch Se','Smartwatch Apple Watch Se 40mm Gps',1479.00,50,1,_binary '','Apple',2,1,1,2),(11,'RF8','Smart Tv Samsung Led 4k Uhd 65','Smart Tv Samsung Led 4k Uhd 65 Un65tu8500gxpe',2999.00,3,1,_binary '','Samsung',2,1,1,3),(12,'RF9','Sony Tv 55 Led 4k Uhd','Sony Tv 55 Led 4k Uhd Con Hdr Android Tv Xbr-55x955g',3999.00,10,1,_binary '','Sony',4,1,1,3),(13,'RF10','Parlante Portátil Extra Bass','Parlante Portátil Extra Bass Xb43 Con Bluetooth',469.00,30,1,_binary '','Sony',21,1,1,3),(14,'RF11','DualShock 4 ','El mejor producto para acabar con la ansiedad',300.00,15,1,_binary '','SONY',12,1,1,2),(15,'RF12','PowerA - Cable de carga USB para PlayStation 4','la mejor carga para tu ps4',50.00,50,1,_binary '','SONY',12,1,1,2),(16,'RF13','PS4 Estación de doble carga para controlador de Sony PlayStation ','la mejor carga para tu ps4',50.00,50,1,_binary '','BEBONCOOL PS4',12,1,1,2);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_complementario`
--

DROP TABLE IF EXISTS `producto_complementario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_complementario` (
  `idproductocomplementario` int NOT NULL AUTO_INCREMENT,
  `idcategoriaproducto` int NOT NULL,
  `categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`idproductocomplementario`),
  KEY `fk_producto_complementario_categoria_producto1_idx` (`idcategoriaproducto`),
  CONSTRAINT `fk_producto_complementario_categoria_producto1` FOREIGN KEY (`idcategoriaproducto`) REFERENCES `categoria_producto` (`idcategoriaproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_complementario`
--

LOCK TABLES `producto_complementario` WRITE;
/*!40000 ALTER TABLE `producto_complementario` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_complementario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_demandado`
--

DROP TABLE IF EXISTS `producto_demandado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_demandado` (
  `idproducto_demandado` int NOT NULL AUTO_INCREMENT,
  `fecha_vencimiento` datetime DEFAULT NULL,
  `idproducto` bigint NOT NULL,
  `idcategoria` int NOT NULL,
  PRIMARY KEY (`idproducto_demandado`),
  UNIQUE KEY `idproducto_demandado_UNIQUE` (`idproducto_demandado`),
  KEY `fk_producto_demandado_producto1_idx` (`idproducto`),
  KEY `fk_producto_demandado_categoria1_idx` (`idcategoria`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `producto_deseado`
--

DROP TABLE IF EXISTS `producto_deseado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_deseado` (
  `idproductodeseado` int NOT NULL,
  `idusuario` int NOT NULL,
  `idproducto` bigint NOT NULL,
  `fecha_deseo` datetime DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idproductodeseado`),
  KEY `fk_usuario_has_producto_producto1_idx` (`idproducto`),
  KEY `fk_usuario_has_producto_usuario1_idx` (`idusuario`),
  CONSTRAINT `fk_usuario_has_producto_producto1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`),
  CONSTRAINT `fk_usuario_has_producto_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_deseado`
--

LOCK TABLES `producto_deseado` WRITE;
/*!40000 ALTER TABLE `producto_deseado` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_deseado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_favorito`
--

DROP TABLE IF EXISTS `producto_favorito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_favorito` (
  `idproductofavorito` int NOT NULL,
  `idpersona` int NOT NULL,
  `idproducto` bigint NOT NULL,
  PRIMARY KEY (`idproductofavorito`),
  KEY `fk_producto_favorito_persona1_idx` (`idpersona`),
  KEY `fk_producto_favorito_producto1_idx` (`idproducto`),
  CONSTRAINT `fk_producto_favorito_persona` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`),
  CONSTRAINT `fk_producto_favorito_producto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_favorito`
--

LOCK TABLES `producto_favorito` WRITE;
/*!40000 ALTER TABLE `producto_favorito` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_favorito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_mas_visto`
--

DROP TABLE IF EXISTS `producto_mas_visto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_mas_visto` (
  `idProducto` bigint NOT NULL,
  `idpersona` int NOT NULL,
  `idproductovisto` int NOT NULL,
  PRIMARY KEY (`idproductovisto`),
  KEY `idProducto_idx` (`idProducto`),
  KEY `idPersona_idx` (`idpersona`),
  CONSTRAINT `idPersona` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`),
  CONSTRAINT `idProducto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_mas_visto`
--

LOCK TABLES `producto_mas_visto` WRITE;
/*!40000 ALTER TABLE `producto_mas_visto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_mas_visto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_valorado`
--

DROP TABLE IF EXISTS `producto_valorado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_valorado` (
  `idproductovalorado` int NOT NULL AUTO_INCREMENT,
  `deseado` bit(1) DEFAULT NULL COMMENT 'Solo sera la respuesta de "SI" o "No"',
  `recomendado` bit(1) DEFAULT NULL COMMENT 'Solo sera la respuesta de "SI" o "No"',
  `idproducto` bigint NOT NULL,
  `idusuario` int NOT NULL,
  PRIMARY KEY (`idproductovalorado`),
  UNIQUE KEY `idProductoDeseado_UNIQUE` (`idproductovalorado`),
  KEY `fk_producto1_idx` (`idproducto`),
  KEY `fk_usuario1_idx` (`idusuario`),
  CONSTRAINT `fk_producto1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE,
  CONSTRAINT `fk_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_valorado`
--

LOCK TABLES `producto_valorado` WRITE;
/*!40000 ALTER TABLE `producto_valorado` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_valorado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productosjuntos`
--

DROP TABLE IF EXISTS `productosjuntos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productosjuntos` (
  `idproductosjuntos` bigint NOT NULL,
  `producto1` bigint NOT NULL,
  `producto2` bigint NOT NULL,
  PRIMARY KEY (`idproductosjuntos`),
  KEY `fk_productosjuntos_producto3_idx` (`producto1`),
  KEY `fk_productosjuntos_producto4_idx` (`producto2`),
  CONSTRAINT `fk_productosjuntos_producto3` FOREIGN KEY (`producto1`) REFERENCES `producto` (`idproducto`),
  CONSTRAINT `fk_productosjuntos_producto4` FOREIGN KEY (`producto2`) REFERENCES `producto` (`idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productosjuntos`
--

LOCK TABLES `productosjuntos` WRITE;
/*!40000 ALTER TABLE `productosjuntos` DISABLE KEYS */;
INSERT INTO `productosjuntos` VALUES (1,14,15),(2,14,16),(3,15,14),(4,16,14);
/*!40000 ALTER TABLE `productosjuntos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclamo`
--

DROP TABLE IF EXISTS `reclamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reclamo` (
  `idreclamo` int NOT NULL AUTO_INCREMENT,
  `descripcion` text NOT NULL,
  `tipo_reclamo` varchar(80) NOT NULL,
  `idusuario` int NOT NULL,
  PRIMARY KEY (`idreclamo`),
  UNIQUE KEY `idLibro_UNIQUE` (`idreclamo`),
  KEY `fk_Reclamo_Usuario1_idx` (`idusuario`),
  CONSTRAINT `fk_Reclamo_Usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclamo`
--

LOCK TABLES `reclamo` WRITE;
/*!40000 ALTER TABLE `reclamo` DISABLE KEYS */;
/*!40000 ALTER TABLE `reclamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regalo`
--

DROP TABLE IF EXISTS `regalo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regalo` (
  `idregalo` int NOT NULL AUTO_INCREMENT,
  `descripcion_regalo` varchar(100) NOT NULL,
  `categoria` varchar(45) NOT NULL,
  `puntos_requeridos` varchar(45) NOT NULL DEFAULT '0' COMMENT 'Puntos necesarios para que un comprador pueda tener un regalo.',
  `idcompradorfrecuente` int NOT NULL,
  PRIMARY KEY (`idregalo`),
  UNIQUE KEY `idRegalo_UNIQUE` (`idregalo`),
  KEY `fk_regalo_comprador_frecuente1_idx` (`idcompradorfrecuente`),
  CONSTRAINT `fk_regalo_comprador_frecuente1` FOREIGN KEY (`idcompradorfrecuente`) REFERENCES `comprador_frecuente` (`idcompradorfrecuente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regalo`
--

LOCK TABLES `regalo` WRITE;
/*!40000 ALTER TABLE `regalo` DISABLE KEYS */;
/*!40000 ALTER TABLE `regalo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte`
--

DROP TABLE IF EXISTS `reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reporte` (
  `idreporte` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `idpersona` int NOT NULL,
  PRIMARY KEY (`idreporte`),
  KEY `fk_reporte_persona1_idx` (`idpersona`),
  CONSTRAINT `fk_reporte_persona1` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte`
--

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idrol` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idrol`),
  UNIQUE KEY `nombreRol_UNIQUE` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador'),(3,'Comprador'),(2,'Vendedor');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_opcion`
--

DROP TABLE IF EXISTS `rol_opcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_opcion` (
  `idrolopcion` int NOT NULL,
  `idrol` int NOT NULL,
  `idopcion` int NOT NULL,
  PRIMARY KEY (`idrolopcion`),
  UNIQUE KEY `idRolOpcioncol_UNIQUE` (`idrolopcion`),
  KEY `fk_rol_opcion_rol1_idx` (`idrol`),
  KEY `fk_rol_opcion_opcion1_idx` (`idopcion`),
  CONSTRAINT `fk_rol_opcion_opcion1` FOREIGN KEY (`idopcion`) REFERENCES `opcion` (`idopcion`) ON DELETE CASCADE,
  CONSTRAINT `fk_rol_opcion_rol1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_opcion`
--

LOCK TABLES `rol_opcion` WRITE;
/*!40000 ALTER TABLE `rol_opcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol_opcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_usuario`
--

DROP TABLE IF EXISTS `rol_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_usuario` (
  `idrolusuario` int NOT NULL AUTO_INCREMENT,
  `estado` tinyint NOT NULL,
  `idrol` int NOT NULL,
  `idusuario` int NOT NULL,
  PRIMARY KEY (`idrolusuario`),
  UNIQUE KEY `idrolusuario_UNIQUE` (`idrolusuario`),
  KEY `fk_rol_usuario_idx` (`idrol`),
  KEY `fk_usuario_rol_idx` (`idusuario`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_rol_usuario_id` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`),
  CONSTRAINT `fk_usuario_rol_id` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_usuario`
--

LOCK TABLES `rol_usuario` WRITE;
/*!40000 ALTER TABLE `rol_usuario` DISABLE KEYS */;
INSERT INTO `rol_usuario` VALUES (1,1,2,1),(2,1,2,2),(3,1,2,3),(4,1,2,4),(5,1,2,5);
/*!40000 ALTER TABLE `rol_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguimiento_pedido`
--

DROP TABLE IF EXISTS `seguimiento_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguimiento_pedido` (
  `idseguimientopedido` int NOT NULL AUTO_INCREMENT,
  `tiposeguimiento` varchar(30) NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idseguimientopedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguimiento_pedido`
--

LOCK TABLES `seguimiento_pedido` WRITE;
/*!40000 ALTER TABLE `seguimiento_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `seguimiento_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_modulo`
--

DROP TABLE IF EXISTS `sub_modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_modulo` (
  `idsubmodulo` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `estado` tinyint NOT NULL,
  `idmodulo` int NOT NULL,
  PRIMARY KEY (`idsubmodulo`),
  UNIQUE KEY `idSubModulo_UNIQUE` (`idsubmodulo`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  UNIQUE KEY `estado_UNIQUE` (`estado`),
  KEY `fk_sub_modulo_modulo1_idx` (`idmodulo`),
  CONSTRAINT `fk_sub_modulo_modulo1` FOREIGN KEY (`idmodulo`) REFERENCES `modulo` (`idmodulo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_modulo`
--

LOCK TABLES `sub_modulo` WRITE;
/*!40000 ALTER TABLE `sub_modulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sugerenciahistorial`
--

DROP TABLE IF EXISTS `sugerenciahistorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sugerenciahistorial` (
  `idsugerenciahistorial` int NOT NULL,
  `historial` varchar(45) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `idproducto` bigint NOT NULL,
  PRIMARY KEY (`idsugerenciahistorial`),
  KEY `fk_sugerencia_historial_producto1_idx` (`idproducto`),
  CONSTRAINT `fk_sugerencia_historial_producto1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sugerenciahistorial`
--

LOCK TABLES `sugerenciahistorial` WRITE;
/*!40000 ALTER TABLE `sugerenciahistorial` DISABLE KEYS */;
/*!40000 ALTER TABLE `sugerenciahistorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sugerencias_cate`
--

DROP TABLE IF EXISTS `sugerencias_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sugerencias_cate` (
  `idsugerencias` int NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `idcategoriaproducto` int NOT NULL,
  PRIMARY KEY (`idsugerencias`),
  KEY `fk_sugerencias_cate_categoria_producto1_idx` (`idcategoriaproducto`),
  CONSTRAINT `fk_sugerencias_cate_categoria_producto1` FOREIGN KEY (`idcategoriaproducto`) REFERENCES `categoria_producto` (`idcategoriaproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sugerencias_cate`
--

LOCK TABLES `sugerencias_cate` WRITE;
/*!40000 ALTER TABLE `sugerencias_cate` DISABLE KEYS */;
/*!40000 ALTER TABLE `sugerencias_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjeta`
--

DROP TABLE IF EXISTS `tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjeta` (
  `idtarjeta` int unsigned NOT NULL AUTO_INCREMENT,
  `numero_tarjeta` varchar(16) NOT NULL,
  `cod_verificacion_tarjeta` varchar(3) NOT NULL,
  `fecha_deposito` datetime NOT NULL,
  `monto_deposito` decimal(10,2) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtarjeta`),
  UNIQUE KEY `idDeposito_UNIQUE` (`idtarjeta`),
  UNIQUE KEY `numeroTarjeta_UNIQUE` (`numero_tarjeta`),
  UNIQUE KEY `codVerificaciónTarjeta_UNIQUE` (`cod_verificacion_tarjeta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta`
--

LOCK TABLES `tarjeta` WRITE;
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferencia_bancaria`
--

DROP TABLE IF EXISTS `transferencia_bancaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transferencia_bancaria` (
  `idtransferenciabancaria` int NOT NULL,
  `referencia_pago` varchar(45) DEFAULT NULL,
  `direccion_facturacion` varchar(45) DEFAULT NULL,
  `idpago` int NOT NULL,
  PRIMARY KEY (`idtransferenciabancaria`),
  KEY `fk_Transferencia Bancaria_pago1_idx` (`idpago`),
  CONSTRAINT `fk_Transferencia Bancaria_pago1` FOREIGN KEY (`idpago`) REFERENCES `pago` (`idpago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferencia_bancaria`
--

LOCK TABLES `transferencia_bancaria` WRITE;
/*!40000 ALTER TABLE `transferencia_bancaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `transferencia_bancaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(90) NOT NULL,
  `password` varchar(120) NOT NULL,
  `ultimo_login` timestamp NULL DEFAULT NULL,
  `idcompradorfrecuente` int DEFAULT NULL,
  `historial_des_usuario` varchar(45) NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`),
  UNIQUE KEY `idusuario_UNIQUE` (`idusuario`),
  KEY `fk_usuario_comprador_frecuente1_idx` (`idcompradorfrecuente`),
  CONSTRAINT `fk_usuario_comprador_frecuente1` FOREIGN KEY (`idcompradorfrecuente`) REFERENCES `comprador_frecuente` (`idcompradorfrecuente`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Pablo','Lepzilin','2020-12-11 02:20:00',1,'prueba'),(2,'Juan','juan','2020-11-11 02:20:00',1,'prueba'),(3,'Lorenzo','lorenzo','2020-10-11 02:35:00',1,'prueba'),(4,'Lina','lina','2020-10-10 02:40:00',2,'prueba'),(5,'Akasha','akasha','2020-10-09 02:00:00',2,'prueba');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `idventa` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_venta` datetime NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `idpago` int NOT NULL,
  PRIMARY KEY (`idventa`),
  UNIQUE KEY `idVenta_UNIQUE` (`idventa`),
  KEY `fk_venta_pago1_idx` (`idpago`),
  CONSTRAINT `fk_venta_pago1` FOREIGN KEY (`idpago`) REFERENCES `pago` (`idpago`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_reporte`
--

DROP TABLE IF EXISTS `venta_reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta_reporte` (
  `idventareporte` int NOT NULL AUTO_INCREMENT,
  `tipo_reporte` varchar(80) NOT NULL,
  `idreporte` int NOT NULL,
  `idventa` int unsigned NOT NULL,
  PRIMARY KEY (`idventareporte`),
  KEY `fk_venta_reporte_reporte1_idx` (`idreporte`),
  KEY `fk_venta_reporte_venta1_idx` (`idventa`),
  CONSTRAINT `fk_venta_reporte_reporte1` FOREIGN KEY (`idreporte`) REFERENCES `reporte` (`idreporte`) ON DELETE CASCADE,
  CONSTRAINT `fk_venta_reporte_venta1` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_reporte`
--

LOCK TABLES `venta_reporte` WRITE;
/*!40000 ALTER TABLE `venta_reporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_reporte` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-21  1:10:34
