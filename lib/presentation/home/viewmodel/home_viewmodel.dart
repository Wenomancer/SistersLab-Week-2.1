import 'package:flutter/material.dart';

class HomeViewmodel extends ChangeNotifier {
  int counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }
}