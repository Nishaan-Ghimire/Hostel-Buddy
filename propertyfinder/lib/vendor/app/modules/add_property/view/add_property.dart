

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:propertyfinder/vendor/app/modules/add_property/controller/add_property_controller.dart';
import 'package:propertyfinder/vendor/app/modules/add_property/view/widget/flat.dart';
import 'package:propertyfinder/vendor/app/modules/add_property/view/widget/hostel.dart';
import 'package:propertyfinder/vendor/app/modules/add_property/view/widget/hotel.dart';
import 'package:propertyfinder/vendor/app/modules/add_property/view/widget/room.dart';



class AddPropertyView extends GetView<PropertyController> {
  const AddPropertyView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PropertyController());
    return Scaffold(appBar: AppBar(title:   Text('Add Hostel',style: TextStyle(height: 18,fontWeight: FontWeight.bold),),),
      body: SingleChildScrollView(
        child: Column(
          //shrinkWrap: true,
          children: [
        //  Align(alignment: Alignment.topLeft,child: Padding(
        //    padding: const EdgeInsets.only(left:17.0,top: 25),
        //    child: IconButton(onPressed: (){
        //   Get.back();
        //   }, icon: Icon(Icons.arrow_back)),
        //  ),),
        // Text('Add Hostel',style: TextStyle(height: 18,fontWeight: FontWeight.bold),),
        Container(
        height:Get.height,
          child: AddHostel(),
        ),
        
          //   Text('Please choose your property type '),
          //   Padding(
          //     padding: const EdgeInsets.all(30.0),
          //     child: Row(children: [
          //    Obx(() =>    DropdownButton(
          //         hint: Text(controller.propertyType.value),
          //         items: [
          //     DropdownMenuItem<String>(
          //             child: Text('Hostel'),
          //             value: 'Hostel',
          //           ),
          //           DropdownMenuItem<String>(
          //             child: Text('single room'),
          //             value: 'Single room',
          //           ),
          //           DropdownMenuItem<String>(
          //             child: Text('Flat'),
          //             value: 'flat',
          //           ),
          //           DropdownMenuItem<String>(
          //             child: Text('Hotel'),
          //             value: ' Hotel',
          //           )
          //       ]
                
          //       , onChanged: (v){
          //         controller.propertyType.value=v.toString();
          //   print(v);
          //       }))
          //     ],),
          //   ),
        
          // Obx(() =>   Visibility(
          //     visible: controller.propertyType.value!="select",
        
          //     child:
        
          //     Container(
          //       height: 395,
          //       child: 
          //       controller.propertyType.value=="Hostel"?
          //       AddHostel():controller.propertyType.value=="Single room"?AddRoom():
          //       controller.propertyType.value=="flat"?AddFlat():AddHotel()
                
          //       ) )),
          //      Text('data'),
         SizedBox(height: 40,)
          ]
          ,
        ),
      ),
    );
  }
}
