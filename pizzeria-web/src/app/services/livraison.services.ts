import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Livraison} from '../models/livraison.models';



@Injectable({
    providedIn: 'root'
  })
  export class LivraisonService {
  
    constructor(private http: HttpClient) { }
  
    
   

    getAllpostLivraison(): Observable<Livraison[]> {
        return this.http.get<Livraison[]>('http://localhost:7999/livraisons');
      }
   
      

      deleteLivaraison(id:number) {
       
        const deleteEndpoint ='http://localhost:7999/livraisons/delete/'+id;
      return this.http.delete(deleteEndpoint);
     }
     
     add(data: any): Observable<Livraison> {
      return this.http.post('http://localhost:7999/livraisons/add', data);
    }
     
    getLivraisonById(id:number): Observable<Livraison>{
   
      return this.http.get('http://localhost:7999/livraison/'+id);
     }
     editLivraison(id:number, livraison:Livraison){
   
      return this.http.put('http://localhost:7999/livraison/mod/'+id,livraison);
    }
  
}