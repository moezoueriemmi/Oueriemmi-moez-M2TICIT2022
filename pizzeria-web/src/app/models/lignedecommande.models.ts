import { Article } from "./article.models";
import { Commande } from "./commande.models";

export class Lignedecommande{
    id?:number;
    article?:Article;
    commande?:Commande;
    remarque?:string;

    qte?:number;   
   
      
    

        
    }