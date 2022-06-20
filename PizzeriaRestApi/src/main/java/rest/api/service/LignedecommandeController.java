package rest.api.service;

import java.awt.print.Pageable;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import rest.api.dao.CommandeRepository;
import rest.api.dao.LignedecommandeRepository;
import rest.api.entities.Commande;
import rest.api.entities.Lignedecommande;



@RestController
public class LignedecommandeController {
	@Autowired
	private LignedecommandeRepository lignedecommandeRepository;


	
	@CrossOrigin()
	@GetMapping("lignes")

	public List<Lignedecommande> getCommandes() {
		return lignedecommandeRepository.findAll();

	}
	@CrossOrigin()
	@GetMapping("lignes/{id}")

	public List<Lignedecommande> getCommande(@PathVariable (value="id") Integer idcom ) {
		List <Lignedecommande> lignes= lignedecommandeRepository.findAll();
		  List<Lignedecommande> res=new ArrayList <Lignedecommande>();
  	    for (Lignedecommande c : lignes) {
  	    	
  	        if ((idcom)==(c.getCommande().getId_com())  ) {
  	        	res.add(c)  ;
  	            
  	        }
  	    }
return res;
	}
	
	@CrossOrigin()
	@PostMapping("lignecommande/add")
	public Lignedecommande ajoutcommande(@RequestBody Lignedecommande commande) {
		
	     
		lignedecommandeRepository.save(commande);
		
		
		return commande;
	}
}
//	

