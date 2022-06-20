import { BrowserAnimationsModule } from "@angular/platform-browser/animations";
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { ToastrModule } from "ngx-toastr";
import { SidebarModule } from './sidebar/sidebar.module';
import { FooterModule } from './shared/footer/footer.module';
import { NavbarModule} from './shared/navbar/navbar.module';
import { FixedPluginModule} from './shared/fixedplugin/fixedplugin.module';
import { HttpClientModule } from '@angular/common/http';
import { AppComponent } from './app.component';
import { AppRoutes } from './app.routing';
import { FormsModule,ReactiveFormsModule } from '@angular/forms';
import { AdminLayoutComponent } from './layouts/admin-layout/admin-layout.component';
import { EditproduitComponent } from './editproduit/editproduit.component';
import { EditemployeComponent } from './editemploye/editemploye.component';
import { EdituserComponent } from './edituser/edituser.component';
import { EditarticleComponent } from './editarticle/editarticle.component';
import { EditlivreurComponent } from './editlivreur/editlivreur.component';
import { LoginComponent } from "./pages/login/login.component";
import { EditcommandeComponent } from "./editcommande/editcommande.component";
import { EditclientComponent } from "./editclient/editclient.component";
import { EditlivraisonComponent } from "./editlivraison/editlivraison.component";
import { EditrecetteComponent } from "./editrecette/editrecette.component";




@NgModule({
  declarations: [
    AppComponent,
    AdminLayoutComponent,
    EditproduitComponent,
    EditemployeComponent,
    EdituserComponent,
    EditarticleComponent,
    EditlivreurComponent, 
    LoginComponent,
    EditcommandeComponent,
    EditclientComponent,
    EditlivraisonComponent,
    EditrecetteComponent
  ],
  imports: [
    BrowserAnimationsModule,
    RouterModule.forRoot(AppRoutes,{
      useHash: true
    }),HttpClientModule,
    SidebarModule,
    NavbarModule,
    ToastrModule.forRoot(),
    FooterModule,
    FixedPluginModule,
    FormsModule,
    ReactiveFormsModule
    
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
