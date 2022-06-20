package rest.api.dao;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import rest.api.entities.Contact;


@RepositoryRestResource
public interface ContactRepository extends JpaRepository<Contact, Integer> {
	
	

}
