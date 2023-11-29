import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:propertyfinder/app/modules/home/view/subview/buy_premium_page.dart';
import 'package:propertyfinder/app/modules/home/view/subview/dashboard_view.dart';
import 'package:propertyfinder/app/modules/home/view/subview/message_view.dart';
import 'package:propertyfinder/app/modules/home/view/subview/profileview.dart';

class HomeController extends GetxController {
var selectedCase = 0.obs; 
var active=false.obs;
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