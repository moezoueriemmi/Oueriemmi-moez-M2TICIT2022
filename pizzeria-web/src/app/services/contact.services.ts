import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Contact} from '../models/contact.models';



@Injectable({
    providedIn: 'root'
  })
  export class ContactService {
  
    constructor(private http: HttpClient) { }
  
    
   

    getAllpostContacts(): Observable<Contact[]> {
        return this.http.get<Contact[]>("http://localhost:7999/contacts");
      }
   
      
     getCList(): Observable<Contact[]> {
       return this.http.get<Contact[]>('http://localhost:7999/contacts');
     }
     deleteContact(id:number) {
       
       const deleteEndpoint ='http://localhost:7999/contacts/delete/'+id;
       return this.http.delete(deleteEndpoint);
     }
     
     
   
}