import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Produit } from 'app/models/produit.models';
import { ProduitService } from 'app/services/produit.services';
import { data } from 'jquery';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-editproduit',
  templateUrl: './editproduit.component.html',
  styleUrls: ['./editproduit.component.css']
})
export class EditproduitComponent implements OnInit {

  id :number;
  produit :Produit;
   //apiResponse : ApiResponse;
  constructor(private produitService: ProduitService,private router:Router, private route:ActivatedRoute) { }

  ngOnInit(): void {
    this.produit=new Produit();
    this.id=this.route.snapshot.params['id'];
    this.produitService.getProduitById(this.id).subscribe(
      data=>{console.log(data)
      this.produit=data;
      },
      error=>console.log(error)) ;

      console.log(this.produit.image);
      
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
    
        this.produitService.editProduit(this.id,this.produit).subscribe(() =>{
        Swal.fire(
          'modifier!',
          'le produit a été modifié.',
          'success'
        );this.produit=new Produit();
        this.router.navigate(['produits']);
        
  }
  );

  
}
    }
    
    ); 
    }


    annuler(){
      this.router.navigate(['produits']);
    }
 
    
   
   
  }
