package rest.api.entities;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.*;


@Entity
@Data
@NoArgsConstructor 
@AllArgsConstructor
public class Commande {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	
	private int id_com;
	private Date date_com;
	private String etat;
	private Integer prix;
	private String type;
	private String adresse;
	
	

	 @ManyToOne private Client client;
	 @JsonIgnore
	@OneToMany(mappedBy="commande",cascade={CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REMOVE
        })
	
	private List<Lignedecommande> lignedecommandes;


	
	
	

}
