import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NgbActiveModal, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Produit } from 'app/models/produit.models';
import { ProduitService } from 'app/services/produit.services';
import Chart from 'chart.js';
import Swal from 'sweetalert2';



@Component({
    selector: 'produit-cmp',
    moduleId: module.id,
    templateUrl: 'produit.component.html'
})


export class ProduitComponent implements OnInit{
 
  

  constructor(private produitService: ProduitService,private router:Router,private modalService:NgbModal) { }
  produit: Produit = {
    id:1,
    image:'',
    nom:'',
   qte: 0,
    prix: 0,
  };
nom:any;
  id:'';
  submitted = false;
  nomp:String;
  produits?: Produit[];
  currentShop?: Produit;
  currentIndex = -1;

  ngOnInit(): void {
    this.retrieveV();
     

    
  }
  
  retrieveV(): void {
   
    this.produitService.getVList()
      .subscribe(
        data => {
          this.produits = data;
         console.log(data);
         //this.retrieveV();


        },
        error => {
          console.log(error);
        });

  }
 
  saveProduit(): void
   {
    const data = {
      id :this.produit.id,
      image: this.produit.image.substring(12,this.produit.image.length),
      nom: this.produit.nom,
      qte: this.produit.qte,
      prix:this.produit.prix,
  
    };
    this.produitService.add(data)
      .subscribe(
        response => {
          console.log(response);
          this.submitted = true;
          console.log("ajouté")
          Swal.fire(
            'Produit ajouter avec  succes !',
            '',
            'success'
          )
          window.location.reload();

        },
        error => {
          console.log(error);
        });
       
  }
 
  deleteProduit(id) {
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
    
    this.produitService.deleteProduit(id)
      .subscribe(() =>{
        Swal.fire(
          'Supprimer!',
          'produit a été supprimé.',
          'success'
        );
        window.location.reload();
        
  }
  );

  
}
}
    )}


    Updateproduit(id:number){

      this.router.navigate(['update',id]);

    }
 
    search(){

      if (this.nomp==""){

        this.ngOnInit();
      }else{
        this.produits=this.produits.filter(
          res => {return res.nom.toLocaleLowerCase().match(this.nomp.toLocaleLowerCase())}
        )
      }

    }
}
    

