package pe.edu.unsch.entities;
// Generated 19-nov-2020 18:08:16 by Hibernate Tools 5.1.10.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Persona generated by hbm2java
 */
@Entity
@Table(name = "persona", catalog = "marketplacebd_test")
public class Persona implements java.io.Serializable {

	private Integer idpersona;
	private Usuario usuario;
	private String nombre;
	private String apellido;
	private String telefono;
	private String foto;
	private String correo;
	private Set<Producto> productos = new HashSet<Producto>(0);
	private Set<Reporte> reportes = new HashSet<Reporte>(0);
	private Set<PersonaDireccion> personaDireccions = new HashSet<PersonaDireccion>(0);
	private Set<LibroReclamacion> libroReclamacions = new HashSet<LibroReclamacion>(0);
	private Set<ProductoMasVisto> productoMasVistos = new HashSet<ProductoMasVisto>(0);
	private Set<Notificacion> notificacions = new HashSet<Notificacion>(0);
	private Set<ProductoFavorito> productoFavoritos = new HashSet<ProductoFavorito>(0);

	public Persona() {
	}

	public Persona(Usuario usuario, String correo) {
		this.usuario = usuario;
		this.correo = correo;
	}

	public Persona(Usuario usuario, String nombre, String apellido, String telefono, String foto, String correo,
			Set<Producto> productos, Set<Reporte> reportes, Set<PersonaDireccion> personaDireccions,
			Set<LibroReclamacion> libroReclamacions, Set<ProductoMasVisto> productoMasVistos,
			Set<Notificacion> notificacions, Set<ProductoFavorito> productoFavoritos) {
		this.usuario = usuario;
		this.nombre = nombre;
		this.apellido = apellido;
		this.telefono = telefono;
		this.foto = foto;
		this.correo = correo;
		this.productos = productos;
		this.reportes = reportes;
		this.personaDireccions = personaDireccions;
		this.libroReclamacions = libroReclamacions;
		this.productoMasVistos = productoMasVistos;
		this.notificacions = notificacions;
		this.productoFavoritos = productoFavoritos;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "idpersona", unique = true, nullable = false)
	public Integer getIdpersona() {
		return this.idpersona;
	}

	public void setIdpersona(Integer idpersona) {
		this.idpersona = idpersona;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idusuario", nullable = false)
	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	@Column(name = "nombre", length = 45)
	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Column(name = "apellido", length = 45)
	public String getApellido() {
		return this.apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	@Column(name = "telefono", length = 9)
	public String getTelefono() {
		return this.telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	@Column(name = "foto", length = 45)
	public String getFoto() {
		return this.foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	@Column(name = "correo", nullable = false, length = 45)
	public String getCorreo() {
		return this.correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "persona")
	public Set<Producto> getProductos() {
		return this.productos;
	}

	public void setProductos(Set<Producto> productos) {
		this.productos = productos;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "persona")
	public Set<Reporte> getReportes() {
		return this.reportes;
	}

	public void setReportes(Set<Reporte> reportes) {
		this.reportes = reportes;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "persona")
	public Set<PersonaDireccion> getPersonaDireccions() {
		return this.personaDireccions;
	}

	public void setPersonaDireccions(Set<PersonaDireccion> personaDireccions) {
		this.personaDireccions = personaDireccions;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "persona")
	public Set<LibroReclamacion> getLibroReclamacions() {
		return this.libroReclamacions;
	}

	public void setLibroReclamacions(Set<LibroReclamacion> libroReclamacions) {
		this.libroReclamacions = libroReclamacions;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "persona")
	public Set<ProductoMasVisto> getProductoMasVistos() {
		return this.productoMasVistos;
	}

	public void setProductoMasVistos(Set<ProductoMasVisto> productoMasVistos) {
		this.productoMasVistos = productoMasVistos;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "persona")
	public Set<Notificacion> getNotificacions() {
		return this.notificacions;
	}

	public void setNotificacions(Set<Notificacion> notificacions) {
		this.notificacions = notificacions;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "persona")
	public Set<ProductoFavorito> getProductoFavoritos() {
		return this.productoFavoritos;
	}

	public void setProductoFavoritos(Set<ProductoFavorito> productoFavoritos) {
		this.productoFavoritos = productoFavoritos;
	}

}
