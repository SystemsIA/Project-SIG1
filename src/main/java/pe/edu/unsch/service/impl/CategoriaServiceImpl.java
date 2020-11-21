package pe.edu.unsch.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.edu.unsch.dao.CategoriaDao;
import pe.edu.unsch.entities.Categoria;
import pe.edu.unsch.service.CategoriaService;

@Service
@Transactional
public class CategoriaServiceImpl implements CategoriaService{
	
	@Autowired
	private CategoriaDao categoriaDao;
	
	@Override
	public List<Categoria> listaCategorias(){
		return categoriaDao.listaCategorias();
	}

}
