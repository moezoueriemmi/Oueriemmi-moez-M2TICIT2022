package rest.api.service;

import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
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

import rest.api.dao.ContactRepository;
import rest.api.entities.Contact;

@RestController
public class ContactController {

	@Autowired
	private ContactRepository contactRepository;
	private  String a="http://localhost:4200";
	@CrossOrigin()
	@PostMapping("contact/add")

	public Contact postcontact(@RequestBody Contact contact) {
		contactRepository.save(contact);
		return contact;
	}
	@CrossOrigin("http://localhost:4200")
	@GetMapping("contacts")

	public List<Contact> getContacts() {
		return contactRepository.findAll();

	}
	@CrossOrigin("http://localhost:4200")
	@DeleteMapping("contacts/delete/{id}")

	public List<Contact> deletContacts(@PathVariable Integer id) {

		contactRepository.deleteById(id);
		return contactRepository.findAll();

	}
	
	@PutMapping("contacts/mod/{id}")
    public ResponseEntity<?> update(@RequestBody Contact contact,@PathVariable Integer id)
    {
    	
		Contact existContact=contactRepository.findById(id).get();
    	
    try { 
    	contactRepository.save(contact);
    	return new ResponseEntity<>(HttpStatus.OK);
    	
    	}
    	catch(NoSuchElementException e) {
    		return new ResponseEntity<>(HttpStatus.FOUND);
    	}
    	
    }

}