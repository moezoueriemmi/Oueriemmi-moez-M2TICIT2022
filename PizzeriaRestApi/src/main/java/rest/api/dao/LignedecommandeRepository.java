package rest.api.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import rest.api.entities.Client;
import rest.api.entities.Commande;
import rest.api.entities.Article;
import rest.api.entities.Lignedecommande;
@RepositoryRestResource
public interface LignedecommandeRepository extends JpaRepository <Lignedecommande,Integer> {




}
