import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Employe } from 'app/models/employe.models';
import { EmployeService } from 'app/services/employe.services';
import { data } from 'jquery';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-editemploye',
  templateUrl: './editemploye.component.html',
  styleUrls: ['./editemploye.component.css']
})
export class EditemployeComponent implements OnInit {

  idemp :number;
  employe :Employe;
   //apiResponse : ApiResponse;
  constructor(private employeService: EmployeService,private router:Router, private route:ActivatedRoute) { }

  ngOnInit(): void {
    this.employe=new Employe();
    this.idemp=this.route.snapshot.params['id'];
    this.employeService.getEmployeById(this.idemp).subscribe(
      data=>{console.log(data)
      this.employe=data;
      },
      error=>console.log(error)) ;

      console.log(this.employe.idemp);
      
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
    
        this.employeService.editEmploye(this.idemp,this.employe).subscribe(() =>{
        Swal.fire(
          'modifier!',
          'le produit a été modifié.',
          'success'
        );this.employe=new Employe();
        this.router.navigate(['employes']);
        
  }
  );

  
}
    }
    
    ); 
    }



 
    annuler(){
      this.router.navigate(['employes']);
    }
   
   
  }
