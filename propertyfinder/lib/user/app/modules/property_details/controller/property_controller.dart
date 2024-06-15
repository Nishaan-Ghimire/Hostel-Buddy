
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:propertyfinder/user/app/data/model/hostel_datail/hostel_detail.dart';
import 'package:propertyfinder/user/app/data/model/suggested/suggested_model.dart';
import 'package:propertyfinder/user/app/data/repo/hostel_repo.dart';
import 'package:propertyfinder/user/app/modules/property_details/view/property_view.dart';
     
class PropertyController extends GetxController {
  var items=<String>[].obs;

  var hostelId = ''.obs;
  var roomNo = ''.obs;
  @override
  void onInit(){
    super.onInit();

    final args = Get.arguments;
    if (args != null) {
      
hostelId.value = args['roomId'];
      roomNo.value = args['roomNo'];
    }
   getPropertyDetails(hostelId.value, roomNo.value) ;
   try {
     items.value =  finalDetails[0].facilities.split(',');
   } catch (e) {
     print(e);
   }
  }
//   @override
// void onInit() {
//     super.onInit();
//     // Called immediately after the controller is allocated in memory

//      final args = Get.arguments;
//     if (args != null) {
      
// hostelId.value = args['roomId'];
//       roomNo.value = args['roomNo'];
//     }
//    getPropertyDetails(hostelId.value, roomNo.value) ;

//     // Example: Fetching initial data

//   }
//Rx<PropertDetail?> ?propertDetail;
PropertDetail ?propertDetail;
var ropertDetails=<PropertDetail>[].obs;
var finalDetails=<PropertDetail>[].obs;

//var propertyDetail=PropertDetail(id: , name: name, type: type, noOfSeater: noOfSeater, city: city, lat: lat, long: long, costPerMonth: costPerMonth, mobile: mobile, photo: photo, description: description, facilities: facilities, roomNo: roomNo, isAvailable: isAvailable).obs;
//var propertyDetail=<PropertDetail>[];
Future <List<PropertDetail?>?>  getPropertyDetails(String hostelId,String roomNo)async{
  print('#####################################################');
//propertDetail?.value=

var d=await HostelRepo.instance.propertyDetails(hostelId, roomNo);

print('d  $d');
//propertDetail?.value=d;
propertDetail=d;
ropertDetails.add(propertDetail!);
finalDetails=ropertDetails;
getStatus(finalDetails[0].id);
print('pdetai   $propertDetail');
return finalDetails;
//suggestedData.value=recentData!;
//print('resent data ........${recentData![0]!.imageUrl}.................................................');

 }
 var requestSent=false.obs;
 bookNow(String id)async{
  final box = GetStorage();
var data=await HostelRepo.instance.sendBookingRequest(box.read('username'), id);
print('data$data');
if (data!=null) {
  requestSent.value=true;
}

 }
 var status="".obs;
 getStatus(String id)async{
  print('44444444444444444444444444444444444444444444444444444444');
  print( 'iiiiiiiiii  ${id}');
    final box = GetStorage();
    var username=box.read('username');
if (username!=null) {
  var data=await HostelRepo.instance.getStatus(id,username);
  for(int i=0;i<data!.length;i++){
    if (data[i]!.username==username) {
 status.value=data[i]!.status;
print('status$status');
      print('xa');
    }
  }

}

// if (data!=null) {
//   //requestSent.value=true;
// }
 }
}