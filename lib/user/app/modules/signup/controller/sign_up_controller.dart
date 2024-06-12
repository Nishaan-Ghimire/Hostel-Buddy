import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:propertyfinder/user/app/routes/app_routes.dart';

import '../../../data/repo/auth_repo.dart';

class SignupController extends GetxController {

  final obscurePassword = true.obs;
  final obscureConfirmPassword = true.obs;

  var password = TextEditingController();
  var dob = TextEditingController();
  var fullName = TextEditingController();
  var jobStatus = TextEditingController();
  var mobileNumber = TextEditingController();
  var emailAddress = TextEditingController();
    var userName = TextEditingController();
        var profession = TextEditingController();
    var collegename = TextEditingController();










  Future<void> signupProcess() async {

     var registerResponse = await AuthRepository.instance.
     register(fullName: fullName.text, dob: dob.text, userName: userName.text, email: emailAddress.text,
      phoneNo: mobileNumber.text, password: password.text,
       college: collegename.text, company: '', 
      jobstatus: jobStatus.text, collegelongitude: '', collegelatitude: '', 
      fieldOfProfession: profession.text);
      print(registerResponse?.statusCode);
       //     print(registerResponse?.data.email);

//print('register response${registerResponse!.data!.college!.longitude}  status ${registerResponse!.statusCode.toString()}');
if (registerResponse?.statusCode == 201) {
  print('registered successfully');
    Get.offAllNamed(Routes.SIGNIN);
}
else{

  print('something went wrong');
}


  }
}