-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ejemplo4
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema marketplacebd_test
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `garantia_producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `garantia_producto` ;

CREATE TABLE IF NOT EXISTS `garantia_producto` (
  `idgarantiaproducto` INT NOT NULL AUTO_INCREMENT,
  `inicio_garantia` DATETIME NOT NULL,
  `final_garantia` DATETIME NOT NULL,
  `descripcion` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`idgarantiaproducto`),
  UNIQUE INDEX `idGarantiaProducto_UNIQUE` (`idgarantiaproducto` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `comprador_frecuente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comprador_frecuente` ;

CREATE TABLE IF NOT EXISTS `comprador_frecuente` (
  `idcompradorfrecuente` INT NOT NULL,
  `puntos_acumulados` INT NULL DEFAULT NULL,
  `numero_pedidos` INT NOT NULL,
  `descuento` FLOAT NOT NULL,
  PRIMARY KEY (`idcompradorfrecuente`),
  UNIQUE INDEX `idCompradorFrecuente_UNIQUE` (`idcompradorfrecuente` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `usuario` ;

CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(90) NOT NULL,
  `password` VARCHAR(120) NOT NULL,
  `ultimo_login` TIMESTAMP NULL DEFAULT NULL,
  `idcompradorfrecuente` INT NULL DEFAULT NULL,
  `historial_des_usuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE INDEX `usuario_UNIQUE` (`usuario` ASC) VISIBLE,
  UNIQUE INDEX `idusuario_UNIQUE` (`idusuario` ASC) VISIBLE,
  INDEX `fk_usuario_comprador_frecuente1_idx` (`idcompradorfrecuente` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_comprador_frecuente1`
    FOREIGN KEY (`idcompradorfrecuente`)
    REFERENCES `comprador_frecuente` (`idcompradorfrecuente`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `persona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `persona` ;

CREATE TABLE IF NOT EXISTS `persona` (
  `idpersona` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `apellido` VARCHAR(45) NULL DEFAULT NULL,
  `telefono` VARCHAR(9) NULL DEFAULT NULL,
  `foto` VARCHAR(45) NULL DEFAULT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `idusuario` INT NOT NULL,
  PRIMARY KEY (`idpersona`),
  INDEX `fk_usuario2_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_usuario2`
    FOREIGN KEY (`idusuario`)
    REFERENCES `usuario` (`idusuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `libro_reclamacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `libro_reclamacion` ;

CREATE TABLE IF NOT EXISTS `libro_reclamacion` (
  `idlibroreclamaciones` INT NOT NULL AUTO_INCREMENT,
  `fecha_reclamo` DATETIME NOT NULL,
  `idproducto` BIGINT NOT NULL,
  `idpersona` INT NOT NULL,
  PRIMARY KEY (`idlibroreclamaciones`),
  UNIQUE INDEX `LibroReclamaciones_UNIQUE` (`idlibroreclamaciones` ASC) VISIBLE,
  INDEX `fk_LibroReclamaciones_persona1_idx` (`idpersona` ASC) VISIBLE,
  CONSTRAINT `fk_LibroReclamaciones_persona1`
    FOREIGN KEY (`idpersona`)
    REFERENCES `persona` (`idpersona`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `producto` ;

CREATE TABLE IF NOT EXISTS `producto` (
  `idproducto` BIGINT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(20) NOT NULL,
  `nombre` VARCHAR(255) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `precio_unitario` DECIMAL(10,2) NOT NULL,
  `cantidad` TINYINT NOT NULL,
  `estadoseleccionoferta` TINYINT(1) NOT NULL DEFAULT '0',
  `destacado` BIT(1) NULL DEFAULT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `cantidadventas` INT NOT NULL,
  `idlibroreclamaciones` INT NOT NULL,
  `idgarantiaproducto` INT NOT NULL,
  `idpersona` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idproducto`),
  UNIQUE INDEX `idProducto_UNIQUE` (`idproducto` ASC) VISIBLE,
  UNIQUE INDEX `codigoProducto_UNIQUE` (`codigo` ASC) VISIBLE,
  INDEX `fk_producto_garantia_producto1_idx` (`idgarantiaproducto` ASC) VISIBLE,
  INDEX `fk_producto_persona1_idx` (`idpersona` ASC) VISIBLE,
  INDEX `fk_producto_LibroReclamaciones1_idx` (`idlibroreclamaciones` ASC) VISIBLE,
  CONSTRAINT `fk_producto_garantia_producto1`
    FOREIGN KEY (`idgarantiaproducto`)
    REFERENCES `garantia_producto` (`idgarantiaproducto`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_producto_LibroReclamaciones1`
    FOREIGN KEY (`idlibroreclamaciones`)
    REFERENCES `libro_reclamacion` (`idlibroreclamaciones`),
  CONSTRAINT `fk_producto_persona1`
    FOREIGN KEY (`idpersona`)
    REFERENCES `persona` (`idpersona`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `productosjuntos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `productosjuntos` ;

CREATE TABLE IF NOT EXISTS `productosjuntos` (
  `idproductosjuntos` BIGINT NOT NULL,
  `producto1` BIGINT NOT NULL,
  `producto2` BIGINT NOT NULL,
  PRIMARY KEY (`idproductosjuntos`),
  INDEX `fk_productosjuntos_producto3_idx` (`producto1` ASC) VISIBLE,
  INDEX `fk_productosjuntos_producto4_idx` (`producto2` ASC) VISIBLE,
  CONSTRAINT `fk_productosjuntos_producto3`
    FOREIGN KEY (`producto1`)
    REFERENCES `marketplacebd_test`.`producto` (`idproducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productosjuntos_producto4`
    FOREIGN KEY (`producto2`)
    REFERENCES `marketplacebd_test`.`producto` (`idproducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `garantia_producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `garantia_producto` ;

CREATE TABLE IF NOT EXISTS `garantia_producto` (
  `idgarantiaproducto` INT NOT NULL AUTO_INCREMENT,
  `inicio_garantia` DATETIME NOT NULL,
  `final_garantia` DATETIME NOT NULL,
  `descripcion` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`idgarantiaproducto`),
  UNIQUE INDEX `idGarantiaProducto_UNIQUE` (`idgarantiaproducto` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `comprador_frecuente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comprador_frecuente` ;

CREATE TABLE IF NOT EXISTS `comprador_frecuente` (
  `idcompradorfrecuente` INT NOT NULL,
  `puntos_acumulados` INT NULL DEFAULT NULL,
  `numero_pedidos` INT NOT NULL,
  `descuento` FLOAT NOT NULL,
  PRIMARY KEY (`idcompradorfrecuente`),
  UNIQUE INDEX `idCompradorFrecuente_UNIQUE` (`idcompradorfrecuente` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `usuario` ;

CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(90) NOT NULL,
  `password` VARCHAR(120) NOT NULL,
  `ultimo_login` TIMESTAMP NULL DEFAULT NULL,
  `idcompradorfrecuente` INT NULL DEFAULT NULL,
  `historial_des_usuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE INDEX `usuario_UNIQUE` (`usuario` ASC) VISIBLE,
  UNIQUE INDEX `idusuario_UNIQUE` (`idusuario` ASC) VISIBLE,
  INDEX `fk_usuario_comprador_frecuente1_idx` (`idcompradorfrecuente` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_comprador_frecuente1`
    FOREIGN KEY (`idcompradorfrecuente`)
    REFERENCES `comprador_frecuente` (`idcompradorfrecuente`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `persona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `persona` ;

CREATE TABLE IF NOT EXISTS `persona` (
  `idpersona` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `apellido` VARCHAR(45) NULL DEFAULT NULL,
  `telefono` VARCHAR(9) NULL DEFAULT NULL,
  `foto` VARCHAR(45) NULL DEFAULT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `idusuario` INT NOT NULL,
  PRIMARY KEY (`idpersona`),
  INDEX `fk_usuario2_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_usuario2`
    FOREIGN KEY (`idusuario`)
    REFERENCES `usuario` (`idusuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `libro_reclamacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `libro_reclamacion` ;

CREATE TABLE IF NOT EXISTS `libro_reclamacion` (
  `idlibroreclamaciones` INT NOT NULL AUTO_INCREMENT,
  `fecha_reclamo` DATETIME NOT NULL,
  `idproducto` BIGINT NOT NULL,
  `idpersona` INT NOT NULL,
  PRIMARY KEY (`idlibroreclamaciones`),
  UNIQUE INDEX `LibroReclamaciones_UNIQUE` (`idlibroreclamaciones` ASC) VISIBLE,
  INDEX `fk_LibroReclamaciones_persona1_idx` (`idpersona` ASC) VISIBLE,
  CONSTRAINT `fk_LibroReclamaciones_persona1`
    FOREIGN KEY (`idpersona`)
    REFERENCES `persona` (`idpersona`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `producto` ;

CREATE TABLE IF NOT EXISTS `producto` (
  `idproducto` BIGINT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(20) NOT NULL,
  `nombre` VARCHAR(255) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `precio_unitario` DECIMAL(10,2) NOT NULL,
  `cantidad` TINYINT NOT NULL,
  `estadoseleccionoferta` TINYINT(1) NOT NULL DEFAULT '0',
  `destacado` BIT(1) NULL DEFAULT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `cantidadventas` INT NOT NULL,
  `idlibroreclamaciones` INT NOT NULL,
  `idgarantiaproducto` INT NOT NULL,
  `idpersona` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idproducto`),
  UNIQUE INDEX `idProducto_UNIQUE` (`idproducto` ASC) VISIBLE,
  UNIQUE INDEX `codigoProducto_UNIQUE` (`codigo` ASC) VISIBLE,
  INDEX `fk_producto_garantia_producto1_idx` (`idgarantiaproducto` ASC) VISIBLE,
  INDEX `fk_producto_persona1_idx` (`idpersona` ASC) VISIBLE,
  INDEX `fk_producto_LibroReclamaciones1_idx` (`idlibroreclamaciones` ASC) VISIBLE,
  CONSTRAINT `fk_producto_garantia_producto1`
    FOREIGN KEY (`idgarantiaproducto`)
    REFERENCES `garantia_producto` (`idgarantiaproducto`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_producto_LibroReclamaciones1`
    FOREIGN KEY (`idlibroreclamaciones`)
    REFERENCES `libro_reclamacion` (`idlibroreclamaciones`),
  CONSTRAINT `fk_producto_persona1`
    FOREIGN KEY (`idpersona`)
    REFERENCES `persona` (`idpersona`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `productosjuntos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `productosjuntos` ;

CREATE TABLE IF NOT EXISTS `productosjuntos` (
  `idproductosjuntos` BIGINT NOT NULL,
  `producto1` BIGINT NOT NULL,
  `producto2` BIGINT NOT NULL,
  PRIMARY KEY (`idproductosjuntos`),
  INDEX `fk_productosjuntos_producto3_idx` (`producto1` ASC) VISIBLE,
  INDEX `fk_productosjuntos_producto4_idx` (`producto2` ASC) VISIBLE,
  CONSTRAINT `fk_productosjuntos_producto3`
    FOREIGN KEY (`producto1`)
    REFERENCES `marketplacebd_test`.`producto` (`idproducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productosjuntos_producto4`
    FOREIGN KEY (`producto2`)
    REFERENCES `marketplacebd_test`.`producto` (`idproducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tarjeta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tarjeta` ;

CREATE TABLE IF NOT EXISTS `tarjeta` (
  `idtarjeta` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `numero_tarjeta` VARCHAR(16) NOT NULL,
  `cod_verificacion_tarjeta` VARCHAR(3) NOT NULL,
  `fecha_deposito` DATETIME NOT NULL,
  `monto_deposito` DECIMAL(10,2) NOT NULL,
  `fecha_vencimiento` DATE NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idtarjeta`),
  UNIQUE INDEX `idDeposito_UNIQUE` (`idtarjeta` ASC) VISIBLE,
  UNIQUE INDEX `numeroTarjeta_UNIQUE` (`numero_tarjeta` ASC) VISIBLE,
  UNIQUE INDEX `codVerificaciónTarjeta_UNIQUE` (`cod_verificacion_tarjeta` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pago`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pago` ;

CREATE TABLE IF NOT EXISTS `pago` (
  `idpago` INT NOT NULL AUTO_INCREMENT,
  `tipo_pago` VARCHAR(45) NOT NULL,
  `fecha_pago` DATETIME NOT NULL,
  `monto` DECIMAL(10,2) NOT NULL,
  `impuesto` DECIMAL(10,2) NOT NULL,
  `idtarjeta` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idpago`),
  UNIQUE INDEX `idPago_UNIQUE` (`idpago` ASC) VISIBLE,
  INDEX `fk_tarjeta1_idx` (`idtarjeta` ASC) VISIBLE,
  CONSTRAINT `fk_tarjeta1`
    FOREIGN KEY (`idtarjeta`)
    REFERENCES `tarjeta` (`idtarjeta`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `boleta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boleta` ;

CREATE TABLE IF NOT EXISTS `boleta` (
  `idboleta` INT NOT NULL,
  `cantidad_producto` INT NOT NULL,
  `idpago` INT NOT NULL,
  PRIMARY KEY (`idboleta`),
  UNIQUE INDEX `idBoletaVenta_UNIQUE` (`idboleta` ASC) VISIBLE,
  INDEX `fk_boleta_pago1_idx` (`idpago` ASC) VISIBLE,
  CONSTRAINT `fk_boleta_pago1`
    FOREIGN KEY (`idpago`)
    REFERENCES `pago` (`idpago`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `boleta_venta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boleta_venta` ;

CREATE TABLE IF NOT EXISTS `boleta_venta` (
  `idboletaventa` INT NOT NULL,
  PRIMARY KEY (`idboletaventa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `garantia_producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `garantia_producto` ;

CREATE TABLE IF NOT EXISTS `garantia_producto` (
  `idgarantiaproducto` INT NOT NULL AUTO_INCREMENT,
  `inicio_garantia` DATETIME NOT NULL,
  `final_garantia` DATETIME NOT NULL,
  `descripcion` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`idgarantiaproducto`),
  UNIQUE INDEX `idGarantiaProducto_UNIQUE` (`idgarantiaproducto` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `comprador_frecuente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comprador_frecuente` ;

CREATE TABLE IF NOT EXISTS `comprador_frecuente` (
  `idcompradorfrecuente` INT NOT NULL,
  `puntos_acumulados` INT NULL DEFAULT NULL,
  `numero_pedidos` INT NOT NULL,
  `descuento` FLOAT NOT NULL,
  PRIMARY KEY (`idcompradorfrecuente`),
  UNIQUE INDEX `idCompradorFrecuente_UNIQUE` (`idcompradorfrecuente` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `usuario` ;

CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(90) NOT NULL,
  `password` VARCHAR(120) NOT NULL,
  `ultimo_login` TIMESTAMP NULL DEFAULT NULL,
  `idcompradorfrecuente` INT NULL DEFAULT NULL,
  `historial_des_usuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE INDEX `usuario_UNIQUE` (`usuario` ASC) VISIBLE,
  UNIQUE INDEX `idusuario_UNIQUE` (`idusuario` ASC) VISIBLE,
  INDEX `fk_usuario_comprador_frecuente1_idx` (`idcompradorfrecuente` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_comprador_frecuente1`
    FOREIGN KEY (`idcompradorfrecuente`)
    REFERENCES `comprador_frecuente` (`idcompradorfrecuente`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `persona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `persona` ;

CREATE TABLE IF NOT EXISTS `persona` (
  `idpersona` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `apellido` VARCHAR(45) NULL DEFAULT NULL,
  `telefono` VARCHAR(9) NULL DEFAULT NULL,
  `foto` VARCHAR(45) NULL DEFAULT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `idusuario` INT NOT NULL,
  PRIMARY KEY (`idpersona`),
  INDEX `fk_usuario2_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_usuario2`
    FOREIGN KEY (`idusuario`)
    REFERENCES `usuario` (`idusuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `libro_reclamacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `libro_reclamacion` ;

CREATE TABLE IF NOT EXISTS `libro_reclamacion` (
  `idlibroreclamaciones` INT NOT NULL AUTO_INCREMENT,
  `fecha_reclamo` DATETIME NOT NULL,
  `idproducto` BIGINT NOT NULL,
  `idpersona` INT NOT NULL,
  PRIMARY KEY (`idlibroreclamaciones`),
  UNIQUE INDEX `LibroReclamaciones_UNIQUE` (`idlibroreclamaciones` ASC) VISIBLE,
  INDEX `fk_LibroReclamaciones_persona1_idx` (`idpersona` ASC) VISIBLE,
  CONSTRAINT `fk_LibroReclamaciones_persona1`
    FOREIGN KEY (`idpersona`)
    REFERENCES `persona` (`idpersona`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `producto` ;

CREATE TABLE IF NOT EXISTS `producto` (
  `idproducto` BIGINT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(20) NOT NULL,
  `nombre` VARCHAR(255) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `precio_unitario` DECIMAL(10,2) NOT NULL,
  `cantidad` TINYINT NOT NULL,
  `estadoseleccionoferta` TINYINT(1) NOT NULL DEFAULT '0',
  `destacado` BIT(1) NULL DEFAULT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `cantidadventas` INT NOT NULL,
  `idlibroreclamaciones` INT NOT NULL,
  `idgarantiaproducto` INT NOT NULL,
  `idpersona` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idproducto`),
  UNIQUE INDEX `idProducto_UNIQUE` (`idproducto` ASC) VISIBLE,
  UNIQUE INDEX `codigoProducto_UNIQUE` (`codigo` ASC) VISIBLE,
  INDEX `fk_producto_garantia_producto1_idx` (`idgarantiaproducto` ASC) VISIBLE,
  INDEX `fk_producto_persona1_idx` (`idpersona` ASC) VISIBLE,
  INDEX `fk_producto_LibroReclamaciones1_idx` (`idlibroreclamaciones` ASC) VISIBLE,
  CONSTRAINT `fk_producto_garantia_producto1`
    FOREIGN KEY (`idgarantiaproducto`)
    REFERENCES `garantia_producto` (`idgarantiaproducto`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_producto_LibroReclamaciones1`
    FOREIGN KEY (`idlibroreclamaciones`)
    REFERENCES `libro_reclamacion` (`idlibroreclamaciones`),
  CONSTRAINT `fk_producto_persona1`
    FOREIGN KEY (`idpersona`)
    REFERENCES `persona` (`idpersona`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cupon_descuento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cupon_descuento` ;

CREATE TABLE IF NOT EXISTS `cupon_descuento` (
  `idcupon` INT NOT NULL AUTO_INCREMENT,
  `valor_descuento` DECIMAL(6,2) NOT NULL,
  `idproducto` BIGINT NOT NULL,
  PRIMARY KEY (`idcupon`),
  UNIQUE INDEX `idCuponDescuento_UNIQUE` (`idcupon` ASC) VISIBLE,
  INDEX `fk_cupon_producto_idx` (`idproducto` ASC) VISIBLE,
  CONSTRAINT `fk_cupon_producto`
    FOREIGN KEY (`idproducto`)
    REFERENCES `producto` (`idproducto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `carrito`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carrito` ;

CREATE TABLE IF NOT EXISTS `carrito` (
  `idcarrito` INT UNSIGNED NOT NULL,
  `precio_total` DOUBLE NOT NULL,
  `unidad_por_producto` INT NOT NULL,
  `idproducto` BIGINT NOT NULL,
  `idcupon` INT NOT NULL,
  `idusuario` INT NOT NULL,
  PRIMARY KEY (`idcarrito`),
  INDEX `fk_carrito_producto_producto1_idx` (`idproducto` ASC) VISIBLE,
  INDEX `fk_carrito_usuario_idx` (`idusuario` ASC) VISIBLE,
  INDEX `fk_carrito_cupon_idx` (`idcupon` ASC) VISIBLE,
  CONSTRAINT `fk_carrito_cupon`
    FOREIGN KEY (`idcupon`)
    REFERENCES `cupon_descuento` (`idcupon`),
  CONSTRAINT `fk_carrito_producto_producto1`
    FOREIGN KEY (`idproducto`)
    REFERENCES `producto` (`idproducto`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_carrito_usuario`
    FOREIGN KEY (`idusuario`)
    REFERENCES `usuario` (`idusuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `categoria` ;

CREATE TABLE IF NOT EXISTS `categoria` (
  `idcategoria` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `desrcipcion` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`idcategoria`),
  UNIQUE INDEX `idTipoProducto_UNIQUE` (`idcategoria` ASC) VISIBLE,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `categoria_producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `categoria_producto` ;

CREATE TABLE IF NOT EXISTS `categoria_producto` (
  `idcategoriaproducto` INT NOT NULL AUTO_INCREMENT,
  `idproducto` BIGINT NOT NULL,
  `idcategoria` INT NOT NULL,
  PRIMARY KEY (`idcategoriaproducto`),
  INDEX `fk_producto_has_categoria_categoria1_idx` (`idcategoria` ASC) VISIBLE,
  INDEX `fk_producto_has_categoria_producto1_idx` (`idproducto` ASC) VISIBLE,
  CONSTRAINT `fk_producto_has_categoria_categoria1`
    FOREIGN KEY (`idcategoria`)
    REFERENCES `categoria` (`idcategoria`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_producto_has_categoria_producto1`
    FOREIGN KEY (`idproducto`)
    REFERENCES `producto` (`idproducto`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `categoria_subcategoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `categoria_subcategoria` ;

CREATE TABLE IF NOT EXISTS `categoria_subcategoria` (
  `idcategoriasubcategoria` INT NOT NULL AUTO_INCREMENT,
  `idcategoria` INT NOT NULL,
  `idsubcategoria` INT NOT NULL,
  PRIMARY KEY (`idcategoriasubcategoria`),
  UNIQUE INDEX `idcategoriasubcategoria_UNIQUE` (`idcategoriasubcategoria` ASC) VISIBLE,
  INDEX `fk_categoria_has_categoria_categoria2_idx` (`idsubcategoria` ASC) VISIBLE,
  INDEX `fk_categoria_has_categoria_categoria1_idx` (`idcategoria` ASC) VISIBLE,
  CONSTRAINT `fk_categoria_has_subcategoria`
    FOREIGN KEY (`idcategoria`)
    REFERENCES `categoria` (`idcategoria`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_subcategoria_has_categoria`
    FOREIGN KEY (`idsubcategoria`)
    REFERENCES `categoria` (`idcategoria`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `comentario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comentario` ;

CREATE TABLE IF NOT EXISTS `comentario` (
  `idcomentario` INT NOT NULL,
  `titulo` VARCHAR(100) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `puntaje` TINYINT NULL DEFAULT NULL,
  `idusuario` INT NOT NULL,
  PRIMARY KEY (`idcomentario`),
  INDEX `fk_comentario_usuario1_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_comentario_usuario1`
    FOREIGN KEY (`idusuario`)
    REFERENCES `usuario` (`idusuario`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `factura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `factura` ;

CREATE TABLE IF NOT EXISTS `factura` (
  `idfactura` INT NOT NULL,
  PRIMARY KEY (`idfactura`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `comprobante_venta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comprobante_venta` ;

CREATE TABLE IF NOT EXISTS `comprobante_venta` (
  `idcomprobanteventa` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `igv` DECIMAL(4,2) UNSIGNED NOT NULL,
  `subtotal` DECIMAL(4,2) UNSIGNED NOT NULL,
  `numero_ruc` VARCHAR(11) NOT NULL,
  `idboletaventa` INT NULL DEFAULT NULL,
  `idfactura` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idcomprobanteventa`),
  UNIQUE INDEX `numeroRUC_UNIQUE` (`numero_ruc` ASC) VISIBLE,
  UNIQUE INDEX `idFactura_UNIQUE` (`idcomprobanteventa` ASC) VISIBLE,
  INDEX `fk_comprobante_boleta_idx` (`idboletaventa` ASC) VISIBLE,
  INDEX `fk_comprobante_factura_idx` (`idfactura` ASC) VISIBLE,
  CONSTRAINT `fk_comprobante_boleta`
    FOREIGN KEY (`idboletaventa`)
    REFERENCES `boleta_venta` (`idboletaventa`),
  CONSTRAINT `fk_comprobante_factura`
    FOREIGN KEY (`idfactura`)
    REFERENCES `factura` (`idfactura`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `contra_reembolso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `contra_reembolso` ;

CREATE TABLE IF NOT EXISTS `contra_reembolso` (
  `nombre` VARCHAR(20) NULL DEFAULT NULL,
  `numero_cuenta` INT NULL DEFAULT NULL,
  `idpago` INT NOT NULL,
  `idcontrareembolso` INT NOT NULL,
  PRIMARY KEY (`idcontrareembolso`),
  INDEX `fk_ContraReembolso_pago1_idx` (`idpago` ASC) VISIBLE,
  CONSTRAINT `fk_ContraReembolso_pago1`
    FOREIGN KEY (`idpago`)
    REFERENCES `pago` (`idpago`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `direccion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `direccion` ;

CREATE TABLE IF NOT EXISTS `direccion` (
  `iddireccion` INT NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NULL DEFAULT NULL,
  `pais` VARCHAR(45) NULL DEFAULT NULL,
  `distrito` VARCHAR(45) NULL DEFAULT NULL,
  `codigo_postal` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`iddireccion`),
  UNIQUE INDEX `idDireccion_UNIQUE` (`iddireccion` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `domiciliacion_bancaria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `domiciliacion_bancaria` ;

CREATE TABLE IF NOT EXISTS `domiciliacion_bancaria` (
  `iddomiciliacionbancaria` INT NOT NULL,
  `direccion_empresa` VARCHAR(12) NULL DEFAULT NULL,
  `fecha_caducidad` DATETIME NULL DEFAULT NULL,
  `firma_cliente` VARCHAR(45) NULL DEFAULT NULL,
  `numero_cuenta` VARCHAR(45) NULL DEFAULT NULL,
  `referencia_solicitud` VARCHAR(45) NULL DEFAULT NULL,
  `idpago` INT NOT NULL,
  PRIMARY KEY (`iddomiciliacionbancaria`),
  INDEX `fk_domiciliacionBancaria_pago1_idx` (`idpago` ASC) VISIBLE,
  CONSTRAINT `fk_domiciliacionBancaria_pago1`
    FOREIGN KEY (`idpago`)
    REFERENCES `pago` (`idpago`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `seguimiento_pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `seguimiento_pedido` ;

CREATE TABLE IF NOT EXISTS `seguimiento_pedido` (
  `idseguimientopedido` INT NOT NULL AUTO_INCREMENT,
  `tiposeguimiento` VARCHAR(30) NOT NULL,
  `estado` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idseguimientopedido`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pedido` ;

CREATE TABLE IF NOT EXISTS `pedido` (
  `idpedido` BIGINT NOT NULL,
  `codigo` VARCHAR(20) NOT NULL,
  `fecha` DATETIME NOT NULL,
  `direccion_entrega` VARCHAR(200) NOT NULL,
  `cantidad_producto` INT NOT NULL,
  `estado_pedido` TINYINT NOT NULL DEFAULT '0',
  `precio_producto` DECIMAL(10,0) NOT NULL,
  `descuento_producto` DECIMAL(10,0) NOT NULL,
  `pago_pendiente` VARCHAR(50) NOT NULL,
  `idpago` INT NULL DEFAULT NULL,
  `idusuario` INT NOT NULL,
  `idcomprobanteventa` INT NULL DEFAULT NULL,
  `idcompradorfrecuente` INT NOT NULL,
  `idseguimientopedido` INT NOT NULL,
  PRIMARY KEY (`idpedido`),
  UNIQUE INDEX `codigoPedido_UNIQUE` (`codigo` ASC) VISIBLE,
  UNIQUE INDEX `idPedido_UNIQUE` (`idpedido` ASC) VISIBLE,
  INDEX `fk_pedido_pago1_idx` (`idpago` ASC) VISIBLE,
  INDEX `fk_pedido_usuario1_idx` (`idusuario` ASC) VISIBLE,
  INDEX `fk_pedidio_factura1_idx` (`idcomprobanteventa` ASC) VISIBLE,
  INDEX `fk_pedido_comprador_frecuente1_idx` (`idcompradorfrecuente` ASC) VISIBLE,
  INDEX `fk_seguimiento_pedido1_idx` (`idseguimientopedido` ASC) VISIBLE,
  CONSTRAINT `fk_pedidio_comprobante`
    FOREIGN KEY (`idcomprobanteventa`)
    REFERENCES `comprobante_venta` (`idcomprobanteventa`),
  CONSTRAINT `fk_pedido_comprador_frecuente1`
    FOREIGN KEY (`idcompradorfrecuente`)
    REFERENCES `comprador_frecuente` (`idcompradorfrecuente`),
  CONSTRAINT `fk_pedido_pago1`
    FOREIGN KEY (`idpago`)
    REFERENCES `pago` (`idpago`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_pedido_usuario1`
    FOREIGN KEY (`idusuario`)
    REFERENCES `usuario` (`idusuario`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_seguimiento_pedido1`
    FOREIGN KEY (`idseguimientopedido`)
    REFERENCES `seguimiento_pedido` (`idseguimientopedido`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `historial_pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `historial_pedido` ;

CREATE TABLE IF NOT EXISTS `historial_pedido` (
  `idhistorialpedido` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  `idproducto` BIGINT NOT NULL,
  `idpedido` BIGINT NOT NULL,
  PRIMARY KEY (`idhistorialpedido`),
  UNIQUE INDEX `idHistorialPedido_UNIQUE` (`idhistorialpedido` ASC) VISIBLE,
  INDEX `fk_historial_pedido_producto1_idx` (`idproducto` ASC) VISIBLE,
  INDEX `fk_historial_pedido_pedido1_idx` (`idpedido` ASC) VISIBLE,
  CONSTRAINT `fk_historial_pedido_pedido1`
    FOREIGN KEY (`idpedido`)
    REFERENCES `pedido` (`idpedido`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_historial_pedido_producto1`
    FOREIGN KEY (`idproducto`)
    REFERENCES `producto` (`idproducto`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `imagen_producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `imagen_producto` ;

CREATE TABLE IF NOT EXISTS `imagen_producto` (
  `idimagenproducto` INT NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(586) NULL DEFAULT NULL,
  `idproducto` BIGINT NOT NULL,
  PRIMARY KEY (`idimagenproducto`),
  UNIQUE INDEX `idImagenProducto_UNIQUE` (`idimagenproducto` ASC) VISIBLE,
  INDEX `fk_imagen_producto_producto1_idx` (`idproducto` ASC) VISIBLE,
  CONSTRAINT `fk_imagen_producto_producto1`
    FOREIGN KEY (`idproducto`)
    REFERENCES `producto` (`idproducto`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rol` ;

CREATE TABLE IF NOT EXISTS `rol` (
  `idrol` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idrol`),
  UNIQUE INDEX `nombreRol_UNIQUE` (`nombre` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `info_vendedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `info_vendedor` ;

CREATE TABLE IF NOT EXISTS `info_vendedor` (
  `idinfovendedor` INT NOT NULL,
  `tiempoderegistro` DATE NOT NULL,
  `cantidadproductosvendidos` INT NOT NULL,
  `calificaciondevendedor` INT NOT NULL,
  `nombrevendedor` VARCHAR(45) NOT NULL,
  `apellidovendedor` VARCHAR(45) NOT NULL,
  `telefonovendedor` VARCHAR(9) NOT NULL,
  `correovendedor` VARCHAR(45) NOT NULL,
  `idrol` INT NOT NULL,
  PRIMARY KEY (`idinfovendedor`),
  INDEX `fk_informacionvendedor_rol1_idx` (`idrol` ASC) VISIBLE,
  CONSTRAINT `fk_informacionvendedor_rol1`
    FOREIGN KEY (`idrol`)
    REFERENCES `rol` (`idrol`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `modulo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `modulo` ;

CREATE TABLE IF NOT EXISTS `modulo` (
  `idmodulo` INT NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `icono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idmodulo`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE,
  UNIQUE INDEX `idModulo_UNIQUE` (`idmodulo` ASC) VISIBLE,
  UNIQUE INDEX `icono_UNIQUE` (`icono` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `notificacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `notificacion` ;

CREATE TABLE IF NOT EXISTS `notificacion` (
  `idnotificacionventa` INT NOT NULL,
  `notificacion_pago_realizado` BIT(1) NOT NULL,
  `notificacionc_pedido_enviado` BIT(1) NOT NULL,
  `notificacion_pedido_nuevo` BIT(1) NOT NULL,
  `notificar_deposito_pendiente` BIT(1) NOT NULL,
  `notificar_cancelacion_pedidos` BIT(1) NOT NULL,
  `notificar_devolucion_pedido` BIT(1) NOT NULL,
  `fecha_devolucion` DATETIME NOT NULL,
  `idpedido` BIGINT NOT NULL,
  `idpago` INT NOT NULL,
  `idpersona` INT NOT NULL,
  PRIMARY KEY (`idnotificacionventa`),
  UNIQUE INDEX `notificacion_pago_realizado_UNIQUE` (`notificacion_pago_realizado` ASC) VISIBLE,
  INDEX `idpedido_idx` (`idpedido` ASC) INVISIBLE,
  INDEX `idpago_idx` (`idpago` ASC) VISIBLE,
  INDEX `fk_persona1_idx` (`idpersona` ASC) VISIBLE,
  CONSTRAINT `fk_persona1`
    FOREIGN KEY (`idpersona`)
    REFERENCES `persona` (`idpersona`),
  CONSTRAINT `idpago`
    FOREIGN KEY (`idpago`)
    REFERENCES `pago` (`idpago`),
  CONSTRAINT `idpedido`
    FOREIGN KEY (`idpedido`)
    REFERENCES `pedido` (`idpedido`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `oferta_especial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oferta_especial` ;

CREATE TABLE IF NOT EXISTS `oferta_especial` (
  `idofertaespecial` INT NOT NULL,
  `precio_descuento` FLOAT NOT NULL,
  `fecha_inicio` DATETIME NULL DEFAULT NULL,
  `fecha_limite` DATETIME NULL DEFAULT NULL,
  `descripcion_oferta` TEXT NULL DEFAULT NULL,
  `idcompradorfrecuente` INT NOT NULL,
  `idproducto` BIGINT NOT NULL,
  PRIMARY KEY (`idofertaespecial`),
  INDEX `fk_oferta_especial_comprador_frecuente1_idx` (`idcompradorfrecuente` ASC) VISIBLE,
  INDEX `fk_oferta_especial_producto1_idx` (`idproducto` ASC) VISIBLE,
  CONSTRAINT `fk_oferta_especial_comprador_frecuente1`
    FOREIGN KEY (`idcompradorfrecuente`)
    REFERENCES `comprador_frecuente` (`idcompradorfrecuente`),
  CONSTRAINT `fk_oferta_especial_producto1`
    FOREIGN KEY (`idproducto`)
    REFERENCES `producto` (`idproducto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `oferta_especial_has_producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oferta_especial_has_producto` ;

CREATE TABLE IF NOT EXISTS `oferta_especial_has_producto` (
  `oferta_especial_idoferta_especial` INT NOT NULL,
  `producto_idproducto` BIGINT NOT NULL,
  PRIMARY KEY (`oferta_especial_idoferta_especial`, `producto_idproducto`),
  INDEX `fk_oferta_especial_has_producto_producto1_idx` (`producto_idproducto` ASC) VISIBLE,
  INDEX `fk_oferta_especial_has_producto_oferta_especial1_idx` (`oferta_especial_idoferta_especial` ASC) VISIBLE,
  CONSTRAINT `fk_oferta_especial_has_producto_oferta_especial1`
    FOREIGN KEY (`oferta_especial_idoferta_especial`)
    REFERENCES `oferta_especial` (`idofertaespecial`),
  CONSTRAINT `fk_oferta_especial_has_producto_producto1`
    FOREIGN KEY (`producto_idproducto`)
    REFERENCES `producto` (`idproducto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `oferta_producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oferta_producto` ;

CREATE TABLE IF NOT EXISTS `oferta_producto` (
  `idofertaproducto` BIGINT NOT NULL AUTO_INCREMENT,
  `descripcion` TEXT NOT NULL,
  `precio_oferta` FLOAT NOT NULL,
  `fecha_inicio` DATETIME NOT NULL,
  `fecha_limite` DATETIME NOT NULL,
  `fecha_creacion` DATETIME NOT NULL,
  `estado` TINYINT(1) NOT NULL DEFAULT '1',
  `valoracion_producto` INT NULL DEFAULT NULL,
  `idproducto` BIGINT NOT NULL,
  PRIMARY KEY (`idofertaproducto`),
  INDEX `fk_oferta_producto_producto1_idx` (`idproducto` ASC) VISIBLE,
  CONSTRAINT `fk_oferta_producto1`
    FOREIGN KEY (`idproducto`)
    REFERENCES `producto` (`idproducto`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sub_modulo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sub_modulo` ;

CREATE TABLE IF NOT EXISTS `sub_modulo` (
  `idsubmodulo` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `estado` TINYINT NOT NULL,
  `idmodulo` INT NOT NULL,
  PRIMARY KEY (`idsubmodulo`),
  UNIQUE INDEX `idSubModulo_UNIQUE` (`idsubmodulo` ASC) VISIBLE,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE,
  UNIQUE INDEX `estado_UNIQUE` (`estado` ASC) VISIBLE,
  INDEX `fk_sub_modulo_modulo1_idx` (`idmodulo` ASC) VISIBLE,
  CONSTRAINT `fk_sub_modulo_modulo1`
    FOREIGN KEY (`idmodulo`)
    REFERENCES `modulo` (`idmodulo`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `opcion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opcion` ;

CREATE TABLE IF NOT EXISTS `opcion` (
  `idopcion` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `estado` TINYINT NOT NULL,
  `idsubmodulo` INT NOT NULL,
  PRIMARY KEY (`idopcion`),
  UNIQUE INDEX `idOpcion_UNIQUE` (`idopcion` ASC) VISIBLE,
  INDEX `fk_opcion_sub_modulo1_idx` (`idsubmodulo` ASC) VISIBLE,
  CONSTRAINT `fk_opcion_sub_modulo1`
    FOREIGN KEY (`idsubmodulo`)
    REFERENCES `sub_modulo` (`idsubmodulo`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pago_paypal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pago_paypal` ;

CREATE TABLE IF NOT EXISTS `pago_paypal` (
  `idpagopaypal` INT NOT NULL,
  `nombre` VARCHAR(20) NULL DEFAULT NULL,
  `direccion_correo` VARCHAR(45) NULL DEFAULT NULL,
  `idpago` INT NOT NULL,
  PRIMARY KEY (`idpagopaypal`),
  INDEX `fk_PagoPaypal_pago1_idx` (`idpago` ASC) VISIBLE,
  CONSTRAINT `fk_PagoPaypal_pago1`
    FOREIGN KEY (`idpago`)
    REFERENCES `pago` (`idpago`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `persona_direccion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `persona_direccion` ;

CREATE TABLE IF NOT EXISTS `persona_direccion` (
  `idpersonadireccion` INT NOT NULL,
  `iddireccion` INT NOT NULL,
  `idpersona` INT NOT NULL,
  PRIMARY KEY (`idpersonadireccion`),
  INDEX `fk_persona_direccion_direccion1_idx` (`iddireccion` ASC) VISIBLE,
  INDEX `fk_persona_direccion_persona1_idx` (`idpersona` ASC) VISIBLE,
  CONSTRAINT `fk_persona_direccion_direccion1`
    FOREIGN KEY (`iddireccion`)
    REFERENCES `direccion` (`iddireccion`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_persona_direccion_persona1`
    FOREIGN KEY (`idpersona`)
    REFERENCES `persona` (`idpersona`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `premio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `premio` ;

CREATE TABLE IF NOT EXISTS `premio` (
  `idpremio` INT NOT NULL,
  `descripcion_premio` VARCHAR(100) NULL DEFAULT NULL,
  `categoria` VARCHAR(45) NULL DEFAULT NULL,
  `idcompradorfrecuente` INT NOT NULL,
  PRIMARY KEY (`idpremio`),
  INDEX `fk_premio_comprador_frecuente1_idx` (`idcompradorfrecuente` ASC) VISIBLE,
  CONSTRAINT `fk_premio_comprador_frecuente1`
    FOREIGN KEY (`idcompradorfrecuente`)
    REFERENCES `comprador_frecuente` (`idcompradorfrecuente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `producto_complementario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `producto_complementario` ;

CREATE TABLE IF NOT EXISTS `producto_complementario` (
  `idproductocomplementario` INT NOT NULL AUTO_INCREMENT,
  `idcategoriaproducto` INT NOT NULL,
  `categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idproductocomplementario`),
  INDEX `fk_producto_complementario_categoria_producto1_idx` (`idcategoriaproducto` ASC) VISIBLE,
  CONSTRAINT `fk_producto_complementario_categoria_producto1`
    FOREIGN KEY (`idcategoriaproducto`)
    REFERENCES `categoria_producto` (`idcategoriaproducto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `producto_demandado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `producto_demandado` ;

CREATE TABLE IF NOT EXISTS `producto_demandado` (
  `idproducto_demandado` INT NOT NULL AUTO_INCREMENT,
  `fecha_vencimiento` DATETIME NULL DEFAULT NULL,
  `idproducto` BIGINT NOT NULL,
  `idcategoria` INT NOT NULL,
  PRIMARY KEY (`idproducto_demandado`),
  UNIQUE INDEX `idproducto_demandado_UNIQUE` (`idproducto_demandado` ASC) VISIBLE,
  INDEX `fk_producto_demandado_producto1_idx` (`idproducto` ASC) VISIBLE,
  INDEX `fk_producto_demandado_categoria1_idx` (`idcategoria` ASC) VISIBLE)
ENGINE = MRG_MyISAM
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `producto_deseado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `producto_deseado` ;

CREATE TABLE IF NOT EXISTS `producto_deseado` (
  `idproductodeseado` INT NOT NULL,
  `idusuario` INT NOT NULL,
  `idproducto` BIGINT NOT NULL,
  `fecha_deseo` DATETIME NULL DEFAULT NULL,
  `estado` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`idproductodeseado`),
  INDEX `fk_usuario_has_producto_producto1_idx` (`idproducto` ASC) VISIBLE,
  INDEX `fk_usuario_has_producto_usuario1_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_has_producto_producto1`
    FOREIGN KEY (`idproducto`)
    REFERENCES `producto` (`idproducto`),
  CONSTRAINT `fk_usuario_has_producto_usuario1`
    FOREIGN KEY (`idusuario`)
    REFERENCES `usuario` (`idusuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `producto_favorito`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `producto_favorito` ;

CREATE TABLE IF NOT EXISTS `producto_favorito` (
  `idproductofavorito` INT NOT NULL,
  `idpersona` INT NOT NULL,
  `idproducto` BIGINT NOT NULL,
  PRIMARY KEY (`idproductofavorito`),
  INDEX `fk_producto_favorito_persona1_idx` (`idpersona` ASC) VISIBLE,
  INDEX `fk_producto_favorito_producto1_idx` (`idproducto` ASC) VISIBLE,
  CONSTRAINT `fk_producto_favorito_persona`
    FOREIGN KEY (`idpersona`)
    REFERENCES `persona` (`idpersona`),
  CONSTRAINT `fk_producto_favorito_producto`
    FOREIGN KEY (`idproducto`)
    REFERENCES `producto` (`idproducto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `producto_mas_visto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `producto_mas_visto` ;

CREATE TABLE IF NOT EXISTS `producto_mas_visto` (
  `idProducto` BIGINT NOT NULL,
  `idpersona` INT NOT NULL,
  `idproductovisto` INT NOT NULL,
  PRIMARY KEY (`idproductovisto`),
  INDEX `idProducto_idx` (`idProducto` ASC) VISIBLE,
  INDEX `idPersona_idx` (`idpersona` ASC) VISIBLE,
  CONSTRAINT `idPersona`
    FOREIGN KEY (`idpersona`)
    REFERENCES `persona` (`idpersona`),
  CONSTRAINT `idProducto`
    FOREIGN KEY (`idProducto`)
    REFERENCES `producto` (`idproducto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `producto_valorado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `producto_valorado` ;

CREATE TABLE IF NOT EXISTS `producto_valorado` (
  `idproductovalorado` INT NOT NULL AUTO_INCREMENT,
  `deseado` BIT(1) NULL DEFAULT NULL COMMENT 'Solo sera la respuesta de \"SI\" o \"No\"',
  `recomendado` BIT(1) NULL DEFAULT NULL COMMENT 'Solo sera la respuesta de \"SI\" o \"No\"',
  `idproducto` BIGINT NOT NULL,
  `idusuario` INT NOT NULL,
  PRIMARY KEY (`idproductovalorado`),
  UNIQUE INDEX `idProductoDeseado_UNIQUE` (`idproductovalorado` ASC) VISIBLE,
  INDEX `fk_producto1_idx` (`idproducto` ASC) VISIBLE,
  INDEX `fk_usuario1_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_producto1`
    FOREIGN KEY (`idproducto`)
    REFERENCES `producto` (`idproducto`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_usuario1`
    FOREIGN KEY (`idusuario`)
    REFERENCES `usuario` (`idusuario`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `reclamo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `reclamo` ;

CREATE TABLE IF NOT EXISTS `reclamo` (
  `idreclamo` INT NOT NULL AUTO_INCREMENT,
  `descripcion` TEXT NOT NULL,
  `tipo_reclamo` VARCHAR(80) NOT NULL,
  `idusuario` INT NOT NULL,
  PRIMARY KEY (`idreclamo`),
  UNIQUE INDEX `idLibro_UNIQUE` (`idreclamo` ASC) VISIBLE,
  INDEX `fk_Reclamo_Usuario1_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_Reclamo_Usuario1`
    FOREIGN KEY (`idusuario`)
    REFERENCES `usuario` (`idusuario`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `regalo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `regalo` ;

CREATE TABLE IF NOT EXISTS `regalo` (
  `idregalo` INT NOT NULL AUTO_INCREMENT,
  `descripcion_regalo` VARCHAR(100) NOT NULL,
  `categoria` VARCHAR(45) NOT NULL,
  `puntos_requeridos` VARCHAR(45) NOT NULL DEFAULT '0' COMMENT 'Puntos necesarios para que un comprador pueda tener un regalo.',
  `idcompradorfrecuente` INT NOT NULL,
  PRIMARY KEY (`idregalo`),
  UNIQUE INDEX `idRegalo_UNIQUE` (`idregalo` ASC) VISIBLE,
  INDEX `fk_regalo_comprador_frecuente1_idx` (`idcompradorfrecuente` ASC) VISIBLE,
  CONSTRAINT `fk_regalo_comprador_frecuente1`
    FOREIGN KEY (`idcompradorfrecuente`)
    REFERENCES `comprador_frecuente` (`idcompradorfrecuente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `reporte`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `reporte` ;

CREATE TABLE IF NOT EXISTS `reporte` (
  `idreporte` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NULL DEFAULT NULL,
  `idpersona` INT NOT NULL,
  PRIMARY KEY (`idreporte`),
  INDEX `fk_reporte_persona1_idx` (`idpersona` ASC) VISIBLE,
  CONSTRAINT `fk_reporte_persona1`
    FOREIGN KEY (`idpersona`)
    REFERENCES `persona` (`idpersona`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rol_opcion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rol_opcion` ;

CREATE TABLE IF NOT EXISTS `rol_opcion` (
  `idrolopcion` INT NOT NULL,
  `idrol` INT NOT NULL,
  `idopcion` INT NOT NULL,
  PRIMARY KEY (`idrolopcion`),
  UNIQUE INDEX `idRolOpcioncol_UNIQUE` (`idrolopcion` ASC) VISIBLE,
  INDEX `fk_rol_opcion_rol1_idx` (`idrol` ASC) VISIBLE,
  INDEX `fk_rol_opcion_opcion1_idx` (`idopcion` ASC) VISIBLE,
  CONSTRAINT `fk_rol_opcion_opcion1`
    FOREIGN KEY (`idopcion`)
    REFERENCES `opcion` (`idopcion`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_rol_opcion_rol1`
    FOREIGN KEY (`idrol`)
    REFERENCES `rol` (`idrol`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rol_usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rol_usuario` ;

CREATE TABLE IF NOT EXISTS `rol_usuario` (
  `idrolusuario` INT NOT NULL AUTO_INCREMENT,
  `estado` TINYINT NOT NULL,
  `idrol` INT NOT NULL,
  `idusuario` INT NOT NULL,
  PRIMARY KEY (`idrolusuario`),
  UNIQUE INDEX `idrolusuario_UNIQUE` (`idrolusuario` ASC) VISIBLE,
  INDEX `fk_rol_usuario_idx` (`idrol` ASC) VISIBLE,
  INDEX `fk_usuario_rol_idx` (`idusuario` ASC) INVISIBLE,
  CONSTRAINT `fk_rol_usuario_id`
    FOREIGN KEY (`idusuario`)
    REFERENCES `usuario` (`idusuario`),
  CONSTRAINT `fk_usuario_rol_id`
    FOREIGN KEY (`idrol`)
    REFERENCES `rol` (`idrol`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sugerenciahistorial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sugerenciahistorial` ;

CREATE TABLE IF NOT EXISTS `sugerenciahistorial` (
  `idsugerenciahistorial` INT NOT NULL,
  `historial` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(80) NOT NULL,
  `idproducto` BIGINT NOT NULL,
  PRIMARY KEY (`idsugerenciahistorial`),
  INDEX `fk_sugerencia_historial_producto1_idx` (`idproducto` ASC) VISIBLE,
  CONSTRAINT `fk_sugerencia_historial_producto1`
    FOREIGN KEY (`idproducto`)
    REFERENCES `producto` (`idproducto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sugerencias_cate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sugerencias_cate` ;

CREATE TABLE IF NOT EXISTS `sugerencias_cate` (
  `idsugerencias` INT NOT NULL,
  `descripcion` VARCHAR(80) NOT NULL,
  `idcategoriaproducto` INT NOT NULL,
  PRIMARY KEY (`idsugerencias`),
  INDEX `fk_sugerencias_cate_categoria_producto1_idx` (`idcategoriaproducto` ASC) VISIBLE,
  CONSTRAINT `fk_sugerencias_cate_categoria_producto1`
    FOREIGN KEY (`idcategoriaproducto`)
    REFERENCES `categoria_producto` (`idcategoriaproducto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transferencia_bancaria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `transferencia_bancaria` ;

CREATE TABLE IF NOT EXISTS `transferencia_bancaria` (
  `idtransferenciabancaria` INT NOT NULL,
  `referencia_pago` VARCHAR(45) NULL DEFAULT NULL,
  `direccion_facturacion` VARCHAR(45) NULL DEFAULT NULL,
  `idpago` INT NOT NULL,
  PRIMARY KEY (`idtransferenciabancaria`),
  INDEX `fk_Transferencia Bancaria_pago1_idx` (`idpago` ASC) VISIBLE,
  CONSTRAINT `fk_Transferencia Bancaria_pago1`
    FOREIGN KEY (`idpago`)
    REFERENCES `pago` (`idpago`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `venta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `venta` ;

CREATE TABLE IF NOT EXISTS `venta` (
  `idventa` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fecha_venta` DATETIME NOT NULL,
  `monto` DECIMAL(10,2) NOT NULL,
  `idpago` INT NOT NULL,
  PRIMARY KEY (`idventa`),
  UNIQUE INDEX `idVenta_UNIQUE` (`idventa` ASC) VISIBLE,
  INDEX `fk_venta_pago1_idx` (`idpago` ASC) VISIBLE,
  CONSTRAINT `fk_venta_pago1`
    FOREIGN KEY (`idpago`)
    REFERENCES `pago` (`idpago`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `venta_reporte`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `venta_reporte` ;

CREATE TABLE IF NOT EXISTS `venta_reporte` (
  `idventareporte` INT NOT NULL AUTO_INCREMENT,
  `tipo_reporte` VARCHAR(80) NOT NULL,
  `idreporte` INT NOT NULL,
  `idventa` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idventareporte`),
  INDEX `fk_venta_reporte_reporte1_idx` (`idreporte` ASC) VISIBLE,
  INDEX `fk_venta_reporte_venta1_idx` (`idventa` ASC) VISIBLE,
  CONSTRAINT `fk_venta_reporte_reporte1`
    FOREIGN KEY (`idreporte`)
    REFERENCES `reporte` (`idreporte`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_venta_reporte_venta1`
    FOREIGN KEY (`idventa`)
    REFERENCES `venta` (`idventa`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
