package pe.edu.unsch.service.impl;

import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.edu.unsch.dao.CompradorFrecuentaDao;
import pe.edu.unsch.dao.PersonaDao;
import pe.edu.unsch.dao.RolDao;
import pe.edu.unsch.dao.RolUsuarioDao;
import pe.edu.unsch.dao.UsuarioDao;
import pe.edu.unsch.dao.comprador.CompradorDao;
import pe.edu.unsch.entities.Pedido;
import pe.edu.unsch.entities.Persona;
import pe.edu.unsch.entities.Producto;
import pe.edu.unsch.entities.RolUsuario;
import pe.edu.unsch.entities.Usuario;
import pe.edu.unsch.security.PasswordConfig;
import pe.edu.unsch.service.UsuarioService;

@Service
@Transactional
public class UsuarioServiceImpl implements UsuarioService {

	@Autowired
	private UsuarioDao usuarioDao;

	@Autowired
	private CompradorDao compradorDao;

	@Autowired
	private PasswordConfig passwordEncoder;

	@Autowired
	private RolDao rolDao;

	@Autowired
	private RolUsuarioDao rolUsuarioDao;

	@Autowired
	private CompradorFrecuentaDao compradorFrecuentaDao;

	@Autowired
	private PersonaDao personaDao;

	@Override
	public List<Producto> listarProductosDeseados(int idusuario) {

		return usuarioDao.listarProductosDeseados(idusuario);

	}

	@Override
	public List<Pedido> listarPedidosDeComprador(int idcomprador) {

		return compradorDao.listarPedidosDeComprador(idcomprador);
	}

	@Override
	public void crearUsuario(String usuario, String password) {

		if (!existsUsuario(usuario)) {
			Persona persona = new Persona("", "", "123456789", usuario + "@gmail.com");
			Usuario user = new Usuario(usuario, passwordEncoder.passwordEncoder().encode(password), persona);
			user.setHistorialDesUsuario("Prueba");
			user.setUltimoLogin(new GregorianCalendar().getTime());
			user.setCompradorFrecuente(compradorFrecuentaDao.findByIdcompradorfrecuente(2));
			usuarioDao.save(user);
			persona.setUsuario(user);
			personaDao.save(persona);
			rolUsuarioDao.save(new RolUsuario(rolDao.findByNombre("Comprador"), user));
		}

	}

	@Override
	public boolean existsUsuario(String username) {
		return usuarioDao.findByUsuario(username) != null;
	}

	@Override
	public Usuario usuarioAuthenticated(String username) {

		return usuarioDao.findByUsuario(username);
	}

}
