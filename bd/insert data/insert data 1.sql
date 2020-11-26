-- Garantia

INSERT INTO garantia_producto VALUES (1,'2020-12-10 21:20:00','2020-12-10 21:20:00', 'Producto Garantizadoxdxd');


-- CATEGORIAS
INSERT INTO `marketplacebd_test`.`categoria` (`nombre`, `desrcipcion`) VALUES ('Celulares y Telefónos', 'Equipos portátiles para estar siempre conectado');
INSERT INTO `marketplacebd_test`.`categoria` (`nombre`, `desrcipcion`) VALUES ('Cámaras y Accesorios', 'Para capturar todo buen momento');
INSERT INTO `marketplacebd_test`.`categoria` (`nombre`, `desrcipcion`) VALUES ('Consolas y Videojuegos', 'Relajamiento');
INSERT INTO `marketplacebd_test`.`categoria` (`nombre`, `desrcipcion`) VALUES ('Computación ', 'Para conectarse con el mundo');
INSERT INTO `marketplacebd_test`.`categoria` (`nombre`, `desrcipcion`) VALUES ('Electrónica, Audio y Video', 'TV\'s, Radios, accesorios para dj\'s ');
INSERT INTO `marketplacebd_test`.`categoria` (`nombre`, `desrcipcion`) VALUES ('Relojes y joyas', 'Para estar a la moda');


-- COMPRADOR FRECUENTE
INSERT INTO comprador_frecuente VALUES (1,37,1,2.1); 
INSERT INTO `marketplacebd_test`.`comprador_frecuente` (`idcompradorfrecuente`, `puntos_acumulados`, `numero_pedidos`, `descuento`) VALUES ('2', '14', '2', '2.5');

-- USUARIO
INSERT INTO usuario VALUES (1,'Pablo','Lepzilin','2020-12-10 21:20:00',1, 'prueba' );
INSERT INTO `marketplacebd_test`.`usuario` (`usuario`, `password`, `ultimo_login`, `idcompradorfrecuente`, `historial_des_usuario`) VALUES ('Juan', 'juan', '2020-11-10 21:20:00', '1', 'prueba');
INSERT INTO `marketplacebd_test`.`usuario` (`usuario`, `password`, `ultimo_login`, `idcompradorfrecuente`, `historial_des_usuario`) VALUES ('Lorenzo', 'lorenzo', '2020-10-10 21:35:00', '1', 'prueba');
INSERT INTO `marketplacebd_test`.`usuario` (`usuario`, `password`, `ultimo_login`, `idcompradorfrecuente`, `historial_des_usuario`) VALUES ('Lina', 'lina', '2020-10-09 21:40:00', '2', 'prueba');
INSERT INTO `marketplacebd_test`.`usuario` (`usuario`, `password`, `ultimo_login`, `idcompradorfrecuente`, `historial_des_usuario`) VALUES ('Akasha', 'akasha', '2020-10-08 21:00:00', '2', 'prueba');

-- PERSONA
INSERT INTO `marketplacebd_test`.`persona` (`nombre`, `apellido`, `telefono`, `foto`, `correo`, `idusuario`) VALUES ('Pablo','Lepzilin',961090046,'prueba','pablito@gmail.com',1);
INSERT INTO `marketplacebd_test`.`persona` (`nombre`, `apellido`, `telefono`, `foto`, `correo`, `idusuario`) VALUES ('Juan', 'Mendoza', '985425789', 'prueba', 'juan@gmail.com', '2');
INSERT INTO `marketplacebd_test`.`persona` (`nombre`, `apellido`, `telefono`, `foto`, `correo`, `idusuario`) VALUES ('Lorenzo', 'Prado', '987461233', 'prueba', 'lorenzo@gmail.com', '3');
INSERT INTO `marketplacebd_test`.`persona` (`nombre`, `apellido`, `telefono`, `foto`, `correo`, `idusuario`) VALUES ('Lina', 'Frozen', '987456235', 'prueba', 'lina@outlook.com', '4');
INSERT INTO `marketplacebd_test`.`persona` (`nombre`, `apellido`, `telefono`, `foto`, `correo`, `idusuario`) VALUES ('Akasha', 'Queen', '915948753', 'prueba', 'aksha@gmail.com', '5');

-- Libro de reclamaciones 
INSERT INTO libro_reclamacion VALUES(1,'2020-12-10 21:20:00',1,2);



