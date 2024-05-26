

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:propertyfinder/user/app/modules/add_property/controller/add_property_controller.dart';
import 'package:propertyfinder/user/app/modules/add_property/view/widget/flat.dart';
import 'package:propertyfinder/user/app/modules/add_property/view/widget/hostel.dart';
import 'package:propertyfinder/user/app/modules/add_property/view/widget/hotel.dart';
import 'package:propertyfinder/user/app/modules/add_property/view/widget/room.dart';



class AddPropertyView extends GetView<PropertyController> {
  const AddPropertyView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PropertyController());
    return Scaffold(
      body: Column(
        children: [
 Align(alignment: Alignment.topLeft,child: Padding(
   padding: const EdgeInsets.only(left:17.0,top: 25),
   child: IconButton(onPressed: (){
        Get.back();
        }, icon: Icon(Icons.arrow_back_ios)),
 ),),
      Text('Add your Property',style: TextStyle(height: 18,fontWeight: FontWeight.bold),),
          Text('Please choose your property type '),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(children: [
           Obx(() =>    DropdownButton(
                hint: Text(controller.propertyType.value),
                items: [
            DropdownMenuItem<String>(
                    child: Text('Hostel'),
                    value: 'Hostel',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('single room'),
                    value: 'Single room',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('Flat'),
                    value: 'flat',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('Hotel'),
                    value: ' Hotel',
                  )
              ]
              
              , onChanged: (v){
                controller.propertyType.value=v.toString();
          print(v);
              }))
            ],),
          ),

        Obx(() =>   Visibility(
            visible: controller.propertyType.value!="select",

            child:

            Container(
              height: 395,
              child: 
              controller.propertyType.value=="Hostel"?
              AddHostel():controller.propertyType.value=="Single room"?AddRoom():
              controller.propertyType.value=="flat"?AddFlat():AddHotel()
              
              ) ))
       
        ]
        ,
      ),
    );
  }
}
