

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:propertyfinder/user/app/modules/home/controller/home_controller.dart';

import 'package:propertyfinder/user/app/modules/home/view/subview/dashboard_view.dart';
final iconList = <IconData>[
  FeatherIcons.home,
  //Icons.home,
   FeatherIcons.messageCircle,
   // Icons.messenger,
    Icons.money_off,
    Icons.person,
  ];

class HomeView extends GetView<HomeController> {
   HomeView({Key? key}) : super(key: key);
//int _selectedCase = 1; 
  @override
  Widget build(BuildContext context) {

switch (controller.selectedCase.value) {
  case 0:
controller.selectedWidget.value=controller.bodyList[0];
//DashBoardView();
    break;
    case 1:
  controller.  selectedWidget.value= controller.bodyList[1];
  //controller.  selectedWidget[1];
  //Message();
    case 2:controller.bodyList[2];
   // Premium();

    case 3:
   controller.  selectedWidget.value= controller.bodyList[3];
   
   //ProfileView();

  default:controller.  selectedWidget.value=DashBoardView();
}
    
    return
Scaffold(
  body: Obx(() => controller.bodyList[controller.selectedCase.value]
  //controller.selectedWidget.value
  ),

  //  floatingActionButton: Align(alignment: Alignment.bottomCenter,
  //     child: Padding(
  //       padding: const EdgeInsets.only(top:8.0,left: 24),
  //       child: FloatingActionButton(onPressed: (){
        
  //       },
  //       child: Icon(Icons.add,color: Colors.red,),backgroundColor: Colors.white,
  //       ),
  //     ),
  //   ),
    
    bottomNavigationBar: AnimatedBottomNavigationBar.builder(
      itemCount: iconList.length,
    tabBuilder: (int index,bool isActive){
      print(isActive);
      controller.active.value=
      //true;
      isActive;
        return Obx(() => Icon(
          iconList[index],
          size: 24,
          color: controller.active.value==true?Colors.red:Colors.black
          // isActive ? Colors.red : Colors.black,
        ));
        
    },
    activeIndex: controller.selectedCase.value,
    //_bottomNavIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      onTap: (index){
//print(index);
    //   Get.to(Message());
        controller.selectedCase.value=index;
      },
    ),
);

  }
  }