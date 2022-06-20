import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Article } from 'app/models/article.models';
import { Commande } from 'app/models/commande.models';
import { Client } from 'app/models/client.models';
import { ArticleService } from 'app/services/article.services';
import { CommandeService } from 'app/services/commande.services';
import { ClientService } from 'app/services/client.services';
import { data } from 'jquery';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-editcommande',
  templateUrl: './editcommande.component.html',
  styleUrls: ['./editcommande.component.css']
})
export class EditcommandeComponent implements OnInit {

  id :number;
  article_id:number;
  commande :Commande;
  clients?:Client[];
  articles?:Article[];
  articless:any[]=[];
  article?:Article;
   //apiResponse : ApiResponse;
  constructor(private commandeService: CommandeService,private articleService: ArticleService,private clientService: ClientService,private router:Router, private route:ActivatedRoute) { }

  ngOnInit(): void {
    this.commande=new Commande();
    this.id=this.route.snapshot.params['id'];
    this.commandeService.getCommandeById(this.id).subscribe(
      data=>{console.log(data)
      this.commande=data;
      },
      error=>console.log(error)) ;

     // console.log(this.commande.id_com);
      this.articleService.getAllpostArticles()
       
          .subscribe(
            data => {
              this.articles = data;
            // console.log(this.articles);
             
    
    
            },
            error => {
              console.log(error);
            });
            this.clientService.getAllpostClients()
       
            .subscribe(
              data => {
                this.clients = data;
              // console.log(this.users);
               
      
      
              },
              error => {
                //console.log(error);
              });
              
  }
  onChange(deviceValue) {
   
   this.article_id=deviceValue;
    console.log(this.article_id);
    this.articleService.getArticleById(this.article_id).subscribe((data)=>{
      
               this.article=data;
     this.articless= this.articless.concat(this.article);
    //  this.articless.push(JSON.parse(JSON.stringify(response.data)))

     //  console.log(JSON.stringify(this.articless[0].data.id));
    },error => {
      console.log(error);
    }
    );
}

////

////
  onSubmit(){
    // console.log(this.articless);
    // this.commande.articles=this.articless;
    // this.commande.prix=this.commande.lignedecommande[0].article.prix
//  console.log(this.commande.articles);
    // Swal.fire({
      // title: 'voulez vous modifier?',
      // icon: 'warning',
      // showCancelButton: true,
      // confirmButtonColor: '#3085d6',
      // cancelButtonColor: '#d33',
      // cancelButtonText:'Annuler',
      // confirmButtonText: 'Oui'
    // }).then((result) => {
      // if (result.isConfirmed) {
        // 
       // this.commande.article_id=(this.article_id);
        // console.log(this.commande);
        // this.commandeService.editCommande(this.id,this.commande).subscribe(() =>{
        // Swal.fire(
          // 'modifier!',
          // 'la commande a été modifié.',
          // 'success'
        // );this.commande=new Commande();
        // this.articles= []
        // 
        // this.router.navigate(['commandes']);
        
  // }
  // );

  
// }
    // }
    // 
    // ); 
    }


annuler(){
  this.router.navigate(['commandes']);
}
 
    
   
   
  }
