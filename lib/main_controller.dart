

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sisterslabsecond/auth/presentation/create_account_page.dart';

import 'auth/presentation/login_page.dart';
import 'auth/presentation/main_page.dart';

class MainController  extends ChangeNotifier {
  Widget firstPage = const LoginPage();

  void checkUserSignedIn() {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        firstPage = const CreateAccountPage();
        notifyListeners();
      } else {
        firstPage = const MainPage();
        notifyListeners();
      }
    });
  }

  void init() {
    checkUserSignedIn();

  }
}