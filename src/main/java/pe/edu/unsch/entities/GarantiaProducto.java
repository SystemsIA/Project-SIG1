package pe.edu.unsch.entities;
// Generated 4 Nov 2020, 21:14:55 by Hibernate Tools 5.1.10.Final

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * GarantiaProducto generated by hbm2java
 */
@Entity
@Table(name = "garantia_producto", catalog = "marketplacebd_test")
public class GarantiaProducto implements java.io.Serializable {

	private int idgarantiaproducto;
	private Date inicioGarantia;
	private Date finalGarantia;
	private String descripcion;
	private Set<Producto> productos = new HashSet<Producto>(0);

	public GarantiaProducto() {
	}

	public GarantiaProducto(int idgarantiaproducto, Date inicioGarantia, Date finalGarantia, String descripcion) {
		this.idgarantiaproducto = idgarantiaproducto;
		this.inicioGarantia = inicioGarantia;
		this.finalGarantia = finalGarantia;
		this.descripcion = descripcion;
	}

	public GarantiaProducto(int idgarantiaproducto, Date inicioGarantia, Date finalGarantia, String descripcion,
			Set<Producto> productos) {
		this.idgarantiaproducto = idgarantiaproducto;
		this.inicioGarantia = inicioGarantia;
		this.finalGarantia = finalGarantia;
		this.descripcion = descripcion;
		this.productos = productos;
	}

	@Id

	@Column(name = "idgarantiaproducto", unique = true, nullable = false)
	public int getIdgarantiaproducto() {
		return this.idgarantiaproducto;
	}

	public void setIdgarantiaproducto(int idgarantiaproducto) {
		this.idgarantiaproducto = idgarantiaproducto;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "inicio_garantia", nullable = false, length = 19)
	public Date getInicioGarantia() {
		return this.inicioGarantia;
	}

	public void setInicioGarantia(Date inicioGarantia) {
		this.inicioGarantia = inicioGarantia;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "final_garantia", nullable = false, length = 19)
	public Date getFinalGarantia() {
		return this.finalGarantia;
	}

	public void setFinalGarantia(Date finalGarantia) {
		this.finalGarantia = finalGarantia;
	}

	@Column(name = "descripcion", nullable = false, length = 300)
	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "garantiaProducto")
	public Set<Producto> getProductos() {
		return this.productos;
	}

	public void setProductos(Set<Producto> productos) {
		this.productos = productos;
	}

}