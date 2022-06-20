import { Component, Input,OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NgbActiveModal,NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { UserService } from 'app/services/user.services';
import { User} from 'app/models/user.models';
import Chart from 'chart.js';
import Swal from 'sweetalert2';
import { ToastrService } from 'ngx-toastr';
@Component({
    selector: 'login-cmp',
    moduleId: module.id,
    templateUrl: 'login.component.html'
})
export class LoginComponent implements OnInit {
  
  user: any={};
  login : string;
  pwd : String;
  errorMessage:string;  
  name : string;
  firstname:string;  
  Wdate;
  annee : 0;
  constructor(private router:Router,private userService : UserService,
    public toastr: ToastrService,private modalService:NgbModal) { }

  ngOnInit() {    
    this.userService.islogin = false;
    this.userService.admin = false;
    this.userService.suser = false;
    // this.annee = (this.Wdate).toString().substring(0,4);
     //localStorage.setItem('annee', this.annee.toString());
 }    
 Logine() {
   
   this.userService.logi(this.login).subscribe(
     response =>{this.user = response;
     console.log(this.pwd);
     if (this.user.nom!=null){
      if (this.user.pwd == this.pwd)
      {
       this.name = this.user.nom;
       this.firstname = this.user.prenom;
       localStorage.setItem('name', this.name);
       localStorage.setItem('firstname', this.firstname);
      
        this.userService.islogin = true;
       if (this.user.role  == "admin")
        {
         this.userService.admin = true;
       this.router.navigate(['articles']);
       localStorage.setItem('isAdmin', "true");
     }
     else
     {
       this.userService.suser = true;
       this.router.navigate(['commandes']);
       localStorage.setItem('isAdmin', "false");
     }
      }
    
             else
             {
               this.toastr.warning( 'Mot de Passe  Incorrecte ')
              }

            }
            else  if((this.user.name==null) && (this.user.pwd!=null)){
         
         
           this.toastr.warning( 'Login Incorrecte ')
         }
         if((this.user.name==null) && (this.user.pwd==null)){
          this.toastr.warning( 'Saisir Votre Login et Votre Mot de passe ')

         }
         
        });
         
         
  
         
   
   }
   inscrire()
   {
     this.router.navigate(['/client']);
   }
   

  
   logout() {
     // remove user from local storage and set current user to null
     localStorage.removeItem('name');
     
 }
 employe(){
   return this.userService.suser;
 }
}
