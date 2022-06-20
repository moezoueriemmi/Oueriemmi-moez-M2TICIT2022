package rest.api.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import rest.api.entities.Livreur;

public interface LivreurRepository extends JpaRepository<Livreur, Integer>{

}
