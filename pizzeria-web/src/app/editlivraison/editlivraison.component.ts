import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Commande } from 'app/models/commande.models';
import { Livraison } from 'app/models/livraison.models';
import { Livreur } from 'app/models/livreur.models';
import { CommandeService } from 'app/services/commande.services';
import { LivraisonService } from 'app/services/livraison.services';
import { LivreurService } from 'app/services/livreur.services';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-editlivraison',
  templateUrl: './editlivraison.component.html',
  styleUrls: ['./editlivraison.component.css']
})
export class EditlivraisonComponent implements OnInit {

  id :number;
  livreur_id:number;
  commande_id:number;
  commande:Commande;
  livreur:Livreur;
  livraison :Livraison;
  livraisons:Livraison[];
  livreurs:Livreur[];
  commandes:Commande[];
   //apiResponse : ApiResponse;
  constructor(private livraisonService: LivraisonService,private livreurService: LivreurService,private commandeService: CommandeService,private router:Router, private route:ActivatedRoute) { }

  ngOnInit(): void {
    this.id=this.route.snapshot.params['id'];
   
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
  onSubmit(){

    this.livraisonService.getLivraisonById(this.id).subscribe(data=>{

        this.livraison=data;
      
        console.log(this.livraison);
    },error => {
        console.log(error);
      });
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
    
        this.livraisonService.editLivraison(this.id,this.livraison).subscribe(() =>{
        Swal.fire(
          'modifier!',
          'Livraison a été modifié.',
          'success'
        );this.livraison=new Livraison();
        this.router.navigate(['livreurs']);
        
  }
  );

  
}
    }
    
    ); 
    }



 
    
   
   

}
