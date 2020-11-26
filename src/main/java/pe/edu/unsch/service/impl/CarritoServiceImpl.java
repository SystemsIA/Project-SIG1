package pe.edu.unsch.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.edu.unsch.dao.CarritoDao;
import pe.edu.unsch.entities.Producto;
import pe.edu.unsch.service.CarritoService;

@Service
@Transactional
public class CarritoServiceImpl implements CarritoService {
	@Autowired
	private CarritoDao carritoDao;

	@Override
	public void eliminarProductoDeCarrito(int idproducto) {
		carritoDao.eliminarProductoDeCarrito(idproducto);
	}

	@Override
	public List<Producto> listaProductoCarrito(int idusuario) {
		// TODO Auto-generated method stub
		return carritoDao.listaProductoCarrito(idusuario);
	}
	
}
