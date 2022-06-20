package rest.api.service;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import rest.api.dao.LivraisonRepository;
import rest.api.entities.Livraison;
import rest.api.entities.Livreur;

@RestController
public class LivraisonController {

	@Autowired
	private LivraisonRepository livraisonRepository;
	private static final org.slf4j.Logger logger = org.slf4j.LoggerFactory.getLogger(Livraison.class);
	@CrossOrigin("http://localhost:4200")
	@PostMapping("livraisons/add")
	@Transactional
	public Livraison ajoutlivraison(@RequestBody Livraison livraison) {
		 try {livraisonRepository.save(livraison);
		return livraison;
		 }
		 catch(Exception ex)
		    {
		        /* below works in conjunction with concrete logging framework */
		        logger.error(ex.getMessage(), ex);
		        throw ex;
		    }
	}

	@CrossOrigin(origins = "http://localhost:4200")
	@GetMapping("livraisons")

	public List<Livraison> getLivraisons() {
		return livraisonRepository.findAll();

	}

	@CrossOrigin("*")
	@DeleteMapping("livraisons/delete/{id}")
	public List<Livraison> deletlivraisons(@PathVariable Integer id) {

		livraisonRepository.deleteById(id);
		return livraisonRepository.findAll();

	}
	@CrossOrigin(origins ="http://localhost:4200")
	@GetMapping("livraison/{id}")

	public ResponseEntity<Livraison> getLivraisonById(@PathVariable (value="id") Integer livraisonId)throws ResourceNotFoundException {
		 
		Livraison livraison =livraisonRepository.findById(livraisonId).orElseThrow(()->new ResourceNotFoundException("user not found") );
		return ResponseEntity.ok().body(livraison);

	}
	  
	
	@CrossOrigin("http://localhost:4200")
	@PutMapping("livraison/mod/{id}")
    public ResponseEntity<?> update(@RequestBody Livraison livraison,@PathVariable Integer id)
    {
    	
      Livraison existlivraison= livraisonRepository.findById(id).get();
    	
    try { 
    	livraisonRepository.save(livraison);
    	return new ResponseEntity<>(HttpStatus.OK);
    	
    	}
    	catch(NoSuchElementException e) {
    		return new ResponseEntity<>(HttpStatus.FOUND);
    	}
    	
    }

//	

}
