class ChangePassword {
  int statusCode;
  Data data;
  String message;
  bool success;

  ChangePassword({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.success,
  });

  factory ChangePassword.fromJson(Map<String, dynamic> json) {
    return ChangePassword(
      statusCode: json['statusCode'],
      data: Data.fromJson(json['data']),
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
class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}