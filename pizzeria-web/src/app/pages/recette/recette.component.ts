import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Recette } from 'app/models/recette.models';
import { RecetteService } from 'app/services/recette.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-recette',
  templateUrl: './recette.component.html',
  styleUrls: ['./recette.component.css']
})
export class RecetteComponent implements OnInit {

  constructor(private recetteService: RecetteService,private router:Router,private modalService:NgbModal) { }

  recettes?:Recette[];
  datee = new Date();
  recette=new Recette();
  date:any;
  ngOnInit(): void { this.retrieveV();
     
    
    
  }
  
  retrieveV(): void {
   
    this.recetteService.getCList()
      .subscribe(
        data => {
          this.recettes = data;
         console.log(data);
         //this.retrieveV();
  
  
        },
        error => {
          console.log(error);
        });
  
  }
  deleteRecette(id) {
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
    
    this.recetteService.deleteRecette(id)
      .subscribe(() =>{
        Swal.fire(
          'Supprimer!',
          'recette a été supprimé.',
          'success'
        );
        
  }
  );
  window.location.reload();
  
  }
  }
  )
  }
  Updaterecette(id:number){
    this.router.navigate(['updaterec',id]);
  }
  saveRecette(){

    const rec={
      date:"",
      somme:0
    };
    this.recetteService.add(rec).subscribe(data=>{

      window.location.reload();

    })
    
  }
  net(a:number,b:number){
    return(a-b);
  }
  search(){

    if (this.date==""){
  
    this.ngOnInit();
     }else{
      this.recettes=this.recettes.filter(
   res => {return res.date.toLocaleLowerCase().match(this.date.toLocaleLowerCase())}
    )
   }
  
  } 
}
