import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propertyfinder/user/app/data/repo/auth_repo.dart';
import 'package:propertyfinder/user/app/routes/app_routes.dart';

class SignInController extends GetxController {
  var password = TextEditingController();
  var email = TextEditingController();

Future<void> signInProcess() async {


     var loginResponse = await AuthRepository.instance.login(email: email.text, password: password.text);
print('log...${loginResponse}');
if (loginResponse?.status == 200) {
  print('login successfully');
    Get.offAllNamed(Routes.HOME);
}
else{

  print('something went wrong');
}
  }



}