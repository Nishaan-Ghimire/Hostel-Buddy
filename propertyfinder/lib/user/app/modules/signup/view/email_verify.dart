import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:propertyfinder/user/app/modules/signup/controller/sign_up_controller.dart';
import 'package:propertyfinder/user/app/modules/signup/view/verify_phone.dart';

class EmailVerification extends GetView<SignupController> {
   EmailVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
    body:Form(child: 
    SingleChildScrollView(child: Column(
      children: [
             Align(alignment:Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0,top:50),
                        child: Text(' Enter OTP sent to your email ID',style: TextStyle(fontWeight: FontWeight.bold),
                                    //    ZTextString.zEmail,
                        //  style: Get.textTheme.labelLarge!
                         //     .copyWith(color: ZColors.inseadOfDarkBlack),
                        ),
                      ),
                    ),
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
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(onTap: (){
                    Get.to(PhoneVerificationView());
                               },
                                 child: Container(height: 40,width: Get.width,
                                 
                                       
                       decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10),  color: Colors.red,
                       ),
                       child: Center(
                                 
                                  child: Text('Next',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                 
                       ),
                                 
                       ),
                               ),
                    ),
      ],
    ),)
    
    ) ,
   );
  }
}
