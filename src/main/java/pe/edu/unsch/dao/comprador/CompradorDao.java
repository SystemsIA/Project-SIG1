package pe.edu.unsch.dao.comprador;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import pe.edu.unsch.entities.Pedido;
import pe.edu.unsch.entities.Usuario;

@Repository
public interface CompradorDao extends JpaRepository<Usuario, Serializable> {

	@Query(value = "select new Pedido(pd.idpedido as idpedido,pd.codigo as codigo,pd.fecha as fecha,pd.direccionEntrega as direccionEntrega, pd.estadoPedido as estadoPedido) "
			+ "from Usuario u " + "join u.pedidos pd " + "join u.rolUsuarios ru " + "join ru.rol r "
			+ "where r.nombre='Comprador' and u.idusuario = ?1")
	List<Pedido> listarPedidosDeComprador(int idcomprador);

}
