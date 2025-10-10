// FileName: MultipleFiles/auth.service.service.ts
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Observable, switchMap, throwError, map, of } from 'rxjs';
import { Usuario } from '../modelos/usuario/usuario.module';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = 'http://localhost:3014/usuarios';
  private readonly CHAVE_AUTH = 'usuarioLogado';

  constructor(private router: Router, private http: HttpClient) { }

  registrar(usuario: Usuario): Observable<any> {
    return this.http.get<Usuario[]>(`${this.apiUrl}?email=${usuario.email}`).pipe(
      switchMap(res => {
        if (res.length > 0) {
          return throwError(() => new Error("Usuário Já Existe."));
        }
        return this.http.post<Usuario>(this.apiUrl, usuario).pipe(
          map(novoUsuario => {
            localStorage.setItem(this.CHAVE_AUTH, JSON.stringify(novoUsuario));
            return novoUsuario;
          })
        );
      })
    );
  }

  login(credenciais: any): Observable<boolean> {
    return this.http.get<Usuario[]>(
      `${this.apiUrl}?email=${credenciais.email}&senha=${credenciais.senha}`
    ).pipe(
      map(usuarios => {
        if (usuarios.length > 0) {
          localStorage.setItem(this.CHAVE_AUTH, JSON.stringify(usuarios[0]));
          return true;
        }
        return false;
      })
    );
  }

  logout(): void {
    localStorage.removeItem(this.CHAVE_AUTH);
    this.router.navigate(["/login"]);
  }

  estaAutenticado(): boolean {
    return !!localStorage.getItem(this.CHAVE_AUTH);
  }

  usuarioAtual(): Usuario | null {
    const usuarioString = localStorage.getItem(this.CHAVE_AUTH);
    return usuarioString ? JSON.parse(usuarioString) : null;
  }

  // NOVO MÉTODO: Para atualizar o usuário no localStorage após uma mudança no backend
  refreshCurrentUser(): void {
    const currentUser = this.usuarioAtual();
    if (currentUser && currentUser.id) {
      this.http.get<Usuario>(`${this.apiUrl}/${currentUser.id}`).subscribe(
        (updatedUser) => {
          localStorage.setItem(this.CHAVE_AUTH, JSON.stringify(updatedUser));
          console.log('Usuário no localStorage atualizado:', updatedUser);
        },
        (error) => {
          console.error('Erro ao atualizar usuário no localStorage:', error);
        }
      );
    }
  }
}
