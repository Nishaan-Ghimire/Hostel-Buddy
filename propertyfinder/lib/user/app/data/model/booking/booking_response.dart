class BookingRequestResponse {
  String id;
  String hostelId;
  String username;
  String addedBy;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  BookingRequestResponse({
    required this.id,
    required this.hostelId,
    required this.username,
    required this.addedBy,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  // Factory method to create an instance from JSON
  factory BookingRequestResponse.fromJson(Map<String, dynamic> json) {
    return BookingRequestResponse(
      id: json['_id'],
      hostelId: json['hostel_id'],
      username: json['username'],
      addedBy: json['addedBy'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      v: json['__v'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'hostel_id': hostelId,
      'username': username,
      'addedBy': addedBy,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}