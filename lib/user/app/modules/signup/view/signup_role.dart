import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:propertyfinder/user/app/modules/signup/controller/sign_up_controller.dart';
import 'package:propertyfinder/user/app/modules/signup/view/signup_view.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SignupRole extends GetView<SignupController> {
   SignupRole({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return Scaffold(
body: Padding(
  padding: const EdgeInsets.all(38.0),
  child:   Column(
  
    children: [
           Container(
          height: 200,width: Get.width,
        
          decoration: BoxDecoration(
        color: Colors.red,
         borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(330.0), // Adjust the value for the curve
        ),
        
        //borderRadius: BorderRadius.only(
         // topLeft: Radius.circular(122),
        //bottomLeft: Radius.circular(22),
        //bottomRight: Radius.circular(122),
        
        
        //)
          ),
        
        child: Center(
          child: Center(child: Text('Please select your role',style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,color: Colors.white),),),
        ),
        ),
     // Text('Please select your role',style: TextStyle(fontWeight: FontWeight.bold),),
  SizedBox(height: 23,),
  SizedBox(height: 50,),

      Text('If you are searching for room / hostel sign up as user',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
  SizedBox(height: 23,),
          GestureDetector(onTap: (){
Get.to(SignUpView());
          },
            child: Container(height: 40,width: Get.width,
            decoration: BoxDecoration(
           color: Colors.amber,
           borderRadius: BorderRadius.circular(10)
            ),
                   
            child: Center(
            
              child: Text('Sign up as user',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
          
          
            
            ),
            
            ),
          ),
  SizedBox(height: 50,),
          Text('If you are house /hostel  owner and want to rent your property sign up as owner',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red)),
  
  
  
  SizedBox(height: 20,),
  
           GestureDetector(onTap: (){

           },
             child: Container(height: 40,width: Get.width,
             
                   
                     decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),  color: Colors.red,
                     ),
                     child: Center(
             
              child: Text('Sign up as owner / vendor',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
             
                     ),
             
                     ),
           ),

             
  
    ],
  
  ),
),
);  }}