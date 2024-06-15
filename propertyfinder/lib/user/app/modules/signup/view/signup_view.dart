import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:propertyfinder/user/app/data/model/media_model.dart';
import 'package:propertyfinder/user/app/modules/signup/controller/sign_up_controller.dart';
import 'package:propertyfinder/user/app/modules/signup/view/email_verify.dart';
import 'package:propertyfinder/user/app/modules/signup/view/widget/add_photo.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

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
                        controller: controller.fullName,
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
                        controller: controller.emailAddress,
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
                        controller: controller.mobileNumber,
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
                        child: Text('username'
                                    //    ZTextString.zEmail,
                        //  style: Get.textTheme.labelLarge!
                         //     .copyWith(color: ZColors.inseadOfDarkBlack),
                        ),
                      ),
                    ),
                          Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controller.userName,
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
                        child: Text('DOB'
                                    //    ZTextString.zEmail,
                        //  style: Get.textTheme.labelLarge!
                         //     .copyWith(color: ZColors.inseadOfDarkBlack),
                        ),
                      ),
                    ),
Obx(()=> TextFormField(controller: controller.dob,
                decoration: InputDecoration(
                  labelText: 'Date',
                  hintText:controller. selectedDate == null ? 'Select Date' : 
                  controller.selectedDate.toString(),
                ),
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null && pickedDate !=  controller.selectedDate) {
                    //setState(() {
                  controller.   selectedDate.value = pickedDate.toString();
                  controller.dob.text=controller. selectedDate.value = pickedDate.toString();
                  //  });
                  }
                },
                readOnly: true,
              ),),

/////////////////////////

                    //       Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: TextFormField(
                    //     controller: controller.dob,
                    //                   //    validator: ZValidator.emailValidator,
                    //   //  focusNode: controller.usernameFocus,
                    //     textInputAction: TextInputAction.next,
                    //     onFieldSubmitted: (term) {
                    //      // controller.usernameFocus.unfocus();
                    //    //   FocusScope.of(context).requestFocus(controller.passwordFocus);
                    //     },
                    //     keyboardType: TextInputType.emailAddress,
                    //     decoration: InputDecoration(
                    //       contentPadding:
                    //           const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                    //       // prefixIcon: Icon(
                    //       //   FontAwesomeIcons.envelope,
                    //       //   size: 14,
                    //       //   color: Get.theme.primaryColor.withOpacity(0.25),
                    //       // ),
                    //       border: const OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    //       ),
                    //     ),
                    //   ),
                    // ),
 Align(alignment:Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text('Job Status'
                                    //    ZTextString.zEmail,
                        //  style: Get.textTheme.labelLarge!
                         //     .copyWith(color: ZColors.inseadOfDarkBlack),
                        ),
                      ),
                    ),

Obx(()=> Align(alignment: Alignment.topLeft,
   child: Padding(
     padding: const EdgeInsets.all(8.0),
     child: DropdownButton(
              hint: Text(controller.jobStaus.value??'selelct'),
              items: [
                DropdownMenuItem<String>(
                          child: Text('Student'),
                          value: 'Student',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('Working'),
                          value: ' Working',
                        ),
                          DropdownMenuItem<String>(
                          child: Text('None'),
                          value: ' None',
                        ),
            ], onChanged: (v){
              controller.jobStaus.value=v!;
              print(v);
            }),
   ),
 ),),

                    //       Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: TextFormField(
                    //   controller: controller.jobStatus,
                    //                   //    validator: ZValidator.emailValidator,
                    //   //  focusNode: controller.usernameFocus,
                    //     textInputAction: TextInputAction.next,
                    //     onFieldSubmitted: (term) {
                    //      // controller.usernameFocus.unfocus();
                    //    //   FocusScope.of(context).requestFocus(controller.passwordFocus);
                    //     },
                    //     keyboardType: TextInputType.emailAddress,
                    //     decoration: InputDecoration(
                    //       contentPadding:
                    //           const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                    //       // prefixIcon: Icon(
                    //       //   FontAwesomeIcons.envelope,
                    //       //   size: 14,
                    //       //   color: Get.theme.primaryColor.withOpacity(0.25),
                    //       // ),
                    //       border: const OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    //       ),
                    //     ),
                    //   ),
                    // ),

 Align(alignment:Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text('Profession'
                                    //    ZTextString.zEmail,
                        //  style: Get.textTheme.labelLarge!
                         //     .copyWith(color: ZColors.inseadOfDarkBlack),
                        ),
                      ),
                    ),


