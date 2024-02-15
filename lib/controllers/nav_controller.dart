import 'package:get/get.dart';

class NavigationController extends GetxController {
  var currentIndex = 0.obs;

  set updateNavIndex(int value) {
    currentIndex.value = value;
    update();
  }
}
