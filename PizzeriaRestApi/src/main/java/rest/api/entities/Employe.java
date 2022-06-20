package rest.api.entities;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor 
@AllArgsConstructor
public class Employe {
	@Id
	@GeneratedValue	
	private int idemp;
	private String nom;
	private String prenom;
	private double salaire;
	private String tel;
	private String poste;
	private String datentree;
	private String jourrepos;
	 
	
}
