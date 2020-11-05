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
 * Reclamo generated by hbm2java
 */
@Entity
@Table(name = "reclamo", catalog = "marketplacebd_test")
public class Reclamo implements java.io.Serializable {

	private int idreclamo;
	private Usuario usuario;
	private String descripcion;
	private String tipoReclamo;

	public Reclamo() {
	}

	public Reclamo(int idreclamo, Usuario usuario, String descripcion, String tipoReclamo) {
		this.idreclamo = idreclamo;
		this.usuario = usuario;
		this.descripcion = descripcion;
		this.tipoReclamo = tipoReclamo;
	}

	@Id

	@Column(name = "idreclamo", unique = true, nullable = false)
	public int getIdreclamo() {
		return this.idreclamo;
	}

	public void setIdreclamo(int idreclamo) {
		this.idreclamo = idreclamo;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idusuario", nullable = false)
	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	@Column(name = "descripcion", nullable = false, length = 65535)
	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	@Column(name = "tipo_reclamo", nullable = false, length = 80)
	public String getTipoReclamo() {
		return this.tipoReclamo;
	}

	public void setTipoReclamo(String tipoReclamo) {
		this.tipoReclamo = tipoReclamo;
	}

}