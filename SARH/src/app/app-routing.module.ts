import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './components/home/home.component';
import { LoginComponent } from './components/login/login.component';
import { RegistroComponent } from './components/registro/registro.component';
import { VagasComponent } from './components/vagas/vagas.component';
import { CurriculoComponent } from './components/curriculo/curriculo.component';
import { AdminVagasComponent } from './components/admin-vagas/admin-vagas.component';
import { AdminCurriculosComponent } from './components/admin-curriculos/admin-curriculos.component'; // NOVO COMPONENTE
import { AuthGuard } from './guardas/auth.guard.service'; // Caminho corrigido

const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'login', component: LoginComponent },
  { path: 'registro', component: RegistroComponent },
  { path: 'vagas', component: VagasComponent },
  { path: 'curriculos', component: CurriculoComponent, canActivate: [AuthGuard], data: { tipo: 'comum' } },
  { path: 'admin-vagas', component: AdminVagasComponent, canActivate: [AuthGuard], data: { tipo: 'admin' } },
  { path: 'admin-curriculos', component: AdminCurriculosComponent, canActivate: [AuthGuard], data: { tipo: 'admin' } }, // NOVA ROTA
  { path: '**', redirectTo: '' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
