import { Injectable } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { Observable } from 'rxjs';
import { Vaga } from '../modelos/vaga/vaga.model';

@Injectable({
  providedIn: 'root'
})
export class VagasService {
  private apiUrl = "http://localhost:3014/vagas";

  constructor(private http: HttpClient ) { }

  getVagas():Observable<Vaga[]> {
    return this.http.get<Vaga[]>(this.apiUrl);
  }

  postVaga(vaga:Vaga): Observable<Vaga>{ // Retorna Vaga, não Vaga[] para post
    return this.http.post<Vaga>(this.apiUrl,vaga);
  }

  putVaga(id: number, vaga:Vaga): Observable<Vaga>{ // Retorna Vaga, não Vaga[] para put
    const url =`${this.apiUrl}/${id}`;
    return this.http.put<Vaga>(url,vaga);
  }

  deleteVaga(id:number): Observable<any>{ // Retorna any para delete
    const url = `${this.apiUrl}/${id}`;
    return this.http.delete<any>(url);
  }
}
