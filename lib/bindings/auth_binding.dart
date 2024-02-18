import 'package:get/get.dart';
import 'package:smart_agriculture/controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
