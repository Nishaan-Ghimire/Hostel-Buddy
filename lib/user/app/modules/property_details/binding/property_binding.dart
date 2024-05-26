import 'package:get/get.dart';
import 'package:propertyfinder/user/app/modules/add_property/controller/add_property_controller.dart';

import 'package:propertyfinder/user/app/modules/home/controller/home_controller.dart';

import 'package:get/get.dart';

import 'package:propertyfinder/user/app/modules/home/controller/home_controller.dart';

class PropertyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyController>(
      () => PropertyController(),
    );
  }
}
