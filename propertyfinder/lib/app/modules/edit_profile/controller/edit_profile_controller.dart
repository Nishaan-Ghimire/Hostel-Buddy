import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class EditProfileController extends GetxController {
  final editProfileForMKey = GlobalKey<FormState>();
var isImageChanged=false.obs;
//.obs;
  var fName = TextEditingController(
    //  text: AuthRepository.instance.userInfo.value.fName.toString()
      );
  var lName = TextEditingController(
      //text: AuthRepository.instance.userInfo.value.lName.toString()
      );
  var mobileNumber = TextEditingController(
      //text: AuthRepository.instance.userInfo.value.mobile.toString()
      );
  var emailAddress = TextEditingController(
      //text: AuthRepository.instance.userInfo.value.username.toString()
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

}