import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/bookingrequestmodel.dart';
List<BookingRequestModel>bookingRequ=[

BookingRequestModel(
'Ravi','Male','9807431256',
'Student',''

),
BookingRequestModel(
'Ravi','Male','9807431256',
'Student',''

),
BookingRequestModel(
'Ravi','Male','9807431256',
'Student',''

),
BookingRequestModel(
'Ravi','Male','9807431256',
'Student',''

),

];
class BookingRequestNotification extends StatefulWidget {
  const BookingRequestNotification({super.key});

  @override
  State<BookingRequestNotification> createState() => _BookingRequestNotificationState();
}

class _BookingRequestNotificationState extends State<BookingRequestNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        height: Get.height,
        child: Column(children: [
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
              SizedBox(width: Get.width/3.1),
              Text('Booking Requests',style: TextStyle(fontWeight: FontWeight.bold),)
          ],
        )),
      Container(child: ListView.builder(
        shrinkWrap: true,
        itemCount: bookingRequ.length,
        itemBuilder: (context,i){
      
      return Card(child: Column(children: [
        SizedBox(height: 5,),
        CircleAvatar(radius: 30,),SizedBox(width: 5,),
          Text('${bookingRequ[i].name} / ${bookingRequ[i].gender}'),
       // Row(
        //   children: [
        //     CircleAvatar(radius: 30,),SizedBox(width: 5,),
        //     Text('${bookingRequ[i].name} / ${bookingRequ[i].gender}'),
            
        //   ],
        // ),
  
      Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
      //  SizedBox(width: 80,), 
         Text('${bookingRequ[i].phone} ',style: TextStyle(color: Colors.red),),
             Text(bookingRequ[i].currentlyWorking,),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

 GestureDetector(
        onTap: (){
      Get.to(BookingRequestNotification());
      
        },
        child: Container(
          height: 40,width: 130,
      
          decoration: BoxDecoration(
          color: Colors.red,borderRadius: BorderRadius.circular(10)
          ),
          child: Center(child: Text('reject',style:
           TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
           )
           
           )),
SizedBox(width: 5,),

            GestureDetector(
        onTap: (){
      Get.to(BookingRequestNotification());
      
        },
        child: Container(
          height: 40,width: 130,
      
          decoration: BoxDecoration(
          color: Colors.green,borderRadius: BorderRadius.circular(10)
          ),
          child: Center(child: Text('Accept',style:
           TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
           )
           
           )),

      ],),
   SizedBox(height: 20,)
      ],),);
      
        }),)
      
      
      ],),),
    );
  }
}