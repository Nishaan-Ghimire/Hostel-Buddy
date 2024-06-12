
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:propertyfinder/user/app/data/model/profile/get_profile.dart';
import 'package:propertyfinder/user/app/data/model/suggested/suggested_model.dart';
import 'package:propertyfinder/user/app/data/repo/auth_repo.dart';
import 'package:propertyfinder/user/app/data/repo/hostel_repo.dart';
import 'package:propertyfinder/user/app/modules/home/view/subview/buy_premium_page.dart';
import 'package:propertyfinder/user/app/modules/home/view/subview/dashboard_view.dart';
import 'package:propertyfinder/user/app/modules/home/view/subview/message_view.dart';
import 'package:propertyfinder/user/app/modules/home/view/subview/profileview.dart';

class HomeController extends GetxController {
var selectedCase = 0.obs; 
var active=false.obs;
@override
  onInit(){
getRecent();
getSuggested();
getProfile();

}
var recentData=<SuggestedModel?>[].obs;
var suggestedData=<SuggestedModel?>[].obs;
//recent
Future<List<SuggestedModel>?>  getRecent()async{
var recent= await HostelRepo.instance.getRecent();
recentData.value=recent!;
//print('resent data ........${recentData![0]!.imageUrl}.................................................');

 }
 //suggested
Future<List<SuggestedModel>?>  getSuggested()async{
var recentData= await HostelRepo.instance.getRecent();
suggestedData.value=recentData!;
//print('resent data ........${recentData![0]!.imageUrl}.................................................');

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

 
// Future<SuggestedModel>  getSuggested()async{
// var suggestedData= HostelRepo.instance.getSuggested();


//  }

   Rx<Widget> selectedWidget=
   DashBoardView().obs;
final bodyList =[
  DashBoardView(),
  Message(),
  Premium(),
  ProfileView(),

].obs;

List cities=[
  "Kathmandu",
  "Bhaktapur",
  "lalitpur",
  "Chitwan",
  "Lumbini",
  "janakpur",
  "Nepaljung",
  "birjung",
  "biratnagar",
  "Dhangadhi",
  "Mahendranagar",
  "Gorahi"
].obs;
}