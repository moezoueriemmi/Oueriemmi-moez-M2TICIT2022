import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { User } from 'app/models/user.models';
import { UserService } from 'app/services/user.services';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-edituser',
  templateUrl: './edituser.component.html',
  styleUrls: ['./edituser.component.css']
})
export class EdituserComponent implements OnInit {

  id :number;
  user :User;
   //apiResponse : ApiResponse;
  constructor(private userService: UserService,private router:Router, private route:ActivatedRoute) { }

  ngOnInit(): void {
    this.user=new User();
    this.id=this.route.snapshot.params['id'];
    this.userService.getUserById(this.id).subscribe(
      data=>{console.log(data)
      this.user=data;
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
    
        this.userService.editUser(this.id,this.user).subscribe(() =>{
        Swal.fire(
          'modifier!',
          'utilisateur a été modifié.',
          'success'
        );this.user=new User();
        this.router.navigate(['users']);
        
  }
  );

  
}
    }
    
    ); 
    }


    annuler(){
      this.router.navigate(['users']);
    }
 
    
   
   

}
