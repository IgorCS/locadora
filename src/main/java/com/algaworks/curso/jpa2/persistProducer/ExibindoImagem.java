package com.algaworks.curso.jpa2.persistProducer;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.persistence.EntityManager;
import javax.swing.ImageIcon;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import com.algaworks.curso.jpa2.modelo.Veiculo;
import com.algaworks.curso.jpa2.persistProducer.contextPersist.VeiculoId;
import com.algaworks.curso.jpa2.util.jpa.JpaUtil;

public class ExibindoImagem {
	public static void main(String[] args) throws IOException {

		EntityManager manager = JpaUtil.getEntityManager();
		
		VeiculoId veiculoFoto = new VeiculoId("ABC-0011", "test11");
		Veiculo veiculo = manager.find(Veiculo.class, veiculoFoto);
		if (veiculo.getFoto() != null || veiculoFoto != null) {
			BufferedImage img = ImageIO.read(new ByteArrayInputStream(veiculo.getFoto()));
			JOptionPane.showMessageDialog(null, new JLabel(new ImageIcon(img)));
		} else {
			System.out.println("Veículo não possui foto.");
		}
		manager.close();
		JpaUtil.close();
	}
}