// class SignupModel {
//     int statusCode;
//     DataSignup dataSignup;
//     String message;
//     bool success;

//     SignupModel({
//         required this.statusCode,
//         required this.dataSignup,
//         required this.message,
//         required this.success,
//     });

// }

// class DataSignup {
//     CollegeSignup collegeSignup;
//     LocationCoordinatesSignup locationCoordinatesSignup;
//     String id;
//     String username;
//     String dob;
//     String phoneNo;
//     String email;
//     String fullName;
//     String fieldOfProfession;
//     String profileImage;
//     String role;
//     bool verified;
//     int v;

//     DataSignup({
//         required this.collegeSignup,
//         required this.locationCoordinatesSignup,
//         required this.id,
//         required this.username,
//         required this.dob,
//         required this.phoneNo,
//         required this.email,
//         required this.fullName,
//         required this.fieldOfProfession,
//         required this.profileImage,
//         required this.role,
//         required this.verified,
//         required this.v,
//     });

// }

// class CollegeSignup {
//     String longitude;
//     String latitude;

//     CollegeSignup({
//         required this.longitude,
//         required this.latitude,
//     });

// }

// class LocationCoordinatesSignup {
//     List<dynamic> coordinates;

//     LocationCoordinatesSignup({
//         required this.coordinates,
//     });

// }
class User {
  final String id;
  final String username;
  final String dob;
  final String phoneNo;
  final String email;
  final String fullName;
  final String fieldOfProfession;
  final String profileImage;
  final String hostelName;
  final String role;
  final bool verified;
  final College college;
  final KycDocuments kycDocuments;
  final LocationCoordinates locationCoordinates;

  User({
    required this.id,
    required this.username,
    required this.dob,
    required this.phoneNo,
    required this.email,
    required this.fullName,
    required this.fieldOfProfession,
    required this.profileImage,
    required this.hostelName,
    required this.role,
    required this.verified,
    required this.college,
    required this.kycDocuments,
    required this.locationCoordinates,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      username: json['username'],
      dob: json['dob'],
      phoneNo: json['phoneNo'],
      email: json['email'],
      fullName: json['fullName'],
      fieldOfProfession: json['fieldOfProfession'],
      profileImage: json['profileImage'],
      hostelName: json['HostelName'] ?? '',
      role: json['role'],
      verified: json['verified'],
      college: College.fromJson(json['college']),
      kycDocuments: KycDocuments.fromJson(json['kyc_documents']),
      locationCoordinates: LocationCoordinates.fromJson(json['location_Coordinates']),
    );
  }
}

class College {
  final String longitude;
  final String latitude;

  College({required this.longitude, required this.latitude});

  factory College.fromJson(Map<String, dynamic> json) {
    return College(
      longitude: json['longitude'],
      latitude: json['latitude'],
    );
  }
}

class KycDocuments {
  final String hostelCertificate;
  final String panCard;

  KycDocuments({required this.hostelCertificate, required this.panCard});

  factory KycDocuments.fromJson(Map<String, dynamic> json) {
    return KycDocuments(
      hostelCertificate: json['hostel_certificate'],
      panCard: json['pan_card'],
    );
  }
}

class LocationCoordinates {
  final List<double> coordinates;

  LocationCoordinates({required this.coordinates});

  factory LocationCoordinates.fromJson(Map<String, dynamic> json) {
    return LocationCoordinates(
      coordinates: List<double>.from(json['coordinates']),
    );
  }
}
class SignUpResponse {
  final int statusCode;
  final User data;
  final String message;
  final bool success;

  SignUpResponse({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.success,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      statusCode: json['statusCode'],
      data: User.fromJson(json['data']),
      message: json['message'],
      success: json['success'],
    );
  }
}