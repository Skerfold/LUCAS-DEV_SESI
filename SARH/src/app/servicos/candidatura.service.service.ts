import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Candidatura } from '../modelos/candidatura/candidatura.module'; // Importar o modelo de candidatura

@Injectable({
  providedIn: 'root'
})
export class CandidaturaService {
  private apiUrl = 'http://localhost:3014/candidaturas';

  constructor(private http: HttpClient) { }

  // Método para obter todas as candidaturas (útil para admin)
  getCandidaturas(): Observable<Candidatura[]> {
    return this.http.get<Candidatura[]>(this.apiUrl);
  }

  // Método para obter candidaturas por ID de currículo
  getCandidaturasByCurriculoId(curriculoId: number): Observable<Candidatura[]> {
    return this.http.get<Candidatura[]>(`${this.apiUrl}?curriculoId=${curriculoId}`);
  }

  // Método para obter candidaturas por ID de vaga
  getCandidaturasByVagaId(vagaId: number): Observable<Candidatura[]> {
    return this.http.get<Candidatura[]>(`${this.apiUrl}?vagaId=${vagaId}`);
  }

  // Método para verificar se um currículo já se candidatou a uma vaga específica
  checkCandidaturaExistente(curriculoId: number, vagaId: number): Observable<Candidatura[]> {
    return this.http.get<Candidatura[]>(`${this.apiUrl}?curriculoId=${curriculoId}&vagaId=${vagaId}`);
  }

  // Método para criar uma nova candidatura
  postCandidatura(candidatura: Candidatura): Observable<Candidatura> {
    return this.http.post<Candidatura>(this.apiUrl, candidatura);
  }

  // Método para excluir uma candidatura (se necessário)
  deleteCandidatura(id: number): Observable<any> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.delete<any>(url);
  }
}
