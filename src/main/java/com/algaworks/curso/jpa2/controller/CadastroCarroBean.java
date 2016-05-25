package com.algaworks.curso.jpa2.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import com.algaworks.curso.jpa2.dao.AcessorioDAO;
import com.algaworks.curso.jpa2.dao.CarroDAO;
import com.algaworks.curso.jpa2.dao.FotoDAO;
import com.algaworks.curso.jpa2.dao.ModeloCarroDAO;
import com.algaworks.curso.jpa2.modelo.Acessorio;
import com.algaworks.curso.jpa2.modelo.Carro;
import com.algaworks.curso.jpa2.modelo.Foto;
import com.algaworks.curso.jpa2.modelo.ModeloCarro;
import com.algaworks.curso.jpa2.service.CadastroCarroService;
import com.algaworks.curso.jpa2.service.CadastroFotoService;
import com.algaworks.curso.jpa2.service.NegocioException;
import com.algaworks.curso.jpa2.util.jpa.FotoUtil;
import com.algaworks.curso.jpa2.util.jsf.FacesUtil;

@Named
@ViewScoped
public class CadastroCarroBean implements Serializable {

	private static final long serialVersionUID = 1L;

	private Carro carro;

	private CarroDAO dao;

	private Foto foto;

	/**
	 * @return the foto
	 */
	public Foto getFoto() {
		return foto;
	}

	/**
	 * @param foto
	 *            the foto to set
	 */
	public void setFoto(Foto foto) {
		this.foto = foto;
	}

	@ManagedProperty(value = "#{uploadMB}")
	@Inject
	private UploadBean uploadBean;

	/*
	 * @ManagedProperty(value = "#{uploadMB}") private UploadController
	 * uploadController;
	 */

	private List<ModeloCarro> modelosCarros;

	private List<Acessorio> acessorios;

	private List<Foto> fotoCarros;

	private List<Carro> carros;

	// private CarroDAO dao;

	/**
	 * @return the carros
	 */
	public List<Carro> getCarros() {
		return carros;
	}

	/**
	 * @param carros
	 *            the carros to set
	 */
	public void setCarros(List<Carro> carros) {
		this.carros = carros;
	}

	@Inject
	private CadastroCarroService cadastroCarroService;

	@Inject
	private CadastroFotoService cadastroFotoService;

	/**
	 * @return the cadastroFotoService
	 */
	public CadastroFotoService getCadastroFotoService() {
		return cadastroFotoService;
	}

	/**
	 * @param cadastroFotoService the cadastroFotoService to set
	 */
	public void setCadastroFotoService(CadastroFotoService cadastroFotoService) {
		this.cadastroFotoService = cadastroFotoService;
	}

	@Inject
	private FotoDAO fotoDAO;

	@Inject
	private AcessorioDAO acessorioDAO;

	@Inject
	private ModeloCarroDAO modeloCarroDAO;

	// private UploadedFile uploadedFile;

	@PostConstruct
	public void inicializar() {
		this.limpar();
		// this.fotoCarros = this.fotoCarroDAO.buscarTodas();
		this.acessorios = acessorioDAO.buscarTodos();
		this.modelosCarros = this.modeloCarroDAO.buscarTodos();
		//this.fotoCarros = this.fotoDAO.buscarTodas();
		/*if (this.dao == null)
			this.dao = new CarroDAO();
		if (this.carro == null)
			this.carro = new Carro();*/

		// this.carros = this.dao.buscarTodos();
	}

	public void salvar() {
		try {
			/*
			 if (this.uploadedFile != null) {
				this.carro.setFoto(this.uploadedFile.getContents());
			}
			 */
			if (this.uploadBean!= null||this.uploadBean== null) {
			this.carro.setFoto(FotoUtil.handlePicture(this.uploadBean.getImageBytes()));
			}
			this.cadastroCarroService.salvar(carro);
			
			

			// this.dao.save(this.carro);

			FacesUtil.addSuccessMessage("Carro salvo com sucesso!");
		} catch (NegocioException e) {
			FacesUtil.addErrorMessage(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			FacesUtil.addErrorMessage("Erro desconhecido. Contatar o administrador");
		}

		this.limpar();
	}

	public void limpar() {
		this.carro = new Carro();
		this.carro.setAcessorios(new ArrayList<Acessorio>());
	}

	public Carro getCarro() {
		return carro;
	}

	public void setCarro(Carro carro) {
		this.carro = carro;
	}

	public List<Acessorio> getAcessorios() {
		return acessorios;
	}

	public List<ModeloCarro> getModelosCarros() {
		return modelosCarros;
	}

	public List<Foto> getFotosCarros() {
		return fotoCarros;
	}

	/*
	 * public UploadedFile getUploadedFile() { return uploadedFile; } public
	 * void setUploadedFile(UploadedFile uploadedFile) { this.uploadedFile =
	 * uploadedFile; }
	 */

	public UploadBean getUploadBean() {
		return uploadBean;
	}

	public void setUploadBean(UploadBean uploadBean) {
		this.uploadBean = uploadBean;
	}

}
