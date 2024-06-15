
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propertyfinder/user/app/data/model/change_password/change_password_model.dart';
import 'package:propertyfinder/user/app/data/repo/auth_repo.dart';
import 'package:propertyfinder/user/app/modules/home/view/subview/dashboard_view.dart';

class ChangePasswordControllerVendor extends GetxController {
  TextEditingController oldPassword=TextEditingController();
TextEditingController newPassword=TextEditingController();
//  final editProfileForMKey = GlobalKey<FormState>();
    changePassword()async{
   ChangePassword ?changePassword=await AuthRepository.instance.changePassword(oldPassword.text,newPassword.text);
if (changePassword!.message=="Password Changed successfully") {
  Get.snackbar('Password Changes', 'Password Changed successfully.',
         colorText: Colors.white,backgroundColor: Colors.blue);
  //Get.to(DashBoardView());
}
else{
    Get.snackbar('Password Changes Failed', 'Something went wrong',
         colorText: Colors.red,backgroundColor: Colors.blue);
}

  }
  }