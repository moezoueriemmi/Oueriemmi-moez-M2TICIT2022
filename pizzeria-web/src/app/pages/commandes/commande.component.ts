import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import {Commande   } from 'app/models/commande.models';
import { Article } from 'app/models/article.models';
import { CommandeService } from 'app/services/commande.services';
import { ArticleService } from 'app/services/article.services';
import { UserService } from 'app/services/user.services';
import { User } from 'app/models/user.models';
import Swal from 'sweetalert2';
import { Client } from 'app/models/client.models';
import { data } from 'jquery';
import { Livreur } from 'app/models/livreur.models';
import { ClientService } from 'app/services/client.services';
import { LivreurService } from 'app/services/livreur.services';
import { RecetteService } from 'app/services/recette.service';
import { LignedecommandeService } from 'app/services/ligne.services';
import {  Lignedecommande } from 'app/models/lignedecommande.models';

@Component({
    selector: 'commande-cmp',
     moduleId: module.id,
     templateUrl: 'commande.component.html'
 })
 export class CommandeComponent {


     constructor(private commandeService: CommandeService,private recetteService: RecetteService,private lignedecommande :LignedecommandeService ,private clientService: ClientService,private livreurService: LivreurService,private articleService: ArticleService,private userService: UserService,private router:Router) { }

  commande:any; 
  nom:any;
  nomc='';
  id:4;
  idcom:0;
  submitted = false;
  commandes?: Commande[];
  lignedecommandes?: Lignedecommande[];
 // Produits?:Produit[];
  //Users?:User[];

  clients?:Client[];
  articles?:Article[];
  livreur?:Livreur;
  client?:Client;

    ngOnInit(): void {
    
   
        this.commandeService.getAllpostCommandes()
       
          .subscribe(
            data => {
              this.commandes = data;
              
             console.log(data);
             
    
    
            },
            error => {
              console.log(error);
            });
            this.lignedecommande.getAllpostlignesdecommande().subscribe(
              data=>{
                this.lignedecommandes=data;
                console.log(this.lignedecommandes);
              }
            )
    
      }

   

     deleteCommande(id) {
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
            this.commandeService.getCommandeById(id).subscribe(data=>{
                    this.commande=data;
                    console.log(data);
                    this.recetteService.annuler(data).subscribe(data1=>{
  
                    });
            });
           
       
       

       
        this.commandeService.deleteCommande(id)
          .subscribe(() =>{
            Swal.fire(
              'Supprimer!',
              'commande a été supprimé.',
              'success'
            );
           // window.location.reload();     
      }
      );
    
      
    }
    }
        )}

        UpdateCommande(id:number){
           
          
      
    
            this.router.navigate(['updatec',id]);
      
          }
          @Input()
          public send(id){

                 
                  this.commandeService.editEtatById(id).subscribe(
                       data=>{
                        this.commande=data;
             console.log(this.commande);
                 
                this.commande=new Commande();
                window.location.reload();
                },
                error => {
                  console.log(error);
                });
          

              
                

               console.log(id);
              //window.location.reload();  
            }
            search(){

              if (this.nomc==""){
        
              this.ngOnInit();
               }else{
                this.commandes=this.commandes.filter(
             res => {return res.etat.toLocaleLowerCase().match(this.nomc.toLocaleLowerCase())}
              )
             }
        
            } 
           
          }

