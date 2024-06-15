import 'package:flutter/material.dart';

Widget descriptionBox(String text){
  return 
ConstrainedBox(
constraints:   BoxConstraints(
        minWidth:20,
        // Get.width < 410 ? (Get.width - 50) / 2 : 180,
        maxWidth:130,
        // Get.width < 410 ? (Get.width - 50) / 2 : 180,
        minHeight: 15,
         maxHeight: 35
      ),
  child:   Container(height: 
  35,
  //25,
  
  //width: 100,
  
  decoration: BoxDecoration(
  
  borderRadius: BorderRadius.circular(10),
  
    border: Border.all(color: Colors.black)
  
  ),child: Center(child: Padding(
  
    padding: const EdgeInsets.all(2.0),
  
    child: Text(text),
  
  )),
  
  //color: Colors.red,
  
  ),
);
}