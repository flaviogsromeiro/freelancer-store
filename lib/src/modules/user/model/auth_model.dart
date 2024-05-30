// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AuthModel {
  final String email;
  final String senha;

  AuthModel({
    required this.email,
    required this.senha,
  });

  factory AuthModel.instance() => AuthModel(email: '', senha: '');

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'senha': senha,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      email: map['email'] as String,
      senha: map['senha'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
