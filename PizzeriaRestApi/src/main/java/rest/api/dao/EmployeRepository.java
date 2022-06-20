package rest.api.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import rest.api.entities.Employe;

public interface EmployeRepository  extends JpaRepository<Employe, Integer>{

}
