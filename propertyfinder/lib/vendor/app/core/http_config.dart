import 'dart:io';

import 'package:get_storage/get_storage.dart';

class HttpConfig {
 static bool isStagging=true;
 static String apiUrl =
 
 isStagging?'http://172.16.2.212:3000/v1/users':'';
 
  //isStagging?'http://192.168.1.86:3000/v1/users':'';


 static String register = '$apiUrl/register';
 static String login = '$apiUrl/login';
 static String getProfile = '$apiUrl/getUser';
  static String getRecent = '$apiUrl/getRecentProperty';
   static String getSuggested = '$apiUrl/getSuggestedProperty';
   static String addProperty = '$apiUrl/addProperty';

   static String propertyDetail = '$apiUrl/propertyDetail';
     static String changePassword = '$apiUrl/changePassword';
          static String updateProfile = '$apiUrl/updateAccountDetail';
          static String search = '$apiUrl/search';
   static String getAddedProperty = '$apiUrl/getAddedProperty';
   static String bookNow = '$apiUrl/bookHostel';
      static String getBookingStatus = '$apiUrl/getStatus';
  // static String getProfile = '$apiUrl/propertyDetail';


}


class Header {
  static Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json;charset=utf-8',
  };
}
class AuthHeader {
  static Map<String, String> getHeader() {
    GetStorage box = GetStorage();
   var authKey = box.read('accessToken');
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json;charset=utf-8',
      HttpHeaders.authorizationHeader: authKey
     // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NjYxY2ExZTc0ZmViZGYxNDIzMzgzYTQiLCJlbWFpbCI6ImNAZ21haWwuY29tIiwidXNlcm5hbWUiOiJjIiwiZnVsbE5hbWUiOiJhIiwicm9sZSI6IlVzZXIiLCJpYXQiOjE3MTgxOTk3NzQsImV4cCI6MTcxODI4NjE3NH0.RaqW7yf6pDVK-ohPGC0LDXQNQoFaUAWrhy727bnm8Q4 '
   //   $authKey',
    };

    return headers;
  }




}