import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'vendor_home_controller.dart';

class HomeBindingVendor extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeControllerVendor>(
      () => HomeControllerVendor(),
    );
  }
}
