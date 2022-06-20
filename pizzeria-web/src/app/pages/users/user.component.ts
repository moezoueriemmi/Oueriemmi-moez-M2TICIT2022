import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { User } from 'app/models/user.models';
import { UserService } from 'app/services/user.services';
import Swal from 'sweetalert2';

@Component({
    selector: 'user-cmp',
    moduleId: module.id,
    templateUrl: 'user.component.html'
})

export class UserComponent implements OnInit{


    constructor(private userService: UserService,private router:Router) { }


    user: User = {
        id_user:1,
        nom:'',
        prenom: '',
        email:'',
        tel:'',
        adresse:'',
        login:'',
    pwd:'',
    role:'',

  };
  usen:any;
  id:4;
  submitted = false;
  
  users?: User[];
  // currentShop?: Client;
  // currentIndex = -1;

    ngOnInit(): void {
        this.retrieveV();
    }

    retrieveV(): void {
   
        this.userService.getVList()
          .subscribe(
            data => {
              this.users = data;
             console.log(data);
              this.retrieveV();
    
    
            },
            error => {
              console.log(error);
            });
    
      }

      saveUser(): void
      {
       const data = {
        id_user :this.user.id_user,
        nom: this.user.nom,
         prenom: this.user.prenom,
         email: this.user.email,
         tel: this.user.tel,
         adresse: this.user.adresse,
         login: this.user.login,
         pwd: this.user.pwd,
         role: this.user.role,
     
       };
       this.userService.add(data)
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
             window.location.reload();
   
           },
           error => {
             console.log(error);
           });
   
     }

     deleteUser(id) {
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
        
        this.userService.deleteUser(id)
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

        UpdateUser(id:number){

            this.router.navigate(['updateu',id]);
      
          }
          search(){

            if (this.usen==""){
          
            this.ngOnInit();
             }else{
              this.users=this.users.filter(
           res => {return res.nom.toLocaleLowerCase().match(this.usen.toLocaleLowerCase())}
            )
           }
          
          } 
        }

