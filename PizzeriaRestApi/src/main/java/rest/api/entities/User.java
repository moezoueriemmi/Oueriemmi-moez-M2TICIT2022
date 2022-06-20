package rest.api.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor 
@AllArgsConstructor
public class User {
	@Id
	@GeneratedValue	
	private int id;
	private String nom;
	private String prenom;
	private String email;
	private String tel;
	private String adresse;
	private String login;
	private String pwd;
	private String role;
	 
     
	
	
}
