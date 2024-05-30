import 'dart:convert';

class UserModel {
  final String? id;
  final String email;
  final String nome;
  final String telefone;
  UserModel({
    this.id,
    required this.email,
    required this.nome,
    required this.telefone,
  });

  factory UserModel.instance() => UserModel(email: '', nome: '', telefone: '');

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'nome': nome,
      'telefone': telefone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      email: map['email'] as String,
      nome: map['nome'] as String,
      telefone: map['telefone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
