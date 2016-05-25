package src.test.jpql.java;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.algaworks.curso.jpa2.modelo.Carro;
import com.algaworks.curso.jpa2.util.jpa.JpaUtil;

public class ListandoObjetos {
	
	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		
		EntityManager manager = JpaUtil.getEntityManager();
		Query sql = manager.createQuery("from Carro");
		List<Carro> carro = sql.getResultList();
		for (Carro veiculo : carro) {
		System.out.println(" RENAVAN: "
		+ veiculo.getRenavan() + " "
		+ veiculo.getPlaca() + ", Descrição "
		+ veiculo.getCor() + "/"
		+ veiculo.getFoto() + " por "
		+ "Data de Criação" + veiculo.getDataCriacao());
		}
		manager.close();
		JpaUtil.close();
		}

}
