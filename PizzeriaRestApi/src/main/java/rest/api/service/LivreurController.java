package rest.api.service;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.http.HttpStatus;
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

import rest.api.dao.LivreurRepository;
import rest.api.entities.Livreur;

@RestController
public class LivreurController {

	@Autowired
	private LivreurRepository livreurRepository;
	@CrossOrigin
	@PostMapping("livreur/ad")

	public Livreur ajoutLivreur(@RequestBody Livreur livreur) {
		livreurRepository.save(livreur);
		return livreur;
	}
	
	@CrossOrigin(origins ="http://localhost:4200")
	@PostMapping("livreurs/add")

	public Livreur ajoutLivreurA(@RequestBody Livreur livreur) {
		livreurRepository.save(livreur);
		return livreur;
	}
	
	
	
	
	
	@CrossOrigin("http://localhost:4200")
	@GetMapping("livreurs")
	public List<Livreur> getLivreurs() {
		return livreurRepository.findAll();

	}
	@CrossOrigin("http://localhost:4200")
	@DeleteMapping("livreurs/delete/{id}")
	public List<Livreur> deletLivreurs(@PathVariable Integer id) {

		livreurRepository.deleteById(id);
		return livreurRepository.findAll();

	}
	@CrossOrigin(origins ="http://localhost:4200")
	@GetMapping("livreur/{id}")

	public ResponseEntity<Livreur> getLivreurById(@PathVariable (value="id") Integer livreurId)throws ResourceNotFoundException {
		 
		Livreur livreur =livreurRepository.findById(livreurId).orElseThrow(()->new ResourceNotFoundException("user not found") );
		return ResponseEntity.ok().body(livreur);

	}
	  
	
	@CrossOrigin("http://localhost:4200")
	@PutMapping("livreurs/mod/{id}")
    public ResponseEntity<?> update(@RequestBody Livreur livreur,@PathVariable Integer id)
    {
    	
      Livreur existlivreur= livreurRepository.findById(id).get();
    	
    try { 
    	livreurRepository.save(livreur);
    	return new ResponseEntity<>(HttpStatus.OK);
    	
    	}
    	catch(NoSuchElementException e) {
    		return new ResponseEntity<>(HttpStatus.FOUND);
    	}
    	
    }
}