-- PRODUCTOS
INSERT INTO `marketplacebd_test`.`producto` (`codigo`, `nombre`, `descripcion`, `precio_unitario`, `cantidad`, `estadoseleccionoferta`, `destacado`, `marca`, `cantidadventas`, `idlibroreclamaciones`, `idgarantiaproducto`, `idpersona`) VALUES ('RF3','ProductoA','El mejor producto para acabar con la ansiedad',15.00,15,1,1,'paltomiel',12,1,1,2);
INSERT INTO `marketplacebd_test`.`producto` (`codigo`, `nombre`, `descripcion`, `precio_unitario`, `cantidad`, `estadoseleccionoferta`, `destacado`, `marca`, `cantidadventas`, `idlibroreclamaciones`, `idgarantiaproducto`, `idpersona`) VALUES ('RF4', 'Xiaomi Redmi Note 9', '128gb 4gb Ram Version Global Sellado', 799.00, 40, 1, 1, 'Xiaomi', 4, 1, 1, 2);
INSERT INTO `marketplacebd_test`.`producto` (`codigo`, `nombre`, `descripcion`, `precio_unitario`, `cantidad`, `estadoseleccionoferta`, `destacado`, `marca`, `cantidadventas`, `idlibroreclamaciones`, `idgarantiaproducto`, `idpersona`) VALUES ('RF5', 'Samsung Galaxy M11', 'velocidad del CPU 1.8GHz', 529.00, 12, 1, 1, 'Samsung', 2, 1, 1, 2);
INSERT INTO `marketplacebd_test`.`producto` (`codigo`, `nombre`, `descripcion`, `precio_unitario`, `cantidad`, `estadoseleccionoferta`, `destacado`, `marca`, `cantidadventas`, `idlibroreclamaciones`, `idgarantiaproducto`, `idpersona`) VALUES ('RF6', 'Apple iPhone 11 64gb', 'Apple iPhone 11 64gb', 2799.00, 10, 1, 1, 'Apple', 3, 1, 1, 2);
INSERT INTO `marketplacebd_test`.`producto` (`codigo`, `nombre`, `descripcion`, `precio_unitario`, `cantidad`, `estadoseleccionoferta`, `destacado`, `marca`, `cantidadventas`, `idlibroreclamaciones`, `idgarantiaproducto`, `idpersona`) VALUES ('RF7', 'Smartwatch Apple Watch Se', 'Smartwatch Apple Watch Se 40mm Gps', 1479.00, 50, 1, 1, 'Apple', 2, 1, 1, 2);
INSERT INTO `marketplacebd_test`.`producto` (`codigo`, `nombre`, `descripcion`, `precio_unitario`, `cantidad`, `estadoseleccionoferta`, `destacado`, `marca`, `cantidadventas`, `idlibroreclamaciones`, `idgarantiaproducto`, `idpersona`) VALUES ('RF8', 'Smart Tv Samsung Led 4k Uhd 65', 'Smart Tv Samsung Led 4k Uhd 65 Un65tu8500gxpe', 2999.00, 3, 1, 1, 'Samsung', 2, 1, 1, 3);
INSERT INTO `marketplacebd_test`.`producto` (`codigo`, `nombre`, `descripcion`, `precio_unitario`, `cantidad`, `estadoseleccionoferta`, `destacado`, `marca`, `cantidadventas`, `idlibroreclamaciones`, `idgarantiaproducto`, `idpersona`) VALUES ('RF9', 'Sony Tv 55 Led 4k Uhd', 'Sony Tv 55 Led 4k Uhd Con Hdr Android Tv Xbr-55x955g', 3999.00, 10, 1, 1, 'Sony', 4, 1, 1, 3);
INSERT INTO `marketplacebd_test`.`producto` (`codigo`, `nombre`, `descripcion`, `precio_unitario`, `cantidad`, `estadoseleccionoferta`, `destacado`, `marca`, `cantidadventas`, `idlibroreclamaciones`, `idgarantiaproducto`, `idpersona`) VALUES ('RF10','Parlante Portátil Extra Bass', 'Parlante Portátil Extra Bass Xb43 Con Bluetooth', 469.00, 30, 1, 1, 'Sony', 21, 1, 1, 3);
INSERT INTO `marketplacebd_test`.`producto` (`codigo`, `nombre`, `descripcion`, `precio_unitario`, `cantidad`, `estadoseleccionoferta`, `destacado`, `marca`, `cantidadventas`, `idlibroreclamaciones`, `idgarantiaproducto`, `idpersona`) VALUES ('RF11','DualShock 4 ','El mejor producto para acabar con la ansiedad',300.00,15,1,1,'SONY',12,1,1,2);
INSERT INTO `marketplacebd_test`.`producto` (`codigo`, `nombre`, `descripcion`, `precio_unitario`, `cantidad`, `estadoseleccionoferta`, `destacado`, `marca`, `cantidadventas`, `idlibroreclamaciones`, `idgarantiaproducto`, `idpersona`) VALUES ('RF12','PowerA - Cable de carga USB para PlayStation 4','la mejor carga para tu ps4',50.00,50,1,1,'SONY',12,1,1,2);
INSERT INTO `marketplacebd_test`.`producto` (`codigo`, `nombre`, `descripcion`, `precio_unitario`, `cantidad`, `estadoseleccionoferta`, `destacado`, `marca`, `cantidadventas`, `idlibroreclamaciones`, `idgarantiaproducto`, `idpersona`) VALUES ('RF13','PS4 Estación de doble carga para controlador de Sony PlayStation ','la mejor carga para tu ps4',50.00,50,1,1,'BEBONCOOL PS4',12,1,1,2);


