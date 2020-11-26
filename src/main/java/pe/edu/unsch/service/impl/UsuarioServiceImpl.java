package pe.edu.unsch.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.edu.unsch.dao.UsuarioDao;
import pe.edu.unsch.dao.comprador.CompradorDao;
import pe.edu.unsch.entities.Pedido;
import pe.edu.unsch.entities.Producto;
import pe.edu.unsch.service.UsuarioService;

@Service
@Transactional
public class UsuarioServiceImpl implements UsuarioService {

	@Autowired
	private UsuarioDao usuarioDao;

	@Autowired
	private CompradorDao compradorDao;

	@Override
	public List<Producto> listarProductosDeseados(int idusuario) {
		// TODO Auto-generated method stub
		return usuarioDao.listarProductosDeseados(idusuario);

	}

	@Override
	public List<Pedido> listarPedidosDeComprador(int idcomprador) {
		// TODO Auto-generated method stub
		return compradorDao.listarPedidosDeComprador(idcomprador);
	}

}
