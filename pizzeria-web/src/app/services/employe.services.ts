import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Employe} from '../models/employe.models';

const baseUrl = 'http://localhost:7999/employes/add';

@Injectable({
    providedIn: 'root'
  })
  
  export class EmployeService {
  
    constructor(private http: HttpClient) { }
  
    
   
    
   
   
      
     getList(): Observable<Employe[]> {
       return this.http.get<Employe[]>('http://localhost:7999/employes');
     }
     deleteEmploye(id:number) {
       
       const deleteEndpoint ='http://localhost:7999/employes/delete/'+id;
       return this.http.delete(deleteEndpoint);
     }
     
     editEmploye(id:number, employe:Employe){

      return this.http.put('http://localhost:7999/employes/mod/'+id,employe);
     }

     getEmployeById(id:number): Observable<Employe>{

      return this.http.get('http://localhost:7999/employe/'+id);
     }
     add(data: any): Observable<Employe> {
      return this.http.post(baseUrl, data);
    }
}