package rest.api.service;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

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
import rest.api.dao.ProduitRepository;
import rest.api.entities.Produit;

@RestController
public class ProduitController {

	@Autowired
	private ProduitRepository produitRepository;
	@CrossOrigin("http://localhost:4200")
	@PostMapping("produits/add")

	public Produit postproduit(@RequestBody Produit produit) {
		produitRepository.save(produit);
		return produit;
	}
	@CrossOrigin(origins ="http://localhost:4200")
	@GetMapping("produits")

	public List<Produit> getProduits() {
		return produitRepository.findAll();

	}
	
	@CrossOrigin
	@GetMapping("produitsC")

	public List<Produit> getProduitsf() {
		return produitRepository.findAll();

	}
	
	@CrossOrigin(origins ="http://localhost:4200")
	@GetMapping("produit/{id}")

	public ResponseEntity<Produit> getProduitById(@PathVariable (value="id") Integer produitId)throws ResourceNotFoundException {
		 
		Produit produit =produitRepository.findById(produitId).orElseThrow(()->new ResourceNotFoundException("produit not found") );
		return ResponseEntity.ok().body(produit);

	}
	@CrossOrigin(origins ="http://localhost:4200")
	@DeleteMapping("produit/delete/{id}")

	public List<Produit> deletproduit(@PathVariable Integer id) {

		produitRepository.deleteById(id);
		return produitRepository.findAll();

	}
	@CrossOrigin("http://localhost:4200")
	@PutMapping("produit/mod/{id}")
    public ResponseEntity<?> update(@RequestBody Produit produit,@PathVariable Integer id)
    {
    	
		Produit existproduit=produitRepository.findById(id).get();
    	
    try { 
    	produitRepository.save(produit);
    	return new ResponseEntity<>(HttpStatus.OK);
    	
    	}
    	catch(NoSuchElementException e) {
    		return new ResponseEntity<>(HttpStatus.FOUND);
    	}
    	
    }
	
	@CrossOrigin(origins ="http://localhost:4200")
	@GetMapping(path="photop/{id}",produces=MediaType.IMAGE_PNG_VALUE)

	public byte[] getPhoto(@PathVariable (value="id") Integer produitId)throws Exception {
		 
		Produit produit =produitRepository.findById(produitId).get();
		return   Files.readAllBytes(Paths.get(System.getProperty("user.home")+"/pizzeria/produits/"+produit.getImage()));  

	}

}
