class PropertDetail {
  String id;
  String name;
  String type;
  String noOfSeater;
  String city;
  double lat;
  double long;
  String costPerMonth;
  String mobile;
  String photo;
  String description;
  String facilities;
  String roomNo;
  bool isAvailable;

  PropertDetail({
    required this.id,
    required this.name,
    required this.type,
    required this.noOfSeater,
    required this.city,
    required this.lat,
    required this.long,
    required this.costPerMonth,
    required this.mobile,
    required this.photo,
    required this.description,
    required this.facilities,
    required this.roomNo,
    required this.isAvailable,
  });

  // factory PropertDetail.fromJson(Map<String, dynamic> json) {
  //   return PropertDetail(
  //     id: json['_id'],
  //     name: json['name'],
  //     type: json['type'],
  //     noOfSeater: json['noOfSeater'],
  //     city: json['city'],
  //     lat: json['lat'].toDouble(),
  //     long: json['long'].toDouble(),
  //     costPerMonth: json['costPerMonth'],
  //     mobile: json['mobile'],
  //     photo: json['photo'],
  //     description: json['description'],
  //     facilities: json['facilities'],
  //     roomNo: json['roomNo'],
  //     isAvailable: json['isAvailable'],
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     '_id': id,
  //     'name': name,
  //     'type': type,
  //     'noOfSeater': noOfSeater,
  //     'city': city,
  //     'lat': lat,
  //     'long': long,
  //     'costPerMonth': costPerMonth,
  //     'mobile': mobile,
  //     'photo': photo,
  //     'description': description,
  //     'facilities': facilities,
  //     'roomNo': roomNo,
  //     'isAvailable': isAvailable,
  //   };
  // }
}