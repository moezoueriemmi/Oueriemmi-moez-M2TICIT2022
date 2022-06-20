import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Commande} from '../models/commande.models';
import { Client } from 'app/models/client.models';



@Injectable({
    providedIn: 'root'
  })
  export class CommandeService {
  
    constructor(private http: HttpClient) { }
  
    
   

    getAllpostCommandes(): Observable<Commande[]> {
        return this.http.get<Commande[]>('http://localhost:7999/commandes');
      }
   
      

      deleteCommande(id:number) {
       
        const deleteEndpoint ='http://localhost:7999/commandes/delete/'+id;
      return this.http.delete(deleteEndpoint);
     }
     
     editCommande(id:number, commande:Commande){

      return this.http.put('http://localhost:7999/commandes/mod/'+id,commande);
     }

     getCommandeById(id:number): Observable<Commande>{

      return this.http.get('http://localhost:7999/commande/'+id);
     }
     editEtatById(id:number): Observable<Commande>{

      return this.http.get('http://localhost:7999/commandes/modE/'+id);
     }
}