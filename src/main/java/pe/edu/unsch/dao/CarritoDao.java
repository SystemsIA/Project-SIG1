package pe.edu.unsch.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import pe.edu.unsch.entities.Carrito;
import pe.edu.unsch.entities.Producto;

@Repository
public interface CarritoDao extends JpaRepository<Carrito, Serializable> {

	@Query(value = "select new Producto(pr.idproducto as idproducto,pr.nombre as nombre,pr.precioUnitario as precioUnitario,pr.cantidad as cantidad, pr.imagenProductos as imagenProductos) "
			+ "from Carrito cr " + "join cr.producto pr " + "join cr.usuario u " + "join u.rolUsuarios ruls "
			+ "join ruls.rol rl " + "where rl.nombre = 'Comprador' and u.idusuario = ?1")
	List<Producto> listaProductoCarrito(int idusuario);

	@Modifying
	@Query(value = "delete from Carrito cr where cr.producto.idproducto = ?1")
	void eliminarProductoDeCarrito(int idproducto);

}
