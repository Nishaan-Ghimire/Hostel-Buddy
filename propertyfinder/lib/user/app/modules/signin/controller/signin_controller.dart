import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:propertyfinder/user/app/data/repo/auth_repo.dart';
import 'package:propertyfinder/user/app/routes/app_routes.dart';

class SignInController extends GetxController {
  var password = TextEditingController();
  var email = TextEditingController();

Future<void> signInProcess() async {


     var loginResponse = await AuthRepository.instance.login(email: email.text, password: password.text);
print('log...${loginResponse?.accesstoken}');
print('log...${loginResponse?.userName}');
final box = GetStorage();
box.write('accessToken',loginResponse?.accesstoken );
box.write('username', loginResponse?.userName);
box.write('role', loginResponse?.role);
if (loginResponse?.status == 200) {
  print('login successfully');

  box.read('role')=="User" ? Get.offAllNamed(Routes.HOME):Get.offAllNamed(Routes.vendorHome);
}
else{

 
}
  }



}