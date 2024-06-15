import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:propertyfinder/user/app/data/model/media_model.dart';
import 'package:propertyfinder/user/app/routes/app_routes.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../data/repo/auth_repo.dart';

class SignupController extends GetxController {

  final obscurePassword = true.obs;
  final obscureConfirmPassword = true.obs;

  var password = TextEditingController();
  var dob = TextEditingController();
  var fullName = TextEditingController();
  var jobStatus = TextEditingController();
  var mobileNumber = TextEditingController();
  var emailAddress = TextEditingController();
    var userName = TextEditingController();
        var profession = TextEditingController();
    var collegename = TextEditingController();
        var hostelname = TextEditingController();


var jobStaus="Student".obs;
var professions="IT".obs;
var collegeName=''.obs;
var role="user".obs;
var kyc="".obs;
var pan="".obs
;
//var hostelname="".obs;





var   selectedDate="".obs;

  Future<void> signupProcess() async {

     var registerResponse = await AuthRepository.instance.
     register(fullName: fullName.text, dob: dob.text, userName: userName.text,
      email: emailAddress.text,
      phoneNo: mobileNumber.text, password: password.text,
       college: collegename.text, company: '', 
      jobstatus: jobStaus.value
     
     // jobStatus.text
      , collegelongitude: '', collegelatitude: '', 
      fieldOfProfession:professions.value,
      
      // profession.text,
      role: "User");
      print(registerResponse?.statusCode);
       //     print(registerResponse?.data.email);

//print('register response${registerResponse!.data!.college!.longitude}  status ${registerResponse!.statusCode.toString()}');
if (registerResponse?.statusCode == 201) {
  print('registered successfully');
     Get.snackbar('Signup Sucess', 'Account Created Successfully.',
         colorText: Colors.white,backgroundColor: Colors.blue);
    Get.offAllNamed(Routes.SIGNIN);
}
else{
 Get.snackbar('Signup Error', 'Something went wrong.',
         colorText: Colors.white,backgroundColor: Colors.blue);
  print('something went wrong');
}


  }


  ///////////////
  ///
  ///
  var photos;
TextEditingController roomNo=TextEditingController();
TextEditingController description=TextEditingController();

var facilities;

//  List <int> selectedItemList=[];
   var selectedItem = -2;

    TextEditingController frequencyEventController = TextEditingController();
  //List<MediaModel> media = [];
  var media=<MediaModel> [].obs;
    var kycmedia=<MediaModel> [].obs;
 void mediaDialog(BuildContext context) {
    showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Select Media Type"),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                    //  Navigator.pop(context);
                      imageDialog(context, true);
                    },
                    icon: Icon(Icons.image)),
                IconButton(
                    onPressed: () {
                    //  Navigator.pop(context);
                      imageDialog(context, false);
                    },
                    icon: Icon(Icons.slow_motion_video_outlined)),
              ],
            ),
          );
        },
        context: context);
  }

  void imageDialog(BuildContext context, bool image) {
    showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Media Source"),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      if (image) {
                        getImageDialog(ImageSource.gallery);
                      } else {
                //        getVideoDialog(ImageSource.gallery);
                      }
                    },
                    icon: Icon(Icons.image)),
                IconButton(
                    onPressed: () {
                      if (image) {
                        getImageDialog(ImageSource.camera);
                      } else {
                    //    getVideoDialog(ImageSource.camera);
                      }
                    },
                    icon: Icon(Icons.camera_alt)),
              ],
            ),
          );
        },
        context: context);
  }

   getImageDialog(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(
      source: source,
    );

    if (image != null) {
      media.add(MediaModel(
        image: File(image.path),
        video: null,
        isVideo: false
      ));

    }

  //   setState(() {});
  //  // Navigator.pop(context);
  // }

  getVideoDialog(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? video = await _picker.pickVideo(
      source: source,
    );

    if (video != null) {


      // media.add(File(image.path));

      Uint8List? uint8list = await VideoThumbnail.thumbnailData(
        video: video.path,
        imageFormat: ImageFormat.JPEG,
        quality: 75,
      );

      media.add(MediaModel(
          thumbnail: uint8list!,
          video: File(video.path),
          isVideo: true
      ));
      // thumbnail.add(uint8list!);
      //
      // isImage.add(false);
    }

    // print(thumbnail.first.path);
    // setState(() {});

    // Navigator.pop(context);
  }}
}