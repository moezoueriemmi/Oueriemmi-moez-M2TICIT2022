import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Livreur } from 'app/models/livreur.models';
import { LivreurService } from 'app/services/livreur.services';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-editlivreur',
  templateUrl: './editlivreur.component.html',
  styleUrls: ['./editlivreur.component.css']
})
export class EditlivreurComponent implements OnInit {

  id :number;
  livreur :Livreur;
   //apiResponse : ApiResponse;
  constructor(private livreurService: LivreurService,private router:Router, private route:ActivatedRoute) { }

  ngOnInit(): void {
    this.livreur=new Livreur();
    this.id=this.route.snapshot.params['id'];
    this.livreurService.getLivreurById(this.id).subscribe(
      data=>{console.log(data)
      this.livreur=data;
      },
      error=>console.log(error)) ;

      
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
    
        this.livreurService.editLivreur(this.id,this.livreur).subscribe(() =>{
        Swal.fire(
          'modifier!',
          'Livreur a été modifié.',
          'success'
        );this.livreur=new Livreur();
        this.router.navigate(['livreurs']);
        
  }
  );

  
}
    }
    
    ); 
    }



 
    
   
   

}
