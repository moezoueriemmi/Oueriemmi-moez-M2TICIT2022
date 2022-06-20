package rest.api.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import rest.api.entities.User;

public interface UserRepository extends JpaRepository<User, Integer>{

}
