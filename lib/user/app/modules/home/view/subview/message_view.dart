import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:propertyfinder/user/app/modules/home/controller/home_controller.dart';

class Message extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
      appBar: AppBar(backgroundColor: Colors.greenAccent,toolbarHeight: 100, 
        title: Center(child: Text('Chats')),shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(45.0),
  ),
  //title: Text('My App'),
),
      
      body: ListView.builder(
        itemCount: 10, // Replace with the actual number of messages
        itemBuilder: (context, index) {
          return MessageWidget(
            sender: 'Sender Name',
            message: 'Message text',
            timestamp: '12:34 PM',
          );
        },
      ),
    );
  }
}
class MessageWidget extends StatelessWidget {
  const MessageWidget({
    Key? key,
    required this.sender,
    required this.message,
    required this.timestamp,
  }) : super(key: key);

  final String sender;
  final String message;
  final String timestamp;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(horizontal:
 
16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sender,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                message,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height:
 
8.0),
              Text(
                timestamp,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              
            ],
          ),
     SizedBox(width: Get.width/2.1,),     CircleAvatar(backgroundImage:NetworkImage('https://th.bing.com/th/id/OIP.mo4EJHqEkLGfl3mZEtxtWAHaLH?pid=ImgDet&rs=1') ,),
        ],
      ),
    );
  }
}