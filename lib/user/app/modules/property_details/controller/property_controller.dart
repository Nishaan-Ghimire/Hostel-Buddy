
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
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
print('inintintintinit');
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
Future <void>  getPropertyDetails(String hostelId,String roomNo)async{
  print('#####################################################');
//propertDetail?.value=

var d=await HostelRepo.instance.propertyDetails(hostelId, roomNo);

print('d  $d');
//propertDetail?.value=d;
propertDetail=d;
ropertDetails.add(propertDetail!);
finalDetails=ropertDetails;

print('pdetai   $propertDetail');
//suggestedData.value=recentData!;
//print('resent data ........${recentData![0]!.imageUrl}.................................................');

 }
}