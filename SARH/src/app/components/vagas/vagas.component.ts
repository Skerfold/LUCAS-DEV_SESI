import { Component, OnInit } from '@angular/core';
import { Vaga } from '../../modelos/vaga/vaga.model';
import { VagasService } from '../../servicos/vagas.service.service';
import { AuthService } from '../../servicos/auth.service.service'; // Importar AuthService
import { CurriculoServiceService } from '../../servicos/curriculo.service.service'; // Importar CurriculoService
import { CandidaturaService } from '../../servicos/candidatura.service.service'; // Importar CandidaturaService
import { Candidatura } from '../../modelos/candidatura/candidatura.module'; // Importar Candidatura model
import { Router } from '@angular/router'; // Importar Router

@Component({
  selector: 'app-vagas',
  templateUrl: './vagas.component.html',
  styleUrls: ['./vagas.component.scss']
})
export class VagasComponent implements OnInit {
  public vagas: Vaga[] = [];
  private usuarioId: number | null = null;
  private curriculoDoUsuarioId: number | null = null;

  constructor(
    private _vagasService: VagasService,
    private authService: AuthService,
    private curriculoService: CurriculoServiceService,
    private candidaturaService: CandidaturaService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.listarVagas();
    this.usuarioId = this.authService.usuarioAtual()?.id || null;
    if (this.usuarioId) {
      this.carregarCurriculoDoUsuario();
    }
  }

  listarVagas() {
    this._vagasService.getVagas().subscribe(
      (e) => {
        this.vagas = e.map(
          (vaga) => {
            return new Vaga(
              vaga.id,
              vaga.nome,
              vaga.foto,
              vaga.descricao,
              vaga.salario
            );
          }
        );
      },
      (error) => {
        console.error('Erro ao listar vagas: ', error);
      }
    );
  }

  carregarCurriculoDoUsuario(): void {
    if (this.usuarioId) {
      this.curriculoService.getCurriculosByUserId(this.usuarioId).subscribe(
        (curriculos) => {
          if (curriculos.length > 0) {
            this.curriculoDoUsuarioId = curriculos[0].id; // Assume que um usuário tem apenas um currículo
          } else {
            this.curriculoDoUsuarioId = null;
          }
        },
        (error) => {
          console.error('Erro ao carregar currículo do usuário: ', error);
          this.curriculoDoUsuarioId = null;
        }
      );
    }
  }

  isLoggedIn(): boolean {
    return this.authService.estaAutenticado();
  }

  isUserComum(): boolean {
    const user = this.authService.usuarioAtual();
    return user?.tipo === 'comum';
  }

  async candidatarVaga(vagaId: number): Promise<void> {
    if (!this.isLoggedIn()) {
      alert('Você precisa estar logado para se candidatar a uma vaga.');
      this.router.navigate(['/login']);
      return;
    }

    if (!this.isUserComum()) {
      alert('Apenas usuários comuns podem se candidatar a vagas.');
      return;
    }

    if (this.curriculoDoUsuarioId === null) {
      alert('Você precisa ter um currículo cadastrado para se candidatar. Por favor, cadastre seu currículo primeiro.');
      this.router.navigate(['/curriculos']);
      return;
    }

    // Verificar se já existe uma candidatura para esta vaga com este currículo
    this.candidaturaService.checkCandidaturaExistente(this.curriculoDoUsuarioId, vagaId).subscribe(
      (candidaturasExistentes) => {
        if (candidaturasExistentes.length > 0) {
          alert('Você já se candidatou a esta vaga.');
        } else {
          // Criar nova candidatura
          const novaCandidatura: Candidatura = new Candidatura(
            0, // ID será gerado pelo json-server
            this.curriculoDoUsuarioId!,
            vagaId,
            new Date().toISOString().split('T')[0] // Data atual no formato YYYY-MM-DD
          );

          this.candidaturaService.postCandidatura(novaCandidatura).subscribe(
            () => {
              alert('Candidatura realizada com sucesso!');
            },
            (error) => {
              console.error('Erro ao candidatar-se à vaga: ', error);
              alert('Ocorreu um erro ao candidatar-se. Tente novamente.');
            }
          );
        }
      },
      (error) => {
        console.error('Erro ao verificar candidaturas existentes: ', error);
        alert('Ocorreu um erro ao verificar sua candidatura. Tente novamente.');
      }
    );
  }
}
