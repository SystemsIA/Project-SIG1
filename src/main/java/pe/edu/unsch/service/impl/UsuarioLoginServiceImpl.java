package pe.edu.unsch.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.edu.unsch.dao.RolDao;
import pe.edu.unsch.dao.UsuarioLoginDao;
import pe.edu.unsch.entities.Rol;
import pe.edu.unsch.entities.Usuario;
import pe.edu.unsch.service.UsuarioLoginService;

@Service("usuarioLoginService")
@Transactional
public class UsuarioLoginServiceImpl implements UsuarioLoginService {

	@Autowired
	private UsuarioLoginDao usuarioLoginDao;

	@Autowired
	private RolDao rolDao;

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

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		Usuario usuario = usuarioLoginDao.findByUsuario(username);

		List<GrantedAuthority> usuarioRoles = new ArrayList<>();

		for (Rol rol : rolDao.rolesPorUsuario(username)) {
			usuarioRoles.add(new SimpleGrantedAuthority(rol.getNombre()));
		}

		return new User(usuario.getUsuario(), usuario.getPassword(), usuarioRoles);
	}

}
