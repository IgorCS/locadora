package com.algaworks.curso.jpa2.persistProducer.contextPersist;

import java.math.BigDecimal;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.algaworks.curso.jpa2.modelo.Carro;
import com.algaworks.curso.jpa2.util.jpa.JpaUtil;

public class SychronizeDetached {

	public static void main(String[] args) {
		
		/*
		 EntityManager manager = JpaUtil.getEntityManager();
		EntityTransaction tx = manager.getTransaction();
		tx.begin();
		Carro veiculo = manager.find(Carro.class, 1L);
		System.out.println("Valor atual: " + veiculo.getValorDiaria());
		veiculo.setValorDiaria(veiculo.getValorDiaria().add(new BigDecimal(500)));
		manager.flush();
		manager.clear();
		System.out.println("Novo valor: " + veiculo.getValorDiaria());
		tx.commit();
		manager.close();
		JpaUtil.close();
		 */

		EntityManager manager = JpaUtil.getEntityManager();
		EntityTransaction tx = manager.getTransaction();
		tx.begin();
		Carro veiculo = manager.find(Carro.class, 1L);
		tx.commit();
		manager.close();
		veiculo.setValorDiaria(veiculo.getValorDiaria().add(new BigDecimal(5_000)));
		//veiculo.setValorDiaria(new BigDecimal(5_000));
		manager = JpaUtil.getEntityManager();
		tx = manager.getTransaction();
		tx.begin();
		// reanexamos o objeto ao novo EntityManager
		veiculo = manager.merge(veiculo);
		tx.commit();
		manager.close();
		JpaUtil.close();

	}

}
