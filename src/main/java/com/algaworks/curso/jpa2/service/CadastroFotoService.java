package com.algaworks.curso.jpa2.service;

import java.io.Serializable;

import javax.inject.Inject;

import com.algaworks.curso.jpa2.dao.FotoDAO;
import com.algaworks.curso.jpa2.modelo.Foto;
import com.algaworks.curso.jpa2.util.jpa.Transactional;

public class CadastroFotoService implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Inject
	private FotoDAO fotoDAO;
	
	@Transactional
	public void salvar(Foto foto) throws NegocioException {
		/*if (foto.getName() == null || foto.getId() ==  null || foto.getName().trim().equals("")) {
			throw new NegocioException("FOTO É OBRIGATÓRIA");*/
		//}
		
				
		this.fotoDAO.salvar(foto);
	}
	

}
