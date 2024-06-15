import 'dart:io';
import 'dart:typed_data';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:propertyfinder/user/app/data/model/media_model.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class AddPhoto extends StatefulWidget {
   AddPhoto({super.key});

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {



  List<MediaModel> media = [];
var photos;
TextEditingController roomNo=TextEditingController();
TextEditingController description=TextEditingController();

var facilities;

//  List <int> selectedItemList=[];
   var selectedItem = -2;

    TextEditingController frequencyEventController = TextEditingController();

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
                        getVideoDialog(ImageSource.gallery);
                      }
                    },
                    icon: Icon(Icons.image)),
                IconButton(
                    onPressed: () {
                      if (image) {
                        getImageDialog(ImageSource.camera);
                      } else {
                        getVideoDialog(ImageSource.camera);
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

    setState(() {});
   // Navigator.pop(context);
  }

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
    setState(() {});

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    List <int> selectedItemList=[];
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
      //    physics: NeverScrollableScrollPhysics(),
          children: [
         
          
          SizedBox(height: 120,),
        
      
      
        
      
        //color: Colors.red,
        
           Text('Upload Photos'),
          Container(
            height: 50,
            child: GestureDetector(onTap: (){
                    mediaDialog(context);
            },
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.add)),
            )),
      
      
            
          SizedBox(height: 5,),
        media.length == 0
                      ? Container()
                      : Container(
                    width: Get.width,
                    height: Get.width * 0.3,
                    child: ListView.builder(
                        itemBuilder: (ctx, i) {
                          return
                              media[i].isVideo!
                            //!isImage[i]
                              ? Container(
                            width: Get.width * 0.3,
                            height: Get.width * 0.3,
                            margin: EdgeInsets.only(
                                right: 15, bottom: 10, top: 10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: MemoryImage(media[i].thumbnail!),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: CircleAvatar(
                                        child: IconButton(
                                          onPressed: () {
                                            media.removeAt(i);
                                            // media.removeAt(i);
                                            // isImage.removeAt(i);
                                            // thumbnail.removeAt(i);
                                            setState(() {});
                                          },
                                          icon: Icon(Icons.close),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.slow_motion_video_rounded,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                )
                              ],
                            ),
                          )
                              : Container(
                            width: Get.width * 0.3,
                            height: Get.width * 0.3,
                            margin: EdgeInsets.only(
                                right: 15, bottom: 10, top: 10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: FileImage(media[i].image!),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: CircleAvatar(
                                    child: IconButton(
                                      onPressed: () {
                                        media.removeAt(i);
                                        // isImage.removeAt(i);
                                        // thumbnail.removeAt(i);
                                        setState(() {});
                                      },
                                      icon: Icon(Icons.close),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        itemCount: media.length,
                        scrollDirection: Axis.horizontal),
                  ),
      
      
             
      //         ElevatedButton(onPressed: ()async{
      //      //     print('${hostelName.text} ${hostelType} $noOfSeater ${city.text} $lat $long ${costPermonth.text} ${mobile.text} $photos ${description.text} $selectedItemList');
      // //print(media[0].image);
      
        
      
      
      
      
      // final cloudinary = CloudinaryPublic('dow3jpx74', 'iyeegie3', cache: false);
      // try {
      
        
      
      
      //     CloudinaryResponse response = await cloudinary.uploadFile(
      //         CloudinaryFile.fromFile(media[0].image!.path, resourceType: CloudinaryResourceType.Image),
      //     );
      
      
      
      // // HostelRepoVendor.instance.AddPhoto(AddPhotoModel(hostelName.text, hostelType.value,
      // //  noOfSeater.value,
      // //  city.text, lat, long, costPermonth.text, mobile.text,
      // //   response.secureUrl??'', description.text, finalValue??"", roomNo.text));
      
      //     print(response.secureUrl);
      // } on CloudinaryException catch (e) {
      //   print(e.message);
      //   print(e.request);
      // }
      // }, child: Center(child: Text('Submit'),),
          
      //         style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),
          
      //         )
          //,
          SizedBox(height: 100,)
          ],),
      ),
    );
  }
}