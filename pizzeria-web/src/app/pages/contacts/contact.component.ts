import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Contact } from 'app/models/contact.models';
import { ContactService } from 'app/services/contact.services';
import { ToastrService } from "ngx-toastr";
import Swal from 'sweetalert2';


@Component({
    selector: 'contact-cmp',
    moduleId: module.id,
    templateUrl: 'contact.component.html'
})

export class ContactComponent  implements OnInit{
  constructor(private contactService: ContactService,private router:Router) {}
  

  nom:any;
  nom_prenom:String;
  id:'';
  submitted = false;
  noms
  contacts?: Contact[];
  currentShop?: Contact;
  currentIndex = -1;

  ngOnInit(): void { this.retrieveV();
     

    
}

retrieveV(): void {
 
  this.contactService.getCList()
    .subscribe(
      data => {
        this.contacts = data;
       console.log(data);
       //this.retrieveV();


      },
      error => {
        console.log(error);
      });

}

deleteContact(id) {
  Swal.fire({
    title: 'voulez vous supprimer?',
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    cancelButtonText:'Annuler',
    confirmButtonText: 'Oui'
  }).then((result) => {
    window.location.reload();
    if (result.isConfirmed) {
  
  this.contactService.deleteContact(id)
    .subscribe(() =>{
      Swal.fire(
        'Supprimer!',
        'produit a été supprimé.',
        'success'
      );
      
}

);


}
}
)
}

// search(){

//   if (this.nom_prenom==""){

//   this.ngOnInit();
//    }else{
//     this.contacts=this.contacts.filter(
//  res => {return res.nom_prenom.toLocaleLowerCase().match(this.nom_prenom.toLocaleLowerCase())}
//   )
//  }

// } 
}
