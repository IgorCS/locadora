package com.algaworks.curso.jpa2.persistProducer.contextPersist;

import javax.persistence.EntityManager;

import com.algaworks.curso.jpa2.modelo.Carro;
import com.algaworks.curso.jpa2.util.jpa.JpaUtil;

public class EntityManagerPersist {
	public static void main(String[] args) {
		EntityManager manager = JpaUtil.getEntityManager();
		Carro veiculo1 = manager.find(Carro.class, 2L);
		
		System.out.println("Buscou veiculo pela primeira vez...");
		Carro veiculo2 = manager.find(Carro.class, 2L);
		System.out.println("Buscou veiculo pela segunda vez...");
		System.out.println("Mesmo veículo? " + (veiculo1 == veiculo2));
		
		
		
	
		
		
		
		manager.close();
		JpaUtil.close();
	}
}
