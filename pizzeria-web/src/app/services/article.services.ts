import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Article } from 'app/models/article.models';

const baseUrl = 'http://localhost:7999';



@Injectable({
  providedIn: 'root'
})
export class ArticleService {

  constructor(private http: HttpClient) { }

  
  add(data: any): Observable<any> {
    return this.http.post(baseUrl+"/articles/add", data);
  }
 
  getAllpostArticles(): Observable<Article[]> {
     return this.http.get<Article[]>(baseUrl+"/articles");
   }

   getArticleById(id:number): Observable<any>{

    return this.http.get(baseUrl+'/articlee/'+id);
   }
   getVList(): Observable<Article[]> {
    return this.http.get<Article[]>('http://localhost:7999/articles');
  }
  deleteArticle(id:number) {
    
  
    return this.http.delete(baseUrl+'/article/delete/'+id);
  }
  
  editArticle(id:number, produit:Article){

    return this.http.put(baseUrl+'/article/mod/'+id,produit);
  }
  getArticleByNom(nom:string){
    return this.http.get(baseUrl+'/article/'+nom);
  }

  public doSearchByKeyWord(keyword: string, page: number, size: number) : Observable<Article> {
    return this.http.get<Article>(baseUrl + "articles/search/nom?nom=" + keyword + "&page=" + page + "&size=" + size);
  }

}