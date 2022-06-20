package rest.api.entities;

import java.util.List;

import javax.persistence.*;



import lombok.*;


@Entity
@Data
@NoArgsConstructor 
@AllArgsConstructor

public class Produit {
	@Id
	@GeneratedValue	
	private int id;
	private String image;
	private String nom;
	private int qte;
	private int prix;


}
