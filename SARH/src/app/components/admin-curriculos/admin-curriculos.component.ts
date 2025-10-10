// FileName: MultipleFiles/admin-curriculos.component.ts
import { Component, OnInit } from '@angular/core';
import { Curriculo } from '../../modelos/curriculo/curriculo.module';
import { CurriculoServiceService } from '../../servicos/curriculo.service.service';
import { CandidaturaService } from '../../servicos/candidatura.service.service';
import { VagasService } from '../../servicos/vagas.service.service';
import { Vaga } from '../../modelos/vaga/vaga.model';
import { AuthService } from '../../servicos/auth.service.service'; // Importar AuthService
import { switchMap, tap } from 'rxjs'; // Importar switchMap e tap

@Component({
  selector: 'app-admin-curriculos',
  templateUrl: './admin-curriculos.component.html',
  styleUrls: ['./admin-curriculos.component.scss']
})
export class AdminCurriculosComponent implements OnInit {
  public curriculos: Curriculo[] = [];
  public curriculoSelecionado: Curriculo | null = null;
  public candidaturasDoCurriculoSelecionado: any[] = [];

  constructor(
    private curriculoService: CurriculoServiceService,
    private candidaturaService: CandidaturaService,
    private vagasService: VagasService,
    private authService: AuthService // Injetar AuthService
  ) { }

  ngOnInit(): void {
    this.listarTodosCurriculos();
  }

  listarTodosCurriculos(): void {
    this.curriculoService.getCurriculos().subscribe(
      (curriculos) => {
        this.curriculos = curriculos;
      },
      (error) => {
        console.error('Erro ao listar currículos: ', error);
        alert('Ocorreu um erro ao listar os currículos.');
      }
    );
  }

  selecionarCurriculo(curriculo: Curriculo): void {
    this.curriculoSelecionado = curriculo;
    this.carregarCandidaturasDoCurriculo(curriculo.id);
  }

  carregarCandidaturasDoCurriculo(curriculoId: number): void {
    this.candidaturaService.getCandidaturasByCurriculoId(curriculoId).subscribe(
      (candidaturas) => {
        // ERRO/MELHORIA: toPromise() está depreciado. Usar lastValueFrom ou firstValueFrom.
        // Para manter a mudança mínima, vou manter toPromise() por enquanto, mas é um ponto de atenção.
        const vagasPromises = candidaturas.map(candidatura =>
          this.vagasService.getVagas().toPromise().then(vagas => {
            const vaga = Array.isArray(vagas) ? vagas.find(v => v.id === candidatura.vagaId) : undefined;
            return {
              ...candidatura,
              nomeVaga: vaga ? vaga.nome : 'Vaga Desconhecida',
              salarioVaga: vaga ? vaga.salario : 0
            };
          })
        );

        Promise.all(vagasPromises).then(candidaturasComDetalhes => {
          this.candidaturasDoCurriculoSelecionado = candidaturasComDetalhes;
        }).catch(error => {
          console.error('Erro ao carregar detalhes das vagas para candidaturas: ', error);
          this.candidaturasDoCurriculoSelecionado = candidaturas;
        });
      },
      (error) => {
        console.error('Erro ao carregar candidaturas do currículo: ', error);
        this.candidaturasDoCurriculoSelecionado = [];
      }
    );
  }

  fecharDetalhes(): void {
    this.curriculoSelecionado = null;
    this.candidaturasDoCurriculoSelecionado = [];
  }

  excluirCurriculo(id: number): void {
    if (confirm('Tem certeza que deseja excluir este currículo? Todas as candidaturas associadas também serão removidas.')) {
      // Primeiro, obtenha o currículo para saber qual usuário está associado
      this.curriculoService.getCurriculo(id).pipe(
        switchMap(curriculo => {
          // Se o currículo tiver um usuarioId, remova o curriculoId do usuário
          if (curriculo && curriculo.usuarioId) {
            // ERRO CORRIGIDO: Acessando removeUserCurriculoId como método público
            return this.curriculoService.removeUserCurriculoId(curriculo.usuarioId).pipe(
              tap(() => {
                // Atualiza o usuário no localStorage se for o usuário logado
                if (this.authService.usuarioAtual()?.id === curriculo.usuarioId) {
                  this.authService.refreshCurrentUser();
                }
              }),
              switchMap(() => this.curriculoService.deleteCurriculo(id)) // Depois de atualizar o usuário, exclui o currículo
            );
          } else {
            return this.curriculoService.deleteCurriculo(id); // Apenas exclui o currículo
          }
        })
      ).subscribe(
        () => {
          alert('Currículo excluído com sucesso!');
          this.listarTodosCurriculos();
          this.fecharDetalhes();
          // Opcional: Excluir candidaturas associadas (json-server não faz isso automaticamente)
          this.candidaturaService.getCandidaturasByCurriculoId(id).subscribe(
            (candidaturas) => {
              candidaturas.forEach(c => this.candidaturaService.deleteCandidatura(c.id).subscribe());
            }
          );
        },
        (error: any) => {
          console.error('Erro ao excluir currículo: ', error);
          alert('Ocorreu um erro ao excluir o currículo. Tente novamente.');
        }
      );
    }
  }
}
