package com.algaworks.curso.jpa2.persistProducer;

import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.algaworks.curso.jpa2.modelo.Proprietario;
import com.algaworks.curso.jpa2.modelo.TipoCombustivel;
import com.algaworks.curso.jpa2.modelo.Veiculo;
import com.algaworks.curso.jpa2.persistProducer.contextPersist.VeiculoId;
import com.algaworks.curso.jpa2.util.jpa.JpaUtil;

public class Persist_ManyToOne {

	public static void main(String[] args) throws IOException {
		//F:\java
		Path path = FileSystems.getDefault().getPath("F:/java/hb20.jpg");
		byte[] foto = Files.readAllBytes(path);
		
		EntityManager manager = JpaUtil.getEntityManager();
		EntityTransaction tx = manager.getTransaction();
		tx.begin();
		
		Proprietario proprietario = new Proprietario();
		proprietario.setNome("Igor Carvalho Soares");
		proprietario.setTelefone("(86)98156-5110");
		proprietario.setEmail("igor@mail.com");
		manager.persist(proprietario);
		
		Veiculo veiculo1 = new Veiculo();
		veiculo1.setChaveComposta(new VeiculoId("ABC-0002", "teste2"));
		veiculo1.setFabricante("Fiat");
		veiculo1.setModelo("Palio");
		veiculo1.setAnoFabricacao(1980);
		veiculo1.setAnoModelo(1982);
		veiculo1.setValor(new BigDecimal(10_000));
		veiculo1.setDataCadastro(new Date());
		veiculo1.setFoto(foto);
		veiculo1.setProprietario(proprietario);
		manager.persist(veiculo1);
		
		
		Veiculo veiculo2 = new Veiculo();
		//veiculo2.setChaveComposta(new VeiculoId("ABC-0004", "WV"));
		veiculo2.setFabricante("Volkswagen");
		veiculo2.setModelo("GOLF");
		veiculo2.setAnoFabricacao(2009);
		veiculo2.setAnoModelo(2010);
		veiculo2.setValor(new BigDecimal(12_000));
		veiculo2.setDataCadastro(new Date());
		veiculo2.setFoto(foto);
		veiculo2.setProprietario(proprietario);
		manager.persist(veiculo2);

		
		tx.commit();
		manager.close();
		JpaUtil.close();
	}

}
