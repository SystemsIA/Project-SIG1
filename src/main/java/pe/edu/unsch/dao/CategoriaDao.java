package pe.edu.unsch.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import pe.edu.unsch.entities.Categoria;

@Repository
public interface CategoriaDao extends JpaRepository<Categoria, Integer>{

	@Query("select new Categoria(cat.idcategoria as idcategoria, cat.nombre as nombre, cat.desrcipcion as desrcipcion, "
			+ "cat.idcategoria as nProductos, "
			+ "cat.idcategoria as proVendidos ) "
			+ "from Producto pro inner join pro.categoriaProductos cp "
			+ "right join cp.categoria cat "
			+ "group by idcategoria "
			+ "order by nombre")	
	List<Categoria> listaCategorias();
	
	@Query("select c from Categoria c where c.idcategoria = ?1")
	Categoria categoriad(int id);
}
