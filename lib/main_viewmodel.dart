

import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {
  int selectedPageIndex = 0;

  void setSelectedPageIndex(int index) {
    selectedPageIndex = index;
    notifyListeners();
  }


}