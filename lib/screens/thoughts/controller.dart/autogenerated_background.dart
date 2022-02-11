import 'package:get/get.dart';

class AutoGenBackground extends GetxController {
  int index = 1;
  generate() {
    if (index >= 2) {
      index = 0;
    } else {
      index = index + 1;
    }
    update();
  }
}
