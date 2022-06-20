import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Lignedecommande} from '../models/lignedecommande.models';



@Injectable({
    providedIn: 'root'
  })
  export class LignedecommandeService {
  
    constructor(private http: HttpClient) { }
  
    
   

    getAllpostlignesdecommande(): Observable<Lignedecommande[]> {
        return this.http.get<Lignedecommande[]>('http://localhost:7999/lignes');
      }
   
     

     
     
     

     
    
}