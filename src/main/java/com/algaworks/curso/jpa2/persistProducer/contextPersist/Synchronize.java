package com.algaworks.curso.jpa2.persistProducer.contextPersist;

import java.math.BigDecimal;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.algaworks.curso.jpa2.modelo.Carro;
import com.algaworks.curso.jpa2.util.jpa.JpaUtil;

public class Synchronize {

	public static void main(String[] args) {

		 /*
		 EntityManager manager = JpaUtil.getEntityManager();
         EntityTransaction tx = manager.getTransaction();
         tx.begin();
         Carro veiculo = manager.find(Carro.class, 1L);    
         // essa alteração não será sincronizada
         veiculo.setValorDiaria(new BigDecimal(120));        
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
          veiculo.setValorDiaria(new BigDecimal(600));
          manager = JpaUtil.getEntityManager();
          tx = manager.getTransaction();
          tx.begin();
          // reanexamos o objeto ao novo EntityManager
          
           veiculo = manager.merge(veiculo);
           System.out.println("Gerenciado_MERGE? " + manager.contains(veiculo)
           +"-MERGE: "+ manager.merge(veiculo));
           //DESANEXANDO O OBJETO
           manager.detach(veiculo);         
           System.out.println("E agora_MERGE? " + manager.contains(veiculo)+"-MERGE? ");
          tx.commit();
          manager.close();
          JpaUtil.close();

	}
}
