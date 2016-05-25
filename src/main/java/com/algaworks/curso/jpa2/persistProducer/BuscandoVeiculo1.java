package com.algaworks.curso.jpa2.persistProducer;

import java.util.List;

import javax.persistence.EntityManager;

import com.algaworks.curso.jpa2.modelo.Carro;
import com.algaworks.curso.jpa2.modelo.Proprietario;
import com.algaworks.curso.jpa2.modelo.Veiculo;
import com.algaworks.curso.jpa2.persistProducer.contextPersist.VeiculoId;
import com.algaworks.curso.jpa2.util.jpa.JpaUtil;

public class BuscandoVeiculo1 {

	public static void main(String[] args) {
		EntityManager manager = JpaUtil.getEntityManager();
		// Carro veiculo = manager.getReference(Carro.class, 1L);

		/*
		 * List<Veiculo> veiculos = manager.createQuery("from Veiculo",
		 * Veiculo.class).getResultList(); for (Veiculo veiculo : veiculos) {
		 * System.out.println(veiculo.getModelo() + " ==> " +
		 * veiculo.getProprietario().getNome()); }
		 */

		Proprietario proprietario = manager.find(Proprietario.class, 2L);

		System.out.println("Proprietário: " + proprietario.getNome());
		for (String telefone : proprietario.getTelefones()) {
			System.out.println("Telefone: " + telefone);
			}

		for (Veiculo veiculo : proprietario.getVeiculos()) {
			
			//for (String telefone : proprietario.getTelefones()) {
				System.out.println("Proprietário:"+ proprietario.getNome() +
						" Veiculos:"+veiculo.getModelo());	
			}
		//}
		

		/*
		 * System.out.println(proprietario.getVeiculo().getModelo() +
		 * " Nome do Proprietário;" + proprietario.getNome());
		 */

		// VeiculoId id = new VeiculoId("ABC-0005", "WV");
		// Veiculo veiculo = manager.find(Veiculo.class, 2L);

		// System.out.println("Placa: " +
		// veiculo.getChaveComposta().getPlaca());
		// System.out.println("Cidade: " +
		// veiculo.getChaveComposta().getCidade());
		// System.out.println("Fabricante: " + veiculo.getFabricante());
		// System.out.println("Modelo: " + veiculo.getModelo());
		// System.out.println("DESCRIÇÃO: " + veiculo.getDescricao());
		// Proprietario proprietario = manager.find(Proprietario.class, id);
		// veiculo.setProprietario(proprietario);
		// System.out.println("Nome do Proprietário: " +
		// veiculo.getProprietario().getNome());
		/*
		 * System.out.println("Email: " + proprietario.getEmail());
		 * System.out.println("Telefone: " + proprietario.getTelefone());
		 */
		/*
		 * System.out.println("Fabricante: " + veiculoBusca.getValorDiaria());
		 * System.out.println("Modelo: " + veiculoBusca.getModelo());
		 * System.out.println("Buscou veículo. Será que já executou o SELECT?");
		 * /*System.out.println("Veículo de código " + veiculo.getCodigo() +
		 * " é um " + veiculo.getModelo().getDescricao());
		 */
		manager.close();
		JpaUtil.close();
	}

}
