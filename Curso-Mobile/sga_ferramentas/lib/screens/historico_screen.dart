// lib/screens/historico_screen.dart
// CÓDIGO COMPLETO

import 'package:flutter/material.dart'; // <-- Faltou este import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; 

// VERIFIQUE SE A CLASSE ESTENDE StatelessWidget
class HistoricoScreen extends StatelessWidget {
  const HistoricoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Referência à coleção de Movimentações (Logs)
    final CollectionReference movimentacoes =
        FirebaseFirestore.instance.collection('Movimentacoes');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Movimentações'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        // (RF021) Ordena pela data/hora da operação,
        // com os mais recentes primeiro
        stream: movimentacoes
            .orderBy('data_hora_operacao', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          // Estados de carregamento e erro
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
                child: Text('Nenhum histórico de movimentação encontrado.'));
          }

          // Temos dados!
          final docs = snapshot.data!.docs;

          // Usamos um ListView para exibir os logs
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (ctx, index) {
              final mov = docs[index].data() as Map<String, dynamic>;
              
              // Pegamos os dados do log
              final String produtoNome = mov['produto_nome'] ?? 'Produto N/A';
              final int quantidade = (mov['quantidade'] as num?)?.toInt() ?? 0;
              final String tipo = mov['tipo'] ?? 'N/A';
              final String usuarioEmail = mov['usuario_email'] ?? 'Usuário N/A';
              
              // (RF022) Pega a data que o usuário informou
              final Timestamp? timestamp = mov['data_movimentacao'];
              
              // Formata a data
              final String dataFormatada = timestamp != null
                  ? DateFormat('dd/MM/yyyy').format(timestamp.toDate())
                  : 'Data N/A';
                  
              // Define o visual (cor e ícone) baseado no tipo
              final bool isEntrada = tipo == 'Entrada';
              final Color cor = isEntrada ? Colors.green : Colors.red;
              final IconData icone = isEntrada ? Icons.add_circle : Icons.remove_circle;

              // Card para exibir o item do histórico
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 2,
                child: ListTile(
                  leading: Icon(icone, color: cor, size: 40),
                  title: Text(
                    produtoNome,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Por: $usuarioEmail\nEm: $dataFormatada', // (RF020)
                  ),
                  trailing: Text(
                    '${isEntrada ? "+" : "-"}$quantidade',
                    style: TextStyle(
                      color: cor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}