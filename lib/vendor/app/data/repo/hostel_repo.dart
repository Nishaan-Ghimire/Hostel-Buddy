import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propertyfinder/user/app/routes/app_routes.dart';
import 'package:propertyfinder/vendor/app/core/http_config.dart';
import 'package:propertyfinder/vendor/app/data/models/hostel/add_hostel_model.dart';
import 'package:http/http.dart' as http;
import 'package:propertyfinder/vendor/app/data/models/hostel/added_hostel_response.dart';
class HostelRepoVendor extends GetxController {
static HostelRepoVendor get instance => Get.find();

Future<AddedHostelResponse?> addHostel(AddHostelModel model) async {
  print (model);
  print('...${model.name}......................................');
  try {
     var res=     await http.post(  Uri.parse(HttpConfig.addProperty)

,  headers: Header.headers,
        body: json.encode(
         {
          "name": model.name,
          "type": model.type,
          "noOfSeater": model.noOfSeater,
          "city": model.city,
          "lat": model.lat,
          "long": model.long,
          "costPerMonth": model.costPerMonth,
          "mobile":model.mobile,
          "photo": model.photo,
          "description": model.description,
          "facilities": model.facilities,
          "roomNo": model.roomNo,
          "isAvailable": true
        }
        ),
);
var data=jsonDecode(res.body);
print(data);
var addedData= AddedHostelResponse(status:data['Status'] ,message:data['Message'] );
if (addedData.status==201) {
  Get.snackbar('Property Added', 'Property  uploaded successfully.',
         colorText: Colors.white,backgroundColor: Colors.blue);
         Get.toNamed(Routes.vendorHome);
}
return addedData;
  } catch (e) {
    
  }
  
  
  


//     SuggestedModel ?log;
//     List<SuggestedModel>suggestedModel=[];
//         List<SuggestedModel>newModel=[];

//     try {
//        final response = await http.get(
//         Uri.parse(HttpConfig.getRecent),
//         headers: Header.headers,
        
//       );
// var data=jsonDecode(response.body);

// for (var i = 0; i < data.length; i++) {
//   print(i);

// suggestedModel.add(

//   SuggestedModel(hostelId:data[i]['hostelId'] as String, id:data[i]['_id'] as String , 
//   name: data[i]['name'] as String ,
//    location: data[i]['location'] as String , rent: data[i]['rent'] as int ,
//   isAvailable: data[i]['isAvailable'] as bool, imageUrl: data[i]['imageUrl'] as String, 
//  rooms: [
//  for(int j=0;j<data[i]['rooms'].length;j++) Room(roomId: data[i]['rooms'][j]['roomId'] as String,
//   seats: [
//      for(int k=0;k<data[i]['rooms'].length;k++)Seat(
//       seatId: data[i]['rooms'][j]['seats'][k]['seatId'] as String,
//       id: data[i]['rooms'][j]['seats'][k]['_id'] as String)
//   ], id: data[i]['rooms'][j]['_id'] as String)
 
//  ], v: data[i]['__v'] as int)
// );
// newModel=suggestedModel;

// }
// // log=SuggestedModel(hostelId: , id: , name: '', location: '', rent: null,
// //  isAvailable: null, imageUrl: '', 
// // rooms: [], v: null,);
//       print(response.body);
//       return  newModel;

//     } catch (e) {
      
//     }
    }

}