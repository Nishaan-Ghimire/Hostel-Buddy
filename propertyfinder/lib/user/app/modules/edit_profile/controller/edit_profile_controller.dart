import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:propertyfinder/user/app/data/model/edit_profile/edit_profile_model.dart';
import 'package:propertyfinder/user/app/data/repo/auth_repo.dart';
import 'package:propertyfinder/user/app/modules/home/controller/home_controller.dart';
import 'package:propertyfinder/user/app/modules/home/view/subview/dashboard_view.dart';
import 'package:propertyfinder/vendor/app/modules/home/vendor_home_controller.dart';

class EditProfileController extends GetxController {
  final editProfileForMKey = GlobalKey<FormState>();
var isImageChanged=false.obs;
//.obs;
  var fullname = TextEditingController(
    //  text: AuthRepository.instance.userInfo.value.fName.toString()
      );

  var mobileNumber = TextEditingController(
      //text: AuthRepository.instance.userInfo.value.mobile.toString()
      );
 
  var dob = TextEditingController(
          //text: AuthRepository.instance.userInfo.value.dob.toString()
          )
      .obs;
  final selectedOption = 0.obs;
  final editProfileFormKey = GlobalKey<FormState>();
  final count = 0.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  //final selectedOption = 0.obs;

  var birthDate = DateTime.now().obs;
  var birthDateString = ''.obs;

  var profileImage = ''.obs;


  editProfile()async{
  //EditProfileModel ?res=
   await AuthRepository.instance.editProfile(fullname.text, mobileNumber.text, dob.value.text);
 //print('222${res}');
 Get.put(HomeController());
 HomeController h=Get.find();
 h.getProfile();
 Get.put(HomeControllerVendor);
 HomeControllerVendor hF=Get.find();
 hF.getProfile();

  }
// getProfile()async{

//      var d= await   AuthRepository.instance.getProfile();
//     profile.value=d!;
//      print('profile ayo hai $d');
// }
}