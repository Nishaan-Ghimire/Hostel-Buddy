import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:propertyfinder/app/modules/add_property/view/add_property.dart';
import 'package:propertyfinder/app/modules/add_property/binding/add_property_binding.dart';
import 'package:propertyfinder/app/modules/change_password/binding/change_password_binding.dart';
import 'package:propertyfinder/app/modules/change_password/view/change_password.dart';
import 'package:propertyfinder/app/modules/edit_profile/binding/edit_profile_binding.dart';
import 'package:propertyfinder/app/modules/edit_profile/view/edit_profile_view.dart';
import 'package:propertyfinder/app/modules/home/binding/home_binding.dart';
import 'package:propertyfinder/app/modules/home/view/home_view.dart';
import 'package:propertyfinder/app/modules/home/view/subview/buy_premium_page.dart';
import 'package:propertyfinder/app/modules/home/view/subview/message_view.dart';
import 'package:propertyfinder/app/modules/property_details/binding/property_binding.dart';
import 'package:propertyfinder/app/modules/property_details/view/property_view.dart';
import 'package:propertyfinder/app/modules/search_page/binding/search_binding.dart';
import 'package:propertyfinder/app/modules/search_page/view/search_view.dart';
import 'package:propertyfinder/app/routes/app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

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
      name: _Paths.MESSAGE,
      page: () =>  Message(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PREMIUM,
      page: () =>  Premium(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGE,
      page: () =>  Message(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADDPROPERTY,
      page: () =>  AddPropertyView(),
      binding: AddPropertyBinding(),
    ),

        GetPage(
      name: _Paths.PROPERTYDETAILS,
      page: () =>  PropertyDetails(),
      binding: PropertyBinding(),
    ),

      GetPage(
      name: _Paths.SEARCHPAGE,
      page: () =>  SearchView(),
      binding: SearchBinding(),
    ),


      GetPage(
      name: _Paths.EDITPROFILE,
      page: () =>  EditProfileView(),
      binding: EditProfileBinding(),
    ),


        GetPage(
      name: _Paths.CHANGEPASSWORD,
      page: () =>  ChangePaswordView(),
      binding: ChangePasswordBinding(),
    ),
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
  static const PROFILE = '/profile';
  static const PREMIUM = '/premium';
  static const MESSAGE = '/message';
    static const ADDPROPERTY = '/addProperty';
       static const PROPERTYDETAILS = '/addProperty';
      // static const EDITPROPERTY = '/editproperty';
         static const SEARCHPAGE = '/searchpage';
         static const EDITPROFILE='/editProfile';
         static const CHANGEPASSWORD='/changePassword';
  static const SIGNIN = '/signin';
  static const SIGNUP = '/signup';
  static const FORGET_PASSWORD = '/forget-password';
  static const CHANGE_PASSWORD = '/change-password';
  static const WELCOME = '/welcome';
  static const SUPPORT = '/support';
  static const PRIVACY_POLICY = '/privacy-policy';
  static const EDIT_PROFILE = '/edit-profile';
  static const MOVIE_DETAILS = '/movie-details';
  static const BOOKING = '/booking';
  static const PDF = '/pdf';
   //static const PROFILE = '/profile';
}