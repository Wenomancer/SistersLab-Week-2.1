import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LoginPageController extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String emailVerificationMessage = '';

  Future<void> login(String email, String password) async {
    User? user = _auth.currentUser;
    await user?.reload();
    user = _auth.currentUser;

    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      emailVerificationMessage = 'Giriş başarılı';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emailVerificationMessage = 'Kullanıcı bulunamadı.';
      } else if (e.code == 'wrong-password') {
        emailVerificationMessage = 'Yanlış şifre.';
      } else {
        emailVerificationMessage = 'Bir hata oluştu: ${e.message}';
      }
    }
  }
}
