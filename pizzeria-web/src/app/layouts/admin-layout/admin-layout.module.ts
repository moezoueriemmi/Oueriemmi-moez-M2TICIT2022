import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule, DatePipe } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { AdminLayoutRoutes } from './admin-layout.routing';

import { EmployeComponent }       from '../../pages/employes/employe.component';
import { ArticleComponent }            from '../../pages/articles/article.component';
import { CommandeComponent }           from '../../pages/commandes/commande.component';
import { LivraisonComponent }      from '../../pages/livraisons/livraison.component';
import { LivreurComponent }           from '../../pages/livreurs/livreur.component';
import { UserComponent }            from '../../pages/users/user.component';
import { ContactComponent }   from '../../pages/contacts/contact.component';
import { ProduitComponent }         from '../../pages/produits/produit.component';
import { RecetteComponent }  from '../../pages/recette/recette.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { LoginComponent } from 'app/pages/login/login.component';
import { ClientComponent } from 'app/pages/clients/client.component';
import { BrowserModule } from '@angular/platform-browser';

@NgModule({
  imports: [
    CommonModule,
    RouterModule.forChild(AdminLayoutRoutes),
    FormsModule,
    NgbModule,

    ReactiveFormsModule

  ],
  declarations: [
    EmployeComponent,
    ArticleComponent,
    CommandeComponent,
    ProduitComponent,
    LivraisonComponent,
    LivreurComponent,
    UserComponent,
    ContactComponent,
    RecetteComponent,
    ClientComponent,
  
  ]
})

export class AdminLayoutModule {}
