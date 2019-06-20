import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String displayName;
  final String email;
  final String photoUrl;
  final String gender;
  final bool isEmailVerified;

  User({
    this.id,
    this.displayName,
    this.email,
    this.photoUrl,
    this.gender,
    this.isEmailVerified,
  });

  factory User.fromFirestore(DocumentSnapshot document) {
    Map data = document.data;

    return User(
      id: document.documentID,
      displayName: data["displayName"] ?? "",
      email: data["email"] ?? "",
      photoUrl: data["photoUrl"] ?? "",
      gender: data["gender"] ?? "",
      isEmailVerified: data["isEmailVerified"] ?? false,
    );
  }
}
