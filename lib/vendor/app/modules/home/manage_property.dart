import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:propertyfinder/vendor/app/data/models/manage_property_model.dart';
import 'package:propertyfinder/vendor/app/modules/home/vendor_home_controller.dart';
List<ManagePropertyModel> manageProperty=[
ManagePropertyModel(
'Koteswor Boys Hostel',
'Kathmandu',
'Rs 10k',
'Available',
'1 st floor',
'2'

),
ManagePropertyModel(
'Saddobato Boys Hostel',
'Kathmandu',
'Rs 10k',
'Available',
'1 st floor'
,'2'
),
ManagePropertyModel(
'Thimi Girls Hostel',
'Bhaktapur',
'Rs 10k',
'Available',
'2 nd floor','2'
),

];
class ManagePropertyVendor extends GetView<HomeControllerVendor> {
   ManagePropertyVendor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
body:Column(
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
      
    ListView(
      shrinkWrap: true,
      children: 
    
  manageProperty.map((e){
  return Container(
child: Column(children: [



Image.network('https://res.klook.com/image/upload/fl_lossy.progressive,q_85/c_fill,w_1000/v1653630139/blog/ziuq1c3rgudpaklqfztb.jpg',

height: 150,fit: BoxFit.cover,
width: double.infinity,
)
,Text(e.name,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
Text('${e.floor} / ${e.noofBed} bed'),
Text(e.rent,style: TextStyle(color: Colors.green),),
Text(e.isAvailable,style: TextStyle(color: Colors.green),),

],),

  );
}).toList() 
     
    
    
    
    
    ,),
  ],
)

,
      
    );
  }
   
   
   }