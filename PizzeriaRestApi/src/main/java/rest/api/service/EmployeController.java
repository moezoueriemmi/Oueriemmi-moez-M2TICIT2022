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

import rest.api.dao.EmployeRepository;
import rest.api.entities.Employe;

@RestController
public class EmployeController {

	@Autowired
	private EmployeRepository employeRepository;
	@CrossOrigin
	@PostMapping("employe/ad")

	public Employe ajoutEmploye(@RequestBody Employe employe) {
		employeRepository.save(employe);
		return employe;
	}
	
	@CrossOrigin(origins ="http://localhost:4200")
	@PostMapping("employes/add")

	public Employe ajoutEmployeA(@RequestBody Employe employe) {
		employeRepository.save(employe);
		return employe;
	}
	
	
	
	
	
	@CrossOrigin("http://localhost:4200")
	@GetMapping("employes")
	public List<Employe> getEmployes() {
		return employeRepository.findAll();

	}
	@CrossOrigin("http://localhost:4200")
	@DeleteMapping("employes/delete/{id}")
	public List<Employe> deletEmployes(@PathVariable Integer id) {

		employeRepository.deleteById(id);
		return employeRepository.findAll();

	}
	@CrossOrigin(origins ="http://localhost:4200")
	@GetMapping("employe/{id}")

	public ResponseEntity<Employe> getEmployeById(@PathVariable (value="id") Integer employeId)throws ResourceNotFoundException {
		 
		Employe employe =employeRepository.findById(employeId).orElseThrow(()->new ResourceNotFoundException("user not found") );
		return ResponseEntity.ok().body(employe);

	}
	  
	@CrossOrigin("http://localhost:4200")
	@PutMapping("employes/mod/{id}")
    public ResponseEntity<?> update(@RequestBody Employe employe,@PathVariable Integer id)
    {
    	
		Employe existemploye=employeRepository.findById(id).get();
    	
    try { 
    	employeRepository.save(employe);
    	return new ResponseEntity<>(HttpStatus.OK);
    	
    	}
    	catch(NoSuchElementException e) {
    		return new ResponseEntity<>(HttpStatus.FOUND);
    	}
    	
    }
}