Align(alignment: Alignment.topLeft,
   child: Padding(
     padding: const EdgeInsets.all(8.0),
     child: Obx(()=>DropdownButton(
              hint: Text(controller.professions.value??'selelct'),
              items: [
                DropdownMenuItem<String>(
                          child: Text('IT'),
                          value: 'IT',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('Engineering'),
                          value: 'Engineering',
                        ),
                          DropdownMenuItem<String>(
                          child: Text('Bussiness'),
                          value: 'Bussiness',
                        ),
  DropdownMenuItem<String>(
                          child: Text('Law'),
                          value: 'Law',
                        ),
                          DropdownMenuItem<String>(
                          child: Text('Psychology'),
                          value: 'Psychology',
                        ),
                          DropdownMenuItem<String>(
                          child: Text('Medical'),
                          value: 'Medical',
                        ),
                          DropdownMenuItem<String>(
                          child: Text('Arts'),
                          value: 'Arts',
                        ),
                          DropdownMenuItem<String>(
                          child: Text('Marketing'),
                          value: 'Marketing',
                        ),
                          DropdownMenuItem<String>(
                          child: Text('Other'),
                          value: 'Other',
                        ),

            ], onChanged: (v){
              controller.professions.value=v!;
              print(v);
            }),)
   ),
 ),

                    //       Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: TextFormField(
                    //     controller: controller.profession,
                    //                   //    validator: ZValidator.emailValidator,
                    //   //  focusNode: controller.usernameFocus,
                    //     textInputAction: TextInputAction.next,
                    //     onFieldSubmitted: (term) {
                    //      // controller.usernameFocus.unfocus();
                    //    //   FocusScope.of(context).requestFocus(controller.passwordFocus);
                    //     },
                    //     keyboardType: TextInputType.emailAddress,
                    //     decoration: InputDecoration(
                    //       contentPadding:
                    //           const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                    //       // prefixIcon: Icon(
                    //       //   FontAwesomeIcons.envelope,
                    //       //   size: 14,
                    //       //   color: Get.theme.primaryColor.withOpacity(0.25),
                    //       // ),
                    //       border: const OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    //       ),
                    //     ),
                    //   ),
                    // ),
 Align(alignment:Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text('College Name'
                                    //    ZTextString.zEmail,
                        //  style: Get.textTheme.labelLarge!
                         //     .copyWith(color: ZColors.inseadOfDarkBlack),
                        ),
                      ),
                    ),
                          Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controller.collegename,
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
//  Align(alignment:Alignment.topLeft,
//                       child: Padding(
//                         padding: const EdgeInsets.only(left:8.0),
//                         child: Text('Role'
//                                     //    ZTextString.zEmail,
//                         //  style: Get.textTheme.labelLarge!
//                          //     .copyWith(color: ZColors.inseadOfDarkBlack),
//                         ),
//                       ),
//                     ),


// Align(alignment: Alignment.topLeft,
//    child: Padding(
//      padding: const EdgeInsets.all(8.0),
//      child: DropdownButton(
//               hint: Text(controller.role.value??'selelct'),
//               items: [
//                 DropdownMenuItem<String>(
//                           child: Text('User'),
//                           value: 'User',
//                         ),
//                         DropdownMenuItem<String>(
//                           child: Text('HostelOwner'),
//                           value: ' HostelOwner',
//                         ),
                       
//             ], onChanged: (v){
//               controller.role.value=v!;
//               print(v);
//             }),
//    ),
//  ),

