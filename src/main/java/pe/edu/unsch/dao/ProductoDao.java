package pe.edu.unsch.dao;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import pe.edu.unsch.entities.Producto;

@Repository
public interface ProductoDao extends JpaRepository<Producto, Serializable> {
	
	@Query( value = " SELECT prod FROM Producto prod"
					+ " WHERE prod.idproducto = ?1 ")
	
	Producto mostrardetalles(long idproducto);
}
