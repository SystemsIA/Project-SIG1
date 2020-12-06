package pe.edu.unsch.service.impl;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.edu.unsch.dao.CarritoDao;
import pe.edu.unsch.dao.CuponDescuentoDao;
import pe.edu.unsch.entities.Carrito;
import pe.edu.unsch.entities.CuponDescuento;
import pe.edu.unsch.entities.Producto;
import pe.edu.unsch.entities.Usuario;
import pe.edu.unsch.service.CarritoService;

@Service
@Transactional
public class CarritoServiceImpl implements CarritoService {

	@Autowired
	private CarritoDao carritoDao;

	@Autowired
	private CuponDescuentoDao cuponDescuentoDao;

	@Override
	public void agregarProductoACarrito(Producto producto, Usuario usuario) {

		CuponDescuento descuento = new CuponDescuento(producto, new BigDecimal(0));

		Carrito carrito = new Carrito(descuento, producto, usuario, 0, 0);

		cuponDescuentoDao.save(descuento);
		carritoDao.save(carrito);

	}

}
