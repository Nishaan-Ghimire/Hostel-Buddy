
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propertyfinder/user/app/data/model/hostel_datail/hostel_detail.dart';
import 'package:propertyfinder/user/app/modules/chat_page/binding/chat_binding.dart';
import 'package:propertyfinder/user/app/modules/chat_page/view/individual_chat.dart';
import 'package:propertyfinder/user/app/modules/forgot_password/binding/forgot_password_binding.dart';
import 'package:propertyfinder/user/app/modules/forgot_password/view/enter_email_view.dart';
import 'package:propertyfinder/user/app/modules/forgot_password/view/forgot_password_view.dart';
import 'package:propertyfinder/user/app/modules/signin/view/signin_view.dart';
import 'package:propertyfinder/user/app/modules/signup/view/email_verify.dart';
import 'package:propertyfinder/user/app/modules/signup/view/signup_role.dart';
import 'package:propertyfinder/user/app/modules/signup/view/verify_phone.dart';
import 'package:propertyfinder/user/app/routes/app_routes.dart';
import 'package:propertyfinder/vendor/app/modules/change_password/binding/change_password_binding.dart';
import 'package:propertyfinder/vendor/app/modules/change_password/view/change_password.dart';
import 'package:propertyfinder/vendor/app/modules/home/vendor_home_binding.dart';
import 'package:propertyfinder/vendor/app/modules/managerooms/manage_room_binding.dart';
import 'package:propertyfinder/vendor/app/modules/managerooms/managerooms_view.dart';

import '../../../vendor/app/modules/home/vendor_home_view.dart';
import '../../../vendor/app/modules/add_property/binding/add_property_binding.dart';
import '../../../vendor/app/modules/add_property/view/add_property.dart';
import '../modules/change_password/binding/change_password_binding.dart';
import '../modules/change_password/view/change_password.dart';
import '../modules/edit_profile/binding/edit_profile_binding.dart';
import '../modules/edit_profile/view/edit_profile_view.dart';
import '../modules/home/binding/home_binding.dart';
import '../modules/home/view/home_view.dart';
import '../modules/home/view/subview/buy_premium_page.dart';
import '../modules/home/view/subview/message_view.dart';
import '../modules/property_details/binding/property_binding.dart';
import '../modules/property_details/view/property_view.dart';
import '../modules/search_page/binding/search_binding.dart';
import '../modules/search_page/view/search_view.dart';
import '../modules/signin/binding/signin_binding.dart';
import '../modules/signup/binding/signup_binding.dart';
import '../modules/signup/view/signup_view.dart';

class AppPages {
  AppPages._();
  static const INITIAL =
   Routes.SIGNIN;

  static final routes = [
    
    // GetPage(
    //   name: _Paths.HOME,
    //   page: () =>
    //       //   const
    //       HomeView(),
    //   binding: HomeBinding(),
    //   children: [
    //     GetPage(
    //       name: _Paths.HOME,
    //       page: () =>
    //           //     const
    //           HomeView(),
    //       binding: HomeBinding(),
    //     ),
    //   ],
    // ),
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeView(),
      binding: HomeBinding(),
    ),
     GetPage(
      name: _Paths.SIGNUP,
      page: () =>  SignUpView(),
      binding: SignupBinding(),
    ),
       GetPage(
      name: _Paths.SIGNIN,
      page: () =>  SignInView(),
      binding: SigninBinding(),
    ),
GetPage(name: 
_Paths.VENDORHOME, page:()=> HomeViewVendor(),
binding:HomeBindingVendor()

),
GetPage(name: _Paths.manageHome, page: ()=>ManageRoomView(),
binding: ManageRoomBinding()
),
GetPage(name: _Paths.MESSAGE, page:()=> IndividualChat(),
binding: ChatBinding()),
GetPage(name: _Paths.HOSTELDETAIL, page:()=> PropertyDetails(),

binding: PropertyBinding()
)
    // GetPage(
    //   name: _Paths.MESSAGE,
    //   page: () =>  Message(),
    //   binding: HomeBinding(),
    // ),
    // GetPage(
    //   name: _Paths.PREMIUM,
    //   page: () =>  Premium(),
    //   binding: HomeBinding(),
    // ),
    // GetPage(
    //   name: _Paths.MESSAGE,
    //   page: () =>  Message(),
    //   binding: HomeBinding(),
    // ),
    // GetPage(
    //   name: _Paths.ADDPROPERTY,
    //   page: () =>  AddPropertyView(),
    //   binding: AddPropertyBinding(),
    // ),

