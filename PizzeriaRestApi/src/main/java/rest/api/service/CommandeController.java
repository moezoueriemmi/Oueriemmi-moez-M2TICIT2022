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
public class CommandeController {
	
	@Autowired
	private CommandeRepository commandeRepository;
	private LignedecommandeRepository ligneRepository;

	@CrossOrigin()
	@PostMapping("commande/add")
	public Commande ajoutcommande(@RequestBody Commande commande) {
		commandeRepository.save(commande);
		return commande;
	}
	
	@CrossOrigin()
	@GetMapping("commandes")
	
	public List<Commande> getCommandes() {
		
		return commandeRepository.findAll();

	}
	
	@CrossOrigin("http://localhost:4200")
	@DeleteMapping("commandes/delete/{id}")
	public List<Commande> deletCommandes(@PathVariable Integer id) {

		commandeRepository.deleteById(id);
		return commandeRepository.findAll();

	}
	@CrossOrigin(origins ="http://localhost:4200")
	@GetMapping("commande/{id}")

	public ResponseEntity<Commande> getCommandeById(@PathVariable (value="id") Integer commandeId)throws ResourceNotFoundException {
		 
		
		Commande commande =commandeRepository.findById(commandeId).orElseThrow(()->new ResourceNotFoundException("user not found") );
		return ResponseEntity.ok().body(commande);

	}
	  
	@CrossOrigin("http://localhost:4200")
	@PutMapping("commandes/mod/{id}")
    public ResponseEntity<?> update(@RequestBody Commande commande,@PathVariable Integer id)
    {
    	
		Commande existcommande=commandeRepository.findById(id).get();
    	
    try { 
    	commandeRepository.save(commande);
    	return new ResponseEntity<>(HttpStatus.OK);
    	
    	}
    	catch(NoSuchElementException e) {
    		return new ResponseEntity<>(HttpStatus.FOUND);
    	}
    	
    }
	
	@CrossOrigin("http://localhost:4200")
	@GetMapping("commandes/modE/{id}")
    public ResponseEntity<Commande> updateEtat(@PathVariable (value="id") Integer id)
    {
    
   
    	Commande commande =commandeRepository.findById(id).orElseThrow(()->new ResourceNotFoundException("user not found") );
		        commande.setEtat("PRETE");
		    	commandeRepository.save(commande);
    	return ResponseEntity.ok().body(commande);
    	
    	
    	
    	
    }
	@CrossOrigin()
	@GetMapping("commandes/modC/{id}")
    public ResponseEntity<Commande> updateEtatC(@PathVariable (value="id") Integer id)
    {
    
   
    	Commande commande =commandeRepository.findById(id).orElseThrow(()->new ResourceNotFoundException("user not found") );
		        commande.setEtat("Annuler");
		    	commandeRepository.save(commande);
    	return ResponseEntity.ok().body(commande);
    	
    	
    	
    	
    }
	@CrossOrigin
	  @GetMapping("commandeC/{id}")
	    public List<Commande> CommandeClient(@PathVariable (value="id") Integer idclient) {
	        List<Commande> commandes = commandeRepository.findAll();
	        List<Commande> res=new ArrayList <Commande>();
	        	    for (Commande c : commandes) {
	        	    	
	        	        if ((idclient)==(c.getClient().getId_client())  ) {
	        	        	res.add(c)  ;
	        	            
	        	        }
	        	    }
      return res;
	  }
	
	
}
//	

