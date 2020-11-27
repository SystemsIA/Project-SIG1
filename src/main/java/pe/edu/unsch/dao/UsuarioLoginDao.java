package pe.edu.unsch.dao;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import pe.edu.unsch.entities.Usuario;

@Repository
public interface UsuarioLoginDao extends JpaRepository<Usuario, Serializable> {
	// new Usuario(u.usuario as usuario, u.password as password, rol.idrol as
	// idusuario, per.idpersona as idpersona )
	@Query("select u " + "from Usuario u inner join u.rolUsuarios ru inner join ru.rol rl "
			+ "where rl.nombre='Comprador' and u.usuario = ?1 and u.password = ?2")
	Usuario loginComprador(String usuario, String password);

	@Query("select u " + "from Usuario u inner join u.rolUsuarios ru inner join ru.rol rl "
			+ "where rl.nombre='Vendedor' and u.usuario = ?1 and u.password = ?2")
	Usuario loginVendedor(String usuario, String password);

	@Query("select u " + "from Usuario u inner join u.rolUsuarios ru inner join ru.rol rl "
			+ "where rl.nombre='Administrador' and u.usuario = ?1 and u.password = ?2")
	Usuario loginAdmin(String usuario, String password);

}
