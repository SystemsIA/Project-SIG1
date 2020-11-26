package pe.edu.unsch.service;

import java.util.List;

import pe.edu.unsch.entities.Producto;

public interface CarritoService {
	void eliminarProductoDeCarrito(int idproducto);

	List<Producto> listaProductoCarrito(int idusuario);
}
