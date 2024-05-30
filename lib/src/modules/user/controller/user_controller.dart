// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_store/src/modules/user/model/auth_model.dart';
import 'package:my_store/src/modules/user/model/user_model.dart';

class UserController {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  const UserController({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  Future<bool> signIn(AuthModel model) async {
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
          email: model.email, password: model.senha);

      return true;
    } catch (e) {
      log('$e');
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      await firebaseAuth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signUp(UserModel model, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: model.email, password: password);

      await _saveUserData(model);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> _saveUserData(UserModel model) async {
    try {
      await firebaseFirestore.collection('Users').add(model.toMap());
    } catch (e) {
      throw Exception();
    }
  }
}
