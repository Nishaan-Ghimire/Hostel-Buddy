
import 'package:get/get.dart';
import 'package:propertyfinder/user/app/modules/change_password/controller/change_password_controller.dart';
import 'package:propertyfinder/user/app/modules/forgot_password/controller/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(
      () => ForgotPasswordController(),
    );
  }
}
