import 'package:get/get.dart';
import 'package:propertyfinder/vendor/app/modules/add_property/controller/add_property_controller.dart';
import 'package:propertyfinder/user/app/modules/edit_profile/controller/edit_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(
      () => EditProfileController(),
    );
  }
}
