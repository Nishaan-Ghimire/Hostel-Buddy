import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:propertyfinder/user/app/data/repo/auth_repo.dart';
import 'package:propertyfinder/user/app/data/repo/hostel_repo.dart';
import 'package:propertyfinder/user/app/modules/change_password/view/change_password.dart';
import 'package:propertyfinder/user/app/modules/edit_profile/controller/edit_profile_controller.dart';
import 'package:propertyfinder/user/app/modules/home/binding/home_binding.dart';
import 'package:propertyfinder/user/app/modules/home/controller/home_controller.dart';
import 'package:propertyfinder/user/app/modules/home/view/home_view.dart';
import 'package:propertyfinder/user/app/modules/home/view/subview/dashboard_view.dart';
import 'package:propertyfinder/user/app/routes/app_page.dart';
import 'package:propertyfinder/user/app/routes/app_routes.dart';
import 'package:propertyfinder/vendor/app/data/repo/hostel_repo.dart';

import 'package:propertyfinder/vendor/app/modules/home/vendor_home_binding.dart';
import 'package:propertyfinder/vendor/app/modules/home/vendor_home_controller.dart';
import 'package:propertyfinder/vendor/app/modules/managerooms/manage_room_binding.dart';
import 'package:propertyfinder/vendor/app/modules/managerooms/manage_rooms_controller.dart';

// map box secret sk.eyJ1IjoibmljazEyMDAwIiwiYSI6ImNsd3I2d3E0ODA5cmkyaXM3NmlmMGU2d3oifQ.isPnEjbvWcKNg3BPLwPXpw

//open source route token 5b3ce3597851110001cf62481c991d3035e94b378361d5eee163965e
//clodianry api key 127147265177412
//secret vtt1-pUJ5UmWTSDh7Eyk1TUG7fk
//CLOUDINARY_URL=cloudinary://<your_api_key>:<your_api_secret>@dow3jpx74
//cloud name dow3jpx74
void main() async{
await GetStorage.init();
final box = GetStorage();
//ZIMKit.instance.init(appID: 1074957561,appSign:"2d2df010a565b66326c1db18943b260625fe37d3f499c8b55ad5fc45726a1cf6" );
MapboxMap(accessToken: const String.fromEnvironment("ACCESS_TOKEN"),
initialCameraPosition: CameraPosition(target: LatLng(27.7172, 85.3240)),
);

 // Get.put(HomeController());
 // Get.put(EditProfileController());
Get.put(AuthRepository());
 Get.put(HomeControllerVendor());
 Get.put(HomeBindingVendor());
Get.put(HostelRepo());
Get.put(HostelRepoVendor());
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
box.read('accessToken')!=null&&box.read('role')=="User"?
Routes.HOME 
  :box.read('accessToken')!=null&&box.read('role')!="User"?Routes.vendorHome :Routes.SIGNIN
//Routes.vendorHome


//Routes.message
//Routes.ROLE
//Routes.ROLE
//Routes.SIGNUP
//Routes.SIGNIN
// Routes.FORGOTPASSWORD
 //Routes.CHANGE_PASSWORD
// RoutesVendor.HOME
//AppPages.INITIAL,
//Routes.EMAILVERIFICATION
   )
   // MaterialApp(home: HomeView()
  //  )
    );
}


