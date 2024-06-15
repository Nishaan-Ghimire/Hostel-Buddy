import 'dart:io';
import 'dart:typed_data';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:propertyfinder/user/app/data/model/media_model.dart';
import 'package:propertyfinder/vendor/app/data/models/hostel/add_hostel_model.dart';
import 'package:propertyfinder/vendor/app/data/repo/hostel_repo.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class AddHostel extends StatefulWidget {
   AddHostel({super.key});

  @override
  State<AddHostel> createState() => _AddHostelState();
}

class _AddHostelState extends State<AddHostel> {
 final MapTileLayerController _controller = MapTileLayerController();

 TextEditingController hostelName=TextEditingController();

 var noOfSeater=''.obs;

 var hostelType=''.obs;

TextEditingController city=TextEditingController();

var lat,long;

TextEditingController costPermonth=TextEditingController();

TextEditingController mobile=TextEditingController();
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
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
    //    physics: NeverScrollableScrollPhysics(),
        children: [
       
        
        SizedBox(height: 120,),
        
        Text('Enter  hostel name'),
        
        Container(
          height: 30,
          child: TextFormField(
controller: hostelName,
          )),
        Text('Type'),
     Obx(()=>   DropdownButton(
          hint: Text(hostelType.value??'selelct'),
          items: [
            DropdownMenuItem<String>(
                      child: Text('Boys hostel'),
                      value: ' Boys Hostel',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Girls hostel'),
                      value: ' Girls Hostel',
                    ),
        ], onChanged: (v){
          hostelType.value=v!;
          print(v);
        }),),
        Text('No of seater'),
       Obx(()=> DropdownButton(
          hint: Text(noOfSeater.value??''),
          items: [
            DropdownMenuItem<String>(
                      child: Text('1 seater'),
                      value: ' single seater',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('2 seater'),
                      value: ' 2 seater',
                    ),
      
         DropdownMenuItem<String>(
                      child: Text('3 seater'),
                      value: ' 3 seater',
                    ),
                       DropdownMenuItem<String>(
                      child: Text('4 seater'),
                      value: ' 4 seater',
                    ),
      
        ], onChanged: (v){

          noOfSeater.value=v!;
          print(v);
        }),),
    
        Text('Enter city'),
        
        TextFormField(

          controller: city,
        ),
        
        Text('Add location from map'),
        
      Container(
      height: 250,

      child: 
      OpenStreetMapSearchAndPick(
              buttonTextStyle: const TextStyle(fontSize: 18, fontStyle: FontStyle.normal),
              buttonColor: Colors.blue,
              buttonText: 'Set Current Location',
              onPicked: (pickedData) {
                lat=pickedData.latLong.latitude;
                long=pickedData.latLong.longitude;
                print(pickedData.latLong.latitude);
                print(pickedData.latLong.longitude);
                print(pickedData.address);
                print(pickedData.addressName);
                // Optionally, you can move the map controller to the picked location
                // _controller.tileLayers = [
                //   MapTileLayer(
                //     urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                //     initialZoomLevel: 12,
                //     initialFocalLatLng: pickedData.latLong,
                //   ),
                // ];
                _controller.notifyListeners();
              },
            ),
)
      
    
      //color: Colors.red,
      ,      
        Text('Enter cost per month'),
        
        
        
        TextFormField(controller:costPermonth ,),
       
      
      
      Text('Enter mobile no'),
        
        
        
        TextFormField(

          controller: mobile,
        ),
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

        Text('Description'),
        TextFormField(
          controller: description,
        ),
Text('Facilities'),
SizedBox(height: 10,),

Container(
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1,
                 //    color: AppColors.genderTextColor
                     ),
                  ),
                  child: TextFormField(
                    readOnly: true,
                    onTap: () {
                      Get.bottomSheet(StatefulBuilder(builder: (ctx, state) {
                        return Container(
                          width: double.infinity,
                          height: Get.width * 0.6,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10))
                                  ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceAround,
                                children: [
                                  selectedItem == 10
                                      ? Container()
                                      : SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          selectedItem = 0;
     if (selectedItemList.contains(0)) {
                                          selectedItemList.remove(0);
                                          }
                                          else{
selectedItemList.add(0);
                                          }



                                          state(() {});
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 10),
                                          decoration: BoxDecoration(
                                            color: selectedItemList.contains(0) 
                                                ? Colors.blue
                                                : Colors.black.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              " Parking ",
                                              style: TextStyle(
                                                  color: selectedItem != 0
                                                      ? Colors.black
                                                      : Colors.white),
                                            ),
                                          ),
                                        ),
                                      )),
                                  selectedItem == 10
                                      ? Container()
                                      : SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          selectedItem = 1;
                                          if (selectedItemList.contains(1)) {
                                            selectedItemList.remove(1);
                                          }
                                          else{
selectedItemList.add(1);
                                          }

