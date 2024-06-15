import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:propertyfinder/user/app/modules/forgot_password/view/enter_email_view.dart';
import 'package:propertyfinder/user/app/modules/signin/controller/signin_controller.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:propertyfinder/user/app/modules/signup/view/email_verify.dart';
import 'package:propertyfinder/user/app/modules/signup/view/signup_role.dart';
import 'package:propertyfinder/user/app/routes/app_routes.dart';
import 'package:sign_in_button/sign_in_button.dart';
class SignInView extends GetView<SignInController> {
   SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     body: SafeArea(
       child: Form(child: SingleChildScrollView(
         child: Column(
          
       //crossAxisAlignment: CrossAxisAlignment.start,  
           children: [
     Container(height: 100,width: Get.width,
     decoration: BoxDecoration(color: Colors.red,
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(130),
      bottomRight: Radius.circular(130)
    
      )
     ),
     child: Center(child: Text('Login Now',style: TextStyle(fontSize: 22,
     fontFamily:'Serif',
     color: Colors.white,fontWeight: FontWeight.bold),),),
     ),
  
     
           const SizedBox(
                      height: 20,
                    ),
                    Align(alignment:Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text('Email'
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
                        controller: controller.email,
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
       
       
                     const SizedBox(
                      height: 20,
                    ),
                    Align(alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text('Password'
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
                        controller: controller.password,
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
                          suffixIcon: IconButton(onPressed: (){

                          }, icon: Icon(FontAwesomeIcons.eye)),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),

                          ),
                        ),
                      ),
                    ),
        Padding(
         padding:  EdgeInsets.only(left:Get.width/2.1),
         child:
          TextButton(onPressed: (){
         Get.to(EnteremailView());
         }, child: Text('Forgot password?',style: TextStyle(color: Colors.red),)),
       ),
                   
              SizedBox(height: 30,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(onTap: (){
      //  Get.toNamed(Routes.HOME);
      controller.signInProcess();
      //  Get.toNamed(Routes.HOME);
                          },
                            child: Container(decoration: BoxDecoration(color: Colors.red,
                            borderRadius: BorderRadius.circular(10)
                            ),
                          height: 35,width: Get.width/1.7,
                          child: Center(child: Text('Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                          ),),
                            ),
                          ),
                          SizedBox(width: 5,),
                          IconButton(onPressed: (){
       
                          }, icon: Icon(Icons.fingerprint))
                        ],
                      ),
       
                      SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:30.0),
                        child: Row(children: [
                         Container(height: 1,width: 140,color: Colors.black,),Padding(
                           padding: const EdgeInsets.only(left:8.0,right: 8),
                           child: Text(' or '),
                         ),Container(height: 1,width: 140,color: Colors.black,)
                        ],),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(right:40.0),
                        child: SignInButton(
                        Buttons.google,
                       // mini: true,
                        onPressed: () {},
                      ),
                      )
                 ,
                 Column(
                   children: [
                     Padding(padding: EdgeInsetsDirectional.only(top: Get.height/6.3),child:
                      Text("Don't have account yet?"),),
                
                TextButton(onPressed: (){

Get.toNamed(Routes.SIGNUP);
//Get.to(SignupRole());
                }, child: Text('Signup ',style: TextStyle(color: Colors.red),))
                
                   ],
                 )

         ],),
       )),
    
    
     ),
   );
  }}