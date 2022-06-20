package rest.api.entities;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;


import lombok.*;


@Entity
@Data
@NoArgsConstructor 
@AllArgsConstructor

public class Contact {
	
	@Id
	@GeneratedValue	
	
	private int id;
	private String nom_prenom;
	private String telc;
	private String email;
	private String message;
	
	

}
