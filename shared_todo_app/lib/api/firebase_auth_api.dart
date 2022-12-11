import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseAuthAPI {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final FirebaseFirestore db = FirebaseFirestore.instance;
  String? errorType;

  Stream<User?> getUser() {
    return auth.authStateChanges();
  }

  FirebaseAuthAPI({
    String? this.errorType,
  });

  void saveUserToFirestore(
      String? uid, String username, String firstName, String lastName) async {
    try {
      await db.collection("users").doc(uid).set(
          {"username": username, "firstName": firstName, "lastName": lastName});
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

  void signIn(String username, String password) async {
    UserCredential credential;
    try {
      final credential = await auth.signInWithEmailAndPassword(
          email: username, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void signUp(String username, String password, String firstName,
      String lastName) async {
    UserCredential credential;
    try {
      credential = await auth.createUserWithEmailAndPassword(
        email: username,
        password: password,
      );
      if (credential.user != null) {
        saveUserToFirestore(
            credential.user?.uid, username, firstName, lastName);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void signOut() async {
    auth.signOut();
  }
}
