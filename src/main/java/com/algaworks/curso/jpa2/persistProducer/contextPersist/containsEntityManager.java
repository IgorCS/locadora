package com.algaworks.curso.jpa2.persistProducer.contextPersist;

import javax.persistence.EntityManager;

import com.algaworks.curso.jpa2.modelo.Carro;
import com.algaworks.curso.jpa2.util.jpa.JpaUtil;

public class containsEntityManager {

	public static void main(String[] args) {

		EntityManager manager = JpaUtil.getEntityManager();
		
		//Carro veiculo1 = new Carro();
		Carro veiculo1 = manager.find(Carro.class, 1L);
		//manager.persist(veiculo1);
		//veiculo1.setCodigo(new Long(11));
		
		System.out.println("Buscou veiculo pela primeira vez...");
		System.out.println("Gerenciado? " + manager.contains(veiculo1));
		manager.detach(veiculo1);
		System.out.println("E agora? " + manager.contains(veiculo1));
		Carro veiculo2 = manager.find(Carro.class, 1L);
		System.out.println("Buscou veiculo pela segunda vez...");
		System.out.println("Mesmo veículo? " + (veiculo1 == veiculo2));
		manager.close();
		JpaUtil.close();

	}

}
