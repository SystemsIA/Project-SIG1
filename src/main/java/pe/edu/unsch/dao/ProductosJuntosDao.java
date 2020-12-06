package pe.edu.unsch.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import pe.edu.unsch.entities.Producto;

@Repository
public interface ProductosJuntosDao extends JpaRepository<Producto, Serializable> {

	@Query(value = "select p from Producto p " + "inner join p.productosjuntosesForProducto2 pj "
			+ "inner join pj.productoByProducto1 p1 " + "where p1.idproducto = ?1")
	public List<Producto> ListarProductosJuntosH(long idproducto);
}
