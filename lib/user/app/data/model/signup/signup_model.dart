class SignupModel {
    int statusCode;
    DataSignup dataSignup;
    String message;
    bool success;

    SignupModel({
        required this.statusCode,
        required this.dataSignup,
        required this.message,
        required this.success,
    });

}

class DataSignup {
    CollegeSignup collegeSignup;
    LocationCoordinatesSignup locationCoordinatesSignup;
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

    DataSignup({
        required this.collegeSignup,
        required this.locationCoordinatesSignup,
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

}

class CollegeSignup {
    String longitude;
    String latitude;

    CollegeSignup({
        required this.longitude,
        required this.latitude,
    });

}

class LocationCoordinatesSignup {
    List<dynamic> coordinates;

    LocationCoordinatesSignup({
        required this.coordinates,
    });

}
