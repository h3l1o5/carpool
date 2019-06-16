import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthBloc with ChangeNotifier {
  static final AuthBloc _authBlocSingleton = AuthBloc._internal();
  static final firebaseAuth = FirebaseAuth.instance;
  FirebaseUser _user;

  factory AuthBloc() {
    return _authBlocSingleton;
  }
  AuthBloc._internal() {
    firebaseAuth.onAuthStateChanged.listen((firebaseUser) {
      user = firebaseUser;
    });
  }

  FirebaseUser get user {
    return _user;
  }

  set user(FirebaseUser user) {
    _user = user;
    notifyListeners();
  }

  Future<void> signUp(String email, String password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
