package rest.api.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import rest.api.entities.Client;
import rest.api.entities.Commande;
import rest.api.entities.Article;
@RepositoryRestResource
public interface CommandeRepository extends JpaRepository <Commande,Integer> {




}
