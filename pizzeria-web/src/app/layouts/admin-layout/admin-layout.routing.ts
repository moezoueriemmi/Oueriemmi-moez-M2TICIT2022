import { Routes } from '@angular/router';

import { EmployeComponent } from '../../pages/employes/employe.component';
import { ArticleComponent } from '../../pages/articles/article.component';
import { CommandeComponent } from '../../pages/commandes/commande.component';
import { LivraisonComponent } from '../../pages/livraisons/livraison.component';
import { LivreurComponent } from '../../pages/livreurs/livreur.component';
import { ContactComponent } from '../../pages/contacts/contact.component';
import { ProduitComponent } from '../../pages/produits/produit.component';
import { RecetteComponent } from '../../pages/recette/recette.component';
import { EditproduitComponent } from 'app/editproduit/editproduit.component';
import { EditemployeComponent } from 'app/editemploye/editemploye.component';
import { UserComponent } from '../../pages/users/user.component';
import { EdituserComponent } from 'app/edituser/edituser.component';
import { EditarticleComponent } from 'app/editarticle/editarticle.component';
import { EditlivreurComponent } from 'app/editlivreur/editlivreur.component';
import { LoginComponent } from '../../pages/login/login.component';
import { EditcommandeComponent } from 'app/editcommande/editcommande.component';
import { EditclientComponent } from 'app/editclient/editclient.component';
import { ClientComponent } from 'app/pages/clients/client.component';
import { EditlivraisonComponent } from 'app/editlivraison/editlivraison.component';
import { EditrecetteComponent } from 'app/editrecette/editrecette.component';

export const AdminLayoutRoutes: Routes = [
    //{ path: 'employes',      component: EmployeComponent },
    { path: 'articles',           component: ArticleComponent },
    { path: 'commandes',          component: CommandeComponent },
    { path: 'livraisons',     component: LivraisonComponent },
    { path: 'livreurs',          component: LivreurComponent },
    { path: 'users',           component: UserComponent },
    { path: 'clients',           component: ClientComponent },
    { path: 'contacts',  component: ContactComponent },
    { path: 'produits',        component: ProduitComponent },
    { path: 'recettes',        component: RecetteComponent },
    { path: 'update/:id',        component: EditproduitComponent },
    { path: 'updateemp/:id',        component: EditemployeComponent },
    { path: 'updateu/:id',        component: EdituserComponent },
    { path: 'updateart/:id',        component: EditarticleComponent },
    { path: 'updateliv/:id',        component: EditlivreurComponent },
    { path: 'login',        component: LoginComponent },
    { path: 'updatec/:id',        component: EditcommandeComponent },
    { path: 'updatecl/:id',        component: EditclientComponent },
    { path: 'updatelivr/:id',        component: EditlivraisonComponent },
    { path: 'updaterec/:id',        component: EditrecetteComponent },

];


