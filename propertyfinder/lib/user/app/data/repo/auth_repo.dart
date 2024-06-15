import 'dart:convert';

//import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:propertyfinder/user/app/data/model/change_password/change_password_model.dart';
import 'package:propertyfinder/user/app/data/model/edit_profile/edit_profile_model.dart';
import 'package:propertyfinder/user/app/data/model/profile/get_profile.dart';
import 'package:propertyfinder/user/app/modules/home/controller/home_controller.dart';
import 'package:propertyfinder/user/app/modules/home/view/subview/dashboard_view.dart';
import 'package:propertyfinder/user/app/modules/home/view/subview/profileview.dart';
import 'package:propertyfinder/vendor/app/core/http_config.dart';

import '../model/login/login_response.dart';
import '../model/signup/signup_model.dart';
import 'package:http/http.dart' as http;
class AuthRepository extends GetxController {
static AuthRepository get instance => Get.find();

 
//register 
Future<SignUpResponse?> register({
    required String fullName,
    required String dob,
    required String userName,
    required String email,
    required String phoneNo,
    required String password,
    required String college,
    required String company,
    required String jobstatus,
        required String collegelongitude,

    required String collegelatitude,
    required String fieldOfProfession,
    String hostelName="",
    String pan_card=""
    ,String kyc_doc="",
   required String role

  }) async {

    print('$fullName $dob $userName $email$phoneNo$password $college $company $jobstatus $collegelongitude $collegelatitude $fieldOfProfession $hostelName $pan_card $kyc_doc $role');
    SignUpResponse ?sign;
    try {
      print('reg');
      final response = await http.post(
        Uri.parse(HttpConfig.register),
        headers: Header.headers,
        body: json.encode({
          "fullName": fullName,
          "dob": dob,
          "username": userName,
          "email": email,
          "phoneNo": phoneNo,
          "password": password,
          "college": college,
          "company": company,
          "jobstatus": jobstatus,
"collegelongitude":collegelongitude,
"collegelatitude":collegelatitude,
          "fieldOfProfession":fieldOfProfession,
          "hostelName":"",
          "pan_card":"",
          "kyc_doc":"",
          "role":role
        }),
      );
      print(response.body);
      

if (response.statusCode==201) {
  final parsed = jsonDecode(response.body);
final signUpResponse = SignUpResponse.fromJson(parsed);
return signUpResponse;
}


  //    if (response.body == "") {
  //       return SignupModel(
  //           statusCode: 0, message: 'Something went wrong', dataSignup:
      
  //            DataSignup(collegeSignup: value['data']['college'], locationCoordinatesSignup: 
  //            LocationCoordinatesSignup(coordinates: [value['data']['location_Coordinates']['coordinates']]),
  // id: value['data']['_id'], username: value['data']['username'],
  //  dob: value['data']['dob'], phoneNo: value['data']['phoneNo'], 
  //  email: value['data']['email'], fullName: value['data']['fullName'], 
  //  fieldOfProfession: value['data']['fieldOfProfession'], 
  //  profileImage: value['data']['profileImage'], 
  //  role: value['data']['role'],
  //   verified: value['data']['verified'], v: value['data']['__v']
    
  //   ),
    
  //    success: value['success']);
  //    }
//       if (response.statusCode == 201) {
// sign=SignupModel(statusCode: value['statusCode'].toInt(), dataSignup:
//  DataSignup(collegeSignup: CollegeSignup(longitude:value['data']['college']['longitude'] , 
//  latitude: value['data']['college']['latitude']),
//   locationCoordinatesSignup: LocationCoordinatesSignup(coordinates: [value['data']['location_Coordinates']['coordinates']]),
//   id: value['data']['_id'].toString(), username: value['data']['username'].toString(),
//    dob: value['data']['dob'].toString(), phoneNo: value['data']['phoneNo'].toString(), 
//    email: value['data']['email'].toString(), fullName: value['data']['fullName'].toString(), 
//    fieldOfProfession: value['data']['fieldOfProfession'].toString(), 
//    profileImage: value['data']['profileImage'].toString(), 
//    role: value['data']['role'].toString(),
//     verified: value['data']['verified'] as bool, v: value['data']['__v'].toInt()), 
//     message: value['message'],
//  success: value['success'] as bool);
//  return sign;
//        // return SignupModel.fromJson(response.body);

//       }
//   else {
//         return SignupModel(statusCode:0, dataSignup:
//  DataSignup(collegeSignup: CollegeSignup(longitude:value['data']['college']['longitude'].toString(), 
//  latitude: value['data']['college']['latitude'].toString()),
//   locationCoordinatesSignup: LocationCoordinatesSignup(coordinates: [value['data']['location_Coordinates']['coordinates']]),
//   id: value['data']['_id'].toString(), username: value['data']['username'].toString(),
//    dob: value['data']['dob'].toString(), phoneNo: value['data']['phoneNo'].toString(), 
//    email: value['data']['email'].toString(), fullName: value['data']['fullName'].toString(), 
//    fieldOfProfession: value['data']['fieldOfProfession'].toString(), 
//    profileImage: value['data']['profileImage'].toString(), 
//    role: value['data']['role'].toString(),
//     verified: value['data']['verified'] as bool, v: value['data']['__v'].toInt()), 
//     message: value['message'],
//  success: value['success'] as bool);
//       }
    } 
    catch (ex) {
//SignupModel          statusCode: 0, message: 'Something went wrong', data: '');
    }
  }

//login


Future<LoginModel?> login({required String email,required String password}) async {
    LoginModel ?log;
    var l;
    try {
      //print('reg');
      final response = await http.post(
        Uri.parse(HttpConfig.login),
        headers: Header.headers,
        body: json.encode(
          {
          "email": email,
          "password": password,
        
        }
        ),
      );
        var value=await jsonDecode(response.body);
   
log=LoginModel(
value['statusCode'].toInt(),
value['data']['accessToken'].toString(),
value['data']['refreshToken'].toString(),
value['data']['user']['username'].toString(),
value['data']['user']['role'].toString(),
);




      print(response.body);
    
      print('ss ${l}');
      l=log;
      return l;

    } 
    catch (ex) {
    }
  }
//profile
Future<GetProfile?> getProfile() async {
    GetProfile ?log;
    var l;
    try {
  
      final response = await http.get(
        Uri.parse(HttpConfig.getProfile),
        headers:AuthHeader.getHeader() ,
 
      );
        var value=await jsonDecode(response.body);
  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON.
    return GetProfile.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response, throw an exception.
    throw Exception('Failed to load profile');
  }


    } 
    catch (ex) {
    }
  }
