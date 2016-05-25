package com.algaworks.curso.jpa2.util.jpa;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.imageio.ImageIO;

import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.StreamedContent;

import com.algaworks.curso.jpa2.modelo.Foto;

public class FotoUtil implements Serializable {
	private static final long serialVersionUID = -7538592532189320120L;

	private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy-HH-mm-ss-SSS");
	public static final String FOLDER = File.separator + "locadoraWeb" + File.separator;

	public static Foto handlePicture(byte[] imageToHandle) throws IOException {
		String nomeFoto = DATE_FORMAT.format(Calendar.getInstance().getTime()) + ".png";

		System.out.println("FOLDER: " + FOLDER + "Nome da Foto: " + nomeFoto + " IMAGEM: " + imageToHandle);

		Foto foto = new Foto(nomeFoto);
       // if(imageToHandle != null && nomeFoto == null)
		 if(nomeFoto == null)
        	salvarNoDisco(null, null);
		else if(nomeFoto!=null && imageToHandle!=null)
			salvarNoDisco(ImageIO.read(new ByteArrayInputStream(imageToHandle)), nomeFoto);
			

		return foto;
	}

	private static void salvarNoDisco(BufferedImage fotoSalvar, String nomeFoto) throws IOException {
		File f = new File(FOLDER);

		if (!f.exists()) {
			f.mkdirs();
			f.setReadable(true);
			f.setWritable(true);
		}

		ImageIO.write(fotoSalvar, "png", new File(FOLDER + nomeFoto));
	}

	public static StreamedContent recuperarFotoDisco(String fotoNome) throws FileNotFoundException {
		try {
			return new DefaultStreamedContent(new FileInputStream(new File(FOLDER + fotoNome)), "image/png");
		} catch (IOException e) {
			e.printStackTrace();

			return new DefaultStreamedContent(new FileInputStream(new File(FOLDER + "DEFAULT.png")), "image/png");
		}
	}
}