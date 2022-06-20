package rest.api.service;

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

import rest.api.dao.ClientRepository;
import rest.api.entities.Client;


@RestController
public class ClientController {

	@Autowired
	private ClientRepository clientRepository;
	@CrossOrigin()
	@PostMapping("clients/add")

	public Client ajoutclient(@RequestBody Client client) {
		int a=0;
		List<Client> clients=clientRepository.findAll();
		for (Client c : clients) {
			
			if(c.getTel().equals(client.getTel())){
				
				 client=c;
				a=1;
			}
		}
		if(a==0) {
		clientRepository.save(client);}
		return client;
	}
	@CrossOrigin("http://localhost:4200")
	@GetMapping("clients")
	public List<Client> getClients() {
		return clientRepository.findAll();

	}
	@CrossOrigin("http://localhost:4200")
	@DeleteMapping("clients/delete/{id}")
	public List<Client> deletClients(@PathVariable Integer id) {

		clientRepository.deleteById(id);
		return clientRepository.findAll();

	}
	@CrossOrigin(origins ="http://localhost:4200")
	@GetMapping("client/{id}")

	public ResponseEntity<Client> getProduitById(@PathVariable (value="id") Integer clientId)throws ResourceNotFoundException {
		 
		Client client =clientRepository.findById(clientId).orElseThrow(()->new ResourceNotFoundException("produit not found") );
		return ResponseEntity.ok().body(client);

	}
	
	@CrossOrigin("http://localhost:4200")
	@PutMapping("clients/mod/{id}")
    public ResponseEntity<?> update(@RequestBody Client client,@PathVariable Integer id)
    {
    	
		Client existClient=clientRepository.findById(id).get();
    	
    try { 
    	clientRepository.save(client);
    	return new ResponseEntity<>(HttpStatus.OK);
    	
    	}
    	catch(NoSuchElementException e) {
    		return new ResponseEntity<>(HttpStatus.FOUND);
    	}
    	
    }
	  @CrossOrigin
	  @GetMapping("client/{prenom}/{telephone}")
	    public Client Login(@PathVariable String prenom,@PathVariable String telephone) {
	        List<Client> clients = clientRepository.findAll();
	        Client res= new Client();
	        	    for (Client c : clients) {
	        	        if ((prenom.equals(c.getPrenom()) )&&(telephone.equals(c.getTel()) ) ) {
	        	        	res = c;
	        	            break;
	        	        }
	        	    }
        return res;
	  }
}
