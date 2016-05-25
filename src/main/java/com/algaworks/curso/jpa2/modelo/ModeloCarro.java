package com.algaworks.curso.jpa2.modelo;

import java.beans.Transient;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class ModeloCarro {

	private Long codigo;
	private String descricao;
	private String nomeCarro;
	/**
	 * @return the nomeCarro
	 */
	public String getNomeCarro() {
		return nomeCarro;
	}

	/**
	 * @param nomeCarro the nomeCarro to set
	 */
	public void setNomeCarro(String nomeCarro) {
		this.nomeCarro = nomeCarro;
	}

	private Fabricante fabricante;
	private Categoria categoria;
	private TipoCombustivel tipoCombustivel;

	
	@Column(name = "tipo_combustivel", nullable = false)
	@Enumerated(EnumType.STRING)
	public TipoCombustivel getTipoCombustivel() {
	return tipoCombustivel;
	}

	public void setTipoCombustivel(TipoCombustivel tipoCombustivel) {
		this.tipoCombustivel = tipoCombustivel;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long getCodigo(){
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	@Transient
	 //@ManyToOne(fetch = FetchType.EAGER)
	//@JoinColumn(name = "codigo_fabricante")
	public String getDescricao() {
		
	return  
	         this.getNomeCarro()
	 + "/ " +this.getCategoria()
	 +"/ "  +this.getTipoCombustivel();
	//+ " por apenas 30000" ;
	}
	
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}	
	

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "codigo_fabricante")
	public Fabricante getFabricante() {
		return fabricante;
	}

	public void setFabricante(Fabricante fabricante) {
		this.fabricante = fabricante;
	}

	@Enumerated(EnumType.STRING)
	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
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
		ModeloCarro other = (ModeloCarro) obj;
		if (codigo == null) {
			if (other.codigo != null)
				return false;
		} else if (!codigo.equals(other.codigo))
			return false;
		return true;
	}

}
