import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Recette } from 'app/models/recette.models';
import { RecetteService } from 'app/services/recette.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-editrecette',
  templateUrl: './editrecette.component.html',
  styleUrls: ['./editrecette.component.css']
})
export class EditrecetteComponent implements OnInit {

  id :number;
  recette :Recette;
   //apiResponse : ApiResponse;
  constructor(private recetteService: RecetteService,private router:Router, private route:ActivatedRoute) { }

  ngOnInit(): void {
    this.recette=new Recette();
    this.id=this.route.snapshot.params['id'];
    this.recetteService.getRecetteById(this.id).subscribe(
      data=>{console.log(data)
      this.recette=data;
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
    
        this.recetteService.editRecette(this.id,this.recette).subscribe(() =>{
          console.log(this.recette);
        Swal.fire(
          'modifier!',
          'Livreur a été modifié.',
          'success'
        );this.recette=new Recette();
        this.router.navigate(['recettes']);
        
  }
  );

  
}
    }
    
    ); 
    }



 
    
   
   

}
