package com.algaworks.curso.jpa2.persistProducer;

import javax.persistence.EntityManager;

import com.algaworks.curso.jpa2.modelo.Carro;
import com.algaworks.curso.jpa2.util.jpa.JpaUtil;

public class BuscandoVeiculo2 {

	public static void main(String[] args) {
		EntityManager manager = JpaUtil.getEntityManager();
		Carro veiculo = manager.getReference(Carro.class, 2L);
		System.out.println("BuscandoVeiculo2 de código " + veiculo.getCodigo() 
		+ " é um " + veiculo.getModelo().getDescricao());
		manager.close();
		JpaUtil.close();
	}

}
