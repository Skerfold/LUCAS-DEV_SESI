import { Component, OnInit } from '@angular/core';
import { AuthService } from '../../servicos/auth.service.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {

  constructor(public authService: AuthService, private router: Router) { }

  ngOnInit(): void {
  }

  isLoggedIn(): boolean {
    return this.authService.estaAutenticado();
  }

  isUserAdmin(): boolean {
    const user = this.authService.usuarioAtual();
    return user?.tipo === 'admin';
  }

  isUserComum(): boolean {
    const user = this.authService.usuarioAtual();
    return user?.tipo === 'comum';
  }

  logout(): void {
    this.authService.logout();
  }
}
