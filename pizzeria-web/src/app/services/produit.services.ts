import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Produit} from '../models/produit.models';

const baseUrl = 'http://localhost:7999/produits/add';



@Injectable({
  providedIn: 'root'
})
export class ProduitService {

  constructor(private http: HttpClient) { }

  
  add(data: any): Observable<any> {
    return this.http.post(baseUrl, data);
  }
 
  getAllpostProduits(): Observable<Produit[]> {
     return this.http.get<Produit[]>("http://localhost:7999/produits");
   }

   getProduitById(id:number): Observable<any>{

    return this.http.get('http://localhost:7999/produit/'+id);
   }
   getVList(): Observable<Produit[]> {
    return this.http.get<Produit[]>('http://localhost:7999/produits');
  }
  deleteProduit(id:number) {
    
    const deleteEndpoint ='http://localhost:7999/produit/delete/'+id;
    return this.http.delete(deleteEndpoint);
  }
  
  editProduit(id:number, produit:Produit){

    return this.http.put('http://localhost:7999/produit/mod/'+id,produit);
  }

}