package pe.edu.unsch.dao;

import java.io.Serializable;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import pe.edu.unsch.entities.CategoriaProducto;
import pe.edu.unsch.entities.Producto;

@Repository
public interface ProductoDao extends JpaRepository<Producto, Serializable> {

	@Query(value = " SELECT prod FROM Producto prod" + " WHERE prod.idproducto = ?1 ")
	Producto mostrardetalles(long idproducto);

	@Query(value = "select pr " + "from Producto pr " + "where pr.destacado=1")
	List<Producto> listaProductoDestacados();

	@Query("select distinct new Producto(pro.idproducto as idproducto, pro.codigo as codigo, pro.nombre as nombre, "
			+ "pro.descripcion as descripcion, pro.cantidad as cantidad, " + "pro.precioUnitario as precioUnitario, "
			+ "cat.nombre as nombreCategoria, pro.persona as persona, pro.cantidadventas as cantidadventas, pro.marca as marca, gp.descripcion as desGarantia) "
			+ "from Producto pro " + "inner join pro.categoriaProductos cp " + "inner join cp.categoria cat "
			+ "inner join pro.persona per " + "join per.usuario u " + "join u.rolUsuarios ruls " + "join ruls.rol rl "
			+ "inner join pro.garantiaProducto gp where rl.nombre='Vendedor' and u.idusuario = ?1 "
			+ " order by nombre")
	List<Producto> listaProductosVendedor(Integer idPersona);

	@Query(value = "select distinct cp from CategoriaProducto cp inner join cp.producto pr where pr.idproducto = ?1")
	CategoriaProducto categoriaProducto(long idproducto);
}
