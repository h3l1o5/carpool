import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kapoo/models/user.dart';

class AuthService {
  static final _firestore = Firestore.instance;
  static final _firebaseAuth = FirebaseAuth.instance;
  static final _googleSignIn = GoogleSignIn(scopes: ["email"]);
  static final _authStreamController = StreamController<User>.broadcast();

  StreamSubscription<User> _userStreamSubscription;
  Stream<User> onAuthStateChanged = _authStreamController.stream;

  AuthService() {
    _firebaseAuth.onAuthStateChanged.listen((firebaseUser) async {
      if (firebaseUser != null) {
        await _extendUser(firebaseUser);
        _userStreamSubscription = _getUserStream(firebaseUser)
            .listen((user) => _authStreamController.add(user));
      } else {
        _authStreamController.add(null);

        if (_userStreamSubscription != null) {
          _userStreamSubscription.cancel();
        }
      }
    });
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

  Future<void> _extendUser(FirebaseUser firebaseUser) async {
    final userExtension =
        await _firestore.collection("users").document(firebaseUser.uid).get();

    if (!userExtension.exists) {
      await _firestore.collection("users").document(firebaseUser.uid).setData({
        "displayName": firebaseUser.displayName,
        "email": firebaseUser.email,
        "isEmailVerified": firebaseUser.isEmailVerified,
        "photoUrl": firebaseUser.photoUrl,
      });
    } else {
      await _firestore.collection("users").document(firebaseUser.uid).setData({
        "isEmailVerified": firebaseUser.isEmailVerified,
      }, merge: true);
    }
  }

  Stream<User> _getUserStream(FirebaseUser firebaseUser) {
    return _firestore
        .collection("users")
        .document(firebaseUser.uid)
        .snapshots()
        .take(1)
        .map((firebaseUser) => User.fromFirebase(firebaseUser));
  }
}
