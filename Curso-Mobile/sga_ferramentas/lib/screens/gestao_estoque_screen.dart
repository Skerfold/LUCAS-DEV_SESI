// lib/screens/gestao_estoque_screen.dart
// CÓDIGO COMPLETO (com correção final do TextInputType)

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sga_ferramentas/models/produto.dart';
import 'package:intl/intl.dart'; // (Lembre-se: flutter pub add intl)

// Enum para controlar o tipo de movimentação (7.1.2)
enum TipoMovimentacao { entrada, saida }

class GestaoEstoqueScreen extends StatefulWidget {
  const GestaoEstoqueScreen({super.key});

  @override
  State<GestaoEstoqueScreen> createState() => _GestaoEstoqueScreenState();
}

class _GestaoEstoqueScreenState extends State<GestaoEstoqueScreen> {
  // --- ESTADO DO WIDGET ---
  final _formKey = GlobalKey<FormState>();
  final _quantidadeController = TextEditingController();
  bool _isLoading = false;

  // Estado do formulário
  Produto? _produtoSelecionado;
  TipoMovimentacao _tipoSelecionado = TipoMovimentacao.entrada;
  DateTime _dataSelecionada = DateTime.now();

  // Referência ao Firestore
  final CollectionReference _produtosCollection =
      FirebaseFirestore.instance.collection('Produtos');
  final CollectionReference _movimentacoesCollection =
      FirebaseFirestore.instance.collection('Movimentacoes');

  // --- FIM DO ESTADO ---

  @override
  void dispose() {
    _quantidadeController.dispose();
    super.dispose();
  }

  // (7.1.3) Função para mostrar o seletor de data
  Future<void> _selecionarData(BuildContext context) async {
    final DateTime? dataEscolhida = await showDatePicker(
      context: context,
      initialDate: _dataSelecionada,
      firstDate: DateTime(2020), // Primeiro ano permitido
      lastDate: DateTime.now(), // Não permite datas futuras
    );
    if (dataEscolhida != null && dataEscolhida != _dataSelecionada) {
      setState(() {
        _dataSelecionada = dataEscolhida;
      });
    }
  }

