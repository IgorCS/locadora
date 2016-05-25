package com.algaworks.curso.jpa2.modelo;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.algaworks.curso.jpa2.modelo.Foto;




@Entity
@NamedQueries({
	@NamedQuery(name="Carro.buscarTodos", query="select c from Carro c inner join fetch c.modelo"),
	@NamedQuery(name="Carro.buscarCarroComAcessorios", query="select c "
															+ "	from Carro c JOIN c.acessorios a "
															+ " where c.codigo = :codigo"),
	@NamedQuery(name="Carro.buscarCarroComFotos", query="select c "
			+ "	from Carro c JOIN c.foto f "
			+ " where c.codigo = :codigo"),
})
public class Carro {

	private Long codigo;
	private String placa;
	private String cor;
	private String renavan;
	private BigDecimal valorDiaria;
	public ModeloCarro modelo;
	public Carro() { }
	private Foto foto;
	private List<Acessorio> acessorios;
	private List<Aluguel> alugueis;
	//private TipoCombustivel tipoCombustivel;
	
	private Date dataCriacao;
	private Date dataModificacao;	
	
	//@Cascade(value = CascadeType.ALL)	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Long getCodigo() {
		return codigo;
	}
	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}
	
	/*@Column(name = "tipo_combustivel", nullable = false)
	@Enumerated(EnumType.STRING)
	public TipoCombustivel getTipoCombustivel() {
	return tipoCombustivel;
	}
	public void setTipoCombustivel(TipoCombustivel tipoCombustivel) {
	this.tipoCombustivel = tipoCombustivel;
	}*/
	
	public String getPlaca() {
		return placa;
	}
	public void setPlaca(String placa) {
		this.placa = placa;
	}
	
	public String getCor() {
		return cor;
	}
	public void setCor(String cor) {
		this.cor = cor;
	}
	
	public String getRenavan() {
		return renavan;
	}
	public void setRenavan(String renavan) {
		this.renavan = renavan;
	}
	
	public BigDecimal getValorDiaria() {
		return valorDiaria;
	}
	public void setValorDiaria(BigDecimal valorDiaria) {
		this.valorDiaria = valorDiaria;
	}	
	/*
	@OneToOne
	@JoinColumn(name = "FOTO_ID")
	@Cascade(value = CascadeType.ALL)*/	

	
	@JoinColumn(name = "FOTO_ID")
	@OneToOne(optional = true,fetch=FetchType.EAGER,cascade = CascadeType.ALL)	
	public Foto getFoto() {
		return foto;
	}

	public void setFoto(Foto foto) {
		this.foto = foto;
	}
	
	@ManyToOne(fetch=FetchType.EAGER, cascade=CascadeType.PERSIST)
	@JoinColumn(name="codigo_modelo")
	public ModeloCarro getModelo() {
		return modelo;
	}
	public void setModelo(ModeloCarro modelo) {
		this.modelo = modelo;
	}
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="carro_acessorio"
				, joinColumns=@JoinColumn(name="codigo_carro")
				, inverseJoinColumns=@JoinColumn(name="codigo_acessorio"))
	public List<Acessorio> getAcessorios() {
		return acessorios;
	}
	public void setAcessorios(List<Acessorio> acessorios) {
		this.acessorios = acessorios;
	}
	
	@OneToMany(mappedBy="carro")
	public List<Aluguel> getAlugueis() {
		return alugueis;
	}
	public void setAlugueis(List<Aluguel> alugueis) {
		this.alugueis = alugueis;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	public Date getDataCriacao(){
		return dataCriacao;
	}
	
	public void setDataCriacao(Date dataCriacao) {
		this.dataCriacao = dataCriacao;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	public Date getDataModificacao() {
		return dataModificacao;
	}
	public void setDataModificacao(Date dataModificacao) {
		this.dataModificacao = dataModificacao;
	}
	
	@PrePersist
	@PreUpdate
	public void configuraDatasCriacaoAlteracao() {
		this.dataModificacao = new Date();
		
		if (this.dataCriacao == null) {
			this.dataCriacao = new Date();
		}
	}
	
	/*@Lob
	public byte[] getFoto() {
		return this.foto;
	}
	public void setFoto(byte[] foto) {
		this.foto = foto;
	}*/
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((foto == null) ? 0 : foto.hashCode());
		result = prime * result + ((codigo == null) ? 0 : codigo.hashCode());		
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Carro other = (Carro) obj;
		if (foto == null) {
			if (other.foto != null)
				return false;
		} else if (!foto.equals(other.foto))
			return false;
		if (codigo == null) {
			if (other.codigo != null)
				return false;
		} else if (!codigo.equals(other.codigo))
			return false;
	
		return true;
	}

	@Override
	public String toString() {
		return "Carro [id=" + codigo + ", foto=" + foto + "]";
	}
	}


