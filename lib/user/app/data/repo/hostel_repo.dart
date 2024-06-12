import 'dart:convert';

import 'package:get/get.dart';
import 'package:propertyfinder/user/app/data/model/hostel_datail/hostel_detail.dart';
import 'package:propertyfinder/user/app/data/model/suggested/suggested_model.dart';
import 'package:http/http.dart' as http;
import 'package:propertyfinder/vendor/app/core/http_config.dart';
class HostelRepo extends GetxController {
static HostelRepo get instance => Get.find();


//recent

Future<List<SuggestedModel?>?> getRecent() async {


    SuggestedModel ?log;
    List<SuggestedModel>suggestedModel=[];
        List<SuggestedModel>newModel=[];

    try {
       final response = await http.get(
        Uri.parse(HttpConfig.getRecent),
        headers: Header.headers,
        
      );
var data=jsonDecode(response.body);

for (var i = 0; i < data.length; i++) {
  print(i);

suggestedModel.add(
SuggestedModel(hostelId: data[i]['_id'], name: data[i]['name'], 
type: data[i]['type'], 
noOfSeater: data[i]['noOfSeater'], city: data[i]['city'], lat: data[i]['lat'], 
long: data[i]['long'], 
costPerMonth: data[i]['costPerMonth'], mobile: data[i]['mobile'], 
photo: data[i]['photo'],
 description: data[i]['description'], facilities: data[i]['facilities'], 
 roomNo: data[i]['roomNo'],isAvailable: data[i]['isAvailable'])
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
);
newModel=suggestedModel;

}
// log=SuggestedModel(hostelId: , id: , name: '', location: '', rent: null,
//  isAvailable: null, imageUrl: '', 
// rooms: [], v: null,);
      print(response.body);
      return  newModel;

    } catch (e) {
      
    }
    }

    //suggested

Future<List<SuggestedModel?>?> getSuggested() async {
    SuggestedModel ?log;
    List<SuggestedModel>suggestedModel=[];
        List<SuggestedModel>newModel=[];

    try {
       final response = await http.get(
        Uri.parse(HttpConfig.getRecent),
        headers: Header.headers,
        
      );
var data=jsonDecode(response.body);

for (var i = 0; i < data.length; i++) {
  print(i);

suggestedModel.add(

  SuggestedModel(hostelId: data[i]['_id'], name: data[i]['name'], 
type: data[i]['type'], 
noOfSeater: data[i]['noOfSeater'], city: data[i]['city'], lat: data[i]['lat'], 
long: data[i]['long'], 
costPerMonth: data[i]['costPerMonth'], mobile: data[i]['mobile'], 
photo: data[i]['photo'],
 description: data[i]['description'], facilities: data[i]['facilities'], 
 roomNo: data[i]['roomNo'],isAvailable: data[i]['isAvailable'])
);
newModel=suggestedModel;

}
// log=SuggestedModel(hostelId: , id: , name: '', location: '', rent: null,
//  isAvailable: null, imageUrl: '', 
// rooms: [], v: null,);
      print(response.body);
      return  newModel;

    } catch (e) {
      
    }
    }



//get details page

Future<PropertDetail?> propertyDetails(var hostelid,var roomNo) async {
    PropertDetail ?detail;
    var resData;
    print('000000000000000000000000000000000000000000000');
try {
       final response = await http.post(
        Uri.parse(HttpConfig.propertyDetail),
        headers: Header.headers,
        body: jsonEncode({
           "id":hostelid,
    "roomNo":roomNo
    }));
      print('resres ${response.body}');
var data=await jsonDecode(response.body);

//print(data);

detail=PropertDetail(
  id: data['_id'] as String, name: data['name'] as String, type: data['type'] as String,
   noOfSeater: data['noOfSeater'] as String,
 city: data['city'] as String, lat: data['lat'] as double, long: data['long'] as double, 
 costPerMonth: data['costPerMonth'] as String, 
 mobile: data['mobile'] as String, 
 photo: data['photo'] as String, description: data['description'] as String,
  facilities: data['facilities'] as String, 
 roomNo: data['roomNo'] as String,
  isAvailable: data['isAvailable'] as bool
  );

  //print (detail.id);
  resData=detail;

  
return resData;
    } catch (e) {
      
    }
    }



}