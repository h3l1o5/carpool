import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthBloc with ChangeNotifier {
  static final AuthBloc _authBlocSingleton = AuthBloc._internal();
  static final _firebaseAuth = FirebaseAuth.instance;
  static final _googleSignIn = GoogleSignIn(scopes: ["email"]);
  FirebaseUser _user;

  factory AuthBloc() {
    return _authBlocSingleton;
  }
  AuthBloc._internal() {
    _firebaseAuth.onAuthStateChanged.listen((firebaseUser) {
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
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signInWithGoogle() async {
    final googleAccount = await _googleSignIn.signIn();

    if (googleAccount != null) {
      final googleAccountAuth = await googleAccount.authentication;
      final credential = GoogleAuthProvider.getCredential(
          accessToken: googleAccountAuth.accessToken,
          idToken: googleAccountAuth.idToken);

      await _firebaseAuth.signInWithCredential(credential);
    } else {
      throw Exception();
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }
}
