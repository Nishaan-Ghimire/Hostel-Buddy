import 'dart:convert';

import 'package:get/get.dart';
import 'package:propertyfinder/user/app/data/model/booking/booking_response.dart';
import 'package:propertyfinder/user/app/data/model/get_status/get_status.dart';
import 'package:propertyfinder/user/app/data/model/hostel_datail/hostel_detail.dart';
import 'package:propertyfinder/user/app/data/model/searc_mohel.dart/search_model.dart';
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
   // SuggestedModel ?log;
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
//search

Future<List<SearchModel?>> searchResult(var squery) async {
    List<SearchModel?>? detail;
     List<SearchModel>newModel=[];
     List<SearchModel> searchResults;
try {
       final response = await http.post(
        Uri.parse(HttpConfig.search),
        headers: Header.headers,
        body: jsonEncode({
           "squery":squery,
   
    }));
if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      if (jsonData is List) {
        searchResults = jsonData.map((item) => SearchModel.fromJson(item)).toList();
        for (var result in searchResults) {
          print('Name: ${result.name}, City: ${result.city}');
        }
        return searchResults;
      } else {
        print("JSON data is not a list.");
      }
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
  } catch (e) {
    print("Error: $e");
  }

  return [];
  
    }
//send booking request
Future<BookingRequestResponse?> sendBookingRequest(String username,String _id) async {
   //BookingRequestResponse? detail;
    
try {
       final response = await http.post(
        Uri.parse(HttpConfig.bookNow),
        headers: Header.headers,
        body: jsonEncode(
       {
    
    "username":username,
    "_id":_id
}
    ));
if (response.statusCode == 200) {
       Map<String, dynamic> jsonData = jsonDecode(response.body);
   BookingRequestResponse bookingRequest = BookingRequestResponse.fromJson(jsonData);
  return bookingRequest;
  
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
  } catch (e) {
    print("Error: $e");
  }

  
  
    }
    //get status
    Future <List<GetStatus?>?> getStatus(String hostel_id,String username) async {
   //BookingRequestResponse? detail;
    
try {
       final response = await http.post(
        Uri.parse(HttpConfig.getBookingStatus),
        headers: Header.headers,
        body: jsonEncode(
       {
    
    "hostel_id":hostel_id,
   // "uername":username
}
    ));
    print(response.body);
 if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      List<GetStatus> bookings = jsonData.map((item) => GetStatus.fromJson(item)).toList();

      // Filter bookings with status "pending"
      List<GetStatus> pendingBookings = bookings.where((booking) => booking.status == 'pending').toList();

      return pendingBookings;
    } else {
      throw Exception('Failed to load bookings');
    }
  } catch (e) {
    print("Error: $e");
  }

  
  
    }

}