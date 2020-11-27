package pe.edu.unsch.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import pe.edu.unsch.dao.UsuarioLoginDao;
import pe.edu.unsch.entities.Usuario;
import pe.edu.unsch.service.UsuarioLoginService;

@Repository("usuarioLoginService")
@Transactional
public class UsuarioLoginServiceImpl implements UsuarioLoginService {

	@Autowired
	private UsuarioLoginDao usuarioLoginDao;

	@Override
	public Usuario loginComprador(String usuario, String password) {
		// TODO Auto-generated method stub
		return usuarioLoginDao.loginComprador(usuario, password);
	}

	@Override
	public Usuario loginVendedor(String usuario, String password) {
		// TODO Auto-generated method stub
		return usuarioLoginDao.loginVendedor(usuario, password);
	}

	@Override
	public Usuario loginAdmin(String usuario, String password) {
		// TODO Auto-generated method stub
		return usuarioLoginDao.loginAdmin(usuario, password);
	}

}
