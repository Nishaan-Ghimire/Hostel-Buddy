import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propertyfinder/user/app/data/model/profile/get_profile.dart';
import 'package:propertyfinder/user/app/data/repo/auth_repo.dart';
import 'package:propertyfinder/vendor/app/data/models/manage_property/manage_property_model.dart';
import 'package:propertyfinder/vendor/app/data/repo/hostel_repo.dart';

class HomeControllerVendor extends GetxController {
var selectedCase = 0.obs; 
var active=false.obs;
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAddedProperty();
    getProfile();
  }
   //Rx<Widget> selectedWidget=
//    DashBoardView().obs;
// final bodyList =[
//   DashBoardView(),
//   Message(),
//   Premium(),
//   ProfileView(),

// ].obs;

// List cities=[
//   "Kathmandu",
//   "Bhaktapur",
//   "lalitpur",
//   "Chitwan",
//   "Lumbini",
//   "janakpur",
//   "Nepaljung",
//   "birjung",
//   "biratnagar",
//   "Dhangadhi",
//   "Mahendranagar",
//   "Gorahi"
// ].obs;
 var added=<ManageAddedRoom?>[].obs;

getAddedProperty()async{
print('get added called');
Get.put(HostelRepoVendor());
 added.value =await HostelRepoVendor.instance.getAddedProperty();

}


 var profile = GetProfile(
    statusCode: 0,
    data: CollegeData(
      college: College(longitude: '', latitude: ''),
      locationCoordinates: LocationCoordinates(coordinates: []),
      id: '',
      username: '',
      dob: '',
      phoneNo: '',
      email: '',
      fullName: '',
      fieldOfProfession: '',
      profileImage: '',
      role: '',
      verified: false,
      v: 0,
    ),
    message: '',
    success: false,
  ).obs;
getProfile()async{

     var d= await   AuthRepository.instance.getProfile();
    profile.value=d!;
     print('profile ayo hai $d');
}
}