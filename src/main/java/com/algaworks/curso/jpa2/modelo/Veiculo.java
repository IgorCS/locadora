package com.algaworks.curso.jpa2.modelo;

import java.beans.Transient;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.algaworks.curso.jpa2.persistProducer.contextPersist.VeiculoId;

@Entity
@Table(name = "tab_veiculo")
public class Veiculo {

	private String fabricante;
	private String modelo;
	private String descricao;
	private byte[] foto;

	private Proprietario proprietario;

	

	/*@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="carro_acessorio"
				, joinColumns=@JoinColumn(name="codigo_carro")
				, inverseJoinColumns=@JoinColumn(name="codigo_acessorio"))
	public List<Acessorio> getAcessorios() {
		return acessorios;
	}
	public void setAcessorios(List<Acessorio> acessorios) {
		this.acessorios = acessorios;
	}*/
	

	//@OneToOne
	@ManyToOne
	@JoinColumn(name = "cod_proprietario")
	public Proprietario getProprietario() {
		return proprietario;
	}

	public void setProprietario(Proprietario proprietario) {
		this.proprietario = proprietario;
	}

	@Lob
	public byte[] getFoto() {
		return foto;
	}

	public void setFoto(byte[] foto) {
		this.foto = foto;
	}

	@Transient
	public String getDescricao() {
		return this.getFabricante() + " " + this.getModelo() + " " + this.getAnoFabricacao() + "/" + this.getAnoModelo()
				+ " por apenas " + this.getValor();
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	private Integer anoFabricacao;
	private Date dataCadastro;

	private Integer anoModelo;
	private BigDecimal valor;
	private VeiculoId chaveComposta;

	public void setChaveComposta(VeiculoId chaveComposta) {
		this.chaveComposta = chaveComposta;
	}

	@EmbeddedId
	public VeiculoId getChaveComposta() {
		return chaveComposta;
	}

	public String getFabricante() {
		return fabricante;
	}

	public void setFabricante(String fabricante) {
		this.fabricante = fabricante;
	}

	public String getModelo() {
		return modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

	public Integer getAnoFabricacao() {
		return anoFabricacao;
	}

	public void setAnoFabricacao(Integer anoFabricacao) {
		this.anoFabricacao = anoFabricacao;
	}

	public Integer getAnoModelo() {
		return anoModelo;
	}

	public void setAnoModelo(Integer anoModelo) {
		this.anoModelo = anoModelo;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "data_cadastro", nullable = false)
	public Date getDataCadastro() {
		return dataCadastro;
	}

	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

	public BigDecimal getValor() {
		return valor;
	}

	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}

}
// getters, setters, hashCode e equals