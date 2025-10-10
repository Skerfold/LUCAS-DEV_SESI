import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './components/login/login.component';
import { RegistroComponent } from './components/registro/registro.component';
import { AdminVagasComponent } from './components/admin-vagas/admin-vagas.component';
import { AdminCurriculosComponent } from './components/admin-curriculos/admin-curriculos.component'; // NOVO COMPONENTE
import { CurriculoComponent } from './components/curriculo/curriculo.component';
import { NavbarComponent } from './components/navbar/navbar.component';
import { HomeComponent } from './components/home/home.component';
import { FooterComponent } from './templates/footer/footer.component';
import { HeaderComponent } from './templates/header/header.component';
import { VagasComponent } from './components/vagas/vagas.component';
import { CadastroComponent } from './components/cadastro/cadastro.component';
import { PainelVagasComponent } from './components/painel-vagas/Painel-vagas.component';

// Importar os serviços e modelos necessários
import { VagasService } from './servicos/vagas.service.service';
import { AuthService } from './servicos/auth.service.service';
import { CurriculoServiceService } from './servicos/curriculo.service.service';
import { CandidaturaService } from './servicos/candidatura.service.service';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    RegistroComponent,
    AdminVagasComponent,
    AdminCurriculosComponent, // Declarar o novo componente
    PainelVagasComponent,
    CurriculoComponent,
    NavbarComponent,
    HomeComponent,
    FooterComponent,
    HeaderComponent,
    VagasComponent,
    CadastroComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule
  ],
  providers: [
    VagasService,
    AuthService,
    CurriculoServiceService,
    CandidaturaService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
