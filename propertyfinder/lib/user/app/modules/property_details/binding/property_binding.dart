import 'package:get/get.dart';
import 'package:propertyfinder/user/app/modules/property_details/controller/property_controller.dart';



class PropertyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyController>(
      () => PropertyController(),
    );
  }
}
