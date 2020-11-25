package pe.edu.unsch.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import pe.edu.unsch.entities.Producto;

import pe.edu.unsch.entities.Usuario;

@Repository
public interface UsuarioDao  extends JpaRepository<Usuario, Serializable>{
	
	@Query( value = " SELECT p "
			+ "FROM Usuario us "
			+ "join us.productoDeseados prods "
			+ "join prods.producto p "
			+ "join us.rolUsuarios rp "
			+ "join rp.rol nr " 
			+ "where nr.nombre = 'Comprador' and us.idusuario = ?1")
	List<Producto> listarProductosDeseados ( int idusuario);
	

}
