import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUserAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;

  Stream<DocumentSnapshot> getUserInfo() {
    return db.collection("users").doc(user?.uid).snapshots();
  }
}
