import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Client} from '../models/client.models';
import { FormGroup } from '@angular/forms';



const baseUrl = 'http://localhost:7999/clients/add';

@Injectable({
    providedIn: 'root'
  })
  
  export class  ClientService {
  
 
  public dataForm:  FormGroup; 
  constructor(private http: HttpClient) { }
  
    
    add(data: any): Observable<any> {
      return this.http.post(baseUrl, data);
    }

    getAllpostClients(): Observable<Client[]> {
        return this.http.get<Client[]>("http://localhost:7999/clients");
      }
   
      getClientById(id:number): Observable<any>{
   
       return this.http.get('http://localhost:7999/client/'+id);
      }
     getVList(): Observable<Client[]> {
       return this.http.get<Client[]>('http://localhost:7999/clients');
     }
     deleteClient(id:number) {
       
       const deleteEndpoint ='http://localhost:7999/clients/delete/'+id;
       return this.http.delete(deleteEndpoint);
     }
     
     editClient(id:number, client:Client){
   
       return this.http.put('http://localhost:7999/clients/mod/'+id,client);
     }
   
}