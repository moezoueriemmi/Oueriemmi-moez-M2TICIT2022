package rest.api.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import rest.api.entities.Produit;



public interface ProduitRepository extends JpaRepository<Produit, Integer> {

}
