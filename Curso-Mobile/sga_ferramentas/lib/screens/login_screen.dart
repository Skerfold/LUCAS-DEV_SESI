// lib/screens/login_screen.dart
// CÓDIGO COMPLETO (com correção do 'context.mounted')

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import do Firebase Auth

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginController = TextEditingController();
  final _senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  bool _isLoading = false;

  Future<void> _fazerLogin() async {
    if (!_formKey.currentState!.validate()) {
      return; 
    }
    
    // CORREÇÃO: Capturamos o context e o navigator ANTES do await
    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    setState(() {
      _isLoading = true;
    });

    try {
      final auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: _loginController.text.trim(), 
        password: _senhaController.text,
      );
      
      User? user = userCredential.user;
      if (user != null) {
        // CORREÇÃO: Usamos o 'navigator' que salvamos
        navigator.pushReplacementNamed(
          '/principal',
          arguments: user, 
        );
      }

    } on FirebaseAuthException catch (e) {
      String mensagemErro;
      if (e.code == 'user-not-found') {
        mensagemErro = 'Nenhum usuário encontrado com este e-mail.';
      } else if (e.code == 'wrong-password') {
        mensagemErro = 'Senha incorreta.';
      } else if (e.code == 'invalid-email') {
        mensagemErro = 'O formato do e-mail é inválido.';
      } else {
        mensagemErro = 'Ocorreu um erro. Tente novamente.';
        print(e); 
      }
      
      // CORREÇÃO: Verificamos se o context ainda é válido
      if (!context.mounted) return;
      _mostrarAlertaFalha(context, mensagemErro); // Passamos o context

    } catch (e) {
      // CORREÇÃO: Verificamos se o context ainda é válido
      if (!context.mounted) return;
      _mostrarAlertaFalha(context, 'Ocorreu um erro inesperado: $e');
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // CORREÇÃO: Recebemos o context como parâmetro
  void _mostrarAlertaFalha(BuildContext context, String mensagem) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Falha na Autenticação'),
        content: Text(mensagem),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _loginController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SGA - Gestão de Almoxarifado'),
        backgroundColor: Colors.blueGrey[900],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Gestão',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 40),

                  // Campo E-mail
                  TextFormField(
                    controller: _loginController,
                    decoration: const InputDecoration(
                      labelText: 'E-mail', // Mudamos de 'Usuário' para 'E-mail'
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Por favor, informe o e-mail.';
                      }
                      if (!value.contains('@')) {
                        return 'E-mail inválido.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Campo Senha
                  TextFormField(
                    controller: _senhaController,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, informe a senha.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),

                  _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          onPressed: _fazerLogin,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: Colors.blueGrey[800],
                            foregroundColor: Colors.white,
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                          child: const Text('ENTRAR'),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}