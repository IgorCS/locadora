package src.test.jpql.java;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.algaworks.curso.jpa2.modelo.Carro;
import com.algaworks.curso.jpa2.util.jpa.JpaUtil;

public class ExcluindoVeiculo {
	
	public static void main(String[] args) {
		EntityManager manager = JpaUtil.getEntityManager();
		EntityTransaction tx = manager.getTransaction();
		tx.begin();
		Carro veiculo = manager.find(Carro.class, 1L);
		manager.remove(veiculo);
		//modeloCarro.setCodigo(new Long (10));
				//veiculo.setModelo();
		tx.commit();
		manager.close();
		JpaUtil.close();
		}

}
