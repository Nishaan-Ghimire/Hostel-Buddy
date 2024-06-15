import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:latlong2/latlong.dart';
import 'package:open_route_service/open_route_service.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:propertyfinder/line_chart.dart';
import 'package:propertyfinder/map.dart';
import 'package:propertyfinder/pi_chart.dart';
import 'package:propertyfinder/user/app/data/hostel_model.dart';
import 'package:propertyfinder/vendor/app/modules/add_property/view/add_property.dart';
//import 'package:propertyfinder/user/app/modules/home/view/subview/profileview.dart';
import 'package:propertyfinder/user/app/modules/home/view/widget/hostel_card.dart';
import 'package:propertyfinder/vendor/app/modules/home/manage_property.dart';
import 'package:propertyfinder/vendor/app/modules/home/message.dart';
import 'package:propertyfinder/vendor/app/modules/home/profile/profile_view.dart';

import 'package:propertyfinder/vendor/app/modules/notification/view/notification_view.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

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
 final MapTileLayerController _controller = MapTileLayerController();
     Position? _currentPosition;
  final MapController _mapController = MapController();
  final origin = LatLng(48.8566, 2.3522); // Example coordinates (Paris)
final destination = LatLng(51.505, -0.09);
//int _selectedCase = 1; 
 void _getCurrentLocation() async {
    _currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    //setState(() {});
  }
  OpenRouteService openrouteservice = OpenRouteService(apiKey: '5b3ce3597851110001cf62481c991d3035e94b378361d5eee163965e');
 
 //final directions=openrouteservice.directionsRouteCoordsGet(startCoordinate: , endCoordinate: endCoordinate)
  @override
  Widget build(BuildContext context) {
controller.getAddedProperty();
 controller.   getProfile();


    openrouteservice.directionsRouteCoordsGet(
      startCoordinate: ORSCoordinate(latitude:  27.7172, longitude: 85.3240
), endCoordinate: ORSCoordinate(latitude: 27.6688, longitude: 85.3247)
      ,
      profileOverride: ORSProfile.drivingCar
      );
return Scaffold(
// drawer:  Drawer(
//         child:Icon(Icons.menu,color: Colors.black,)
    
      
//       ),


  floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
  floatingActionButton: Container(
    //color: Colors.red,
   // height: 200,
    child: FloatingActionButton(
      onPressed: (){

      Get.to(AddPropertyView());
    },
    
    child: Icon(Icons.add),),
  ),

 

  bottomNavigationBar: 
  Container(
    

    width: double.infinity,
  color: Colors.white.withOpacity(0.2),height: 80,
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

Get.to(ProfileViewVendor());

      },
      child: Icon(Icons.person,size: 33,color: Colors.green,)),

  ],),
  
  ),
//  Row(children: [Icon(Icons.messenger_rounded),],),
body:



//MapScreen()
// FlutterMap(options: MapOptions(
//    center: LatLng(27.6930, 85.32435) ,   zoom: 13.0,
// )


// , children: [

//   TileLayer(
//     urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//               subdomains: ['a', 'b', 'c'],
//   ),


// PolylineLayer(
//   polylineCulling: true,
  
//   polylines: [
//   Polyline(isDotted: true,
//                   points: [
//                     LatLng(27.7172, 85.3240), // Example origin coordinates
//                     LatLng(27.6667, 85.3333), // Example destination coordinates
//                   ],
//                   color: Colors.blue,
//                   strokeWidth: 2.0,
//                 ),

// ])   // Example center coordinates
        
// ])



// Stack(
//   children: [
//     SfMaps(
//       layers: [
//                   MapTileLayer(
//                     urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//                     controller: _controller,
//                   ),
    
    
    
    
//       ],
    
      
//     ),
    ///////
    ///
//   Positioned(
//             bottom: 10,
//             left: 10,
//             right: 10,
//             child: OpenStreetMapSearchAndPick(
//               buttonTextStyle: const TextStyle(fontSize: 18, fontStyle: FontStyle.normal),
//               buttonColor: Colors.blue,
//               buttonText: 'Set Current Location',
//               onPicked: (pickedData) {
//                 print(pickedData.latLong.latitude);
//                 print(pickedData.latLong.longitude);
//                 print(pickedData.address);
//                 print(pickedData.addressName);
//                 // Optionally, you can move the map controller to the picked location
//                 // _controller.tileLayers = [
//                 //   MapTileLayer(
//                 //     urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//                 //     initialZoomLevel: 12,
//                 //     initialFocalLatLng: pickedData.latLong,
//                 //   ),
//                 // ];
//                 _controller.notifyListeners();
//               },
//             ),
// )
//   ],
// )

// OpenStreetMapSearchAndPick(
//           buttonTextStyle:
//               const TextStyle(fontSize: 18, fontStyle: FontStyle.normal),
//           buttonColor: Colors.blue,
//           buttonText: 'Set Current Location',
//           onPicked: (pickedData) {
//             print(pickedData.latLong.latitude);
//             print(pickedData.latLong.longitude);
//             print(pickedData.address);
//             print(pickedData.addressName);
//           },
//         )
// _currentPosition == null
//             ? Center(child: CircularProgressIndicator())
//             : FlutterMap(
//                 mapController: _mapController,
//                 options: MapOptions(
//                   initialCenter: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
                  
//                   //LatLng (_currentPosition!.latitude, _currentPosition!.longitude),
//                   maxZoom: 13.0,
//                 ),
//                 children: [
//                   // TileLayerOptions(
//                   //   urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//                   //   subdomains: ['a', 'b', 'c'],
//                   // ),
//                   // MarkerLayerOptions(
//                   //   markers: [
//                   //     Marker(
//                   //       width: 80.0,
//                   //       height: 80.0,
//                   //       point: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
//                   //       builder: (ctx) => Container(
//                   //         child: Icon(
//                   //           Icons.location_on,
//                   //           color: Colors.red,
//                   //           size: 40.0,
//                   //         ),
//                   //       ), child: Container(),
//                   //     ),
//                   //   ],
//                   // ),
//                 ],
//               ),

//////////////////////////////////////////////////////////////////////////////////////////////////////
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
    child: Text('   visits  / month',style: TextStyle(fontWeight: FontWeight.bold),)
    ),
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
    
  Obx(()=>controller.added.isEmpty?Center(child: CircularProgressIndicator(),):  ListView.builder(
      scrollDirection: Axis.horizontal,
    
      itemCount:controller.added.length,
      
      // hostels.length,
      itemBuilder: (context,i,){
   return GestureDetector(
    onTap: (){
      var hostelmodel=     HostelModel(   controller.added[i]?.name,    controller.added[i]?.photo,
           controller.added[i]?.city,    controller.added[i]?.isAvailable.toString() ,
               controller.added[i]?.costPerMonth,    controller.added[i]?.roomNo, 
               '');
   // Get.put(ManageRoomController());
   Get.toNamed(Routes.manageHome,arguments: 
 hostelmodel
 //  controller.added[i]
   //hostels[i]
   );

   print(hostels);
   },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: HostelCard(hostels: 
       HostelModel(   controller.added[i]?.name,    controller.added[i]?.photo,
           controller.added[i]?.city,    controller.added[i]?.isAvailable.toString() ,
               controller.added[i]?.costPerMonth,    controller.added[i]?.roomNo, 
               '')
      //hostels[i]
      ),
    ),
   );
    }))

    
   
    )

   
    ],),
   ),
 ),
);
  }
  }