// lib/models/produto.dart
// Modelo de dados atualizado para o Cloud Firestore

class Produto {
  // No Firestore, o ID é uma String (o ID do Documento)
  // e é armazenado separadamente dos dados.
  String id;
  String nome;
  String descricao;
  double pesoKg;
  String dimensoesCm;
  int estoqueAtual;
  int estoqueMinimo;

  Produto({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.pesoKg,
    required this.dimensoesCm,
    required this.estoqueAtual,
    required this.estoqueMinimo,
  });

  // --- CONVERSORES ---

  // Factory Constructor: Converte um Map (do Firestore) para um objeto Produto
  factory Produto.fromMap(Map<String, dynamic> map, String id) {
    return Produto(
      id: id,
      nome: map['nome'] ?? '', // ?? '' garante que não será nulo
      descricao: map['descricao'] ?? '',
      // Converte 'num' (que pode ser int ou double) para double
      pesoKg: (map['peso_kg'] as num?)?.toDouble() ?? 0.0,
      dimensoesCm: map['dimensoes_cm'] ?? '',
      estoqueAtual: (map['estoque_atual'] as num?)?.toInt() ?? 0,
      estoqueMinimo: (map['estoque_minimo'] as num?)?.toInt() ?? 10,
    );
  }

  // Método: Converte um objeto Produto para um Map
  // (Serialização)
  Map<String, dynamic> toMap() {
    // O 'id' não é incluído aqui, pois ele é o nome do Documento,
    // não um campo *dentro* do documento.
    return {
      'nome': nome,
      'descricao': descricao,
      'peso_kg': pesoKg,
      'dimensoes_cm': dimensoesCm,
      'estoque_atual': estoqueAtual,
      'estoque_minimo': estoqueMinimo,
    };
  }
}