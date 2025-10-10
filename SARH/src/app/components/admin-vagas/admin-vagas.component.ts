import { Component, OnInit } from '@angular/core';
import { Vaga } from '../../modelos/vaga/vaga.model';
import { VagasService } from '../../servicos/vagas.service.service';

@Component({
  selector: 'app-admin-vagas',
  templateUrl: './admin-vagas.component.html',
  styleUrls: ['./admin-vagas.component.scss'],
})
export class AdminVagasComponent implements OnInit {
  public vaga: Vaga = new Vaga(0, '', '', '', 0);
  public vagas: Vaga[] = [];

  constructor(private _vagasService: VagasService) {}

  ngOnInit(): void {
    this.listarVagas();
  }

  listarVagas() {
    this._vagasService.getVagas().subscribe(
      (e) => {
        this.vagas = e.map((vaga) => {
          return new Vaga(
            vaga.id,
            vaga.nome,
            vaga.foto,
            vaga.descricao,
            vaga.salario
          );
        });
      },
      (error) => {
        console.error('Erro ao listar vagas: ', error);
      }
    );
  }

  listarVagaPorId(vaga: Vaga): void {
    this.vaga = new Vaga(vaga.id, vaga.nome, vaga.foto, vaga.descricao, vaga.salario); // Cria uma cópia para evitar modificação direta na lista
  }

  cadastrarVaga(): void {
    // Validação simples antes de cadastrar
    if (!this.vaga.nome || !this.vaga.descricao || !this.vaga.salario) {
      alert('Por favor, preencha todos os campos da vaga (Nome, Descrição, Salário).');
      return;
    }
    this._vagasService.postVaga(this.vaga).subscribe(
      () => {
        this.vaga = new Vaga(0, '', '', '', 0); //limpa o Formulário
        this.listarVagas(); //lista as vagas novamente
        alert('Vaga cadastrada com sucesso!');
      },
      (error) => {
        console.error('Erro ao Cadastrar Vaga: ', error);
        alert('Ocorreu um erro ao cadastrar a vaga. Tente novamente.');
      }
    );
  }

  atualizarVaga(id: number): void { // id como number
    if (!id) {
      alert('Selecione uma vaga para atualizar.');
      return;
    }
    // Validação simples antes de atualizar
    if (!this.vaga.nome || !this.vaga.descricao || !this.vaga.salario) {
      alert('Por favor, preencha todos os campos da vaga (Nome, Descrição, Salário).');
      return;
    }
    this._vagasService.putVaga(id, this.vaga).subscribe(
      () => {
        this.vaga = new Vaga(0, '', '', '', 0); //limpa o formulário
        this.listarVagas(); //lista as vaga novamente
        alert('Vaga atualizada com sucesso!');
      },
      (error) => {
        console.error('Erro ao Atualizar Vaga: ', error);
        alert('Ocorreu um erro ao atualizar a vaga. Tente novamente.');
      }
    );
  }

  excluirVaga(id: number): void { // id como number
    if (!id) {
      alert('Selecione uma vaga para excluir.');
      return;
    }
    if (confirm('Tem certeza que deseja excluir esta vaga?')) {
      this._vagasService.deleteVaga(id).subscribe(
        () => {
          this.vaga = new Vaga(0, '', '', '', 0); //limpa o formulário
          this.listarVagas(); //lista as vaga novamente
          alert('Vaga excluída com sucesso!');
        },
        (error) => {
          console.error('Erro ao Deletar Vaga: ', error);
          alert('Ocorreu um erro ao excluir a vaga. Tente novamente.');
        }
      );
    }
  }
}
