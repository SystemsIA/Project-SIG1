package pe.edu.unsch.dao;

import java.io.Serializable;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import pe.edu.unsch.entities.Producto;

@Repository
public interface ProductoDao extends JpaRepository<Producto, Serializable> {

	@Query(value = " SELECT prod FROM Producto prod" + " WHERE prod.idproducto = ?1 ")
	Producto mostrardetalles(long idproducto);

	@Query(value = "select pr " + "from Producto pr " + "where pr.destacado=1")
	List<Producto> listaProductoDestacados();

	@Query("select new Producto(pro.codigo as codigo, pro.nombre as nombre, "
			+ "pro.descripcion as descripcion, pro.cantidad as cantidad, " + "pro.precioUnitario as precioUnitario, "
			+ " cat.nombre as marca, pro.persona as persona) " + "from Producto pro "
			+ "inner join pro.categoriaProductos cp " + "inner join cp.categoria cat " + "inner join pro.persona per "
			+ " where per.idpersona = ?1 " + "order by nombre")
	List<Producto> listaProductosVendedor(Integer idPersona);
}