  // (7.1.4) Função que mostra o alerta de estoque baixo
  Future<void> _mostrarAlertaEstoqueBaixo(
      Produto produto, int novoEstoque) async {
    
    if (!context.mounted) return; 
    
    return showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('⚠️ Atenção: Estoque Baixo'),
        content: Text(
            'Ao realizar esta saída, o estoque do produto "${produto.nome}" ficará com $novoEstoque unidades, abaixo do mínimo configurado (${produto.estoqueMinimo}).'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('OK, Entendido'),
          ),
        ],
      ),
    );
  }

  // Função principal: Salvar a Movimentação
  Future<void> _salvarMovimentacao() async {
    // 1. Validar formulário
    if (!_formKey.currentState!.validate()) return;
    
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    if (_produtoSelecionado == null) {
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('Erro: Nenhum produto selecionado.')),
      );
      return;
    }
    
    // Pega o usuário logado (RF020)
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('Erro: Usuário não autenticado.')),
      );
      return;
    }

    setState(() { _isLoading = true; });

    try {
      final int quantidade = int.parse(_quantidadeController.text);
      
      // Converte 'entrada' ou 'saída' para +N ou -N
      final int quantidadeReal =
          _tipoSelecionado == TipoMovimentacao.entrada ? quantidade : -quantidade;
          
      // Pega o estoque ATUAL (fresco) do produto selecionado
      final int estoqueAtual = _produtoSelecionado!.estoqueAtual;
      final int estoqueMinimo = _produtoSelecionado!.estoqueMinimo;
      final int novoEstoque = estoqueAtual + quantidadeReal;
      
      // 2. (7.1.4) Checagem de Alerta (apenas para Saídas)
      if (_tipoSelecionado == TipoMovimentacao.saida && novoEstoque < estoqueMinimo) {
        // Mostra o alerta e ESPERA o usuário dar "OK"
        await _mostrarAlertaEstoqueBaixo(_produtoSelecionado!, novoEstoque);
      }

      // 3. (7.1.4 / RF016) Checagem de Saldo (Não pode ficar negativo)
      if (novoEstoque < 0) {
        throw Exception('Estoque insuficiente. Você tentou tirar $quantidade, mas só existem $estoqueAtual unidades.');
      }
      
      // 4. Preparar o Write Batch (Lote de Escrita)
      WriteBatch batch = FirebaseFirestore.instance.batch();

      // Operação 1: Atualizar o Produto (RF015 / RF016)
      DocumentReference produtoRef = _produtosCollection.doc(_produtoSelecionado!.id);
      batch.update(produtoRef, {
        'estoque_atual': FieldValue.increment(quantidadeReal),
      });

      // Operação 2: Criar o Log de Movimentação (RF019, RF020, RF021, RF022)
      DocumentReference movRef = _movimentacoesCollection.doc(); // Cria um ID automático
      batch.set(movRef, {
        'data_hora_operacao': FieldValue.serverTimestamp(), // Pega a hora do servidor
        'data_movimentacao': Timestamp.fromDate(_dataSelecionada), // Data informada (7.1.3)
        'tipo': _tipoSelecionado == TipoMovimentacao.entrada ? 'Entrada' : 'Saída',
        'quantidade': quantidade,
        'produto_id': _produtoSelecionado!.id, // Referência
        'produto_nome': _produtoSelecionado!.nome, // Desnormalizado (facilita relatórios)
        'usuario_id': user.uid, // (RF020)
        'usuario_email': user.email, // (RF020) (Desnormalizado)
      });
      
      // 5. Executar o Batch (as 2 operações ao mesmo tempo)
      await batch.commit();

      // 6. Sucesso: Limpar o formulário
      if (!context.mounted) return;
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('Movimentação salva com sucesso!')),
      );
      
      setState(() {
        // Limpamos apenas a quantidade, mantendo o produto e a data
        _quantidadeController.clear();
      });

    } catch (e) {
      if (!context.mounted) return; 
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text('Erro ao salvar: ${e.toString().replaceAll("Exception: ", "")}')),
      );
    } finally {
      if (mounted) {
        setState(() { _isLoading = false; });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Formata a data para "dd/MM/yyyy"
    final String dataFormatada = DateFormat('dd/MM/yyyy').format(_dataSelecionada);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestão de Estoque'),
      ),
      body:
          // (7.1.1) Usamos um StreamBuilder para garantir que a lista de
          // produtos (e o estoque dela) esteja SEMPRE atualizada.
          StreamBuilder<QuerySnapshot>(
        // (7.1.1) Lista os produtos em ordem alfabética
        stream: _produtosCollection.orderBy('nome').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
                child: Text('Nenhum produto cadastrado.'));
          }

          // Converte os documentos em objetos Produto
          final List<Produto> listaProdutos = snapshot.data!.docs.map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            return Produto.fromMap(data, doc.id);
          }).toList();
          
          // Se um produto estava selecionado, atualizamos seus dados
          // para garantir que temos o estoque_atual mais recente
          if (_produtoSelecionado != null) {
            try {
              // Atualiza a referência do _produtoSelecionado com os dados mais recentes
              _produtoSelecionado = listaProdutos
                  .firstWhere((p) => p.id == _produtoSelecionado!.id);
            } catch (e) {
              // O produto foi deletado por outro usuário; desmarca a seleção
              _produtoSelecionado = null; 
            }
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // (7.1.2) Seleção do Produto
                  DropdownButtonFormField<Produto>(
                    value: _produtoSelecionado,
                    hint: const Text('Selecione um produto...'),
                    isExpanded: true,
                    // Constrói os itens do Dropdown
                    items: listaProdutos.map((Produto produto) {
                      return DropdownMenuItem<Produto>(
                        value: produto,
                        // Mostra nome e estoque atual
                        child: Text('${produto.nome} (Est: ${produto.estoqueAtual})'),
                      );
                    }).toList(),
                    onChanged: (Produto? newValue) {
                      setState(() {
                        _produtoSelecionado = newValue;
                      });
                    },
                    validator: (value) =>
                        value == null ? 'Selecione um produto.' : null,
                  ),
                  const SizedBox(height: 24),

                  // (7.1.2) Seleção de Entrada/Saída
                  SegmentedButton<TipoMovimentacao>(
                    segments: const <ButtonSegment<TipoMovimentacao>>[
                      ButtonSegment<TipoMovimentacao>(
                        value: TipoMovimentacao.entrada,
                        label: Text('Entrada'),
                        icon: Icon(Icons.add),
                      ),
                      ButtonSegment<TipoMovimentacao>(
                        value: TipoMovimentacao.saida,
                        label: Text('Saída'),
                        icon: Icon(Icons.remove),
                      ),
                    ],
                    selected: {_tipoSelecionado},
                    onSelectionChanged: (Set<TipoMovimentacao> newSelection) {
                      setState(() {
                        _tipoSelecionado = newSelection.first;
                      });
                    },
                  ),
                  const SizedBox(height: 24),

                  // Campo de Quantidade
                  TextFormField(
                    controller: _quantidadeController,
                    decoration: const InputDecoration(
                      labelText: 'Quantidade *',
                      border: OutlineInputBorder(),
                    ),
                    // CORREÇÃO AQUI
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe a quantidade.';
                      }
                      if (int.tryParse(value) == null ||
                          int.parse(value) <= 0) {
                        return 'Valor inválido.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  // (7.1.3) Seletor de Data
                  Text('Data da Movimentação:',
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    onPressed: () => _selecionarData(context),
                    icon: const Icon(Icons.calendar_month),
                    label: Text(dataFormatada, style: const TextStyle(fontSize: 16)),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Botão de Salvar
                  _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton.icon(
                          onPressed: _salvarMovimentacao,
                          icon: const Icon(Icons.save),
                          label: const Text('SALVAR MOVIMENTAÇÃO'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}