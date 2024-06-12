import 'dart:convert';

//import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:propertyfinder/user/app/data/model/profile/get_profile.dart';
import 'package:propertyfinder/vendor/app/core/http_config.dart';

import '../model/login/login_response.dart';
import '../model/signup/signup_model.dart';
import 'package:http/http.dart' as http;
class AuthRepository extends GetxController {
static AuthRepository get instance => Get.find();

 
//register 
Future<SignupModel?> register({
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
    required String fieldOfProfession

  }) async {
    SignupModel ?sign;
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
          "fieldOfProfession":fieldOfProfession
        }),
      );
      print(response.body);
      var value=jsonDecode(response.body);
     if (response.body == "") {
        return SignupModel(
            statusCode: 0, message: 'Something went wrong', dataSignup:
      
             DataSignup(collegeSignup: value['data']['college'], locationCoordinatesSignup: 
             LocationCoordinatesSignup(coordinates: [value['data']['location_Coordinates']['coordinates']]),
  id: value['data']['_id'], username: value['data']['username'],
   dob: value['data']['dob'], phoneNo: value['data']['phoneNo'], 
   email: value['data']['email'], fullName: value['data']['fullName'], 
   fieldOfProfession: value['data']['fieldOfProfession'], 
   profileImage: value['data']['profileImage'], 
   role: value['data']['role'],
    verified: value['data']['verified'], v: value['data']['__v']
    
    ),
    
     success: value['success']);
     }
      if (response.statusCode == 201) {
sign=SignupModel(statusCode: value['statusCode'].toInt(), dataSignup:
 DataSignup(collegeSignup: CollegeSignup(longitude:value['data']['college']['longitude'] , 
 latitude: value['data']['college']['latitude']),
  locationCoordinatesSignup: LocationCoordinatesSignup(coordinates: [value['data']['location_Coordinates']['coordinates']]),
  id: value['data']['_id'].toString(), username: value['data']['username'].toString(),
   dob: value['data']['dob'].toString(), phoneNo: value['data']['phoneNo'].toString(), 
   email: value['data']['email'].toString(), fullName: value['data']['fullName'].toString(), 
   fieldOfProfession: value['data']['fieldOfProfession'].toString(), 
   profileImage: value['data']['profileImage'].toString(), 
   role: value['data']['role'].toString(),
    verified: value['data']['verified'] as bool, v: value['data']['__v'].toInt()), 
    message: value['message'],
 success: value['success'] as bool);
 return sign;
       // return SignupModel.fromJson(response.body);

      }
  else {
        return SignupModel(statusCode:0, dataSignup:
 DataSignup(collegeSignup: CollegeSignup(longitude:value['data']['college']['longitude'].toString(), 
 latitude: value['data']['college']['latitude'].toString()),
  locationCoordinatesSignup: LocationCoordinatesSignup(coordinates: [value['data']['location_Coordinates']['coordinates']]),
  id: value['data']['_id'].toString(), username: value['data']['username'].toString(),
   dob: value['data']['dob'].toString(), phoneNo: value['data']['phoneNo'].toString(), 
   email: value['data']['email'].toString(), fullName: value['data']['fullName'].toString(), 
   fieldOfProfession: value['data']['fieldOfProfession'].toString(), 
   profileImage: value['data']['profileImage'].toString(), 
   role: value['data']['role'].toString(),
    verified: value['data']['verified'] as bool, v: value['data']['__v'].toInt()), 
    message: value['message'],
 success: value['success'] as bool);
      }
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
value['data']['userName'].toString(),

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
      //print('reg');
      final response = await http.get(
        Uri.parse(HttpConfig.getProfile),
        headers:AuthHeader.getHeader() ,
        // body: json.encode(
        //   {
        //   "email": email,
        //   "password": password,
        
        // }
        // ),
      );
        var value=await jsonDecode(response.body);
  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON.
    return GetProfile.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response, throw an exception.
    throw Exception('Failed to load profile');
  }
// log=GetProfile(statusCode: value['statusCode'], data:
//  Data(college: value['statusCode'], locationCoordinates: value['statusCode'],
//   id: value['statusCode'], username: value['statusCode'], dob: value['statusCode'], 
//   phoneNo: value['statusCode'], email: value['statusCode'], fullName: value['statusCode'], 
//   fieldOfProfession: value['statusCode'], profileImage: value['statusCode'], role: value['statusCode'],
//    verified: value['statusCode'] , v:  value['statusCode']), message:  value['statusCode'], 
//    success:  value['statusCode']);

//value['statusCode']

      // print(' 111  ${response.body}');
    
      // print('ss ${l}');
      // l=log;
      // return l;

    } 
    catch (ex) {
    }
  }


}