package rest.api.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor 
@AllArgsConstructor
public class Livraison {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idlivraison;

	 
     

	@OneToOne
	 private Livreur livreur;	
	@OneToOne
	 private Commande commande;	
		
		
	
}
