package pe.edu.unsch.entities;
// Generated 19-nov-2020 18:08:16 by Hibernate Tools 5.1.10.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * ProductoValorado generated by hbm2java
 */
@Entity
@Table(name = "producto_valorado", catalog = "marketplacebd_test")
public class ProductoValorado implements java.io.Serializable {

	private Integer idproductovalorado;
	private Producto producto;
	private Usuario usuario;
	private Boolean deseado;
	private Boolean recomendado;

	public ProductoValorado() {
	}

	public ProductoValorado(Producto producto, Usuario usuario) {
		this.producto = producto;
		this.usuario = usuario;
	}

	public ProductoValorado(Producto producto, Usuario usuario, Boolean deseado, Boolean recomendado) {
		this.producto = producto;
		this.usuario = usuario;
		this.deseado = deseado;
		this.recomendado = recomendado;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "idproductovalorado", unique = true, nullable = false)
	public Integer getIdproductovalorado() {
		return this.idproductovalorado;
	}

	public void setIdproductovalorado(Integer idproductovalorado) {
		this.idproductovalorado = idproductovalorado;
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

	@Column(name = "deseado")
	public Boolean getDeseado() {
		return this.deseado;
	}

	public void setDeseado(Boolean deseado) {
		this.deseado = deseado;
	}

	@Column(name = "recomendado")
	public Boolean getRecomendado() {
		return this.recomendado;
	}

	public void setRecomendado(Boolean recomendado) {
		this.recomendado = recomendado;
	}

}