-- CATEGORIA PRODUCTO

INSERT INTO `marketplacebd_test`.`categoria_producto` (`idproducto`, `idcategoria`) VALUES ('6', '6');
INSERT INTO `marketplacebd_test`.`categoria_producto` (`idproducto`, `idcategoria`) VALUES ('7', '1');
INSERT INTO `marketplacebd_test`.`categoria_producto` (`idproducto`, `idcategoria`) VALUES ('8', '1');
INSERT INTO `marketplacebd_test`.`categoria_producto` (`idproducto`, `idcategoria`) VALUES ('9', '1');
INSERT INTO `marketplacebd_test`.`categoria_producto` (`idproducto`, `idcategoria`) VALUES ('10', '6');
INSERT INTO `marketplacebd_test`.`categoria_producto` (`idproducto`, `idcategoria`) VALUES ('11', '5');
INSERT INTO `marketplacebd_test`.`categoria_producto` (`idproducto`, `idcategoria`) VALUES ('12', '5');
INSERT INTO `marketplacebd_test`.`categoria_producto` (`idproducto`, `idcategoria`) VALUES ('13', '5');
INSERT INTO `marketplacebd_test`.`categoria_producto` (`idproducto`, `idcategoria`) VALUES ('14', '3');
INSERT INTO `marketplacebd_test`.`categoria_producto` (`idproducto`, `idcategoria`) VALUES ('15', '3');
INSERT INTO `marketplacebd_test`.`categoria_producto` (`idproducto`, `idcategoria`) VALUES ('16', '3');

-- ROLES
INSERT INTO `marketplacebd_test`.`rol` (`idrol`, `nombre`) VALUES ('1', 'Administrador');
INSERT INTO `marketplacebd_test`.`rol` (`idrol`, `nombre`) VALUES ('2', 'Vendedor');
INSERT INTO `marketplacebd_test`.`rol` (`idrol`, `nombre`) VALUES ('3', 'Comprador');

-- ROL_USUARIO
INSERT INTO `marketplacebd_test`.`rol_usuario` (`estado`, `idrol`, `idusuario`) VALUES ('1', '2', '1');
INSERT INTO `marketplacebd_test`.`rol_usuario` (`estado`, `idrol`, `idusuario`) VALUES ('1', '2', '2');
INSERT INTO `marketplacebd_test`.`rol_usuario` (`estado`, `idrol`, `idusuario`) VALUES ('1', '2', '3');
INSERT INTO `marketplacebd_test`.`rol_usuario` (`estado`, `idrol`, `idusuario`) VALUES ('1', '2', '4');
INSERT INTO `marketplacebd_test`.`rol_usuario` (`estado`, `idrol`, `idusuario`) VALUES ('1', '2', '5');

