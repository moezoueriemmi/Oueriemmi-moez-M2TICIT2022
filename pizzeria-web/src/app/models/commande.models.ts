import { Article } from "./article.models";
import { Client } from "./client.models";
import { Lignedecommande } from "./lignedecommande.models";

export class Commande{
    adresse?:string;
    lignedecommande?:Lignedecommande[];
    client?:Client;
    date_com?:Date;
    etat?:string;
    id_com?:number;
    prix?:number;   
    type?:string;
      
    

        
    }