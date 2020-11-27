package pe.edu.unsch.service;

import java.util.List;

import pe.edu.unsch.entities.Producto;

public interface ProductoCarritoService {
	void eliminarProductoDeCarrito(long idproducto);

	List<Producto> listaProductoCarrito(int idusuario);
}
