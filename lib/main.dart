import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:propertyfinder/user/app/modules/change_password/view/change_password.dart';
import 'package:propertyfinder/user/app/modules/edit_profile/controller/edit_profile_controller.dart';
import 'package:propertyfinder/user/app/modules/home/binding/home_binding.dart';
import 'package:propertyfinder/user/app/modules/home/controller/home_controller.dart';
import 'package:propertyfinder/user/app/modules/home/view/home_view.dart';
import 'package:propertyfinder/user/app/modules/home/view/subview/dashboard_view.dart';
import 'package:propertyfinder/user/app/routes/app_page.dart';
import 'package:propertyfinder/user/app/routes/app_routes.dart';
import 'package:propertyfinder/vendor/app/modules/home/vendor_home_binding.dart';
import 'package:propertyfinder/vendor/app/modules/home/vendor_home_controller.dart';
import 'package:propertyfinder/vendor/app/modules/managerooms/manage_room_binding.dart';
import 'package:propertyfinder/vendor/app/modules/managerooms/manage_rooms_controller.dart';


void main() {

 // Get.put(HomeController());
 // Get.put(EditProfileController());

 Get.put(HomeControllerVendor());
 Get.put(HomeBindingVendor());
 //Get.put(ManageRoomController());
 // Get.put(ManageRoomBinding());
 // Get.put(ChangePaswordView());
  runApp(
   GetMaterialApp(
    debugShowCheckedModeBanner: false,
getPages:


//AppPagesVendor.routes,
 AppPages.routes,
initialRoute:
//Routes.HOME
//Routes.ROLE
//Routes.ROLE
//Routes.SIGNUP
// Routes.FORGOTPASSWORD
 //Routes.CHANGE_PASSWORD
Routes.vendorHome
// RoutesVendor.HOME
//AppPages.INITIAL,
//Routes.EMAILVERIFICATION
   )
   // MaterialApp(home: HomeView()
  //  )
    );
}


