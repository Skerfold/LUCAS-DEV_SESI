// FileName: MultipleFiles/curriculo.service.service.ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, switchMap, tap } from 'rxjs'; // Importar 'tap'
import { Curriculo } from '../modelos/curriculo/curriculo.module';
import { AuthService } from './auth.service.service'; // Importar AuthService

@Injectable({
  providedIn: 'root'
})
export class CurriculoServiceService {
  private apiUrl = 'http://localhost:3014/curriculos';
  private usuariosApiUrl = 'http://localhost:3014/usuarios'; // URL para usuários

  constructor(private http: HttpClient, private authService: AuthService) { }

  getCurriculos(): Observable<Curriculo[]> {
    return this.http.get<Curriculo[]>(this.apiUrl);
  }

  // ERRO CORRIGIDO: Adicionado o método getCurriculo por ID
  getCurriculo(id: number): Observable<Curriculo> {
    return this.http.get<Curriculo>(`${this.apiUrl}/${id}`);
  }

  getCurriculosByUserId(usuarioId: number): Observable<Curriculo[]> {
    return this.http.get<Curriculo[]>(`${this.apiUrl}?usuarioId=${usuarioId}`);
  }

  postCurriculo(curriculo: Curriculo): Observable<Curriculo> {
    return this.http.post<Curriculo>(this.apiUrl, curriculo).pipe(
      tap(novoCurriculo => {
        // Após criar o currículo, atualiza o usuário com o curriculoId
        this.updateUserCurriculoId(novoCurriculo.usuarioId, novoCurriculo.id).subscribe(
          () => {
            console.log(`Usuário ${novoCurriculo.usuarioId} atualizado com curriculoId: ${novoCurriculo.id}`);
            this.authService.refreshCurrentUser(); // Atualiza o usuário no localStorage
          },
          error => console.error('Erro ao atualizar usuario.curriculoId após postCurriculo:', error)
        );
      })
    );
  }

  putCurriculo(id: number, curriculo: Curriculo): Observable<Curriculo> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.put<Curriculo>(url, curriculo).pipe(
      tap(curriculoAtualizado => {
        // Após atualizar o currículo, garante que o usuário tenha o curriculoId correto
        this.updateUserCurriculoId(curriculoAtualizado.usuarioId, curriculoAtualizado.id).subscribe(
          () => {
            console.log(`Usuário ${curriculoAtualizado.usuarioId} atualizado com curriculoId: ${curriculoAtualizado.id}`);
            this.authService.refreshCurrentUser(); // Atualiza o usuário no localStorage
          },
          error => console.error('Erro ao atualizar usuario.curriculoId após putCurriculo:', error)
        );
      })
    );
  }

  deleteCurriculo(id: number): Observable<any> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.delete<any>(url).pipe(
      // Antes de deletar o currículo, remove o curriculoId do usuário associado
      switchMap(() => this.getCurriculo(id)), // Primeiro, obtém o currículo para saber o usuarioId
      switchMap(curriculoToDelete => {
        if (curriculoToDelete && curriculoToDelete.usuarioId) {
          // ERRO CORRIGIDO: removeUserCurriculoId agora é público ou acessado corretamente
          return this.removeUserCurriculoId(curriculoToDelete.usuarioId).pipe(
            switchMap(() => this.http.delete<any>(url)) // Depois de remover o curriculoId do usuário, deleta o currículo
          );
        }
        return this.http.delete<any>(url); // Se não houver usuarioId, apenas deleta o currículo
      }),
      tap(() => {
        this.authService.refreshCurrentUser(); // Atualiza o usuário no localStorage
      })
    );
  }

  // Método auxiliar para atualizar o campo curriculoId de um usuário
  private updateUserCurriculoId(usuarioId: number, curriculoId: number): Observable<any> {
    // Usamos PATCH para atualizar apenas um campo
    return this.http.patch(`${this.usuariosApiUrl}/${usuarioId}`, { curriculoId });
  }

  // ERRO CORRIGIDO: Tornando o método público para ser acessível pelo AdminCurriculosComponent
  public removeUserCurriculoId(usuarioId: number): Observable<any> {
    // Usamos PATCH para definir curriculoId como null
    return this.http.patch(`${this.usuariosApiUrl}/${usuarioId}`, { curriculoId: null });
  }
}
