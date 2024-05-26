import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:propertyfinder/user/app/modules/search_page/view/widget/search_widget.dart';

import '../../home/controller/home_controller.dart';


class SearchView extends GetView<SearchController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(children: [
    Align(alignment: Alignment.topLeft,
      child: IconButton(onPressed: (){
      Get.back();
      }, icon: Icon(Icons.arrow_back_ios)),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      Text('Location'),  Icon(Icons.arrow_drop_down,size: 30,),
      Text('Filter'),
Icon(FeatherIcons.filter),
Text('Property type'),
Icon(Icons.arrow_drop_down,size: 30,),
    ],),


    Container(height:
    //700,
    
    Get.height,
    
    //400,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index){
    return  InkWell(
        onTap: (){
    
        },
        child: SearchWidget());
    
      }),
    )
   
    
    
      ],),
    );
  }
}