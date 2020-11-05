package pe.edu.unsch.entities;
// Generated 4 Nov 2020, 21:14:55 by Hibernate Tools 5.1.10.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * PagoPaypal generated by hbm2java
 */
@Entity
@Table(name = "pago_paypal", catalog = "marketplacebd_test")
public class PagoPaypal implements java.io.Serializable {

	private int idpagopaypal;
	private Pago pago;
	private String nombre;
	private String direccionCorreo;

	public PagoPaypal() {
	}

	public PagoPaypal(int idpagopaypal, Pago pago) {
		this.idpagopaypal = idpagopaypal;
		this.pago = pago;
	}

	public PagoPaypal(int idpagopaypal, Pago pago, String nombre, String direccionCorreo) {
		this.idpagopaypal = idpagopaypal;
		this.pago = pago;
		this.nombre = nombre;
		this.direccionCorreo = direccionCorreo;
	}

	@Id

	@Column(name = "idpagopaypal", unique = true, nullable = false)
	public int getIdpagopaypal() {
		return this.idpagopaypal;
	}

	public void setIdpagopaypal(int idpagopaypal) {
		this.idpagopaypal = idpagopaypal;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idpago", nullable = false)
	public Pago getPago() {
		return this.pago;
	}

	public void setPago(Pago pago) {
		this.pago = pago;
	}

	@Column(name = "nombre", length = 20)
	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Column(name = "direccion_correo", length = 45)
	public String getDireccionCorreo() {
		return this.direccionCorreo;
	}

	public void setDireccionCorreo(String direccionCorreo) {
		this.direccionCorreo = direccionCorreo;
	}

}