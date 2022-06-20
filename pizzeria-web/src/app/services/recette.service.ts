import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Recette} from '../models/recette.models';
import { Commande } from 'app/models/commande.models';
import { FormGroup } from '@angular/forms';


@Injectable({
    providedIn: 'root'
  })
  export class RecetteService {
  
    constructor(private http: HttpClient) { }
  
    
   

    getAllpostRecettes(): Observable<Recette[]> {
        return this.http.get<Recette[]>("http://localhost:7999/recettes");
      }
   
      getRecetteById(id:number): Observable<Recette>{
        return this.http.get('http://localhost:7999/recette/'+id);
       }
     getCList(): Observable<Recette[]> {
       return this.http.get<Recette[]>('http://localhost:7999/recettes');
     }
     deleteRecette(id:number) {
       
       const deleteEndpoint ='http://localhost:7999/recette/delete/'+id;
       return this.http.delete(deleteEndpoint);
     }
     
    editRecette(id:number, recette:Recette){

      return this.http.put('http://localhost:7999/recette/mod/'+id,recette);
    }
      add(data: any): Observable<any> {
        return this.http.post('http://localhost:7999/recette/add', data);
      }
      annuler(data: Commande): Observable<any> {
        return this.http.post('http://localhost:7999/recette/annuler', data);
      }
}