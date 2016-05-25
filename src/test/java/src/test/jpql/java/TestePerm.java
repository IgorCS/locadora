package src.test.jpql.java;

import java.math.BigDecimal;
import java.util.ArrayList;

public class TestePerm {
	
	public static void main(String[] args) {
	      int numeroDeAlocacoes = 0;
	      try {
	         System.out.println("Alocando...");
	         ArrayList list = new ArrayList();
	         String grandeString = new
	            BigDecimal(1000).pow(1000).toString();
	         for (int i = 0; i < 1000; i++)
	            list.add((grandeString + numeroDeAlocacoes++).intern());
	         System.out.println("Fim: "+  list.add((grandeString + numeroDeAlocacoes++).intern()));
	      } catch (OutOfMemoryError e) {
	         System.out.println(e);
	         System.out.println("Alocacoes antes do erro: " + numeroDeAlocacoes);
	      }
	   }

}
