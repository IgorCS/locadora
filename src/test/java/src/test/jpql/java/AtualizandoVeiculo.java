package src.test.jpql.java;

import java.math.BigDecimal;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.algaworks.curso.jpa2.modelo.Carro;
import com.algaworks.curso.jpa2.util.jpa.JpaUtil;

public class AtualizandoVeiculo {

	public static void main(String[] args) {
		EntityManager manager = JpaUtil.getEntityManager();
		EntityTransaction tx = manager.getTransaction();
		tx.begin();
		Carro veiculo = manager.find(Carro.class, 1L);
		System.out.println("Valor atual da Diária: " + veiculo.getValorDiaria());
		veiculo.setValorDiaria(veiculo.getValorDiaria().add(new BigDecimal(100)));
		System.out.println("Novo valor da Diária: " + veiculo.getValorDiaria());
		tx.commit();
		manager.close();
		JpaUtil.close();
	}

}
