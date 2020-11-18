package pe.edu.unsch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.edu.unsch.dao.ProductoDao;
import pe.edu.unsch.entities.Producto;

@Service
@Transactional
public class ProductoServiceImpl implements ProductoService{

	@Autowired
	private ProductoDao productodao;

	@Override
	public Producto mostrardetalles(long idproducto) {
		// TODO Auto-generated method stub
		return productodao.mostrardetalles(idproducto);
	}
	
}
