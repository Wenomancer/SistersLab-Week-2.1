

import 'package:flutter/material.dart';

class MainController extends ChangeNotifier {
  int currentIndex = 0;

  void changePage(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
