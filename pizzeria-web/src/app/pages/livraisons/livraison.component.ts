import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import {Commande   } from 'app/models/commande.models';
import { Article } from 'app/models/article.models';
import { CommandeService } from 'app/services/commande.services';
import { ArticleService } from 'app/services/article.services';
import { UserService } from 'app/services/user.services';
import { User } from 'app/models/user.models';
import { Livraison } from 'app/models/livraison.models';
import { LivraisonService } from 'app/services/livraison.services';
import Swal from 'sweetalert2';
import { Livreur } from 'app/models/livreur.models';
import { LivreurService } from 'app/services/livreur.services';
import { LignedecommandeService } from 'app/services/ligne.services';

@Component({
    selector: 'livraison-cmp',
     moduleId: module.id,
     templateUrl: 'livraison.component.html'
 })
 export class LivraisonComponent {
  livreur_id: number;
  commande_id: number;
  lignedecommandes?:any[];


     constructor(private livraisonService: LivraisonService,private lignedecommande :LignedecommandeService ,private livreurService: LivreurService,private commandeService: CommandeService,private router:Router) { }


    livraison: Livraison = {
       
        livreur_idlivreur:0,
        commande_id_com:0
    
       
  };
  nom:any;
  nomcl:String;
  id:4;
  submitted = false;
  livraisons?: any[];
  commandes?:Commande[];
  livreurs?:Livreur[];
  som?:number;
  commande?:any;
  livreur?:Livreur;
 // Produits?:Produit[];
  //Users?:User[];
  

    ngOnInit(): void {
    
   
        this.livraisonService.getAllpostLivraison()
      
          .subscribe(
            data => {
              this.livraisons = data;
             console.log(this.livraisons);
             
    
    
            },
            error => {
              console.log(error);
            });
            this.commandeService.getAllpostCommandes()
            .subscribe(
              data => {
                this.commandes = data;
               console.log(this.commandes);
               
      
      
              },
              error => {
                console.log(error);
              });

              this.livreurService.getAllpostLivreurs()
       
              .subscribe(
                data => {
                  this.livreurs = data;
                 console.log(this.livreurs);
                 
        
        
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

   

     deleteLivraison(id) {
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
        
        this.livraisonService.deleteLivaraison(id)
          .subscribe(() =>{
            Swal.fire(
              'Supprimer!',
              'livraison a été supprimé.',
              'success'
            );
            window.location.reload();
            
      }
      );
    
      
    }
    }
        )}

        UpdateLivraison(id:number){

            this.router.navigate(['updateL',id]);
      
          }
          
          onChange(deviceValue) {
   
            this.livreur_id=deviceValue;
         this.livreurService.getLivreurById(this.livreur_id).subscribe( 
          data => { 
            this.livreur=data;
             console.log(this.livreur);
         }
          );
        }
         onSelected(deviceValue) {
          this.commande_id=deviceValue;
          this.commandeService.getCommandeById(this.commande_id).subscribe( 
           data => { 
             this.commande=data;
              console.log(this.commande);
          }
           );
       }
          saveLivraison(): void
          {
           const data = {
            
            livreur: this.livreur,
             commande: this.commande
           
    
         
           };
           console.log(data);
           this.livraisonService.add(data)
             .subscribe(
               response => {
                 console.log(response);
                 this.submitted = true;
                 console.log("ajouté")
                 Swal.fire(
                   'livraison ajouter avec  succes !',
                   '',
                   'success'
                 )
                 window.location.reload();
       
               },
               error => {
                 console.log(error);
               });
       
         }
          somme(a:number,b:number){
            return (a+b);
          }
          Updatelivraison(id:number){

            this.router.navigate(['updatelivr',id]);
      
          }
          search(){

            if (this.nomcl==""){
          
            this.ngOnInit();
             }else{
          //     this.livraisons=this.livraisons.filter(
          //  res => {return res.commande.client.nom.toLocaleLowerCase().match(this.nomcl.toLocaleLowerCase())}
          //   )
            this.livraisons=this.livraisons.filter(
              res => {return res.commande.client.nom.toLocaleLowerCase().match(this.nomcl.toLocaleLowerCase())}
               )
           }
          
          } 
          
}
