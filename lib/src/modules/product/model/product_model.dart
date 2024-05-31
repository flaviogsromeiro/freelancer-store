import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  final String? id;
  final String titulo;
  final String descricao;
  final String tamanho;
  final String urlImagem;
  final String preco;

  ProductModel({
    this.id,
    required this.titulo,
    required this.descricao,
    required this.tamanho,
    required this.urlImagem,
    required this.preco,
  });

  factory ProductModel.instance() => ProductModel(
        titulo: '',
        descricao: '',
        tamanho: '',
        urlImagem: '',
        preco: '',
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'tamanho': tamanho,
      'urlImagem': urlImagem,
      'preco': preco,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as String : null,
      titulo: map['titulo'] as String,
      descricao: map['descricao'] as String,
      tamanho: map['tamanho'] as String,
      urlImagem: map['urlImagem'] as String,
      preco: map['preco'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
