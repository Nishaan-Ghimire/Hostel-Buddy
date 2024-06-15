
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:propertyfinder/user/app/data/model/hostel_datail/hostel_detail.dart';
import 'package:propertyfinder/user/app/modules/property_details/controller/property_controller.dart';
import 'package:propertyfinder/user/app/modules/property_details/view/widget/description_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
List<String> img=[
  'https://th.bing.com/th/id/R.caa94be83ec7ee9e2740a0ba2b1107c4?rik=KWs7OOSB2jR8xA&riu=http%3a%2f%2fwww.godsavethepoints.com%2fwp-content%2fuploads%2f2018%2f07%2fhostel.jpg&ehk=N73OpLFzxMXYjLB7JE7QYE2jfq6OVgXbne4hqmyV0yg%3d&risl=&pid=ImgRaw&r=0',
  'https://th.bing.com/th/id/OIP.tEicCQvnLrfsrspl1oqYrgHaE8?pid=ImgDet&rs=1',
  'https://th.bing.com/th/id/OIP.ltb2e-lU_WMYbfxO6JO9ZgHaFJ?pid=ImgDet&rs=1'
];
  final pagecontroller = PageController(viewportFraction: 1, keepPage: true,initialPage: 0);
Animation<double> ?animation;

class PropertyDetails extends GetView<PropertyController> {
   PropertyDetails({Key? key}) : super(key: key);
   
//int _selectedCase = 1; 


  @override
  Widget build(BuildContext context) {
  //  Get.put(PropertyController());
   controller.   getPropertyDetails(controller. hostelId.value,controller. roomNo.value) ;
    // List<String> items =  controller.finalDetails[0].facilities.split(',');
return Scaffold(
  
  bottomSheet:   Padding(
  padding: const EdgeInsets.all(18.0),
  child: Row(
         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(onPressed: (){
              
            },
            child: Icon(Icons.phone),
            ), SizedBox(width: 20,height: 10,), FloatingActionButton(onPressed: (){
              
            },child: Icon(FeatherIcons.messageCircle),backgroundColor: Colors.greenAccent,),
          ],
        ),
),
  // floatingActionButton: Row(
    
  //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //  //.end,
  //   children: [

    
  //   ],
  // ),

  body:   SafeArea(
    child:
    // controller.finalDetails.isEmpty?CircularProgressIndicator():
     Column(
    //  crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        Container(
         // color: Colors.red,
          height: 
          Get.height/1.1
          //840
          //650
          ,width: double.infinity,
        //color: Colors.grey,
          child: Container(
            child: ListView(children: [
 
                Positioned(
   //top:22,
   // 500,
    
  //bottom:  250,
     child: FutureBuilder(future: controller.getPropertyDetails(controller.hostelId.value, 
     controller.roomNo.value), builder: (context,snapshot){
     if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No pending bookings found'));
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount:1,
                
                // snapshot.data!.length,
                itemBuilder: (context, index) {
                  PropertDetail? booking = snapshot.data![index];
                  return
                  
                  
                     Container(
                     height:
                     900
                     //700
                     
                     ,width: Get.width,
                     //double.infinity,
                     decoration: BoxDecoration(
                     color: Colors.white,borderRadius: BorderRadius.circular(40)
                     
                     ),
                     child: Column(
                       
                       children: [
                        Container(height: 300,
            child: PageView.builder(
              // physics: const BouncingScrollPhysics(),
              controller: pagecontroller,
              onPageChanged: (i){
              
            },
              itemCount: img.length,
              itemBuilder: (context,index){
           // controller. getStatus(controller.finalDetails[0].id);
            //controller: controller;
            
            return pages(controller.finalDetails[0].photo?? img[index]);
            // return page[index];
              
            }),
          ),
                         SizedBox(height: 20,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                          Text('100'),
                           Icon(Icons.remove_red_eye),
                       ],),
                            Obx(()=>  
                          Text(
                              controller.finalDetails[0].name,
                            //   controller.propertDetail?.value?.name??
                            // ?? 
                             
                           //   'ABC Boys Hostel',
                     style: TextStyle(fontSize: 22,color: Colors.orange,fontWeight: FontWeight.bold),
                     ),
                     ),
                     Obx(()=> Text('${controller.finalDetails[0].city}')),
                              
                      // Obx(()=> Text('Rs ${controller.finalDetails[0].costPerMonth} / month',style: TextStyle(color: Colors.green),)),
                       SizedBox(height: 20,),
                                
                          
                       Wrap(
                         runSpacing: 5,
                                                 spacing: 5,
                         children: [
                           for(int i=0;i<controller.items.length;i++)
                           Obx(()=> descriptionBox(
                             controller.items[i]))
                       //  Text(controller.finalDetails[0].facilities),
                          //  descriptionBox('attached bathroom'),descriptionBox('water 24/7'),
                          //        descriptionBox('parking  '),descriptionBox('Wifi available ')
                          //        ,descriptionBox('smoking : no'),
                       ],),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                           SizedBox(height: 30,),
                           Padding(
                          padding:  EdgeInsets.only(right:Get.width/1.3,bottom: 10,),
                          child: Text('Descrption',
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                           )
                          
                       ,Flex(
                         direction: Axis.horizontal,
                         children: [ Expanded(
                           child: Obx(()=>
                              Text(
                               controller.finalDetails[0].description
                             ,overflow: TextOverflow.ellipsis,  //controller.finalDetails[0].description,
                                           maxLines: 7,  ),
                           ),
                         ),],
                       ),
                          Container(padding: EdgeInsets.all(22),
                            child: Obx(()=>
                         
                         (controller.status.value=="pending"||controller.requestSent.value==true)? 
                         ElevatedButton(
                           
                           style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black12)),
                           onPressed: ()async{
                           //  var id=controller.finalDetails[0].id;
                            //controller.bookNow(id);
                            }, child: Center(child: Text('Pending',style: TextStyle(color: Colors.white),)
                            ,)):
                         //   controller.requestSent.value==false?
                            ElevatedButton(
                           
                           style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red)),
                           onPressed: ()async{
                             var id=controller.finalDetails[0].id;
                            controller.bookNow(id);
                            }, child: Center(child: Text('Book Now',style: TextStyle(color: Colors.white),)
                            ,))
                           
                            ),
                          ),
                          
                             
                          ],),
                      
                          
                          
                     ],),
                     
                           );
                },
              );
            }
      ///////////////////////
     }),
   ),
          ///////////////////////////////
         
     
          ///////////////////////////////////////////////////////////////////
                       
          
 
          
         
     
          
          ],
          
          )),
        ),



      ],
    ),
  ),
);
  }
  
  pages(var img){
    return Container(
      //color: Colors.red,
      //height: 100,width: double.infinity,
    child: Stack(
      children: [
     
        Image.network(img,fit: BoxFit.cover,opacity: animation,width: Get.width,),
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: IconButton(
        onPressed: (){
          Get.back();
        },
        
        icon: Icon(Icons.arrow_back_ios,size: 22,)
        ),
    ),
      ],
    ),
    
    );
  }
  
  }