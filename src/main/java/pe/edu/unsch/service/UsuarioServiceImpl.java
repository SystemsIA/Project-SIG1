package pe.edu.unsch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.edu.unsch.dao.UsuarioDao;
import pe.edu.unsch.entities.Producto;
import pe.edu.unsch.entities.ProductoDeseado;

@Service
@Transactional
public class UsuarioServiceImpl implements UsuarioService {
	
	@Autowired
	private UsuarioDao usuarioDao;

	@Override
	public List<Producto> listarProductosDeseados(int idusuario) {
		// TODO Auto-generated method stub
		return usuarioDao.listarProductosDeseados(idusuario);
		
	}

}
