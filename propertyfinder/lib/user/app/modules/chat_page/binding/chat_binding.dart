import 'package:get/get.dart';
import 'package:propertyfinder/user/app/modules/chat_page/controller/chat_page_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatPageController>(
      () => ChatPageController(),
    );
  }
}