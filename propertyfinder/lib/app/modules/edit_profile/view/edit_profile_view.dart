import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:propertyfinder/app/modules/edit_profile/controller/edit_profile_controller.dart';
import 'package:propertyfinder/app/modules/home/view/subview/dashboard_view.dart';

class EditProfileView extends GetView<EditProfileController> {
   EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 return Scaffold(

  body: SafeArea(
    child: Container(
      height: double.infinity,
       padding: const EdgeInsets.symmetric(horizontal: 16.0),
       child: SingleChildScrollView(child: 
       Form(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
        children: [
  SizedBox(
    height: 5,
    
  ),
   IconButton(onPressed: (){
  Get.back();
    }, icon: Icon(Icons.arrow_back_ios)),
    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'FirstName',
                      style: Get.textTheme.labelLarge!
                          .copyWith(color: Colors.black
                          
                          //ZColors.inseadOfDarkBlack
                          ),
                    ),
                    SizedBox(height: 7),
                    TextFormField(
                      controller: controller.fName,
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
                    Text(
                      'LastName',
                      style: Get.textTheme.labelLarge!
                          .copyWith(color: Colors.black
                          
                          //ZColors.inseadOfDarkBlack
                          ),
                    ),
   TextFormField(
                      controller: controller.fName,
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
  
     Text(
                      'Password',
                      style: Get.textTheme.labelLarge!
                          .copyWith(color: Colors.black
                          
                          //ZColors.inseadOfDarkBlack
                          ),
                    ),
   TextFormField(
                      controller: controller.fName,
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
  Text('DOB'),
    Obx(
                      () => 
                      Container(
                        
                        //width: double.infinity,
                        decoration: BoxDecoration(
                     //     borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: Get.theme.colorScheme.outline),
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: InkWell(
                          onTap: () async {
                            await showDatePicker(
                              context: context,
                              initialDate: DateTime(1999),
                              firstDate: DateTime(1910),
                              lastDate: DateTime(2050, 12, 31),
                            ).then((value) {
                              controller.birthDate.value =
                                  value ?? DateTime.now();
                              controller.birthDateString.value =
                              // DateFormat()
                                  DateFormat('yyyy-MM-dd')
                                      .format(controller.birthDate.value);
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.birthDateString.value,
                                // '${controller.appointmentBookingDate.value.year} :${controller.appointmentBookingDate.value.month}:${controller.appointmentBookingDate.value.day}  ',
                                style: Get.textTheme.titleSmall,
                              ),
                              Icon(
                                Icons.calendar_today_outlined,
                                size: 16,
                                color: Get.theme.colorScheme.error,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
  
  
    Text('Profile',
                        style: Get.textTheme.labelLarge!
                            .copyWith(color: Colors.black
                            
                            //ZColors.inseadOfDarkBlack
                            )),
                    SizedBox(
                      height: 11,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          child: Stack(
                            children: [
                              //Obx(() =>
                               ClipOval(
                                    child: Image.network(
                                  'https://th.bing.com/th/id/OIP._8Kty4btP3aJuyTfZTaR0wHaHk?pid=ImgDet&rs=1',
                                  //    '${HttpConfig.siteUrl}/images/profile/Thumbnails/small/${AuthRepository.instance.userInfo.value.imageName}',
                                      errorBuilder: (context, error, stackTrace) {
                                        return Icon(Icons.person);
                                      },
  
                                      //controller.profileImage.value,
                                      fit: BoxFit.cover,
                                      width: 100,
                                      height: 90,
                                    ),
                                  )
                                  //),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Container(
                            // width: 100,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Get.theme.colorScheme.primary
  
                                //const Color(0xffD9A250),
                                ),
                            child: MaterialButton(
                              //  color: Color(0xffD9A250),
  
                              onPressed: () async {
                                controller.isImageChanged = true.obs;
  
                               // await controller.getImage(ImageSource.gallery);
                              },
  
                              child: Center(
                                child: Text(
  'change',
                                  //ZTextString.change,
                                  style: TextStyle(
                                      color: Get.theme.colorScheme.onPrimary),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        // Expanded(
                        //   child: Container(
                        //     // width: 110,
                        //     height:35,
                        //     // 35,
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(10),
                        //         color: Get.theme.colorScheme.shadow),
                        //     child: MaterialButton(
                        //       //  color: Colors.black,
  
                        //       onPressed: () {},
  
                        //       child: Center(
                        //         child: Text(
                        //           //ZTextString.
                        //           'remove',
                        //           style: TextStyle(
                        //               color: Get.theme.colorScheme.onPrimary),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
      
  
                      ],
                    ),
  SizedBox(height: 60,),
  
    Container(
      // width: 100,
      height: 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Get.theme.colorScheme.primary
  
          //const Color(0xffD9A250),
          ),
      child: MaterialButton(
        //  color: Color(0xffD9A250),
  color: Colors.red,
        onPressed: () async {
          controller.isImageChanged = true.obs;
  
         // await controller.getImage(ImageSource.gallery);
        },
  
        child: Center(
          child: Text(
  'Submit',
            //ZTextString.change,
            style: TextStyle(
                color: Get.theme.colorScheme.onPrimary),
          ),
        ),
      ),
    ),
  
  
       ],)),),
  
    ),
  ),
 );
  }
   
   }