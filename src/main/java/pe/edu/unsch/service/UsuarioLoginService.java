package pe.edu.unsch.service;

import pe.edu.unsch.entities.Usuario;

public interface UsuarioLoginService {
	
	Usuario loginComprador(String usuario, String password);
	
	Usuario loginVendedor(String usuario, String password);
	
	Usuario loginAdmin(String usuario, String password);

}
