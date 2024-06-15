import 'package:get/get.dart';
import 'package:propertyfinder/user/app/data/hostel_model.dart';
import 'package:propertyfinder/user/app/data/repo/hostel_repo.dart';
import 'package:propertyfinder/vendor/app/data/models/manage_property/manage_property_model.dart';
import 'package:propertyfinder/vendor/app/data/repo/hostel_repo.dart';

class ManageRoomController extends GetxController {
var selectedCase = 0.obs; 
var active=false.obs;

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }
    final HostelModel items = Get.arguments;
 //final arguments = Get.arguments;



}