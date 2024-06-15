import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:propertyfinder/user/app/data/hostel_model.dart';
import 'package:propertyfinder/vendor/app/data/models/manage_property/manage_property_model.dart';
import 'package:propertyfinder/vendor/app/modules/home/vendor_home_controller.dart';
import 'package:propertyfinder/vendor/app/modules/managerooms/manage_rooms_controller.dart';
import 'package:propertyfinder/vendor/app/modules/managerooms/managerooms_view.dart';

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
    print(controller.added[0]?.name);
    // TODO: implement build
    return Scaffold(
body:SingleChildScrollView(
  
  child: Obx(()=>controller.added.isEmpty?Center(child: CircularProgressIndicator(),):
  Column(
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
        //height: 444,
        child: 
        Obx(()=>ListView.builder(shrinkWrap: true,
          itemCount: controller.added.length,
          itemBuilder: (context,index){
             var hostelmodel=     HostelModel(   controller.added[index]?.name, 
                controller.added[index]?.photo,
           controller.added[index]?.city,  
             controller.added[index]?.isAvailable.toString() ,
               controller.added[index]?.costPerMonth,    controller.added[index]?.roomNo, 
               '');
print('object${ controller.added.length}');
     return    GestureDetector(onTap: (){
      Get.toNamed(Routes.manageHome,arguments: hostelmodel);
     },
//             Get.put(ManageRoomController());
//             Get.to(ManageRoomView,arguments: hostelmodel);
//           // Get.toNamed(Routes.manageHome,arguments: e);
//           },
            child: Column(children: [
            
            
            
            Image.network(controller.added[index]!.photo,
            
            height: 150,fit: BoxFit.cover,
            width: double.infinity,
            )
            ,Text(controller.added[index]!.name,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            Text('${controller.added[index]!.roomNo} '),
            Text('Rs ${controller.added[index]!.costPerMonth}/month',style: TextStyle(color: Colors.green),),
        controller.added[index]!.isAvailable==true?  Text('Available',style: TextStyle(color: Colors.green),):Text('Not Available',style: TextStyle(color: Colors.red),),
            
            ],),
            );
        }))
        
//         ListView(
//           physics: NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           children: 
//         controller.added
//          // manageProperty
//           .map((e){

//  var hostelmodel=     HostelModel(   e?.name,    e?.photo,
//            e?.city,    e?.isAvailable.toString() ,
//                e?.costPerMonth,    e?.roomNo, 
//                '');

//           return GestureDetector(onTap: (){
//             Get.put(ManageRoomController());
//             Get.to(ManageRoomView,arguments: hostelmodel);
//           // Get.toNamed(Routes.manageHome,arguments: e);
//           },
//             child: Column(children: [
            
            
            
//             Image.network(e!.photo,
            
//             height: 150,fit: BoxFit.cover,
//             width: double.infinity,
//             )
//             ,Text(e!.name,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
//             Text('${e.roomNo} '),
//             Text('Rs ${e.costPerMonth}/month',style: TextStyle(color: Colors.green),),
//           e.isAvailable==true?  Text('Available',style: TextStyle(color: Colors.green),):Text('Not Available',style: TextStyle(color: Colors.red),),
            
//             ],),
//           );
//         }).toList() 
         
        
        
        
        
//         ,),
      ),
      SizedBox(height: 120,)
    ],
  ))
)

,
      
    );
  }
   
   
   }