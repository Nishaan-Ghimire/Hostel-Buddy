

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import 'package:propertyfinder/user/app/modules/forgot_password/controller/forgot_password_controller.dart';
import 'package:propertyfinder/user/app/modules/signup/view/email_verify.dart';

class EnteremailView extends GetView<ForgotPasswordController> {
   EnteremailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: Form(child: SingleChildScrollView(child: Column(children: [

      SizedBox(height: 45,
  ),
  Align(alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text('Enter Email'
                                    //    ZTextString.zEmail,
                        //  style: Get.textTheme.labelLarge!
                         //     .copyWith(color: ZColors.inseadOfDarkBlack),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                      //  controller: controller.username.value,
                                      //    validator: ZValidator.emailValidator,
                      //  focusNode: controller.usernameFocus,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (term) {
                         // controller.usernameFocus.unfocus();
                       //   FocusScope.of(context).requestFocus(controller.passwordFocus);
                        },
                        keyboardType: TextInputType.emailAddress,
                        
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                          // prefixIcon: Icon(
                          //   FontAwesomeIcons.envelope,
                          //   size: 14,
                          //   color: Get.theme.primaryColor.withOpacity(0.25),
                          // ),
                        
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),

                          ),
                        ),
                      ),
                    ),
  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:120.0,vertical: 10),
                    child: MaterialButton(
                      shape: Border.all(color: Colors.red,
                      style: BorderStyle.solid
                      ),
                      
                      onPressed: (){
                  Get.to(EmailVerification());
                    },
                    child: Container(
                      width: 100,height: 40,
                      child: Center(child: Text('  Next  '))),
                    
                    ),
                  )  
    ],),)),);
  }
   
   }