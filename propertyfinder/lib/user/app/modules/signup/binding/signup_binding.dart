import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:propertyfinder/user/app/modules/signup/controller/sign_up_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(),
    );
  }
}