// Obx(()=>
//    Visibility(
//  //   visible: controller.role.value!="User",
//     child: Column(children: [
//    Align(alignment:Alignment.topLeft,
//                         child: Padding(
//                           padding: const EdgeInsets.only(left:8.0),
//                           child: Text('Upload KYC'
//                                       //    ZTextString.zEmail,
//                           //  style: Get.textTheme.labelLarge!
//                            //     .copyWith(color: ZColors.inseadOfDarkBlack),
//                           ),
//                         ),
//                       ),
  
//    Align(alignment:Alignment.topLeft,
//                         child: Padding(
//                           padding: const EdgeInsets.only(left:8.0),
//                           child:    Container(
//               height: 50,
//               child: GestureDetector(onTap: (){
//                   controller.    mediaDialog(context);
//               },
//                 child: CircleAvatar(
//                   backgroundColor: Colors.grey,
//                   child: Icon(Icons.add)),
//               )),
//                         ),
  
                        
//                       ),
//                       SizedBox(height: 5,),
//      Obx(()=>controller.     kycmedia.length == 0
//                         ? Container()
//                         : Container(
//                       width: Get.width,
//                       height: Get.width * 0.3,
//                       child: ListView.builder(
//                           itemBuilder: (ctx, i) {
//                             return
//                           controller.      kycmedia[i].isVideo!
//                               //!isImage[i]
//                                 ? Container(
//                               width: Get.width * 0.3,
//                               height: Get.width * 0.3,
//                               margin: EdgeInsets.only(
//                                   right: 15, bottom: 10, top: 10),
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: MemoryImage(controller.kycmedia[i].thumbnail!),
//                                     fit: BoxFit.fill),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Stack(
//                                 children: [
//                                   Row(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     mainAxisAlignment:
//                                     MainAxisAlignment.end,
//                                     children: [
//                                       Padding(
//                                         padding: EdgeInsets.all(5),
//                                         child: CircleAvatar(
//                                           child: IconButton(
//                                             onPressed: () {
//                                           controller.    kycmedia.removeAt(i);
//                                               // media.removeAt(i);
//                                               // isImage.removeAt(i);
//                                               // thumbnail.removeAt(i);
//                                           //    setState(() {});
//                                             },
//                                             icon: Icon(Icons.close),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                   Align(
//                                     alignment: Alignment.center,
//                                     child: Icon(
//                                       Icons.slow_motion_video_rounded,
//                                       color: Colors.white,
//                                       size: 40,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             )
//                                 : Container(
//                               width: Get.width * 0.3,
//                               height: Get.width * 0.3,
//                               margin: EdgeInsets.only(
//                                   right: 15, bottom: 10, top: 10),
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: FileImage(controller.media[i].image!),
//                                     fit: BoxFit.fill),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Row(
//                                 crossAxisAlignment:
//                                 CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.end,
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsets.all(5),
//                                     child: CircleAvatar(
//                                       child: IconButton(
//                                         onPressed: () {
//                                         controller.  kycmedia.removeAt(i);
//                                           // isImage.removeAt(i);
//                                           // thumbnail.removeAt(i);
//                                         //  setState(() {});
//                                         },
//                                         icon: Icon(Icons.close),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             );
//                           },
//                           itemCount: controller.media.length,
//                           scrollDirection: Axis.horizontal),
//                     ),),
  
  
//    Align(alignment:Alignment.topLeft,
//                         child: Padding(
//                           padding: const EdgeInsets.only(left:8.0),
//                           child: Text('Upload PAN'
//                                       //    ZTextString.zEmail,
//                           //  style: Get.textTheme.labelLarge!
//                            //     .copyWith(color: ZColors.inseadOfDarkBlack),
//                           ),
//                         ),
  
                        
//                       ),
//                        Align(alignment:Alignment.topLeft,
//                         child: Padding(
//                           padding: const EdgeInsets.only(left:8.0),
//                           child:    Container(
//               height: 50,
//               child: GestureDetector(onTap: (){
//                   controller.    mediaDialog(context);
//               },
//                 child: CircleAvatar(
//                   backgroundColor: Colors.grey,
//                   child: Icon(Icons.add)),
//               )),
//                         ),
  
                        
//                       ),
//                       ////////////////////////////////////////////
//     SizedBox(height: 5,),
//      Obx(()=>controller.     media.length == 0
//                         ? Container()
//                         : Container(
//                       width: Get.width,
//                       height: Get.width * 0.3,
//                       child: ListView.builder(
//                           itemBuilder: (ctx, i) {
//                             return
//                           controller.      media[i].isVideo!
//                               //!isImage[i]
//                                 ? Container(
//                               width: Get.width * 0.3,
//                               height: Get.width * 0.3,
//                               margin: EdgeInsets.only(
//                                   right: 15, bottom: 10, top: 10),
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: MemoryImage(controller.media[i].thumbnail!),
//                                     fit: BoxFit.fill),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Stack(
//                                 children: [
//                                   Row(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     mainAxisAlignment:
//                                     MainAxisAlignment.end,
//                                     children: [
//                                       Padding(
//                                         padding: EdgeInsets.all(5),
//                                         child: CircleAvatar(
//                                           child: IconButton(
//                                             onPressed: () {
//                                           controller.    media.removeAt(i);
//                                               // media.removeAt(i);
//                                               // isImage.removeAt(i);
//                                               // thumbnail.removeAt(i);
//                                           //    setState(() {});
//                                             },
//                                             icon: Icon(Icons.close),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                   Align(
//                                     alignment: Alignment.center,
//                                     child: Icon(
//                                       Icons.slow_motion_video_rounded,
//                                       color: Colors.white,
//                                       size: 40,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             )
//                                 : Container(
//                               width: Get.width * 0.3,
//                               height: Get.width * 0.3,
//                               margin: EdgeInsets.only(
//                                   right: 15, bottom: 10, top: 10),
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: FileImage(controller.media[i].image!),
//                                     fit: BoxFit.fill),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Row(
//                                 crossAxisAlignment:
//                                 CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.end,
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsets.all(5),
//                                     child: CircleAvatar(
//                                       child: IconButton(
//                                         onPressed: () {
//                                         controller.  media.removeAt(i);
//                                           // isImage.removeAt(i);
//                                           // thumbnail.removeAt(i);
//                                         //  setState(() {});
//                                         },
//                                         icon: Icon(Icons.close),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             );
//                           },
//                           itemCount: controller.media.length,
//                           scrollDirection: Axis.horizontal),
//                     ),),
  
  
//   //////////////////////////////////
//                        Align(alignment:Alignment.topLeft,
//                         child: Padding(
//                           padding: const EdgeInsets.only(left:8.0),
//                           child: Text('Hostel Name'
//                                       //    ZTextString.zEmail,
//                           //  style: Get.textTheme.labelLarge!
//                            //     .copyWith(color: ZColors.inseadOfDarkBlack),
//                           ),
//                         ),
//                       ),
  
