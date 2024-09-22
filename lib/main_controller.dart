import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sisterslabsecond/auth/presentation/login/login_page.dart';

import 'main/presentation/main_page.dart';

class MainController  extends ChangeNotifier {
  Widget firstPage = const MainPage();

  void checkUserSignedIn() {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        firstPage = const LoginPage();
        notifyListeners();
      } else{
        if (user.emailVerified) {
          firstPage = const MainPage();
        } else {
          firstPage = const LoginPage();
        }
        notifyListeners();
      }
    });
  }
}