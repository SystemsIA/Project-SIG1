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
 * Carrito generated by hbm2java
 */
@Entity
@Table(name = "carrito", catalog = "marketplacebd_test")
public class Carrito implements java.io.Serializable {

	private int idcarrito;
	private CuponDescuento cuponDescuento;
	private Producto producto;
	private Usuario usuario;
	private double precioTotal;
	private int unidadPorProducto;

	public Carrito() {
	}

	public Carrito(int idcarrito, CuponDescuento cuponDescuento, Producto producto, Usuario usuario, double precioTotal,
			int unidadPorProducto) {
		this.idcarrito = idcarrito;
		this.cuponDescuento = cuponDescuento;
		this.producto = producto;
		this.usuario = usuario;
		this.precioTotal = precioTotal;
		this.unidadPorProducto = unidadPorProducto;
	}

	@Id

	@Column(name = "idcarrito", unique = true, nullable = false)
	public int getIdcarrito() {
		return this.idcarrito;
	}

	public void setIdcarrito(int idcarrito) {
		this.idcarrito = idcarrito;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idcupon", nullable = false)
	public CuponDescuento getCuponDescuento() {
		return this.cuponDescuento;
	}

	public void setCuponDescuento(CuponDescuento cuponDescuento) {
		this.cuponDescuento = cuponDescuento;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idproducto", nullable = false)
	public Producto getProducto() {
		return this.producto;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idusuario", nullable = false)
	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	@Column(name = "precio_total", nullable = false, precision = 22, scale = 0)
	public double getPrecioTotal() {
		return this.precioTotal;
	}

	public void setPrecioTotal(double precioTotal) {
		this.precioTotal = precioTotal;
	}

	@Column(name = "unidad_por_producto", nullable = false)
	public int getUnidadPorProducto() {
		return this.unidadPorProducto;
	}

	public void setUnidadPorProducto(int unidadPorProducto) {
		this.unidadPorProducto = unidadPorProducto;
	}

}
