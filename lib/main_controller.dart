import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sisterslabsecond/auth/presentation/login/login_page.dart';
import 'package:sisterslabsecond/home/presentation/home_page.dart';


class MainController  extends ChangeNotifier {
  Widget firstPage = const HomePage();

  void checkUserSignedIn() {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        firstPage = const LoginPage();
        notifyListeners();
      } else{
        if (user.emailVerified) {
          firstPage = const HomePage();
        } else {
          firstPage = const LoginPage();
        }
        notifyListeners();
      }
    });
  }
}