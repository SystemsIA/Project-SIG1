package pe.edu.unsch.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.edu.unsch.dao.CategoriaProductoDao;
import pe.edu.unsch.dao.ProductoDao;
import pe.edu.unsch.service.CategoriaProductoService;

@Service
@Transactional
public class CategoriaProductoServiceImpl implements CategoriaProductoService {

	@Autowired
	private ProductoDao productoDao;

	@Autowired
	private CategoriaProductoDao categoriaProductoDao;

	@Override
	public void eliminarCategoriaProducto(long idproducto) {

		categoriaProductoDao.delete(productoDao.categoriaProducto(idproducto));

	}

}
