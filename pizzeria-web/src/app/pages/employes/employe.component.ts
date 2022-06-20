import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NgbActiveModal, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Employe } from 'app/models/employe.models';
import { EmployeService } from 'app/services/employe.services';
import Chart from 'chart.js';
import Swal from 'sweetalert2';



@Component({
    selector: 'employe-cmp',
    moduleId: module.id,
    templateUrl: 'employe.component.html'
})


export class EmployeComponent implements OnInit{
 
  

  constructor(private employeService: EmployeService,private router:Router,private modalService:NgbModal) { }
  
employe: Employe = {

nom:'',
prenom:'',
salaire:0,
tel:'',
poste:'',
datentree:'',
jourrepos:'',
  };
nom:any;
  idemp:'';
  submitted = false;
  noms
   employes?: Employe[];
  currentShop?: Employe;
  currentIndex = -1;

  ngOnInit(): void {
    this.retrieveV();
     

    
  }
  
  retrieveV(): void {
   
    this.employeService.getList()
      .subscribe(
        data => {
          this.employes = data;
         console.log(data);
         //this.retrieveV();


        },
        error => {
          console.log(error);
        });

  }
 
  saveEmploye(): void
   {
    const data = {
      idemp :this.employe.idemp,
      nom: this.employe.nom,
      prenom: this.employe.prenom,
      salaire: this.employe.salaire,
      poste:this.employe.poste,
      tel:this.employe.tel,
      datentree:this.employe.datentree,
      jourrepos:this.employe.jourrepos,
  
    };
    this.employeService.add(data)
      .subscribe(
        response => {
          console.log(response);
          this.submitted = true;
          console.log("ajouté")
          Swal.fire(
            'Employe ajouter avec  succes !',
            '',
            'success'
          )
          this.router.navigate(['employes']);

        },
        error => {
          console.log(error);
        });
       

  }
 
  deleteEmploye(idemp) {
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
    
    this.employeService.deleteEmploye(idemp)
      .subscribe(() =>{
        Swal.fire(
          'Supprimer!',
          'employe a été supprimé.',
          'success'
        );
        
  }
  );

  
}
this.router.navigate(['employes']);}

    ) }


    Updateemploye(id:number){

      this.router.navigate(['updateemp',id]);

    }
 
//     Serach(){

//       if (this.nom==""){

//         this.ngOnInit();
//       }else{
//         this.produits=this.produits.filter(
//           res => {return res.nom.toLocaleLowerCase().match(this.nom.toLocaleLowerCase())}
//         )
//       }

//     }
}
    

