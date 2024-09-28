
import 'package:get/get.dart';

class GetxCounterController extends GetxController {
  var counter = 0.obs;

  void increment() {
    counter.value++;
  }

  void decrement() {
    counter.value--;
  }
}