                                         state(() {});
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 10),
                                          decoration: BoxDecoration(
                                            color:
                                             selectedItemList.contains(1) 
                                            // selectedItem == 0
                                                ? Colors.blue
                                                : Colors.black.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Wifi",
                                              style: TextStyle(
                                                  color: selectedItem != 1
                                                      ? Colors.black
                                                      : Colors.white),
                                            ),
                                          ),
                                        ),
                                      )),
                                  selectedItem == 10
                                      ? Container()
                                      : SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          selectedItem = 2;
                                      //    selectedItemList.add(2);

                                               if (selectedItemList.contains(2)) {
                                            selectedItemList.remove(2);
                                          }
                                          else{
selectedItemList.add(2);
                                          }
                                          state(() {
                                            
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 10),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color:  selectedItemList.contains(2) 
                                            
                                            //selectedItem == 1
                                                ? Colors.blue
                                                : Colors.black.withOpacity(0.1),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Water 24/7",
                                              style: TextStyle(
                                                  color: selectedItem != 2
                                                      ? Colors.black
                                                      : Colors.white),
                                            ),
                                          ),
                                        ),
                                      )),
                                  selectedItem == 10
                                      ? Container()
                                      : SizedBox(
                                    width: 10,
                                  ),

                                ],
                              ),
                              Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceAround,
                                children: [

                                  selectedItem == 10
                                      ? Container()
                                      : SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: InkWell(
                                        onTap: () {
                                           selectedItem = 3;
                                         //  selectedItemList.add(3);
                                                if (selectedItemList.contains(3)) {
                                            selectedItemList.remove(3);
                                          }
                                          else{
selectedItemList.add(3);
                                          }
                                          print(selectedItemList);
                                          state(() {
                                           
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 10),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: 
                                             selectedItemList.contains(3) 
                                            //selectedItem == 2
                                                ? Colors.blue
                                                : Colors.black.withOpacity(0.1),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Attached bathroom",
                                              style: TextStyle(
                                                  color: selectedItem != 3
                                                      ? Colors.black
                                                      : Colors.white),
                                            ),
                                          ),
                                        ),
                                      )),
                                  selectedItem == 10
                                      ? Container()
                                      : SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: InkWell(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 10),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: selectedItemList.contains(4) 
                                            
                                            // selectedItem == 3
                                                ? Colors.blue
                                                : Colors.black.withOpacity(0.1),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Balcony",
                                              style: TextStyle(
                                                  color: selectedItem != 3
                                                      ? Colors.black
                                                      : Colors.white),
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                           selectedItem = 4;
                                                if (selectedItemList.contains(4)) {
                                            selectedItemList.remove(4);
                                          }
                                          else{
selectedItemList.add(4);
                                          }


                                          state(() {
                                           
                                          });
                                        },
                                      )),
                                  selectedItem == 10
                                      ? Container()
                                      : SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  MaterialButton(
                                    minWidth: Get.width * 0.8,
                                    onPressed: () {

                                      print(selectedItemList);
                                      // frequencyEventController.text =
                                      // selectedItem == 0
                                      //     ? 'Parking':
                                      // selectedItem == 1
                                      //     ? 'Wifi'
                                      //     : selectedItem == 2
                                      //     ? 'Water 24/7'
                                      //     : selectedItem == 3
                                      //     ? 'Attach Bathroom'
                                      //     : 'Balcony';
                                      Get.back();
                                    },
                                    child: Text(
                                      "Select",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    color: Colors.blue,
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      }));
                    },
                    validator: (String? input) {
                      if (input!.isEmpty) {
                        Get.snackbar('Opps', "facility is required.",
                            colorText: Colors.white,
                            backgroundColor: Colors.blue);
                        return '';
                      }
                      return null;
                    },
                //    controller: frequencyEventController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 3),
                      errorStyle: TextStyle(fontSize: 0),
                      hintStyle: TextStyle(
                     //   color: AppColors.genderTextColor,
                      ),
                      border: InputBorder.none,
                      hintText: ' Click to  Select Facilities',
                      // prefixIcon: Image.asset(
                      //   'assets/repeat.png',
                      //   cacheHeight: 20,
                      // ),
                      // border: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(8.0)),
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                Text('Enter room no'),
                TextFormField(
                  controller: roomNo,
                ),
///////////////////////////////
        ElevatedButton(onPressed: ()async{
     //     print('${hostelName.text} ${hostelType} $noOfSeater ${city.text} $lat $long ${costPermonth.text} ${mobile.text} $photos ${description.text} $selectedItemList');
//print(media[0].image);

  




final cloudinary = CloudinaryPublic('dow3jpx74', 'iyeegie3', cache: false);
try {

  List <String> selectedValues=[];
  var finalValue;
  for(int i=0;i<selectedItemList.length;i++){
if ( selectedItemList.contains(i)) {
  
if (i==0) {
  selectedValues.add("Parking");
}else if(i==1){
selectedValues.add("Wifi");
}else if(i==2){
selectedValues.add("Water 24/7");
}else if(i==3){
selectedValues.add("Attached bathroom");
}else{
selectedValues.add("Balcony");
}

}
  }
 print(selectedValues);

for (var i = 0; i < selectedValues.length; i++) {
  finalValue="${selectedValues[i]},";
}
 print(finalValue);
    CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(media[0].image!.path, resourceType: CloudinaryResourceType.Image),
    );
    


HostelRepoVendor.instance.addHostel(AddHostelModel(hostelName.text, hostelType.value,
 noOfSeater.value,
 city.text, lat, long, costPermonth.text, mobile.text,
  response.secureUrl??'', description.text, finalValue??"", roomNo.text));

    print(response.secureUrl);
} on CloudinaryException catch (e) {
  print(e.message);
  print(e.request);
}
}, child: Center(child: Text('Submit'),),
        
        style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),
        
        )
        ,SizedBox(height: 100,)
        ],),
    );
  }
}