//cahnge password
Future<ChangePassword?> changePassword(var oldPassword,var newPassword ) async {
    ChangePassword ?log;
    var l;
    try {
  
      final response = await http.patch(
        Uri.parse(HttpConfig.changePassword),
        headers:AuthHeader.getHeader() ,
        body: jsonEncode({
          "oldPassword":oldPassword,
"newPassword":newPassword
        })
 
      );
        var value=await jsonDecode(response.body);
  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON.
    return ChangePassword.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response, throw an exception.
    throw Exception('Failed to load profile');
  }


    } 
    catch (ex) {
    }
  }
  //edit profile
  Future<void> editProfile(var fullName,var phone,var dob ) async {
    EditProfileModel ?log;
    var l;
    try {
  
      final response = await http.patch(
        Uri.parse(HttpConfig.updateProfile),
        headers:AuthHeader.getHeader() ,
        body: jsonEncode({
          "fullName":fullName,
"phoneNo":phone,
"dob":dob
        })
 
      );
        var value=await jsonDecode(response.body);
      print('EditPr$value');
      print(value['message']);

      if (value['message'].toString()=="User details updated successfully") {
              Get.snackbar('Profile Updated', 'Profile Updated successfully.',
         colorText: Colors.white,backgroundColor: Colors.blue);
     
     HomeController h=Get.find();
    // Get.to(ProfileView());
//h.selectedWidget.value=h.bodyList[0];
     //    Get.to(DashBoardView());
      }
      else{
             Get.snackbar('Profile Update Error', 'Something went wrong.',
         colorText: Colors.white,backgroundColor: Colors.blue);
         Get.to(DashBoardView());
      }
//   if (response.statusCode == 200) {
// print(value['message']);
//   if ( value['message']=="User details updated successfully") {
//       Get.snackbar('Profile Updated', 'Profile Updated successfully.',
//          colorText: Colors.white,backgroundColor: Colors.blue);

//   Get.to(DashBoardView());

//   }else{
//      Get.snackbar('Profile Update Error', 'Something went wrong.',
//          colorText: Colors.white,backgroundColor: Colors.blue);
//          Get.to(DashBoardView());
//   }

    // If the server returns a 200 OK response, parse the JSON.
   // return EditProfileModel.fromJson(json.decode(response.body));
  // } else {
  //   // If the server did not return a 200 OK response, throw an exception.
  //   throw Exception('Failed to load profile');
  // }


    } 
    catch (ex) {
    }
  }

}