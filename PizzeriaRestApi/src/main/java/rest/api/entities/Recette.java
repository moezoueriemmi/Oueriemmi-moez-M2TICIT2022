package rest.api.entities;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.*;


import lombok.*;


@Entity
@Data
@NoArgsConstructor 
@AllArgsConstructor
public class Recette {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idR;
	private String date;
	private int somme;
	private int depenses;
	
	
	
	
	
	


	
	

}
