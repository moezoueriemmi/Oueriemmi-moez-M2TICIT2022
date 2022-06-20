package rest.api.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import rest.api.entities.Livraison;
import rest.api.entities.Commande;
import rest.api.entities.Livreur;
@RepositoryRestResource
public interface LivraisonRepository extends JpaRepository<Livraison, Integer> {

}