-- IMAGEN_PRODUCTO2
INSERT INTO `marketplacebd_test`.`imagen_producto` (`direccion`, `idproducto`) VALUES('/img/reloj1.jpg',6);   
INSERT INTO `marketplacebd_test`.`imagen_producto` (`direccion`, `idproducto`) VALUES('/img/reloj2.jpg',6); 
INSERT INTO `marketplacebd_test`.`imagen_producto` (`direccion`, `idproducto`) VALUES( '/img/reloj3.jpg',6);
INSERT INTO `marketplacebd_test`.`imagen_producto` (`direccion`, `idproducto`) VALUES ('/img/product2/xiaomi1.png', '7');
INSERT INTO `marketplacebd_test`.`imagen_producto` (`direccion`, `idproducto`) VALUES ('/img/product2/xiaomi2.png', '7');
INSERT INTO `marketplacebd_test`.`imagen_producto` (`direccion`, `idproducto`) VALUES ('/img/product2/xiaomi3.png', '7');
INSERT INTO `marketplacebd_test`.`imagen_producto` (`direccion`, `idproducto`) VALUES('/img/mando1.jpg',14);   
INSERT INTO `marketplacebd_test`.`imagen_producto` (`direccion`, `idproducto`) VALUES('/img/mando2.jpg',14); 
INSERT INTO `marketplacebd_test`.`imagen_producto` (`direccion`, `idproducto`) VALUES('/img/mando3.jpg',14);
INSERT INTO `marketplacebd_test`.`imagen_producto` (`direccion`, `idproducto`) VALUES( '/img/cable1.jpg',15);   
INSERT INTO `marketplacebd_test`.`imagen_producto` (`direccion`, `idproducto`) VALUES('/img/cable2.jpg',15); 
INSERT INTO `marketplacebd_test`.`imagen_producto` (`direccion`, `idproducto`) VALUES('/img/cable3.jpg',15);
INSERT INTO `marketplacebd_test`.`imagen_producto` (`direccion`, `idproducto`) VALUES('/img/carga1.jpg',16);   
INSERT INTO `marketplacebd_test`.`imagen_producto` (`direccion`, `idproducto`) VALUES('/img/carga2.jpg',16); 
INSERT INTO `marketplacebd_test`.`imagen_producto` (`direccion`, `idproducto`) VALUES('/img/carga3.jpg',16);


 INSERT INTO `marketplacebd_test`.`productosjuntos`
(`idproductosjuntos`,
`producto1`,
`producto2`)
VALUES
(1,
14,
15);

INSERT INTO `marketplacebd_test`.`productosjuntos`
(`idproductosjuntos`,
`producto1`,
`producto2`)
VALUES
(2,
14,
16);

INSERT INTO `marketplacebd_test`.`productosjuntos`
(`idproductosjuntos`,
`producto1`,
`producto2`)
VALUES
(3,
15,
14);

INSERT INTO `marketplacebd_test`.`productosjuntos`
(`idproductosjuntos`,
`producto1`,
`producto2`)
VALUES
(4,
16,
14);

-- DATOS PARA EL PRIMER COMPRADOR y para productos deseados
INSERT INTO `marketplacebd_test`.`usuario` ( `usuario`, `password`, `ultimo_login`, `idcompradorfrecuente`, `historial_des_usuario`) VALUES ('Axe', 'Viper', '2020-10-08 21:00:00', '2', 'prueba');

INSERT INTO `marketplacebd_test`.`persona` (`nombre`, `apellido`, `telefono`, `foto`, `correo`, `idusuario`) VALUES ('Axe', 'Strong', '961090046', 'prueba', 'axe@gmail.com', '6');

INSERT INTO `marketplacebd_test`.`rol_usuario` (`estado`, `idrol`, `idusuario`) VALUES ('1', '3', '6');
INSERT INTO  producto_deseado (idproductodeseado, idusuario, idproducto,fecha_deseo,estado) VALUES(1, 6,6, '2020-10-08 21:00:00',1);


-- Seguimiento Pedido
INSERT INTO `marketplacebd_test`.`seguimiento_pedido`
(`idseguimientopedido`,`tiposeguimiento`,`estado`) VALUES (1,"Terrestre",2);


-- Pedido
INSERT INTO `marketplacebd_test`.`pedido`
(`idpedido`,`codigo`,`fecha`,`direccion_entrega`,`cantidad_producto`,`estado_pedido`,`precio_producto`,`descuento_producto`,`pago_pendiente`,`idusuario`,`idcompradorfrecuente`,`idseguimientopedido`)
VALUES
(1,"PED-01",'2020-05-02 15:30:00',"Av Avenida de las Avenidas",2,1,100.52,4.32,"Pago pendiente",1,1,1);

-- Cupon descuento
INSERT INTO `marketplacebd_test`.`cupon_descuento`
(
`valor_descuento`,
`idproducto`)
VALUES
(
0.32,6);


-- Carrito
INSERT INTO `marketplacebd_test`.`carrito`
(`idcarrito`,
`precio_total`,
`unidad_por_producto`,
`idproducto`,
`idcupon`,
`idusuario`)
VALUES
(2,
256.2,
3,
7,
1,
6);

INSERT INTO `marketplacebd_test`.`carrito`
(`idcarrito`,
`precio_total`,
`unidad_por_producto`,
`idproducto`,
`idcupon`,
`idusuario`)
VALUES
(3,
100.2,
2,
9,
2,
6);
