package pe.edu.unsch.service;

import pe.edu.unsch.entities.Producto;
import pe.edu.unsch.entities.Usuario;

public interface CarritoService {

	void agregarProductoACarrito(Producto producto, Usuario usuario);
}
