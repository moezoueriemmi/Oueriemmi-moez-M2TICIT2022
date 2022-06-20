import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { User} from '../models/user.models';
import { FormGroup } from '@angular/forms';



const baseUrl = 'http://localhost:7999/users/add';

@Injectable({
    providedIn: 'root'
  })
  
  export class  UserService {
  
  islogin = false;
  admin = false;
  suser = false;
  choixmenu : string  = 'A';
  listData : User[];
  public dataForm:  FormGroup; 
  constructor(private http: HttpClient) { }
  
    
    add(data: any): Observable<any> {
      return this.http.post(baseUrl, data);
    }

    getAllpostUsers(): Observable<User[]> {
        return this.http.get<User[]>("http://localhost:7999/users");
      }
   
      getUserById(id:number): Observable<any>{
   
       return this.http.get('http://localhost:7999/user/'+id);
      }
     getVList(): Observable<User[]> {
       return this.http.get<User[]>('http://localhost:7999/users');
     }
     deleteUser(id:number) {
       
       const deleteEndpoint ='http://localhost:7999/users/delete/'+id;
       return this.http.delete(deleteEndpoint);
     }
     loginn(login:string,password:string){
      return this.http.get<User[]>('http://localhost:7999/user/'+login+'/'+password);
     }
     logi(login:string):Observable<User[]> {
      return this.http.get<User[]>('http://localhost:7999/userr/'+login);
     }
     editUser(id:number, user:User){
   
       return this.http.put('http://localhost:7999/users/mod/'+id,user);
     }
   
}