package pe.edu.unsch.entities;
// Generated 19-nov-2020 18:08:16 by Hibernate Tools 5.1.10.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Boleta generated by hbm2java
 */
@Entity
@Table(name = "boleta", catalog = "marketplacebd_test")
public class Boleta implements java.io.Serializable {

	private int idboleta;
	private Pago pago;
	private int cantidadProducto;

	public Boleta() {
	}

	public Boleta(int idboleta, Pago pago, int cantidadProducto) {
		this.idboleta = idboleta;
		this.pago = pago;
		this.cantidadProducto = cantidadProducto;
	}

	@Id

	@Column(name = "idboleta", unique = true, nullable = false)
	public int getIdboleta() {
		return this.idboleta;
	}

	public void setIdboleta(int idboleta) {
		this.idboleta = idboleta;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idpago", nullable = false)
	public Pago getPago() {
		return this.pago;
	}

	public void setPago(Pago pago) {
		this.pago = pago;
	}

	@Column(name = "cantidad_producto", nullable = false)
	public int getCantidadProducto() {
		return this.cantidadProducto;
	}

	public void setCantidadProducto(int cantidadProducto) {
		this.cantidadProducto = cantidadProducto;
	}

}
