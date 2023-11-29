
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_instance/src/bindings_interface.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(
      () => SearchController(),
    );
  }
}
