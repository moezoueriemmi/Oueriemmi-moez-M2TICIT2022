import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Client } from 'app/models/client.models';
import { ClientService } from 'app/services/client.services';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-editclient',
  templateUrl: './editclient.component.html',
  styleUrls: ['./editclient.component.css']
})
export class EditclientComponent implements OnInit {

  id_client :number;
  client :Client;
   //apiResponse : ApiResponse;
  constructor(private clientService: ClientService,private router:Router, private route:ActivatedRoute) { }

  ngOnInit(): void {
    this.client=new Client();
    this.id_client=this.route.snapshot.params['id'];
    this.clientService.getClientById(this.id_client).subscribe(
      data=>{console.log(data)
      this.client=data;
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
    
        this.clientService.editClient(this.id_client,this.client).subscribe(() =>{
        Swal.fire(
          'modifier!',
          'client a été modifié.',
          'success'
        );this.client=new Client();
        this.router.navigate(['clients']);
        
  }
  );

  
}
    }
    
    ); 
    }



 
    
    annuler(){
      this.router.navigate(['clients']);
    }   
   

}
