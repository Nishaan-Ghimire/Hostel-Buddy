import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:propertyfinder/user/app/modules/signup/controller/sign_up_controller.dart';
import 'package:propertyfinder/user/app/modules/signup/view/email_verify.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SignUpView extends GetView<SignupController> {
   SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return Scaffold(
body:Form(child: 
SingleChildScrollView(
  child: SafeArea(
    child: Column(
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
          child: Center(child: Text('Create Account',style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,color: Colors.white),),),
        ),
        ),
// Text('If you are searching for room / hostel sign up as user'),
//         Container(height: 40,width: Get.width,
//         color: Colors.amber,child: Center(
//           child: Text('Sign up as user'),
//         ),
//         ),
//         Text('If you are house /hostel  owner and want to rent your property sign up as owner'),

// SizedBox(height: 20,),
//          Container(height: 40,width: Get.width,
//         color: Colors.amber,child: Center(
//           child: Text('Sign up owner / vendor'),
//         ),
//         ),
     Align(alignment:Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text('Full Name'
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
                         Align(alignment:Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text('email'
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
                         Align(alignment:Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text('Password'
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
                         Align(alignment:Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text('phone'
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
                    Get.to(EmailVerification());
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
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
              Container(width: Get.width/3,height: 1,color: Colors.black,),        Text('  or   '),Divider()
        ,Container(width: Get.width/3,height: 1,color: Colors.black,),              ],),
                 Padding(
                        padding: const EdgeInsets.only(right:10.0,top: 30),
                        child:SignInButtonBuilder(
  text: 'Sign up with google',
  icon: FontAwesomeIcons.google,
  onPressed: () {},
  backgroundColor: Colors.black,
),
                      )    
                    
      ],
    ),
  ),
)

) ,


);  }}

class CurvyShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
 Path path = Path();
    path.moveTo(0, size.height); // Start at the bottom-left corner
    path.lineTo(0, 
    //44
    size.height
    // * 0.85
    ); // Move upwards slightly
    // path.quadraticBezierTo(size.width * 0.25, 
    // size.height 
    // * 0.6,
    //  size.width * 0.5,
    //   size.height * 0.85); 
     path.addArc(Rect.fromCircle(center:Offset(130, 200) , radius: 20), 30, 60);// Create the curve
    //path.quadraticBezierTo(size.width * 0.75, size.height * 1.1, size.width, size.height * 0.85); // Create the opposite curve
    // path.quadraticBezierTo(size.width * 0.25, size.height * 0.6, size.width * 0.5, size.height * 0.85); 
    path.lineTo(size.width, size.height);
     // Line to the bottom-right corner
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
