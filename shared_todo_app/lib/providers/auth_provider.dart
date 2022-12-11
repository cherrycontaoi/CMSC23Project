import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/api/firebase_auth_api.dart';

class AuthProvider with ChangeNotifier {
  late FirebaseAuthAPI authService;
  User? userObj;

  AuthProvider() {
    authService = FirebaseAuthAPI();
    authService.getUser().listen((User? newUser) {
      userObj = newUser;
      print('AuthProvider - FirebaseAuth - onAuthStateChanged - $newUser');
      notifyListeners();
    }, onError: (e) {
      // provide a more useful error
      print('AuthProvider - FirebaseAuth - onAuthStateChanged - $e');
    });
  }

  User? get user => userObj;
  // for registering the username in email form
  String emailTag = "@email.com";

  bool get isAuthenticated {
    return user != null;
  }

  void signIn(String email, String password) {
    authService.signIn(email, password);
  }

  void signOut() {
    authService.signOut();
  }

  void signUp(
      String username, String password, String firstName, String lastName) {
    authService.signUp(username + emailTag, password, firstName, lastName);
  }
}
