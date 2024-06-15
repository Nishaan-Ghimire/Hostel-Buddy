class EditProfileModel {
  int statusCode;
  CollegeData data;
  String message;
  bool success;

  EditProfileModel({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.success,
  });

  factory EditProfileModel.fromJson(Map<String, dynamic> json) {
    return EditProfileModel(
      statusCode: json['statusCode'],
      data: CollegeData.fromJson(json['data']),
      message: json['message'],
      success: json['success'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'data': data.toJson(),
      'message': message,
      'success': success,
    };
  }
}
class CollegeData {
  College college;
  LocationCoordinates locationCoordinates;
  String id;
  String username;
  String dob;
  String phoneNo;
  String email;
  String fullName;
  String fieldOfProfession;
  String profileImage;
  String role;
  bool verified;
  int v;

  CollegeData({
    required this.college,
    required this.locationCoordinates,
    required this.id,
    required this.username,
    required this.dob,
    required this.phoneNo,
    required this.email,
    required this.fullName,
    required this.fieldOfProfession,
    required this.profileImage,
    required this.role,
    required this.verified,
    required this.v,
  });

  factory CollegeData.fromJson(Map<String, dynamic> json) {
    return CollegeData(
      college: College.fromJson(json['college']),
      locationCoordinates: LocationCoordinates.fromJson(json['location_Coordinates']),
      id: json['_id'],
      username: json['username'],
      dob: json['dob'],
      phoneNo: json['phoneNo'],
      email: json['email'],
      fullName: json['fullName'],
      fieldOfProfession: json['fieldOfProfession'],
      profileImage: json['profileImage'],
      role: json['role'],
      verified: json['verified'],
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'college': college.toJson(),
      'location_Coordinates': locationCoordinates.toJson(),
      '_id': id,
      'username': username,
      'dob': dob,
      'phoneNo': phoneNo,
      'email': email,
      'fullName': fullName,
      'fieldOfProfession': fieldOfProfession,
      'profileImage': profileImage,
      'role': role,
      'verified': verified,
      '__v': v,
    };
  }
}
class College {
  String longitude;
  String latitude;

  College({
    required this.longitude,
    required this.latitude,
  });

  factory College.fromJson(Map<String, dynamic> json) {
    return College(
      longitude: json['longitude'],
      latitude: json['latitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'longitude': longitude,
      'latitude': latitude,
    };
  }
}
class LocationCoordinates {
  List<dynamic> coordinates;

  LocationCoordinates({
    required this.coordinates,
  });

  factory LocationCoordinates.fromJson(Map<String, dynamic> json) {
    return LocationCoordinates(
      coordinates: List<dynamic>.from(json['coordinates']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coordinates': coordinates,
    };
  }
}