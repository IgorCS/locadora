package com.algaworks.curso.jpa2.modelo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "proprietario")
public class Proprietario {

	/*
	 * private Veiculo veiculo;
	 * 
	 * /**
	 * 
	 * @param veiculo the veiculo to set
	 */
	/*
	 * public void setVeiculo(Veiculo veiculo) { this.veiculo = veiculo; }
	 * 
	 * // ...
	 * 
	 * @OneToOne(mappedBy = "proprietario") public Veiculo getVeiculo() { return
	 * veiculo; }
	 */

	private List<String> telefones = new ArrayList<>();

	@ElementCollection
	@CollectionTable(name = "proprietario_telefones", joinColumns = @JoinColumn(name = "cod_proprietario") )
	@Column(name = "numero_telefone", length = 20, nullable = false)
	public List<String> getTelefones() {
		return telefones;
	}

	public void setTelefones(List<String> telefones) {
		this.telefones = telefones;
	}

	private List<Veiculo> veiculos;

	@OneToMany(mappedBy = "proprietario")
	public List<Veiculo> getVeiculos() {
		return veiculos;
	}

	public void setVeiculos(List<Veiculo> veiculos) {
		this.veiculos = veiculos;
	}

	private Long codigo;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	// @Column(name = "id_proprietario")
	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	private String nome;
	private String telefone;
	private String email;

	@Column(length = 60, nullable = false)
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	@Column(length = 20, nullable = false)
	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	@Column(length = 255)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
