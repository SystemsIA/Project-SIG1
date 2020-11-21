package pe.edu.unsch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import pe.edu.unsch.dao.ProductosJuntosDao;
import pe.edu.unsch.entities.Producto;


@Repository("productoJuntosService")
@Transactional
public class ProductosJuntosServiceImpl implements ProductosJuntosService{
	
	@Autowired
	private ProductosJuntosDao productosJuntosDao;
	
	@Override
	public List<Producto> ListarProductosJuntosH(long idproducto) {
	
		return productosJuntosDao.ListarProductosJuntosH(idproducto);
	}
	
	

}
