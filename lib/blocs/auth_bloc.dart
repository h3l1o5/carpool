import 'package:flutter/material.dart';
import 'package:kapoo/models/user.dart';
import 'package:kapoo/services/auth_service.dart';

class AuthBloc with ChangeNotifier {
  AuthService _authService = AuthService();
  User _user;

  AuthBloc() {
    _authService.onAuthStateChanged.listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  User getUser() {
    return _user;
  }

  Future<void> signUp(String email, String password) async {
    await _authService.signUp(email, password);
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await _authService.signInWithEmailAndPassword(email, password);
  }

  Future<void> signInWithGoogle() async {
    await _authService.signInWithGoogle();
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}
