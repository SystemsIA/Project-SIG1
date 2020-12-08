package pe.edu.unsch.service;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import pe.edu.unsch.entities.Pedido;
import pe.edu.unsch.entities.Producto;
import pe.edu.unsch.entities.Usuario;

public interface UsuarioService extends UserDetailsService {

	List<Producto> listarProductosDeseados(int idusuario);

	List<Pedido> listarPedidosDeComprador(int idcomprador);

	void crearUsuario(String usuario, String password);

	default boolean existsUsuario(String username) {
		return false;
	}

	Usuario usuarioAuthenticated(String username);
}
