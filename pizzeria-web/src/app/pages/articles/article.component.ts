import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NgbActiveModal, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Article } from 'app/models/article.models';
import { ArticleService } from 'app/services/article.services';
import Chart from 'chart.js';
import Swal from 'sweetalert2';



@Component({
    selector: 'article-cmp',
    moduleId: module.id,
    templateUrl: 'article.component.html'
})


export class ArticleComponent implements OnInit{
  currentPage=0;
  size =0;
 
  articles: Article[]=[];

  constructor(private articleService: ArticleService,private router:Router,private modalService:NgbModal) { }
  article: Article = {
    idart:1,
    image:'',
    nom:'',
   ingredients:'',
    prix: 0,
    categorie:''
  };
  nom:any;
  id:'';
  categorie:'';
  submitted = false;
 
 
  currentShop?: Article;
  currentIndex = -1;

  ngOnInit(): void {
    this.retrieveV();
     

    
  }
  
  retrieveV(): void {
   
    this.articleService.getVList()
      .subscribe(
        data => {
          this.articles = data;
         console.log(data);
         //this.retrieveV();


        },
        error => {
          console.log(error);
        });

  }
  onSelected (deviceValue) {
   
    this.categorie=deviceValue;
     console.log(this.categorie);
 }
 
  saveArticle(): void
   {
    const data = {
      idart :this.article.idart,
      image: this.article.image.substring(12,this.article.image.length),
      nom: this.article.nom,
      ingredients: this.article.ingredients,
      prix:this.article.prix,
      categorie:this.categorie,
  
    };
    this.articleService.add(data)
      .subscribe(
        response => {
          console.log(response);
          this.submitted = true;
          console.log("ajouté")
       
          Swal.fire(
            'Article ajouter avec  succes !',
            '',
            'success'
          )
         

        },
        error => {
          console.log(error);
        });
        window.location.reload();
  }
 
  deleteArticle(idart) {
    Swal.fire({
      title: 'voulez vous supprimer?',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      cancelButtonText:'Annuler',
      confirmButtonText: 'Oui'
    }).then((result) => {
      if (result.isConfirmed) {
    
    this.articleService.deleteArticle(idart)
      .subscribe(() =>{
        Swal.fire(
          'Supprimer!',
          'article a été supprimé.',
          'success'
        );
      
  }
  );
  
  
}
window.location.reload();
}
    )}


    UpdateArticle(id:number){

      this.router.navigate(['updateart',id]);

    }
 
    search(){

      if (this.nom==""){

      this.ngOnInit();
       }else{
        this.articles=this.articles.filter(
     res => {return res.nom.toLocaleLowerCase().match(this.nom.toLocaleLowerCase())}
      );
      console.log(this.articles);

     }

    } 
    
}
    

