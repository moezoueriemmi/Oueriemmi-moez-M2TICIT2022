import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NgbActiveModal,NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { UserService } from 'app/services/user.services';
import { User} from 'app/models/user.models';


export interface RouteInfo {
    path: string;
    title: string;
    icon: string;
    class: string;
}

export const ROUTES: RouteInfo[] = [
   // { path: '/employes',     title: 'Employés',         icon:'nc-badge',       class: '' },
    { path: '/articles',         title: 'Articles',             icon:'nc-box',    class: '' },
    { path: '/commandes',          title: 'Commandes',              icon:'nc-cart-simple',      class: '' },
    { path: '/livraisons', title: 'Livraisons',     icon:'nc-paper',    class: '' },
    { path: '/livreurs',          title: 'Livreurs',      icon:'nc-delivery-fast',  class: '' },
    { path: '/clients',         title: 'Clients',        icon:'nc-single-02',    class: '' },
    { path: '/users',         title: 'Users',        icon:'nc-single-02',    class: '' },
    { path: '/contacts',    title: 'Contacts',        icon:'nc-email-85', class: '' },
   
    { path: '/produits',       title: 'Produits',    icon:'nc-chart-pie-36',  class: '' },
    { path: '/recettes',       title: 'Recettes',    icon:'nc-money-coins',  class: '' },
    
];
export const ROUTESE: RouteInfo[] = [
   
   
    { path: '/commandes',          title: 'Commandes',              icon:'nc-cart-simple',      class: '' },
    { path: '/livraisons', title: 'Livraisons',     icon:'nc-paper',    class: '' },
    
    
    
];

@Component({
    moduleId: module.id,
    selector: 'sidebar-cmp',
    templateUrl: 'sidebar.component.html',
})

export class SidebarComponent implements OnInit {

    constructor(private router:Router,private userService :UserService,private modalService:NgbModal){}
    public menuItems: any[];
    ngOnInit() {
        if((this.userService.suser==false) && (localStorage.getItem("isAdmin")=="true")){
        this.menuItems = ROUTES.filter(menuItem => menuItem);
        }
        else{
            this.menuItems = ROUTESE.filter(menuItem => menuItem);
        }
    }
}
