import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Article } from 'app/models/article.models';
import { ArticleService } from 'app/services/article.services';
import { data } from 'jquery';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-editarticle',
  templateUrl: './editarticle.component.html',
  styleUrls: ['./editarticle.component.css']
})
export class EditarticleComponent implements OnInit {

  idart :number;
  article :Article;
  categorie:'';
   //apiResponse : ApiResponse;
  constructor(private articleService: ArticleService,private router:Router, private route:ActivatedRoute) { }
  onSelected (deviceValue) {
   
    this.categorie=deviceValue;
     console.log(this.categorie);
 }
 
  ngOnInit(): void {
    this.article=new Article();
    this.idart=this.route.snapshot.params['id'];
    this.articleService.getArticleById(this.idart).subscribe(
      data=>{console.log(data)
      this.article=data;
      },
      error=>console.log(error)) ;

      console.log(this.article.image);
      
  }

  onSubmit(){
    Swal.fire({
      title: 'voulez vous modifier?',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      cancelButtonText:'Annuler',
      confirmButtonText: 'Oui'
    }).then((result) => {
      if (result.isConfirmed) {
    this.article.categorie=this.categorie;
        this.articleService.editArticle(this.idart,this.article).subscribe(() =>{
        Swal.fire(
          'modifier!',
          'Article a été modifié.',
          'success'
        );this.article=new Article();
        this.router.navigate(['articles']);
        
  }
  );

  
}
    }
    
    ); 
    }


    annuler(){
      this.router.navigate(['articles']);
    }
 
    
   
   
  }
