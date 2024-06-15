// class SuggestedModel {
//     String ?id;
//     String ?hostelId;
//     String ?name;
//     String ?location;
//     int ?rent;
//     bool ?isAvailable;
//     String ?imageUrl;
//     List<Room> ?rooms;
//     int ?v;

//     SuggestedModel({
//         required this.id,
//         required this.hostelId,
//         required this.name,
//         required this.location,
//         required this.rent,
//         required this.isAvailable,
//         required this.imageUrl,
//         required this.rooms,
//         required this.v,
//     });

// }

// class Room {
//     String roomId;
//     List<Seat> seats;
//     String id;

//     Room({
//         required this.roomId,
//         required this.seats,
//         required this.id,
//     });

// }

// class Seat {
//     String seatId;
//     String id;

//     Seat({
//         required this.seatId,
//         required this.id,
//     });

// }

class SuggestedModel {
  final String hostelId;
  final String name;
  final String type;
  final String noOfSeater;
  final String city;
  final double lat;
  final double long;
  final String costPerMonth;
  final String mobile;
  final String photo;
  final String description;
  final String facilities;
  final String roomNo;
  final bool isAvailable;

  SuggestedModel({
    required 
    this.hostelId,
    required
     this.name,
   required
     this.type,
    required 
    this.noOfSeater,
    required 
    this.city,
    required 
    this.lat,
    required
     this.long,
    required 
    this.costPerMonth,
    required 
    this.mobile,
   required 
    this.photo,
    required 
    this.description,
    required
     this.facilities,
    required 
    this.roomNo,
    required 
    this.isAvailable
  });

 factory 
  SuggestedModel.fromJson(Map<String, dynamic> json) {
    return SuggestedModel(
      hostelId: json['_id'], // MongoDB auto-generated ID
      name: json['name'],
      type: json['type'],
      noOfSeater: json['noOfSeater'],
      city: json['city'],
      lat: json['lat'].toDouble(),
      long: json['long'].toDouble(),
      costPerMonth: json['costPerMonth'],
      mobile: json['mobile'],
      photo: json['photo'],
      description: json['description'],
      facilities: json['facilities'],
      roomNo: json['roomNo'],
      isAvailable: json['isAvailable']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': hostelId,
      'name': name,
      'type': type,
      'noOfSeater': noOfSeater,
      'city': city,
      'lat': lat,
      'long': long,
      'costPerMonth': costPerMonth,
      'mobile': mobile,
      'photo': photo,
      'description': description,
      'facilities': facilities,
      'roomNo': roomNo,
      'isAvailable':isAvailable
    };
  }
}