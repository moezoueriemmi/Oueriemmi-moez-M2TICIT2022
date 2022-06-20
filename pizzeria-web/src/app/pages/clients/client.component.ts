import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Client } from 'app/models/client.models';
import { ClientService } from 'app/services/client.services';
import Swal from 'sweetalert2';

@Component({
    selector: 'client-cmp',
    moduleId: module.id,
    templateUrl: 'client.component.html'
})

export class ClientComponent implements OnInit{
  clients: Client[]=[];

    constructor(private clientService: ClientService,private router:Router) { }


    client: Client = {
        id_client:1,
        nom:'',
        prenom: '',
        tel:'',
      

  };
  nom:any;
  Nom:any;
  id:4;
  submitted = false;
  
  
  // currentShop?: Client;
  // currentIndex = -1;

    ngOnInit(): void {
        this.retrieveV();
    }

    retrieveV(): void {
   
        this.clientService.getVList()
          .subscribe(
            data => {
              this.clients = data;
             console.log(data);
              this.retrieveV();
    
    
            },
            error => {
              console.log(error);
            });
    
      }

      saveClient(): void
      {
       const data = {
        id_client :this.client.id_client,
        nom: this.client.nom,
         prenom: this.client.prenom,
         tel: this.client.tel,

     
       };
       this.clientService.add(data)
         .subscribe(
           response => {
             console.log(response);
             this.submitted = true;
             console.log("ajouté")
             Swal.fire(
               'user ajouter avec  succes !',
               '',
               'success'
             )
   
           },
           error => {
             console.log(error);
           });
           window.location.reload();
     }

     deleteClient(id) {
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
        
        this.clientService.deleteClient(id)
          .subscribe(() =>{
            Swal.fire(
              'Supprimer!',
              'user a été supprimé.',
              'success'
            );
            window.location.reload();
      }
      
      );
    
      
    }
    }
        )}

        UpdateClient(id:number){

            this.router.navigate(['updatecl',id]);
      
          }
          search(){

            if (this.Nom !==""){
              this.clients=this.clients.filter(
                res => {return res.tel.toLocaleLowerCase().match(this.Nom.toLocaleLowerCase())}
                 )
            
             }else{
              this.ngOnInit();
           }
      
          } 
}
