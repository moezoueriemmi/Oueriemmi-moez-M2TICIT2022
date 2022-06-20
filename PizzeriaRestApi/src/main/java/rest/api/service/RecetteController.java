package rest.api.service;


import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.NoSuchElementException;

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

import rest.api.dao.RecetteRepository;
import rest.api.entities.Commande;
import rest.api.entities.Produit;
import rest.api.entities.Recette;

@RestController
public class RecetteController {

	@Autowired
	private RecetteRepository recetteRepository;
	private  String a="http://localhost:4200";
	@CrossOrigin()
	@PostMapping("recette/add")

	public Recette postrecette(@RequestBody Recette recette) {
		LocalDate localDate = LocalDate.now();
		String date =localDate.toString();
		recette.setDate(date);
		recetteRepository.save(recette);
		return recette;
	}
	@CrossOrigin(origins ="http://localhost:4200")
	@GetMapping("recette/{id}")

	public ResponseEntity<Recette> getRecetteById(@PathVariable (value="id") Integer recetteId)throws ResourceNotFoundException {
		 
		Recette recette =recetteRepository.findById(recetteId).orElseThrow(()->new ResourceNotFoundException("produit not found") );
		return ResponseEntity.ok().body(recette);

	}
	@CrossOrigin("http://localhost:4200")
	@GetMapping("recettes")

	public List<Recette> getRecettes() {
		return recetteRepository.findAll();

	}
	@CrossOrigin("http://localhost:4200")
	@DeleteMapping("recette/delete/{id}")

	public List<Recette> deletRecettes(@PathVariable Integer id) {

		recetteRepository.deleteById(id);
		return recetteRepository.findAll();

	}
	@CrossOrigin("http://localhost:4200")
	@PutMapping("recette/mod/{id}")
    public ResponseEntity<?> update(@RequestBody Recette recette,@PathVariable Integer id)
    {
    	
		Recette existRecette=recetteRepository.findById(id).get();
    	
    try { 
    	recetteRepository.save(recette);
    	return new ResponseEntity<>(HttpStatus.OK);
    	
    	}
    	catch(NoSuchElementException e) {
    		return new ResponseEntity<>(HttpStatus.FOUND);
    	}
    	
    }
	@CrossOrigin()
	@PostMapping("recette/somme")
    public ResponseEntity<?> update(@RequestBody Commande commande)
    {
    	
	List<Recette> existRecette= recetteRepository.findAll();
	
	for(Recette r : existRecette) {
		LocalDate localDate = LocalDate.now();
		if ((r.getDate()).equals(localDate.toString())) {
			r.setSomme(r.getSomme()+commande.getPrix());
			recetteRepository.save(r);
		}
		
	}
    	
    try { 
    	
    	return new ResponseEntity<>(HttpStatus.OK);
    	
    	}
    	catch(NoSuchElementException e) {
    		return new ResponseEntity<>(HttpStatus.FOUND);
    	}
    	
    }
	@CrossOrigin()
	@PostMapping("recette/annuler")
    public ResponseEntity<?> updater(@RequestBody Commande commande)
    {
    	
	List<Recette> existRecette= recetteRepository.findAll();
	
	for(Recette r : existRecette) {
		LocalDate localDate = LocalDate.now();
		if ((r.getDate()).equals(localDate.toString())) {
			r.setSomme(r.getSomme()-commande.getPrix());
			recetteRepository.save(r);
		}
		
	}
    	
    try { 
    	
    	return new ResponseEntity<>(HttpStatus.OK);
    	
    	}
    	catch(NoSuchElementException e) {
    		return new ResponseEntity<>(HttpStatus.FOUND);
    	}
    	
    }
}