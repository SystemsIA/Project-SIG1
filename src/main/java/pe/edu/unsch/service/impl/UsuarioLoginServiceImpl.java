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
	public Usuario login(String usuario, String password) {
		return usuarioLoginDao.login(usuario, password);
	}

}
