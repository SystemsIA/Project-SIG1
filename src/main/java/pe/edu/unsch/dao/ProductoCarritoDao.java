package pe.edu.unsch.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import pe.edu.unsch.entities.Producto;

@Repository
public interface ProductoCarritoDao extends JpaRepository<Producto, Serializable> {

	@Query(value = "SELECT pr.* " + "FROM carrito car " + "INNER JOIN producto pr "
			+ "on car.idproducto = pr.idproducto " + "INNER JOIN usuario u " + "on u.idusuario = car.idusuario "
			+ "INNER JOIN rol_usuario rl " + "on rl.idusuario = u.idusuario " + "INNER JOIN rol r "
			+ "on r.idrol = rl.idrol " + "where r.nombre = 'Comprador' and u.idusuario=?1", nativeQuery = true)
	List<Producto> listaProductoCarrito(int idusuario);

	@Modifying
	@Query(value = "delete Carrito cr where cr.producto.idproducto = ?1")
	void eliminarProductoDeCarrito(int idproducto);

}
