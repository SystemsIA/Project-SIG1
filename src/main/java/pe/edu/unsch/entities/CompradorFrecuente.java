package pe.edu.unsch.entities;
// Generated 19-nov-2020 18:08:16 by Hibernate Tools 5.1.10.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * CompradorFrecuente generated by hbm2java
 */
@Entity
@Table(name = "comprador_frecuente", catalog = "marketplacebd_test")
public class CompradorFrecuente implements java.io.Serializable {

	private int idcompradorfrecuente;
	private Integer puntosAcumulados;
	private int numeroPedidos;
	private float descuento;
	private Set<Usuario> usuarios = new HashSet<Usuario>(0);
	private Set<Pedido> pedidos = new HashSet<Pedido>(0);
	private Set<Premio> premios = new HashSet<Premio>(0);
	private Set<OfertaEspecial> ofertaEspecials = new HashSet<OfertaEspecial>(0);
	private Set<Regalo> regalos = new HashSet<Regalo>(0);

	public CompradorFrecuente() {
	}

	public CompradorFrecuente(int idcompradorfrecuente, int numeroPedidos, float descuento) {
		this.idcompradorfrecuente = idcompradorfrecuente;
		this.numeroPedidos = numeroPedidos;
		this.descuento = descuento;
	}

	public CompradorFrecuente(int idcompradorfrecuente, Integer puntosAcumulados, int numeroPedidos, float descuento,
			Set<Usuario> usuarios, Set<Pedido> pedidos, Set<Premio> premios, Set<OfertaEspecial> ofertaEspecials,
			Set<Regalo> regalos) {
		this.idcompradorfrecuente = idcompradorfrecuente;
		this.puntosAcumulados = puntosAcumulados;
		this.numeroPedidos = numeroPedidos;
		this.descuento = descuento;
		this.usuarios = usuarios;
		this.pedidos = pedidos;
		this.premios = premios;
		this.ofertaEspecials = ofertaEspecials;
		this.regalos = regalos;
	}

	@Id

	@Column(name = "idcompradorfrecuente", unique = true, nullable = false)
	public int getIdcompradorfrecuente() {
		return this.idcompradorfrecuente;
	}

	public void setIdcompradorfrecuente(int idcompradorfrecuente) {
		this.idcompradorfrecuente = idcompradorfrecuente;
	}

	@Column(name = "puntos_acumulados")
	public Integer getPuntosAcumulados() {
		return this.puntosAcumulados;
	}

	public void setPuntosAcumulados(Integer puntosAcumulados) {
		this.puntosAcumulados = puntosAcumulados;
	}

	@Column(name = "numero_pedidos", nullable = false)
	public int getNumeroPedidos() {
		return this.numeroPedidos;
	}

	public void setNumeroPedidos(int numeroPedidos) {
		this.numeroPedidos = numeroPedidos;
	}

	@Column(name = "descuento", nullable = false, precision = 12, scale = 0)
	public float getDescuento() {
		return this.descuento;
	}

	public void setDescuento(float descuento) {
		this.descuento = descuento;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "compradorFrecuente")
	public Set<Usuario> getUsuarios() {
		return this.usuarios;
	}

	public void setUsuarios(Set<Usuario> usuarios) {
		this.usuarios = usuarios;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "compradorFrecuente")
	public Set<Pedido> getPedidos() {
		return this.pedidos;
	}

	public void setPedidos(Set<Pedido> pedidos) {
		this.pedidos = pedidos;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "compradorFrecuente")
	public Set<Premio> getPremios() {
		return this.premios;
	}

	public void setPremios(Set<Premio> premios) {
		this.premios = premios;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "compradorFrecuente")
	public Set<OfertaEspecial> getOfertaEspecials() {
		return this.ofertaEspecials;
	}

	public void setOfertaEspecials(Set<OfertaEspecial> ofertaEspecials) {
		this.ofertaEspecials = ofertaEspecials;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "compradorFrecuente")
	public Set<Regalo> getRegalos() {
		return this.regalos;
	}

	public void setRegalos(Set<Regalo> regalos) {
		this.regalos = regalos;
	}

}
