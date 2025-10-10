// FileName: MultipleFiles/registro.component.ts
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from '../../servicos/auth.service.service';
import { Usuario } from '../../modelos/usuario/usuario.module';

@Component({
  selector: 'app-registro',
  templateUrl: './registro.component.html',
  styleUrls: ['./registro.component.scss']
})
export class RegistroComponent implements OnInit {
  registroForm!: FormGroup;

  constructor(
    private fb: FormBuilder,
    private authService: AuthService,
    private router: Router
  ) { }

  ngOnInit(): void {
    this.registroForm = this.fb.group({
      email: ['', [Validators.required, Validators.email]],
      senha: ['', [Validators.required, Validators.minLength(6)]],
      confirmarSenha: ['', Validators.required]
    }, { validator: this.passwordMatchValidator });
  }

  passwordMatchValidator(form: FormGroup) {
    return form.get('senha')?.value === form.get('confirmarSenha')?.value
      ? null : { 'mismatch': true };
  }

  onSubmit(): void {
    if (this.registroForm.valid) {
      const { email, senha } = this.registroForm.value;
      // ID será gerado pelo json-server, curriculoId é null inicialmente
      const novoUsuario: Usuario = new Usuario(0, email, senha, 'comum', null);

      this.authService.registrar(novoUsuario).subscribe(
        () => {
          alert('Usuário registrado com sucesso! Você foi logado automaticamente.');
          this.router.navigate(['/curriculos']); // Redireciona para a página de currículo
        },
        (error) => {
          if (error.message === "Usuário Já Existe.") {
            alert('Este email já está cadastrado. Tente outro ou faça login.');
          } else {
            console.error('Erro ao registrar usuário:', error);
            alert('Ocorreu um erro ao registrar. Tente novamente.');
          }
        }
      );
    } else {
      alert('Por favor, preencha todos os campos corretamente e verifique se as senhas coincidem.');
    }
  }
}
