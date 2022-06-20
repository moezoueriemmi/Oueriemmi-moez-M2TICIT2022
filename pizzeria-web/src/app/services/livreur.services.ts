import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Livreur} from '../models/livreur.models';


const baseUrl = 'http://localhost:7999/livreurs/add';

@Injectable({
    providedIn: 'root'
  })
  export class  LivreurService {
  
    constructor(private http: HttpClient) { }
  
    
    add(data: any): Observable<any> {
      return this.http.post(baseUrl, data);
    }

    getAllpostLivreurs(): Observable<Livreur[]> {
        return this.http.get<Livreur[]>("http://localhost:7999/livreurs");
      }
   
      getLivreurById(id:number): Observable<Livreur>{
   
       return this.http.get('http://localhost:7999/livreur/'+id);
      }
     getVList(): Observable<Livreur[]> {
       return this.http.get<Livreur[]>('http://localhost:7999/livreurs');
     }
     deleteLivreur(id:number) {
       
       const deleteEndpoint ='http://localhost:7999/livreurs/delete/'+id;
       return this.http.delete(deleteEndpoint);
     }
     
     editLivreur(id:number, livreur:Livreur){
   
       return this.http.put('http://localhost:7999/livreurs/mod/'+id,livreur);
     }
   
}