//                       Align(alignment:Alignment.topLeft,
//                         child: Padding(
//                           padding: const EdgeInsets.only(left:8.0),
//                           child: TextField(
//                             controller: controller.hostelname,
//                           )
//                         ),
//                       ),
//   ],)
//   ),
// ),



                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(onTap: (){


          //          Get.to(EmailVerification());
controller.signupProcess();

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
              Container(width: Get.width/3,height: 1,color: Colors.black,),  
                    Text('  or   '),Divider()
        ,Container(width: Get.width/3,height: 1,color: Colors.black,),       
               ],),

                Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(onTap: (){
          //          Get.to(EmailVerification());
Get.back();

                               },
                                 child: Container(height: 40,width: Get.width,
                                 
                                       
                       decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10),  color: Colors.grey,
                       ),
                       child: Center(
                                 
                                  child: Text('Back to Login',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                 
                       ),
                                 
                       ),
                               ),
                    ),
//                  Padding(
//                         padding: const EdgeInsets.only(right:10.0,top: 30),
//                         child:SignInButtonBuilder(
//   text: 'Sign up with google',
//   icon: FontAwesomeIcons.google,
//   onPressed: () {},
//   backgroundColor: Colors.black,
// ),
//                       )    
SizedBox(height: 10,)
                    
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
