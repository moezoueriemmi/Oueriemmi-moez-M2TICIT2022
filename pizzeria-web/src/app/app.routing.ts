import { Routes } from '@angular/router';

import { AdminLayoutComponent } from './layouts/admin-layout/admin-layout.component';
import { CommandeComponent } from './pages/commandes/commande.component';
import { LoginComponent } from './pages/login/login.component';

export const AppRoutes: Routes = [
  //== {
  //   path: '',
  //   redirectTo: 'employes',
  //   pathMatch: 'full',
  // }, 
 { path: '',
    component: LoginComponent,}
// },
,{
    path: '',
    component: AdminLayoutComponent,
    children: [
        {
      path: '',
      loadChildren: './layouts/admin-layout/admin-layout.module#AdminLayoutModule'
  }]},
  {
    path: '**',
    redirectTo: 'employes'
  },
 
]
