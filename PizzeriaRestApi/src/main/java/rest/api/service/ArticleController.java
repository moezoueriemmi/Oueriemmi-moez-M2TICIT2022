package rest.api.service;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
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
import rest.api.dao.ArticleRepository;
import rest.api.entities.Article;


@RestController
public class ArticleController {

	@Autowired
	private ArticleRepository articleRepository;
	@CrossOrigin("http://localhost:4200")
	@PostMapping("articles/add")

	public Article postarticle(@RequestBody Article article) {
		articleRepository.save(article);
		return article;
	}
	
	@CrossOrigin()
	@GetMapping("articles")

	public List<Article> getArticles() {
		return articleRepository.findAll();

	}
	@CrossOrigin()
	@GetMapping("articlesp")

	public List<Article> getArticlesp() {
		ArrayList<Article> lp= new ArrayList();
		List <Article> l= articleRepository.findAll();
		for(int i=0;i<l.size();i++) {
			if(l.get(i).getCategorie().equals("PIZZA")) {
				lp.add(l.get(i));
			}
		}
		return lp;
		

	}
	@CrossOrigin()
	@GetMapping("articlespl")

	public List<Article> getArticlespl() {
		ArrayList<Article> lp= new ArrayList();
		List <Article> l= articleRepository.findAll();
		for(int i=0;i<l.size();i++) {
			if(l.get(i).getCategorie().equals("PLAT")) {
				lp.add(l.get(i));
			}
		}
		return lp;
		

	}
	@CrossOrigin()
	@GetMapping("articlessa")

	public List<Article> getArticlesS() {
		ArrayList<Article> lp= new ArrayList();
		List <Article> l= articleRepository.findAll();
		for(int i=0;i<l.size();i++) {
			if(l.get(i).getCategorie().equals("SANDWICH")) {
				lp.add(l.get(i));
			}
		}
		return lp;
		

	}
	
	@CrossOrigin()
	@GetMapping("articlesc")

	public List<Article> getArticlesc() {
		ArrayList<Article> lp= new ArrayList();
		List <Article> l= articleRepository.findAll();
		for(int i=0;i<l.size();i++) {
			if(l.get(i).getCategorie().equals("CREPE")) {
				lp.add(l.get(i));
			}
		}
		return lp;
		

	}
	@CrossOrigin()
	@GetMapping("articlesb")

	public List<Article> getArticlesb() {
		ArrayList<Article> lp= new ArrayList();
		List <Article> l= articleRepository.findAll();
		for(int i=0;i<l.size();i++) {
			if(l.get(i).getCategorie().equals("BOISSON")) {
				lp.add(l.get(i));
			}
		}
		return lp;
		

	}
	@CrossOrigin(origins ="http://localhost:4200")
	@GetMapping("articlesC")

	public List<Article> getarticlef() {
		return articleRepository.findAll();

	}
	
	@CrossOrigin()
	@GetMapping("articlee/{id}")

	public ResponseEntity<Article> getArticleById(@PathVariable (value="id") Integer articleId)throws ResourceNotFoundException {
		 
		Article article =articleRepository.findById(articleId).orElseThrow(()->new ResourceNotFoundException("produit not found") );
		return ResponseEntity.ok().body(article);

	}
	
	@CrossOrigin()
	@GetMapping(path="photo/{id}",produces=MediaType.IMAGE_PNG_VALUE)

	public byte[] getPhoto(@PathVariable (value="id") Integer articleId)throws Exception {
		 
		Article article =articleRepository.findById(articleId).get();
		return   Files.readAllBytes(Paths.get(System.getProperty("user.home")+"/pizzeria/articles/"+article.getImage()));  

	}
	@CrossOrigin(origins ="http://localhost:4200")
	@DeleteMapping("article/delete/{id}")

	public List<Article> deletarticle(@PathVariable Integer id) {

		articleRepository.deleteById(id);
		return articleRepository.findAll();

	}
	@CrossOrigin("http://localhost:4200")
	@PutMapping("article/mod/{id}")
    public ResponseEntity<?> update(@RequestBody Article article,@PathVariable Integer id)
    {
    	
		Article existproduit=articleRepository.findById(id).get();
    	
    try { 
    	articleRepository.save(article);
    	return new ResponseEntity<>(HttpStatus.OK);
    	
    	}
    	catch(NoSuchElementException e) {
    		return new ResponseEntity<>(HttpStatus.FOUND);
    	}
    	
    }
	@CrossOrigin(origins ="http://localhost:4200")
	@GetMapping("article/{nom}")

	public Integer getArticleByNom(@PathVariable (value="nom") String nom)throws ResourceNotFoundException {
		 
		List<Article> articles =articleRepository.findAll();
		  
		 Integer res = null;
	       
 	    for (Article c : articles) {
 	        if ((nom.equals(c.getNom()) ) ) {
 	        	res = c.getIdart();
 	        	
 	            break;
 	        }
 	    }
return res;

	}


}
