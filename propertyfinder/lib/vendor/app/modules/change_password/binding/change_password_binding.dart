
import 'package:get/get.dart';
import 'package:propertyfinder/user/app/modules/change_password/controller/change_password_controller.dart';
import 'package:propertyfinder/vendor/app/modules/change_password/controller/change_password_controller.dart';

class ChangePasswordVendorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordControllerVendor>(
      () => ChangePasswordControllerVendor(),
    );
  }



}
