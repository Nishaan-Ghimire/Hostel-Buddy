import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:propertyfinder/vendor/app/modules/managerooms/manage_rooms_controller.dart';

import '../../data/models/rating_model.dart';
import '../notification/view/notification_view.dart';
List<RatingModel> rmodel=[
RatingModel('DS Aaire', '3.5', 'Good'),
RatingModel('Virat Kholi ', '4', ' gooddsssssssssssssssssssssssssssssssssssjcbjajsbcjbdjskbcjksssssssssssssssshhhhhhhhhhhhhhhhhhhhhhhhhaaaaaaaaaaaaaaaaaaaa'),
RatingModel('MSD ', '4.5', 'Best'),
RatingModel('Rohit pudel ', '5', 'Best'),
RatingModel('Ambathi Raidu ', '5', 'Best'),
RatingModel('Sandeep Lamichane ', '5', 'Best'),

];
 class ManageRoomView extends GetView<ManageRoomController> {
   ManageRoomView({Key? key}) : super(key: key);
     Widget build(BuildContext context) {

      return Scaffold(
body: Column(children: [

SizedBox(height: 40,),

  Align(
    alignment: 
    Alignment.topLeft,child: GestureDetector(
      onTap: (){

Get.back();

      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.arrow_back),
      )),
      ),

//      Text(controller.items.toString())

Container(
  height: 200,width: double.infinity,
  child: Image.network(controller.items.image),),
  Text(controller.items.name,style: TextStyle(fontWeight: FontWeight.bold),),
  Text('${controller.items.isAvailable} / ${controller.items.location}'),
 
  Text('${controller.items.noOfBeds} / ${controller.items.price}'),
  Text('is booked : NO',style: TextStyle(color: Colors.red),),
  SizedBox(height: 10,),
  Row(mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: (){
      
      
        },
        child: Container(
          height: 50,width: 130,
      
          decoration: BoxDecoration(
          color: Colors.red,borderRadius: BorderRadius.circular(10)
          ),
          child: Center(child: Text('Remove',style:
           TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
           )
           
           )),

SizedBox(width: 10,),
              GestureDetector(
        onTap: (){
      Get.to(BookingRequestNotification());
      
        },
        child: Container(
          height: 50,width: 130,
      
          decoration: BoxDecoration(
          color: Colors.green,borderRadius: BorderRadius.circular(10)
          ),
          child: Center(child: Text('Requests (11)',style:
           TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
           )
           
           )),
    ],
  ),
SizedBox(height: 10,)
,GestureDetector(
        onTap: (){
     // Get.to(BookingRequestNotification());
      
        },
        child: Container(
          height: 50,width: 130,
      
          decoration: BoxDecoration(
          color: Colors.grey,borderRadius: BorderRadius.circular(10)
          ),
          child: Center(child: Text('Edit',style:
           TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
           )
           
           )),

    SizedBox(height: 20,),
    Align(
      
      alignment: Alignment.topLeft,
      child: Text('  Rating and Reviews',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
      ),
    // Center(
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [Icon(Icons.star),
      
    //   Icon(Icons.star),Icon(Icons.star)
    //   ],),
    // ),
   
Container(height: 

Get.height/3.3,
//250,
//300,
  child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(shrinkWrap: true,
          itemCount: rmodel.length,
          itemBuilder: (context,i){
int fullstars=double.parse(rmodel[i].stars).floor();
double halfstar=(double.parse(rmodel[i].stars))-fullstars;
 //if(halfstar==0){
  //print(fullstars);
  print(halfstar);
return Container(height: 100,width: Get.width,
          color: Colors.grey,
          child: Column(children: [
            
            Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text('${rmodel[i].name} ',style: TextStyle(fontWeight: FontWeight.bold),),
            )),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(children: [
            for(double j = 0; j < double.parse(rmodel[i].stars).floor(); j++)
               //Text('')
                     halfstar==0? 
             Icon(Icons.star,color: Colors.yellow,)
                     :Row(children: [
                     // j>(double.parse(rmodel[i].stars).floor()).toDouble()?Icon(Icons.star_half):Icon(Icons.star)
            j==double.parse(rmodel[i].stars).floor()-1?Row(children: [
              
              Icon(Icons.star,color: Colors.yellow,),
            
            Icon(Icons.star_half,color: Colors.yellow,),
            ],):Icon(Icons.star,color: Colors.yellow,)
            //Text('${double.parse(rmodel[i].stars).floor()}')
            
            //j==(double.parse(rmodel[i].stars).floor())?Icon(Icons.star_half):Icon(Icons.star):
                  //    Icon(Icons.star,color: Colors.yellow,)
            
                     ],)
             // ,Icon(Icons.star),Icon(Icons.star),
            
            
            ],),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(rmodel[i].comment,overflow: TextOverflow.ellipsis,),
            ))
        ,  Divider()
          ],),
        );
       //   }

 //else{
// print('else');

 //}

        })
      ),
),
  //Text('Room Details',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)
],),

      );
     }
   
   }