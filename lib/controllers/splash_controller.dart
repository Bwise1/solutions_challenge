import 'package:get/get.dart';

import '../routes/route.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 2000), () {
      Get.offAllNamed(Routes.MAIN_PAGE);
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
