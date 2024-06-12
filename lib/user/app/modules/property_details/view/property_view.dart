
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:propertyfinder/user/app/modules/property_details/controller/property_controller.dart';
import 'package:propertyfinder/user/app/modules/property_details/view/widget/description_widget.dart';
import 'package:propertyfinder/user/app/modules/property_details/view/widget/property_poster_info.dart';
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
    Get.put(PropertyController());
    // List<String> items =  controller.finalDetails[0].facilities.split(',');
return Scaffold(bottomSheet:   Padding(
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
  floatingActionButton: Row(
    
   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
   //.end,
    children: [

// Container(
//   height: 80,width: 200,
//   child: PosterInfo()
  
//   ),
//SizedBox(width: Get.width/1.8,),
// Row(children: [
// PosterInfo()
// ],),
  //370.0
  //,bottom: 55
  

 

//SizedBox(height: 4,),
    
    ],
  ),

  body:   SafeArea(
    child:controller.finalDetails.length<1?CircularProgressIndicator(): Column(
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
            child: Stack(children: [
          
          Container(height: 300,
            child: PageView.builder(
              // physics: const BouncingScrollPhysics(),
              controller: pagecontroller,
              onPageChanged: (i){
              
            },
              itemCount: img.length,
              itemBuilder: (context,index){
            
            //controller: controller;
            
            return pages(img[index]);
            // return page[index];
              
            }),
          ),
     
          
                        Positioned(top: 220,left: 200,
                          child: SmoothPageIndicator(
                            
                            controller: pagecontroller,
                            
                            count: img.length,
                            
                            effect: const WormEffect(
                            dotColor: Colors.grey,
                              dotHeight: 16,
                            
                              dotWidth: 16,
                            
                              type: WormType.thinUnderground,
                            
                            ),
                            
                          ),
                        ),
          
        Positioned(
          top: 250,
          child: Container(
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
              SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
Text('100'),
 Icon(Icons.remove_red_eye),
            ],),
  Obx(()=>  
   Text(
       controller.finalDetails[0].name
     //   controller.propertDetail?.value?.name??
      ?? 
      
       'ABC Boys Hostel',
          style: TextStyle(fontSize: 22,color: Colors.orange,fontWeight: FontWeight.bold),
          ),
          ),
          Obx(()=> Text('${controller.finalDetails[0].city}')),
            // Center(
            //   child: Row(
            //     children: [SizedBox(width: Get.width/2.4,),
            //       Icon(Icons.gps_off),Text('Koteswor Kathmandu')
            //     ],
            //   ),
            // ),
            Obx(()=> Text('Rs ${controller.finalDetails[0].costPerMonth} / month',style: TextStyle(color: Colors.green),)),
            SizedBox(height: 20,),
         

            Wrap(
              runSpacing: 5,
                                      spacing: 5,
              children: [
                for(int i=0;i<controller.items.length;i++)Obx(()=> descriptionBox(controller.items[i]))
            //   Text(controller.finalDetails[0].facilities),
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
  child: ElevatedButton(
    
    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red)),
    onPressed: (){
  
  }, child: Center(child: Text('Book Now',style: TextStyle(color: Colors.white),),)),
),

            // Container(
            //   //height: 85,
            //   width: 200,
            //   child: PosterInfo()
              
            //   ),
 // SizedBox(height: 10,),
    // Row(
    //    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: [
    //       FloatingActionButton(onPressed: (){
            
    //       },
    //       child: Icon(Icons.phone),
    //       ), SizedBox(width: 20,height: 10,), FloatingActionButton(onPressed: (){
            
    //       },child: Icon(FeatherIcons.messageCircle),backgroundColor: Colors.greenAccent,),
    //     ],
    //   ),
],),
           


          ],),
          
                ))
          
         
     
          
          ],
          
          )),
        ),

//Padding(
  //padding:  EdgeInsets.only(top:
 // 0,
  //Get.height/2.5
  //,left: 10
  //),
  //child:   
  // Align(
  //   alignment: Alignment.bottomLeft,
  //   child: Padding(
  //     padding:  EdgeInsets.only(top:Get.height/6




  //           ),
  //     child: PosterInfo(),
  //   )),
//),
//  CircleAvatar(
//    backgroundColor: Colors.red,
//    radius: 22,
//    child: InkWell(
//      onTap: (){
 
//      },
//      child: Icon(Icons.support_agent_sharp,size: 27,color: Colors.white,))),



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