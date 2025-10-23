// lib/screens/cadastro_produto_screen.dart
// CÓDIGO COMPLETO (com correção final do TextInputType)

import 'package:flutter/material.dart';
import 'package:sga_ferramentas/models/produto.dart'; // Nosso modelo atualizado
import 'package:cloud_firestore/cloud_firestore.dart'; // Import do Firestore

class CadastroProdutoScreen extends StatefulWidget {
  const CadastroProdutoScreen({super.key});

  @override
  State<CadastroProdutoScreen> createState() => _CadastroProdutoScreenState();
}

class _CadastroProdutoScreenState extends State<CadastroProdutoScreen> {
  // (6.1.2) Controlador e variável para a busca
  final _searchController = TextEditingController();
  String _termoBusca = '';

  // Chave do formulário para validação (6.1.6)
  final _formKey = GlobalKey<FormState>();

  // Referência principal à nossa coleção no Firestore
  final CollectionReference _produtosCollection =
      FirebaseFirestore.instance.collection('Produtos');

  @override
  void initState() {
    super.initState();
    // Adiciona o "ouvinte" da busca
    _searchController.addListener(() {
      setState(() {
        _termoBusca = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // --- LÓGICA DE DADOS (CRUD) ---

  // (6.1.3, 6.1.4, 6.1.6)
  Future<void> _mostrarFormularioProduto({Produto? produtoExistente}) async {
    // Preenche os controladores se estiver editando
    final nomeController = TextEditingController(text: produtoExistente?.nome);
    final descController = TextEditingController(text: produtoExistente?.descricao);
    final pesoController =
        TextEditingController(text: produtoExistente?.pesoKg.toString());
    final dimensoesController =
        TextEditingController(text: produtoExistente?.dimensoesCm);
    final estAtualController =
        TextEditingController(text: produtoExistente?.estoqueAtual.toString());
    final estMinimoController =
        TextEditingController(text: produtoExistente?.estoqueMinimo.toString());
    
    // Capturamos os 'context' ANTES do 'await'
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    // Mostra o Dialog
    return showDialog<void>(
      context: context,
      builder: (ctx) {
        // Usamos o 'ctx' do builder para o Navigator.pop() interno do Dialog
        final dialogNavigator = Navigator.of(ctx);
        
        return AlertDialog(
          title: Text(produtoExistente == null ? 'Novo Produto' : 'Editar Produto'),
          content: Form(
            key: _formKey, // Usa a chave global
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: nomeController,
                    decoration: const InputDecoration(labelText: 'Nome *'),
                    validator: (val) => val!.isEmpty ? 'Campo obrigatório' : null,
                  ),
                  TextFormField(
                    controller: descController,
                    decoration: const InputDecoration(labelText: 'Descrição'),
                  ),
                  TextFormField(
                    controller: pesoController,
                    decoration: const InputDecoration(labelText: 'Peso (kg) *'),
                    // Correto para decimais
                    keyboardType: const TextInputType.numberWithOptions(decimal: true), 
                    validator: (val) => val!.isEmpty ? 'Campo obrigatório' : null,
                  ),
                  TextFormField(
                    controller: dimensoesController,
                    decoration: const InputDecoration(labelText: 'Dimensões (cm)'),
                  ),
                  TextFormField(
                    controller: estAtualController,
                    decoration: const InputDecoration(labelText: 'Estoque Atual *'),
                    // CORREÇÃO AQUI
                    keyboardType: TextInputType.number, 
                    validator: (val) => val!.isEmpty ? 'Campo obrigatório' : null,
                  ),
                  TextFormField(
                    controller: estMinimoController,
                    decoration: const InputDecoration(labelText: 'Estoque Mínimo *'),
                    // CORREÇÃO AQUI
                    keyboardType: TextInputType.number,
                    validator: (val) => val!.isEmpty ? 'Campo obrigatório' : null,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => dialogNavigator.pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () async {
                // (6.1.6) Validação
                if (_formKey.currentState!.validate()) {
                  final dadosProduto = Produto(
                    id: '', // ID temporário
                    nome: nomeController.text,
                    descricao: descController.text,
                    pesoKg: double.tryParse(pesoController.text) ?? 0.0,
                    dimensoesCm: dimensoesController.text,
                    estoqueAtual: int.tryParse(estAtualController.text) ?? 0,
                    estoqueMinimo: int.tryParse(estMinimoController.text) ?? 10,
                  ).toMap();

                  try {
                    if (produtoExistente == null) {
                      // (6.1.3) INSERIR
                      await _produtosCollection.add(dadosProduto);
                    } else {
                      // (6.1.4) EDITAR
                      await _produtosCollection
                          .doc(produtoExistente.id)
                          .update(dadosProduto);
                    }
                    dialogNavigator.pop(); // Fecha o Dialog
                  } catch (e) {
                    scaffoldMessenger.showSnackBar(
                      SnackBar(content: Text('Erro ao salvar produto: $e')),
                    );
                  }
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  // (6.1.5) Lógica de Exclusão
  void _confirmarExclusao(Produto produto) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    
    showDialog(
      context: context,
      builder: (ctx) {
        final dialogNavigator = Navigator.of(ctx);
        return AlertDialog(
          title: const Text('Confirmar Exclusão'),
          content: Text('Tem certeza que deseja excluir o produto "${produto.nome}"?'),
          actions: [
            TextButton(
              onPressed: () => dialogNavigator.pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              onPressed: () async {
                try {
                  // Exclui o documento usando o ID
                  await _produtosCollection.doc(produto.id).delete();
                  dialogNavigator.pop(); // Fecha o Dialog
                } catch (e) {
                  scaffoldMessenger.showSnackBar(
                    SnackBar(content: Text('Erro ao excluir produto: $e')),
                  );
                }
              },
              child: const Text('Excluir'),
            ),
          ],
        );
      }
    );
  }

  // --- CONSTRUÇÃO DA INTERFACE ---

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Produto'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _mostrarFormularioProduto(), // Chama o formulário vazio
        tooltip: 'Adicionar Novo Produto',
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // (6.1.2) Campo de Busca
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Buscar por nome ou descrição',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // (6.1.1) Tabela de Produtos em Tempo Real
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
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

                  // 1. Mapeia os documentos do Firestore para objetos Produto
                  List<Produto> todosProdutos = snapshot.data!.docs.map((doc) {
                    Map<String, dynamic> data =
                        doc.data() as Map<String, dynamic>;
                    return Produto.fromMap(data, doc.id);
                  }).toList();

                  // 2. (6.1.2) Aplica o filtro da busca localmente
                  final List<Produto> listaFiltrada;
                  if (_termoBusca.isEmpty) {
                    listaFiltrada = todosProdutos;
                  } else {
                    listaFiltrada = todosProdutos.where((produto) {
                      return produto.nome.toLowerCase().contains(_termoBusca) ||
                          produto.descricao.toLowerCase().contains(_termoBusca);
                    }).toList();
                  }

                  // 3. Constrói a Tabela
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Nome')),
                        DataColumn(label: Text('Est. Atual'), numeric: true),
                        DataColumn(label: Text('Est. Mínimo'), numeric: true),
                        DataColumn(label: Text('Descrição')),
                        DataColumn(label: Text('Ações')),
                      ],
                      rows: listaFiltrada.map((produto) {
                        return DataRow(
                          cells: [
                            DataCell(Text(produto.nome)),
                            DataCell(Text(produto.estoqueAtual.toString())),
                            DataCell(Text(produto.estoqueMinimo.toString())),
                            DataCell(Text(
                              produto.descricao,
                              overflow: TextOverflow.ellipsis,
                            )),
                            DataCell(
                              Row(
                                children: [
                                  // (6.1.4) Botão de Editar
                                  IconButton(
                                    icon: const Icon(Icons.edit, size: 20),
                                    onPressed: () => _mostrarFormularioProduto(
                                        produtoExistente: produto),
                                  ),
                                  // (6.1.5) Botão de Excluir
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.redAccent, size: 20),
                                    onPressed: () => _confirmarExclusao(produto),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}