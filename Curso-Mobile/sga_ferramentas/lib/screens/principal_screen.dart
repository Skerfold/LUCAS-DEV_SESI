// lib/screens/principal_screen.dart

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PrincipalScreen extends StatelessWidget {
  const PrincipalScreen({super.key});

  Future<void> _fazerLogout(BuildContext context) async {
    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      await FirebaseAuth.instance.signOut();
      navigator.pushReplacementNamed('/');
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text('Erro ao fazer logout: $e')),
      );
    }
  }

  void _irPara(BuildContext context, String rota) {
    Navigator.of(context).pushNamed(rota);
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User?;
    final String nomeUsuario = user?.displayName ?? user?.email ?? "Usuário";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Painel Principal'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30.0),
          child: Container(
            padding: const EdgeInsets.only(bottom: 8.0, left: 16.0),
            alignment: Alignment.centerLeft,
            child: Text(
              'Bem-vindo(a), $nomeUsuario',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ),
        ),
        actions: [
          Tooltip(
            message: 'Fazer Logout',
            child: IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => _fazerLogout(context),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, 
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          childAspectRatio: 1.5, 
          children: [
            _MenuButton(
              icone: Icons.add_box_rounded,
              titulo: 'Cadastrar Produto',
              onTap: () => _irPara(context, '/cadastro_produto'),
            ),
            _MenuButton(
              icone: Icons.warehouse_rounded,
              titulo: 'Gerir Estoque',
              onTap: () => _irPara(context, '/gestao_estoque'),
            ),
            _MenuButton(
              icone: Icons.history_rounded,
              titulo: 'Histórico',
              // ----> 3. VOCÊ ATUALIZOU O ONTAP AQUI?
              onTap: () => _irPara(context, '/historico'), 
            ),
          ],
        ),
      ),
    );
  }
}

// Widget Auxiliar _MenuButton (sem alterações)
class _MenuButton extends StatelessWidget {
  final String titulo;
  final IconData icone;
  final VoidCallback onTap;

  const _MenuButton({
    required this.titulo,
    required this.icone,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icone, size: 48.0, color: Colors.white70),
            const SizedBox(height: 12),
            Text(
              titulo,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}