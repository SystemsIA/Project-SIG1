package pe.edu.unsch.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.edu.unsch.dao.CarritoDao;
import pe.edu.unsch.dao.ProductoCarritoDao;
import pe.edu.unsch.entities.Producto;
import pe.edu.unsch.service.ProductoCarritoService;

@Service
@Transactional
public class ProductoCarritoServiceImpl implements ProductoCarritoService {
	@Autowired
	private ProductoCarritoDao productoCarritoDao;

	@Autowired
	private CarritoDao carritoDao;

	@Override
	public void eliminarProductoDeCarrito(long idproducto) {

		carritoDao.delete(productoCarritoDao.eliminarProductoDeCarrito(idproducto));
	}

	@Override
	public List<Producto> listaProductoCarrito(int idusuario) {
		// TODO Auto-generated method stub
		return productoCarritoDao.listaProductoCarrito(idusuario);
	}

}
