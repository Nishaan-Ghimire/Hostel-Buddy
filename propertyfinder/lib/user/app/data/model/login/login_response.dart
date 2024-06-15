
class
  LoginModel{
int status;
String accesstoken;
String refreshToken;
String userName;
String role;
LoginModel(this.status,this.accesstoken,this.refreshToken,this.userName,this.role);
  }


// class LoginModel {
//     int ?statusCode;
//     Data ?data;
//     String ?message;
//     bool ?success;

//     LoginModel({
//         required this.statusCode,
//         required this.data,
//         required this.message,
//         required this.success,
//     });

// }

// class Data {
//     User ?user;
//     String ?accessToken;
//     String ?refreshToken;

//     Data({
//         required this.user,
//         required this.accessToken,
//         required this.refreshToken,
//     });

// }

// class User {
//     College ?college;
//     LocationCoordinates ?locationCoordinates;
//     String ?id;
//     String ?username;
//     String ?dob;
//     String ?phoneNo;
//     String ?email;
//     String ?fullName;
//     String ?fieldOfProfession;
//     String ?profileImage;
//     String ?role;
//     bool ?verified;
//     int ?v;

//     User({
//         required this.college,
//         required this.locationCoordinates,
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

// class College {
//     String ?longitude;
//     String ?latitude;

//     College({
//         required this.longitude,
//         required this.latitude,
//     });

// }

// class LocationCoordinates {
//     List<dynamic> ?coordinates;

//     LocationCoordinates({
//         required this.coordinates,
//     });

// }
