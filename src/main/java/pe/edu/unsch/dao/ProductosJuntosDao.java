package pe.edu.unsch.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import pe.edu.unsch.entities.Producto;

@Repository
public interface ProductosJuntosDao extends JpaRepository<Producto, Serializable>{
	
	
		@Query(value = "select p.* From producto p inner join productosjuntos pj on (p.idproducto = pj.producto2) where pj.producto1 = ?1", nativeQuery= true)
		public List<Producto> ListarProductosJuntosH(long idproducto);
}
