

import 'package:flutter/cupertino.dart';
import 'package:sisterslabsecond/data/repository/bloc_repository.dart';

class HomeController extends ChangeNotifier {
  final BlocRepository _blocRepository = BlocRepository();

  // state
  int get counterState => _blocRepository.counter;

  // event
  void increment() {
    _blocRepository.counter++;
    notifyListeners();
  }
  void decrement() {
    _blocRepository.counter--;
    notifyListeners();
  }

}