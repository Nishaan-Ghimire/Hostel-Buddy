import 'package:get/get.dart';

import 'package:propertyfinder/app/modules/home/controller/home_controller.dart';

class AddPropertyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
