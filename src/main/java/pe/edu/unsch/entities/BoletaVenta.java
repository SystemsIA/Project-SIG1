package pe.edu.unsch.entities;
// Generated 4 Nov 2020, 21:14:55 by Hibernate Tools 5.1.10.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * BoletaVenta generated by hbm2java
 */
@Entity
@Table(name = "boleta_venta", catalog = "marketplacebd_test")
public class BoletaVenta implements java.io.Serializable {

	private int idboletaventa;
	private Set<ComprobanteVenta> comprobanteVentas = new HashSet<ComprobanteVenta>(0);

	public BoletaVenta() {
	}

	public BoletaVenta(int idboletaventa) {
		this.idboletaventa = idboletaventa;
	}

	public BoletaVenta(int idboletaventa, Set<ComprobanteVenta> comprobanteVentas) {
		this.idboletaventa = idboletaventa;
		this.comprobanteVentas = comprobanteVentas;
	}

	@Id

	@Column(name = "idboletaventa", unique = true, nullable = false)
	public int getIdboletaventa() {
		return this.idboletaventa;
	}

	public void setIdboletaventa(int idboletaventa) {
		this.idboletaventa = idboletaventa;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "boletaVenta")
	public Set<ComprobanteVenta> getComprobanteVentas() {
		return this.comprobanteVentas;
	}

	public void setComprobanteVentas(Set<ComprobanteVenta> comprobanteVentas) {
		this.comprobanteVentas = comprobanteVentas;
	}

}