    //     GetPage(
    //   name: _Paths.PROPERTYDETAILS,
    //   page: () =>  PropertyDetails(),
    //   binding: PropertyBinding(),
    // ),

    //   GetPage(
    //   name: _Paths.SEARCHPAGE,
    //   page: () =>  SearchView(),
    //   binding: SearchBinding(),
    // ),


      ,GetPage(
      name: _Paths.EDITPROFILE,
      page: () =>  EditProfileView(),
      binding: EditProfileBinding(),
    )


        ,GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () =>  ChangePaswordView(),
      binding: ChangePasswordBinding(),
    ),
         GetPage(name:_Paths.CHANGEPASSWORDVENDOR,
          page: ()=>ChangePaswordViewVendor(),
          binding: ChangePasswordVendorBinding()),
//     GetPage(name: _Paths.SIGNUP, page: ()=>SignUpView(),binding: SignupBinding()),
//          GetPage(name:_Paths.ROLE, page: ()=>SignupRole(),binding: SignupBinding()),
//      GetPage(name:_Paths.EMAILVERIFICATION, page: ()=>EmailVerification    (),binding: SignupBinding()),
//    // GetPage(name: , page: () => SignupRole(), binding: SignupBinding())
//  GetPage(name:_Paths.PHONEVERIFICATION, page: ()=>PhoneVerificationView (),binding: SignupBinding()),
//    GetPage(name:_Paths.FORGOTPASSWORD, page: ()=>ForgotPasswordView (),binding: ForgotPasswordBinding()),
//    GetPage(name:_Paths.ENTEREMAIL, page: ()=>EnteremailView (),binding: ForgotPasswordBinding()),
    // GetPage(
    //   name: _Paths.CHANGE_PASSWORD,
    //   page: () => const ChangePasswordView(),
    //   binding: ChangePasswordBinding(),
    // ),
    // GetPage(
    //   name: _Paths.WELCOME,
    //   page: () => const WelcomeView(),
    //   binding: WelcomeBinding(),
    // ),
    // GetPage(
    //   name: _Paths.SUPPORT,
    //   page: () => const SupportView(),
    //   binding: SupportBinding(),
    // ),
    // GetPage(
    //   name: _Paths.PRIVACY_POLICY,
    //   page: () => const PrivacyPolicyView(),
    //   binding: PrivacyPolicyBinding(),
    // ),
    // GetPage(
    //   name: _Paths.EDIT_PROFILE,
    //   page: () => const EditProfileView(),
    //   binding: EditProfileBinding(),
    // ),
    // GetPage(
    //   name: _Paths.MOVIE_DETAILS,
    //   page: () => const MovieDetailsView(),
    //   binding: MovieDetailsBinding(),
    // ),
    // GetPage(
    //   name: _Paths.BOOKING,
    //   page: () => const BookingView(),
    //   binding: BookingBinding(),
    // ),
    // GetPage(
    //   name: _Paths.PDF,
    //   page: () => const PdfView(),
    //   binding: PdfBinding(),
    // ),
   
  ];
}
abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const VENDORHOME='/vendorHome';
static const manageHome='/manageHome';



  static const PROFILE = '/profile';
  static const PREMIUM = '/premium';
  static const MESSAGE = '/message';
    static const ADDPROPERTY = '/addProperty';
       static const PROPERTYDETAILS = '/addProperty';
      // static const EDITPROPERTY = '/editproperty';
         static const SEARCHPAGE = '/searchpage';
         static const EDITPROFILE='/editProfile';
  static const CHANGE_PASSWORD = '/change-password';
  static const SIGNIN = '/signin';
  static const SIGNUP = '/signup';
  // static const MESSAGE='message';
 
  //static const CHANGE_PASSWORD = '/change-password';
  static const WELCOME = '/welcome';
  static const SUPPORT = '/support';
  static const PRIVACY_POLICY = '/privacy-policy';
  static const EDIT_PROFILE = '/edit-profile';
  static const MOVIE_DETAILS = '/movie-details';
  static const BOOKING = '/booking';
  static const PDF = '/pdf';
    static const ROLE = '/role';
    static const EMAILVERIFICATION="/emailVerification";
            static const PHONEVERIFICATION="/phoneVerification";
      static const FORGOTPASSWORD="/forgotPassword";
       static const ENTEREMAIL="/enterEmail";
       static const HOSTELDETAIL='/hostelDetail';
        static const CHANGEPASSWORDVENDOR='/vendorChangePassword';
   //static const PROFILE = '/profile';
}