package rest.api.entities;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.*;


@Entity
@Data
@NoArgsConstructor 
@AllArgsConstructor
public class Lignedecommande {
	@Id
	@GeneratedValue()
	private int id;
	private String remarque;
	private String qte;
	
	
	 @ManyToOne 
	 private Article article;
	// @JsonIgnore
	 @ManyToOne
	 
	 private Commande commande;
   	 

	 
	
	
	

}
