import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:propertyfinder/user/app/modules/edit_profile/controller/edit_profile_controller.dart';
import 'package:propertyfinder/user/app/modules/edit_profile/view/edit_profile_view.dart';
import 'package:propertyfinder/user/app/modules/home/controller/home_controller.dart';
import 'package:propertyfinder/user/app/routes/app_routes.dart';
import 'package:propertyfinder/vendor/app/modules/change_password/controller/change_password_controller.dart';
import 'package:propertyfinder/vendor/app/modules/change_password/view/change_password.dart';
import 'package:propertyfinder/vendor/app/modules/home/vendor_home_controller.dart';

import '../../../../../user/app/modules/change_password/view/change_password.dart';
import '../../../../../user/app/modules/home/view/widget/profile_medu.dart';

class ProfileViewVendor extends GetView<
HomeControllerVendor
//HomeControllerVendor
>{
  @override
  Widget build(BuildContext context) {
    //Get.put(HomeController());
        Color originalColor = const Color(0xff373737);
    // TODO: implement build
    return Scaffold(body: SafeArea(child: Container(
      height: Get.height,child: SingleChildScrollView(child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
        children: [
Container(height: 200,width: double.infinity,color: Colors.yellow,
child: Center(child: Column(
   mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Align(alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: (){
          Get.back();
        },
        child: Icon(Icons.arrow_back,color: Colors.black,)),
    ),
  // Align(
  //                           alignment: Alignment.topLeft,
  //                           child: Padding(
  //                             padding: const EdgeInsets.all(8.0),
  //                             child: CircleAvatar(
  //                               //backgroundColor: Color(0xff747474),
  //                               radius: 16,
  //                               child: CircleAvatar(
  //                                 radius: 17,
  //                                 backgroundColor: Colors.white,
  //                                 child: IconButton(
  //                                     style: IconButton.styleFrom(
  //                                         // elevation: 2,
  //                                         //shadowColor: Colors.grey,
  //                                         backgroundColor:
  //                                             Get.theme.colorScheme.surface),
  //                                     onPressed: () {
  //                                       Get.back();
  //                                     },
  //                                     icon: const Icon(
  //                                       Icons.arrow_back,
  //                                       size: 18,
  //                                     )),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
                          //   CircleAvatar(radius: 45,
                      
                          Center(
                              child: ClipOval(
                            child: Image.network(
                              'https://th.bing.com/th/id/OIP.mo4EJHqEkLGfl3mZEtxtWAHaLH?pid=ImgDet&rs=1'
                              //mrtdqhhylff_20230912135956048.jpg'

                              ,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.person);
                                //  Image.asset(
                                //   ZImageAssets.profile,
                                //   fit: BoxFit.cover,
                                //   width: 90,
                                //   height: 90,
                                // );
                              },
                              fit: BoxFit.cover,
                              width: 90,
                              height: 90,
                            ),
                          )),
                          const SizedBox(
                            height: 10,
                          ),

                          // Obx(() =>
                         Text(
                              controller.profile.value.data.fullName??     "",
                              style: const TextStyle(
                                  color: Color(0xff00182D),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          

                          //    ),
                          Text(
 controller.profile.value.data.email??    "david@gmail.com",                            style: const TextStyle(color: Color(0xff747474)),
                          ),
],),),

),

  Container(
                  
                  //width: Get.width,
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      //color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                      border:
                          Border.all(color: originalColor.withOpacity(0.1))),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ProfileMenuWidget(
                        title:'Edit Profile',
                        // ZTextString.zEditProfile,
                        subtitle: 'edit your details',
                        //ZTextString.zEditProfileSubtitle,
                        icon: FeatherIcons.settings,
                        onPress: () {
                          
                          Get.put(EditProfileController());
                          Get.to(EditProfileView());
                      //    Get.toNamed(Routes.EDIT_PROFILE);
                        },
                      ),
                      ProfileMenuWidget(
                        title: 'Change Password',
                        subtitle: 'change your password',
                        
                        //ZTextString.zChangePasswordSubtitle,
                        icon: FeatherIcons.lock,
                        onPress: () {
                         Get.toNamed(Routes.CHANGEPASSWORDVENDOR);
                   //      Get.to(ChangePaswordViewVendor());
                         // Get.to(ChangePasswordControllerVendor());
                         // Get.to(ChangePaswordViewVendor());
                      //    Get.to(ChangePaswordView());
                          // Get.toNamed(Routes.CHANGE_PASSWORD,
                          //     arguments: [true, '', '']);
                        },
                      ),
                  
                      // ProfileMenuWidget(
                      //   title: ZTextString.zSupport,
                      //   subtitle: ZTextString.zSupportSubtitle,
                      //   icon: Icons.call,
                      //   onPress: () {
                      //     Get.toNamed(Routes.SUPPORT, arguments: [true, '']);
                      //   },
                      // ),
                      // ProfileMenuWidget(
                      //   title: ZTextString.zPrivacyPolicy,
                      //   subtitle: ZTextString.zPrivacyPolicySubtitle,
                      //   icon: Icons.security_rounded,
                      //   onPress: () {
                      //     Get.toNamed(Routes.PRIVACY_POLICY,
                      //         arguments: [true, '']);
                      //   },
                      // ),
                      ProfileMenuWidget(
                        title: 'Logout',
                        //ZTextString.zLogout,
                        subtitle: 'log out from app',
                        //ZTextString.zLogoutSubtitle,
                        endIcon: false,
                        icon: Icons.logout,
                        onPress: () {
 final box = GetStorage();
                      box.remove('accessToken');
                      box.remove('username');
                        box.remove('role');
                      Get.toNamed(Routes.SIGNIN);

                          //controller.logout();
                        },
                      ),
                    ],
                  ),
                ),

      ],),),
    )));
  }
}