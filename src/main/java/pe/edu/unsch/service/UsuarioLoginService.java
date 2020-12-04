package pe.edu.unsch.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import pe.edu.unsch.entities.Usuario;

public interface UsuarioLoginService extends UserDetailsService {

	Usuario loginComprador(String usuario, String password);

	Usuario loginVendedor(String usuario, String password);

	Usuario loginAdmin(String usuario, String password);

}
