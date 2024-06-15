
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:propertyfinder/user/app/modules/signin/controller/signin_controller.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(
      () => SignInController(),
    );
  }
}