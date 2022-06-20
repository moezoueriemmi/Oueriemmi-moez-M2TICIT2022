import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Livreur } from 'app/models/livreur.models';
import { LivreurService } from 'app/services/livreur.services';
import Swal from 'sweetalert2';

@Component({
    selector: 'livreur-cmp',
    moduleId: module.id,
    templateUrl: 'livreur.component.html'
})

export class LivreurComponent implements OnInit{
  livreurs: Livreur[]=[];

    constructor(private livreurService: LivreurService,private router:Router) { }


    livreur: Livreur = {
        idlivreur:1,
        nom:'',
        prenom: '',
        tel:'',
        adresse:'',
        prix:0,

  };
  nom:any;
  id:4;
  submitted = false;
  liv:any;
  
  // currentShop?: Client;
  // currentIndex = -1;

    ngOnInit(): void {
        this.retrieveV();
    }

    retrieveV(): void {
   
        this.livreurService.getVList()
          .subscribe(
            data => {
              this.livreurs = data;
             console.log(data);
              this.retrieveV();
    
    
            },
            error => {
              console.log(error);
            });
    
      }

      saveLivreur(): void
      {
       const data = {
        idlivreur :this.livreur.idlivreur,
        nom: this.livreur.nom,
         prenom: this.livreur.prenom,
         tel: this.livreur.tel,
         adresse: this.livreur.adresse,
         prix: this.livreur.prix,
     
       };
       this.livreurService.add(data)
         .subscribe(
           response => {
             console.log(response);
             this.submitted = true;
             console.log("ajouté")
             Swal.fire(
               'livreur ajouter avec  succes !',
               '',
               'success'
             )
   
           },
           error => {
             console.log(error);
           });
   
     }

     deleteLivreur(idlivreur) {
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
        
        this.livreurService.deleteLivreur(idlivreur)
          .subscribe(() =>{
            Swal.fire(
              'Supprimer!',
              'Livreur a été supprimé.',
              'success'
            );
            
      }
      );
    
      
    }
    }
        )}

        UpdateLivreur(id:number){

            this.router.navigate(['updateliv',id]);
      
          }
           search(){

            if (this.liv==""){
          
            this.ngOnInit();
             }else{
              this.livreurs=this.livreurs.filter(
           res => {return res.adresse.toLocaleLowerCase().match(this.liv.toLocaleLowerCase())}
          
            )
            console.log(this.livreurs);
           }
          
          } 
          
}
