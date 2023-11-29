import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:propertyfinder/app/modules/change_password/view/change_password.dart';
import 'package:propertyfinder/app/modules/edit_profile/controller/edit_profile_controller.dart';
import 'package:propertyfinder/app/modules/home/binding/home_binding.dart';
import 'package:propertyfinder/app/modules/home/controller/home_controller.dart';
import 'package:propertyfinder/app/modules/home/view/home_view.dart';
import 'package:propertyfinder/app/modules/home/view/subview/dashboard_view.dart';
import 'package:propertyfinder/app/routes/app_page.dart';

void main() {

  Get.put(HomeController());
  Get.put(EditProfileController());
 // Get.put(ChangePaswordView());
  runApp(
   GetMaterialApp(
getPages: AppPages.routes,
initialRoute: AppPages.INITIAL,
   )
   // MaterialApp(home: HomeView()
  //  )
    );
}


