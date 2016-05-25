package com.algaworks.curso.jpa2.controller;

import java.io.Serializable;

import javax.faces.bean.ViewScoped;
import javax.inject.Named;

import org.primefaces.event.FileUploadEvent;

@Named(value = "uploadMB")
@ViewScoped
public class UploadBean implements Serializable {
	private static final long serialVersionUID = 7475247398584602545L;

	private byte[] imageBytes;

	public void handlePictureUploaded(FileUploadEvent uploadEvent) {
		 this.imageBytes = uploadEvent.getFile().getContents();
       System.out.println("IMAGEBYTES[]: "+imageBytes);
	}
	  //
	 // GETTERS / SETTERS
	//
	public byte[] getImageBytes() {
		return imageBytes;
	}

	public void setImageBytes(byte[] imageBytes) {
		this.imageBytes = imageBytes;
	}
}