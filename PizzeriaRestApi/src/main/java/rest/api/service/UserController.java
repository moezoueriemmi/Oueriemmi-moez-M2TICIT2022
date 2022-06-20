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

import rest.api.dao.UserRepository;
import rest.api.entities.User;

@RestController
public class UserController {

	@Autowired
	private UserRepository userRepository;
	@CrossOrigin
	@PostMapping("user/ad")

	public User ajoutUser(@RequestBody User user) {
		userRepository.save(user);
		return user;
	}
	
	@CrossOrigin(origins ="http://localhost:4200")
	@PostMapping("users/add")

	public User ajoutUserA(@RequestBody User user) {
		userRepository.save(user);
		return user;
	}
	
	
	
	
	
	@CrossOrigin("http://localhost:4200")
	@GetMapping("users")
	public List<User> getUsers() {
		return userRepository.findAll();

	}
	@CrossOrigin("http://localhost:4200")
	@DeleteMapping("users/delete/{id}")
	public List<User> deletUsers(@PathVariable Integer id) {

		userRepository.deleteById(id);
		return userRepository.findAll();

	}
	@CrossOrigin(origins ="http://localhost:4200")
	@GetMapping("user/{id}")

	public ResponseEntity<User> getUserById(@PathVariable (value="id") Integer userId)throws ResourceNotFoundException {
		 
		User user =userRepository.findById(userId).orElseThrow(()->new ResourceNotFoundException("user not found") );
		return ResponseEntity.ok().body(user);

	}
	  @CrossOrigin
	  @GetMapping("user/{login}/{password}")
	    public User Login(@PathVariable String login,@PathVariable String password) {
	        List<User> users = userRepository.findAll();
	        User res= new User();
	        	    for (User c : users) {
	        	        if ((login.equals(c.getLogin()) )&&(password.equals(c.getPwd()) ) ) {
	        	        	res = c;
	        	            break;
	        	        }
	        	    }
        return res;
	  }
	  @CrossOrigin(origins ="http://localhost:4200")
	  @GetMapping("userr/{login}")
	    public User log(@PathVariable String login) {
	        List<User> users = userRepository.findAll();
	        User res= new User();
	       
	        	    for (User c : users) {
	        	        if ((login.equals(c.getLogin()) ) ) {
	        	        	res = c;
	        	        	
	        	            break;
	        	        }
	        	    }
      return res;
	  }	  
	
	@CrossOrigin("http://localhost:4200")
	@PutMapping("users/mod/{id}")
    public ResponseEntity<?> update(@RequestBody User user,@PathVariable Integer id)
    {
    	
		User existuser=userRepository.findById(id).get();
    	
    try { 
    	userRepository.save(user);
    	return new ResponseEntity<>(HttpStatus.OK);
    	
    	}
    	catch(NoSuchElementException e) {
    		return new ResponseEntity<>(HttpStatus.FOUND);
    	}
    	
    }
	
}
