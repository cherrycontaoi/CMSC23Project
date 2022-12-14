import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/api/firebase_user_api.dart';

class UserProfileProvider {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late FirebaseUserAPI firebaseService;
  late Stream<DocumentSnapshot> _userStream;

  final loggedUser = FirebaseAuth.instance.currentUser;

  // Stream<DocumentSnapshot> get user => _userStream;

  UserProfileProvider() {
    firebaseService = FirebaseUserAPI();
  }

//for getting the id of the current user

  Stream<DocumentSnapshot> get user => _userStream;

  Future<String> getCurrentUserID() async {
    return (loggedUser!.uid);
  }

  //get the current user
  Future getCurrentUser() async {
    return await loggedUser;
  }

  void fetchUserInfo() {
    _userStream = firebaseService.getUserInfo();
  }

  Future<String?> getLastName() async {
    String? lastName;
    var collection = FirebaseFirestore.instance.collection('users');

    var docSnapshot = await collection.doc(loggedUser?.uid).get();

    Map<String, dynamic>? data = docSnapshot.data();

    lastName = data!['lastName'];

    return lastName;
  }

  // fetchUserInfo() {
  //   _userStream = firebaseService.userInfo((auth.currentUser)?.uid)
  //       as Stream<DocumentSnapshot<Object?>>;
  //   print(_userStream);

}
