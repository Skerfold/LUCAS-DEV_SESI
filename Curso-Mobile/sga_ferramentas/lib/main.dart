// lib/main.dart

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sga_ferramentas/firebase_options.dart';

// Imports das Telas
import 'package:sga_ferramentas/screens/login_screen.dart';
import 'package:sga_ferramentas/screens/principal_screen.dart';
import 'package:sga_ferramentas/screens/cadastro_produto_screen.dart';
import 'package:sga_ferramentas/screens/gestao_estoque_screen.dart';
// ----> 1. VOCÊ ADICIONOU ESTE IMPORT?
import 'package:sga_ferramentas/screens/historico_screen.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const SgaApp());
}

class SgaApp extends StatelessWidget {
  const SgaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SGA - Gestão de Almoxarifado',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),

      initialRoute: '/', 
      routes: {
        '/': (context) => const LoginScreen(),
        '/principal': (context) => const PrincipalScreen(),
        '/cadastro_produto': (context) => const CadastroProdutoScreen(),
        '/gestao_estoque': (context) => const GestaoEstoqueScreen(),
        // ----> 2. VOCÊ ADICIONOU ESTA LINHA DA ROTA?
        '/historico': (context) => const HistoricoScreen(), 
      },
    );
  }
}