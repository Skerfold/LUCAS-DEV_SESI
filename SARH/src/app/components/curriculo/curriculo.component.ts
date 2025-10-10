// FileName: MultipleFiles/curriculo.component.ts
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { CurriculoServiceService } from '../../servicos/curriculo.service.service';
import { AuthService } from '../../servicos/auth.service.service';
import { Curriculo } from '../../modelos/curriculo/curriculo.module';

@Component({
  selector: 'app-curriculo',
  templateUrl: './curriculo.component.html',
  styleUrls: ['./curriculo.component.scss']
})
export class CurriculoComponent implements OnInit {
  curriculoForm!: FormGroup;
  usuarioId: number | null = null;
  curriculoExistente: Curriculo | null = null;

  constructor(
    private fb: FormBuilder,
    private curriculoService: CurriculoServiceService,
    private authService: AuthService
  ) { }

  ngOnInit(): void {
    // Garante que o usuarioId seja obtido do usuário logado
    this.usuarioId = this.authService.usuarioAtual()?.id || null;

    this.curriculoForm = this.fb.group({
      nomeCompleto: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      telefone: ['', Validators.required],
      experiencia: ['', Validators.required],
      formacao: ['', Validators.required],
      habilidades: ['', Validators.required],
      usuarioId: [this.usuarioId] // O ID do usuário é preenchido automaticamente
    });

    this.carregarCurriculoExistente();
  }

  carregarCurriculoExistente(): void {
    if (this.usuarioId) {
      this.curriculoService.getCurriculosByUserId(this.usuarioId).subscribe(
        (curriculos) => {
          if (curriculos.length > 0) {
            this.curriculoExistente = curriculos[0]; // Assume que um usuário tem apenas um currículo
            this.curriculoForm.patchValue(this.curriculoExistente);
            // A atualização do curriculoId no localStorage será feita pelo CurriculoService
            // ao salvar/atualizar o currículo, chamando authService.refreshCurrentUser().
          }
        },
        (error) => {
          console.error('Erro ao carregar currículo existente:', error);
        }
      );
    }
  }

  onSubmit(): void {
    if (this.curriculoForm.valid) {
      // Garante que o usuarioId no payload seja o do usuário logado
      const curriculoData: Curriculo = {
        ...this.curriculoForm.value,
        usuarioId: this.usuarioId,
        id: this.curriculoExistente?.id || 0 // Para PUT, mantém o ID existente
      };

      if (this.curriculoExistente) {
        // Atualizar currículo existente
        this.curriculoService.putCurriculo(this.curriculoExistente.id, curriculoData).subscribe(
          (curriculoAtualizado) => {
            alert('Currículo atualizado com sucesso!');
            this.curriculoExistente = curriculoAtualizado;
            // O AuthService.refreshCurrentUser() já foi chamado pelo CurriculoService
          },
          (error) => {
            console.error('Erro ao atualizar currículo:', error);
            alert('Ocorreu um erro ao atualizar o currículo. Tente novamente.');
          }
        );
      } else {
        // Cadastrar novo currículo
        this.curriculoService.postCurriculo(curriculoData).subscribe(
          (novoCurriculo) => {
            alert('Currículo salvo com sucesso!');
            this.curriculoExistente = novoCurriculo;
            // O AuthService.refreshCurrentUser() já foi chamado pelo CurriculoService
          },
          (error) => {
            console.error('Erro ao salvar currículo:', error);
            alert('Ocorreu um erro ao salvar o currículo. Tente novamente.');
          }
        );
      }
    } else {
      alert('Por favor, preencha todos os campos obrigatórios.');
    }
  }
}
