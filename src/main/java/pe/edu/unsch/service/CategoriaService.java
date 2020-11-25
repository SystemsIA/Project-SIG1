package pe.edu.unsch.service;

import java.util.List;

import pe.edu.unsch.entities.Categoria;

public interface CategoriaService {
	
	List<Categoria> listaCategorias();
	
	//Borrar categoria por el Id
	void borrarCategoria(Integer idCategoria);

}
