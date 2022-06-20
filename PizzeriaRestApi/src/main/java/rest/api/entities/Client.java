package rest.api.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.*;


import lombok.*;


@Entity
@Data
@NoArgsConstructor 
@AllArgsConstructor

public class Client {
	
	@Id
	@GeneratedValue
	private int id_client;
    private String nom;
    private String prenom;
    private String tel;

 

	

	

}
