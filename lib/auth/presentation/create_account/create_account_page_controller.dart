

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateAccountPageController extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  String emailVerificationMessage = '';

  Future<void> register(String email, String password) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      User? user = userCredential.user;
      prefs.setString('email', email);
      prefs.setString('password', password);

      print("Kayıt başarılı");
    } catch (e) {
      print("Hata: $e");
    }
  }


  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      // Firebase ile e-posta ve şifreyle kullanıcı oluşturma
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      // Kullanıcı e-posta doğrulaması isteği gönderiyor
      User? user = userCredential.user;

      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        print("Doğrulama e-postası gönderildi.");
      }
      emailVerificationMessage = 'Kayıt başarılı, lütfen e-postanızı doğrulayın.';
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'weak-password') {
        message = 'Şifre çok zayıf.';
      } else if (e.code == 'email-already-in-use') {
        message = 'Bu e-posta adresiyle zaten bir hesap mevcut.';
      } else {
        message = 'Bir hata oluştu: ${e.message}';
      }

      emailVerificationMessage = message;
      notifyListeners();
    }
  }
}