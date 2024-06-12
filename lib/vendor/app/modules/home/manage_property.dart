import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:propertyfinder/user/app/data/hostel_model.dart';
import 'package:propertyfinder/vendor/app/data/models/manage_property/manage_property_model.dart';
import 'package:propertyfinder/vendor/app/modules/home/vendor_home_controller.dart';

import '../../../../user/app/routes/app_routes.dart';
List<HostelModel> manageProperty=[
HostelModel('Kotesor Boys Hostel', '', 'Kathnandu', 'Available', '10K', '1st floor', '2'),
HostelModel('AnamNagar Boys Hostel', '', 'Anamnagar', 'Available', '12K', '2nd floor', '3'),
HostelModel('Balkumari Girls Hostel Boys Hostel', '', 'Balkumari', 'Available', '10K', '1st floor', '2'),
HostelModel('Rock Boys Hostel', '', 'Kathnandu', 'Available', '11K', '1st floor', '2'),
];
class ManagePropertyVendor extends GetView<HomeControllerVendor> {
   ManagePropertyVendor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
body:SingleChildScrollView(
  
  child: Column(
    children: [
  SizedBox(height: 35,width: 10,),
      Align(
        
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            GestureDetector(
              onTap: (){
            
  
            Get.back();
  
  
              },
              child: Icon(Icons.arrow_back)),
  
  
                Padding(
                  padding: const EdgeInsets.only(left:18.0),
                  child: Text('Manage Property',style: TextStyle(fontWeight: FontWeight.bold),),
                ),
  
  
          ],
        )),
        
      Container(
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: 
        
          manageProperty.map((e){
          return GestureDetector(onTap: (){
           Get.toNamed(Routes.manageHome,arguments: e);
          },
            child: Column(children: [
            
            
            
            Image.network('https://res.klook.com/image/upload/fl_lossy.progressive,q_85/c_fill,w_1000/v1653630139/blog/ziuq1c3rgudpaklqfztb.jpg',
            
            height: 150,fit: BoxFit.cover,
            width: double.infinity,
            )
            ,Text(e.name!,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            Text('${e.floor} / ${e.noOfBeds} bed'),
            Text(e.price!,style: TextStyle(color: Colors.green),),
            Text(e.isAvailable!,style: TextStyle(color: Colors.green),),
            
            ],),
          );
        }).toList() 
         
        
        
        
        
        ,),
      ),
      SizedBox(height: 120,)
    ],
  ),
)

,
      
    );
  }
   
   
   }