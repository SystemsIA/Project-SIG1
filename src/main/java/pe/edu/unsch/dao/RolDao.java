package pe.edu.unsch.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import pe.edu.unsch.entities.Rol;

@Repository
public interface RolDao extends JpaRepository<Rol, Serializable> {

	@Query(value = "select new Rol(rl.idrol as idrol, rl.nombre as nombre) " + "from Usuario us "
			+ "join us.rolUsuarios rls " + "join rls.rol rl " + "where us.usuario=?1")
	List<Rol> rolesPorUsuario(String usuario);

	Rol findByNombre(String nombre);

}
