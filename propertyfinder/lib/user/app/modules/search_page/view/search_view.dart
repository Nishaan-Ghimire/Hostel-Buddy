import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:propertyfinder/user/app/modules/search_page/view/widget/search_widget.dart';

import '../../home/controller/home_controller.dart';


class SearchView extends GetView<HomeController>{
  @override
  // TODO: implement controller
  HomeController get controller => Get.find();
  
  @override
  Widget build(BuildContext context) {
    controller.search(

    );
    // TODO: implement build
    return Scaffold(appBar: AppBar(),
      body:
    Obx(()=>
      controller.searchedList.isEmpty?Center(child: CircularProgressIndicator(),):
      Column(
        children: [

              Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      Text('Location'),  Icon(Icons.arrow_drop_down,size: 30,),
      Text('Filter'),
Icon(FeatherIcons.filter),
Text('Property type'),
Icon(Icons.arrow_drop_down,size: 30,),
    ],),
          Expanded(
            child: ListView.builder(
              itemCount: controller.searchedList.length,
              itemBuilder: (
              
              
              context,index){
            return SearchWidget(name: controller.searchedList[index]?.name,
            city: controller.searchedList[index]?.city,
            facilities:controller.searchedList[index]?.facilities ,
            rent: controller.searchedList[index]?.costPerMonth,
            photo: controller.searchedList[index]?.photo,
            );
                 }),
          ),
        ],
      )
    )
 
     
      
      
//        ListView(children: [
//     Align(alignment: Alignment.topLeft,
//       child: IconButton(onPressed: (){
//       Get.back();
//       }, icon: Icon(Icons.arrow_back_ios)),
//     ),
//     Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//       Text('Location'),  Icon(Icons.arrow_drop_down,size: 30,),
//       Text('Filter'),
// Icon(FeatherIcons.filter),
// Text('Property type'),
// Icon(Icons.arrow_drop_down,size: 30,),
//     ],),


//     Container(height:
//     //700,
    
//     Get.height,
    
//     //400,
//       child: ListView.builder(
//         itemCount: 10,
//         itemBuilder: (context,index){
//     return  InkWell(
//         onTap: (){
    
//         },
//         child: SearchWidget());
    
//       }),
//     )
   
    
    
//       ],),
    );
  }
}