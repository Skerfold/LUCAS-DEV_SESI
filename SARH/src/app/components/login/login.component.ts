import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from '../../servicos/auth.service.service'; // Caminho corrigido

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {
  loginForm!: FormGroup; // Usar '!' para indicar que será inicializado no ngOnInit
email: any;
loading: any;
errorMessage: any;
senha: any;

  constructor(
    private fb: FormBuilder,
    private authService: AuthService,
    private router: Router
  ) { }

  ngOnInit(): void {
    this.loginForm = this.fb.group({
      email: ['', [Validators.required, Validators.email]],
      senha: ['', [Validators.required, Validators.minLength(6)]]
    });
  }

  onSubmit(): void {
    if (this.loginForm.valid) {
      const { email, senha } = this.loginForm.value;
      this.authService.login({ email, senha }).subscribe(
        (success) => {
          if (success) {
            const usuario = this.authService.usuarioAtual();
            if (usuario?.tipo === 'admin') {
              this.router.navigate(['/admin-vagas']);
            } else {
              this.router.navigate(['/curriculos']); // Ou para uma dashboard de usuário comum
            }
          } else {
            alert('Email ou senha inválidos.');
          }
        },
        (error) => {
          console.error('Erro no login:', error);
          alert('Ocorreu um erro ao tentar fazer login. Tente novamente.');
        }
      );
    } else {
      alert('Por favor, preencha todos os campos corretamente.');
    }
  }
}
