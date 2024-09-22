import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class MainPageController extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logout() async {
    await _auth.signOut();
  }
}