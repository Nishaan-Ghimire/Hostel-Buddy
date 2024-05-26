import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:propertyfinder/line_chart.dart';
import 'package:propertyfinder/pi_chart.dart';
import 'package:propertyfinder/test.dart';
import 'package:propertyfinder/user/app/data/hostel_model.dart';
import 'package:propertyfinder/user/app/modules/home/view/subview/profileview.dart';
import 'package:propertyfinder/user/app/modules/home/view/widget/hostel_card.dart';
import 'package:propertyfinder/vendor/app/core/util/keys.dart';
import 'package:propertyfinder/vendor/app/modules/home/manage_property.dart';
import 'package:propertyfinder/vendor/app/modules/home/message.dart';
import 'package:propertyfinder/vendor/app/modules/managerooms/manage_rooms_controller.dart';
import 'package:propertyfinder/vendor/app/modules/managerooms/managerooms_view.dart';
import 'package:propertyfinder/vendor/app/modules/notification/view/notification_view.dart';

import '../../../../user/app/routes/app_routes.dart';
import 'vendor_home_controller.dart';
List<HostelModel> hostels=[

 HostelModel('Koteswor boys hostel',
   'https://5.imimg.com/data5/HU/OL/MY-32626917/3-bunk-bed-500x500.jpg',
    'Koteswor', 'Available', '10k','1 st floor','2 beds')
    
    ,
    HostelModel('Koteswor boys hostel',
   'https://5.imimg.com/data5/HU/OL/MY-32626917/3-bunk-bed-500x500.jpg',
    'Koteswor', 'Available', '10k','1 st floor','2 beds'
    
    ),
 HostelModel('Koteswor boys hostel',
   'https://5.imimg.com/data5/HU/OL/MY-32626917/3-bunk-bed-500x500.jpg',
    'Koteswor', 'Available', '10k','1 st floor','2 beds')
    
    

];
class HomeViewVendor extends GetView<HomeControllerVendor> {
   HomeViewVendor({Key? key}) : super(key: key);
//int _selectedCase = 1; 
  @override
  Widget build(BuildContext context) {
return Scaffold(
drawer:  Drawer(
        child:Icon(Icons.menu,color: Colors.black,)
    
        //  ListView(
        //   padding: EdgeInsets.zero,
        //   children: <Widget>[
        //     DrawerHeader(
        //       child: Text(
        //         'Menu',
        //         style: TextStyle(color: Colors.green, fontSize: 24),
        //       ),
        //       decoration: BoxDecoration(
        //         color: Colors.blue,
        //       ),
        //     ),
        //     ListTile(
        //       leading: Icon(Icons.home),
        //       title: Text('Home'),
        //       onTap: () {
        //         Navigator.pop(context);
        //       },
        //     ),
        //     ListTile(
        //       leading: Icon(Icons.settings),
        //       title: Text('Settings'),
        //       onTap: () {
        //         Navigator.pop(context);
        //       },
        //     ),
        //     ListTile(
        //       leading: Icon(Icons.contact_mail),
        //       title: Text('Contact'),
        //       onTap: () {
        //         Navigator.pop(context);
        //       },
        //     ),
        //   ],
        // ),
      ),


  floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
  floatingActionButton: Container(
    //color: Colors.red,
   // height: 200,
    child: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
  ),

 

  bottomNavigationBar: 
  Container(
    

    width: double.infinity,
  color: Colors.red.withOpacity(0.5),height: 80,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    
    children: [


     GestureDetector(
      onTap: (){

        Get.to(MessageView());
      },
      child: Icon(FeatherIcons.messageCircle,size: 33,color: Colors.green,)),
           GestureDetector(
            
            onTap: (){
Get.to(BookingRequestNotification());
            },
            child: Icon(Icons.notifications,color: Colors.green,size: 33,)),

    
     GestureDetector(
      onTap: (){

Get.to(ManagePropertyVendor());


      },
      child: Icon(FeatherIcons.shoppingBag,color: Colors.green,size: 33)),
 GestureDetector(
      onTap: (){

Get.to(ProfileView());

      },
      child: Icon(Icons.person,size: 33,color: Colors.green,)),

  ],),
  
  ),
//  Row(children: [Icon(Icons.messenger_rounded),],),
body:
 SingleChildScrollView(
   child: Container(
   
    child: Column(children: [
      SizedBox(height: 40,),
      Container(height: 150,
      
      width: 100
      ,child:
      PieChartSample3()
      // BarChartSample2()
      
      ,)
   ,
   Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(children: [
    Row(children: [
    Container(
      height: 15,width: 15,
      color: Colors.red,),Text(' Booked')
    
    ],),
    Row(children: [
    Container(
      height: 15,width: 15,
      color: Colors.yellow,),Text(' Visited but not booked')
    
    ],)
    
    ],),
   ),
   SizedBox(height: 40,),
   Align(
    
    alignment: Alignment.topLeft,
    child: Text('   visits  / month',style: TextStyle(fontWeight: FontWeight.bold),)),
   Container(
    height: 200,
    //width: 200,
   // width: Get.width/1.2,
    child: LineChartView(isShowingMainData: true,)),
      //Container(height: 150,child: BarChartSample2(),)
   //,
   SizedBox(height: 10,),
   Align(
    
    alignment: Alignment.centerLeft,
    child: Text('  Manage added rooms / beds',style: TextStyle(fontWeight: FontWeight.bold),)),
    Container(height: 300,
    child:
    
    ListView.builder(scrollDirection: Axis.horizontal,
    
      itemCount: hostels.length,
      itemBuilder: (context,i,){
   return GestureDetector(
    onTap: (){
   // Get.put(ManageRoomController());
   Get.toNamed(Routes.manageHome,arguments: hostels[i]);
   //Get.to(ManageRoomView(),arguments: hostels
   //arguments: 
   //[
   //ZConstKeys.managedetails:hostels
   //]
   
   
   //);
   print(hostels);
   },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: HostelCard(hostels: hostels[i]),
    ),
   );
    })
    //  hostels.map((e) => Text(data)
    // ).toList(),
   //   child: ListView(
   //     scrollDirection: Axis.horizontal,
   //     padding: EdgeInsets.all(4),
   
   //     children: [
   
   // Padding(
   //   padding: const EdgeInsets.all(8.0),
   //   child: HostelCard(hostels: HostelModel('Koteswor boys hostel',
   //    'https://5.imimg.com/data5/HU/OL/MY-32626917/3-bunk-bed-500x500.jpg',
   //     'Koteswor', 'Available', '10k','1 st floor','2 beds')
      
   //     ,),
   // ),
   
   // Padding(
   //   padding: const EdgeInsets.all(8.0),
   //   child: HostelCard(hostels: HostelModel('Koteswor boys hostel',
   //    'https://5.imimg.com/data5/HU/OL/MY-32626917/3-bunk-bed-500x500.jpg',
   //     'Koteswor', 'Available', '10k','1 st floor','2 beds')
   //     ),
   // ),
   // Padding(
   //   padding: const EdgeInsets.all(8.0),
   //   child: HostelCard(hostels:HostelModel('Koteswor boys hostel',
   //    'https://5.imimg.com/data5/HU/OL/MY-32626917/3-bunk-bed-500x500.jpg',
   //     'Koteswor', 'Available', '10k','1 st floor','2 beds'),
   //     ),
   // ),
   
   //   ],),
    )
   //,
   //Container(
   // height: 300,
    
   // child:BarChartSample2()
    
   //   BarChart(
   //   BarChartData(
   //     maxY: 200
   //     ,minY: 100,
   //   //  backgroundColor: Colors.red,
   //     barGroups: [
   // BarChartGroupData(x: 12,groupVertically: true),
   // BarChartGroupData(x: 12,groupVertically: true),
   
   
   //     ]
   //     // read about it in the BarChartData section
   //   ),
   
   
   //   swapAnimationDuration: Duration(milliseconds: 150), // Optional
   //   swapAnimationCurve: Curves.linear, // Optional
   // )
   
   // ,)
   
   
    ],),
   ),
 ),
);
  }
  }