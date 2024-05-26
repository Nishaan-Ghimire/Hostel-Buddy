import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:propertyfinder/user/app/modules/change_password/controller/change_password_controller.dart';
import 'package:propertyfinder/user/app/modules/forgot_password/controller/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
   ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: 
 SafeArea(
    child: Container(
      height: double.infinity,
       padding: const EdgeInsets.symmetric(horizontal: 16.0),
       child: SingleChildScrollView(child: 
       Form(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
        children: [
  SizedBox(
    height: 15,
    
  ),
   IconButton(onPressed: (){
  Get.back();
    }, icon: Icon(Icons.arrow_back_ios)),
    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Enter New Password',
                      style: Get.textTheme.labelLarge!
                          .copyWith(color: Colors.black
                          
                          //ZColors.inseadOfDarkBlack
                          ),
                    ),
                    SizedBox(height: 7),
                    TextFormField(
                   //   controller: controller.fName,
                      //validator: ZValidator.stringValidator,
                      //  focusNode: controller.fNameFocus,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (term) {},
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height:11
                      // 11.h,
                    ),
  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:120.0,vertical: 10),
                    child: MaterialButton(
                      shape: Border.all(color: Colors.red,
                      style: BorderStyle.solid
                      ),
                      
                      onPressed: (){
                  
                    },
                    child: Container(
                      width: 100,height: 40,
                      child: Center(child: Text('  Change  '))),
                    
                    ),
                  )  

                  //       Text(
                  //     'New Password',
                  //     style: Get.textTheme.labelLarge!
                  //         .copyWith(color: Colors.black
                          
                  //         //ZColors.inseadOfDarkBlack
                  //         ),
                  //   ),
                  //   SizedBox(height: 7),
                  //   TextFormField(
                  //  //   controller: controller.fName,
                  //     //validator: ZValidator.stringValidator,
                  //     //  focusNode: controller.fNameFocus,
                  //     textInputAction: TextInputAction.next,
                  //     onFieldSubmitted: (term) {},
                  //     keyboardType: TextInputType.text,
                  //     decoration: const InputDecoration(
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  //       ),
                  //     ),
                  //   ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal:120.0,vertical: 10),
                  //   child: MaterialButton(
                  //     shape: Border.all(color: Colors.red,
                  //     style: BorderStyle.solid
                  //     ),
                      
                  //     onPressed: (){
                  
                  //   },
                  //   child: Container(
                  //     width: 100,height: 40,
                  //     child: Center(child: Text('  Change  '))),
                    
                  //   ),
                  // ) 
                  
                   ]))))




    ));
  }}