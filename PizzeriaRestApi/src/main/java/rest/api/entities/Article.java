package rest.api.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.*;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor

public class Article {
	@Id
	@GeneratedValue
	private int idart;
	private String image;
	private String nom;
	private String ingredients;
	private int prix;
	private String categorie;
	 @JsonIgnore
	@OneToMany(mappedBy="article",cascade={CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REMOVE})
	private List<Lignedecommande> lignedecommandes;

	
}
