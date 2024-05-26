import 'package:get/get.dart';

import 'package:propertyfinder/user/app/modules/home/controller/home_controller.dart';

class AddPropertyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
