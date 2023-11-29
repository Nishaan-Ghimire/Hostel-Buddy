import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:propertyfinder/app/modules/change_password/view/change_password.dart';
import 'package:propertyfinder/app/modules/edit_profile/view/edit_profile_view.dart';
import 'package:propertyfinder/app/modules/home/controller/home_controller.dart';
import 'package:propertyfinder/app/modules/home/view/widget/profile_medu.dart';
import 'package:propertyfinder/app/routes/app_routes.dart';

class ProfileView extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
        Color originalColor = const Color(0xff373737);
    // TODO: implement build
    return Scaffold(body: SafeArea(child: Container(
      height: Get.height,child: SingleChildScrollView(child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
        children: [
Container(height: 200,width: double.infinity,color: Color(0xfff123cf),
child: Center(child: Column(
   mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                //backgroundColor: Color(0xff747474),
                                radius: 16,
                                child: CircleAvatar(
                                  radius: 17,
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                      style: IconButton.styleFrom(
                                          // elevation: 2,
                                          //shadowColor: Colors.grey,
                                          backgroundColor:
                                              Get.theme.colorScheme.surface),
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        size: 18,
                                      )),
                                ),
                              ),
                            ),
                          ),
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
                              "David Harly",
                              style: const TextStyle(
                                  color: Color(0xff00182D),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          

                          //    ),
                          Text(
                            "david@gmail.com",
                            style: const TextStyle(color: Color(0xff747474)),
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
                          Get.to(ChangePaswordView());
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