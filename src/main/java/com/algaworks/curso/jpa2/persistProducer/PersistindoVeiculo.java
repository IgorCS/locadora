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
import com.algaworks.curso.jpa2.modelo.Veiculo;
import com.algaworks.curso.jpa2.persistProducer.contextPersist.VeiculoId;
import com.algaworks.curso.jpa2.util.jpa.JpaUtil;

public class PersistindoVeiculo {

	public static void main(String[] args) throws IOException {
		//F:\java
		Path path = FileSystems.getDefault().getPath("D:/locadoraWeb/hb20.jpg");
		byte[] foto = Files.readAllBytes(path);
		
		EntityManager manager = JpaUtil.getEntityManager();
		EntityTransaction tx = manager.getTransaction();
		tx.begin();		
		
		
		
		
		Proprietario proprietario = new Proprietario();
		/*proprietario.setNome("João das Couves");
		proprietario.setTelefone("(34)1234-5678");
		proprietario.setEmail("testes@mail.com");*/
		
		proprietario.setNome("Sebastião");
		proprietario.setEmail("sebastiao2000@mail.com");
		proprietario.setTelefone("(34) 1234-5678");
		//proprietario.getTelefones().add("(34) 1234-5678");
		proprietario.getTelefones().add("(11) 9876-5432");
		proprietario.getTelefones().add("(11) 9876-4832");
		proprietario.getTelefones().add("(11) 9876-5032");
		proprietario.getTelefones().add("(11) 9876-5632");	
		
		Proprietario proprietario1 = new Proprietario();
		/*proprietario.setNome("João das Couves");
		proprietario.setTelefone("(34)1234-5678");
		proprietario.setEmail("testes@mail.com");*/
		
		proprietario1.setNome("Igor");
		proprietario1.setEmail("igor2000@mail.com");
		proprietario1.setTelefone("(34) 2234-5678");
		//proprietario.getTelefones().add("(34) 1234-5678");
		proprietario1.getTelefones().add("(11) 8876-5432");
		proprietario1.getTelefones().add("(11) 8876-4832");
		proprietario1.getTelefones().add("(11) 8876-5032");
		proprietario1.getTelefones().add("(11) 8876-5632");
		
		
		
		manager.persist(proprietario);
		
		manager.persist(proprietario1);
		
		Veiculo veiculo = new Veiculo();
		veiculo.setChaveComposta(new VeiculoId("ABC-0006", "teste2"));
		veiculo.setFabricante("Fiat");
		veiculo.setModelo("Palio");
		veiculo.setAnoFabricacao(1980);
		veiculo.setAnoModelo(1982);
		veiculo.setValor(new BigDecimal(10_000));
		veiculo.setDataCadastro(new Date());
		veiculo.setFoto(foto);
		veiculo.setProprietario(proprietario);
		manager.persist(veiculo);
		
		Veiculo veiculo2 = new Veiculo();
		veiculo2.setChaveComposta(new VeiculoId("ABC-0005", "WV"));
		veiculo2.setFabricante("Volkswagen");
		veiculo2.setModelo("GOLF");
		veiculo2.setAnoFabricacao(2009);
		veiculo2.setAnoModelo(2010);
		veiculo2.setValor(new BigDecimal(12_000));
		veiculo2.setDataCadastro(new Date());
		veiculo2.setFoto(foto);
		veiculo2.setProprietario(proprietario);
		manager.persist(veiculo2);
		
		
		Veiculo veiculo1 = new Veiculo();
		veiculo1.setChaveComposta(new VeiculoId("ABC-0011", "test11"));
		veiculo1.setFabricante("Fiat");
		veiculo1.setModelo("STRADA");
		veiculo1.setAnoFabricacao(1980);
		veiculo1.setAnoModelo(1982);
		veiculo1.setValor(new BigDecimal(10_000));
		veiculo1.setDataCadastro(new Date());
		veiculo1.setFoto(foto);
		veiculo1.setProprietario(proprietario1);
		manager.persist(veiculo1);
		
		Veiculo veiculo3 = new Veiculo();
		veiculo3.setChaveComposta(new VeiculoId("ABC-0010", "WV"));
		veiculo3.setFabricante("Volkswagen");
		veiculo3.setModelo("SAVEIRO");
		veiculo3.setAnoFabricacao(2009);
		veiculo3.setAnoModelo(2010);
		veiculo3.setValor(new BigDecimal(12_000));
		veiculo3.setDataCadastro(new Date());
		veiculo3.setFoto(foto);
		veiculo3.setProprietario(proprietario1);
		manager.persist(veiculo3);
		
		
		
		tx.commit();
		manager.close();
		JpaUtil.close();
	}

}
