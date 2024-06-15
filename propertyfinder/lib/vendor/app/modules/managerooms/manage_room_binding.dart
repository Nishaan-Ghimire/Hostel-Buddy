import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'manage_rooms_controller.dart';



class ManageRoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageRoomController>(
      () => ManageRoomController(),
    );
  }
}
