package pe.edu.unsch.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.edu.unsch.dao.ProductoDao;
import pe.edu.unsch.entities.Producto;
import pe.edu.unsch.service.ProductoService;

@Service
@Transactional
public class ProductoServiceImpl implements ProductoService {

	@Autowired
	private ProductoDao productodao;

	@Override
	public Producto traerProducto(long idproducto) {
		// TODO Auto-generated method stub
		return productodao.findByIdproducto(idproducto);
	}

	@Override
	public List<Producto> listaProductoDestacados() {
		// TODO Auto-generated method stub
		return productodao.listaProductoDestacados();
	}

	// ProductosVendedor
	@Override
	public List<Producto> listaProductosVendedor(Integer idPersona) {
		return productodao.listaProductosVendedor(idPersona);
	}
}
