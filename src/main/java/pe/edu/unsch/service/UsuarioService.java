package pe.edu.unsch.service;

import java.util.List;

import pe.edu.unsch.entities.Pedido;
import pe.edu.unsch.entities.Producto;

public interface UsuarioService {

	List<Producto> listarProductosDeseados(int idusuario);

	List<Pedido> listarPedidosDeComprador(int idcomprador);
}
