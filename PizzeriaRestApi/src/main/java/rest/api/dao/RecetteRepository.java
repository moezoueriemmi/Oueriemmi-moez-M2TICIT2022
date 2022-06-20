package rest.api.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import rest.api.entities.Recette;
@RepositoryRestResource

public interface RecetteRepository extends JpaRepository<Recette, Integer> {

}
