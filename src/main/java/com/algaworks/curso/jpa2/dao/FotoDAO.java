package com.algaworks.curso.jpa2.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceException;

import com.algaworks.curso.jpa2.modelo.Foto;
import com.algaworks.curso.jpa2.service.NegocioException;
import com.algaworks.curso.jpa2.util.jpa.Transactional;

public class FotoDAO implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Inject
	private EntityManager manager;
	
	public Foto buscarPeloCodigo(Long id) {
		return manager.find(Foto.class, id);
	}
	
	public void salvar(Foto foto) {
		manager.flush();
		manager.merge(foto);
	}

	@SuppressWarnings("unchecked")
	public List<Foto> buscarTodas() {
		return manager.createNamedQuery("Foto.buscarTodas").getResultList();
	}
	
	@Transactional
	public void excluir(Foto foto) throws NegocioException {
		foto = buscarPeloCodigo(foto.getId());
		
		try {
			manager.remove(foto);
			manager.flush();
		} catch (PersistenceException e) {
			throw new NegocioException("Foto não pode ser excluída");
		}
	}

	

	

	/*public Long encontrarQuantidadeDeCarros() {
		return manager.createQuery("select count(c) from Carro c", Long.class).getSingleResult();
	}*/
	
	public void setEntityManager(EntityManager manager) {
		this.manager = manager;
	}
	
}
