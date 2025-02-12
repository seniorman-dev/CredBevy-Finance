class UserRecord {
  final int id;
  final String fullname;
  final String image;

  UserRecord({required this.id, required this.fullname, required this.image});

  // Convert a JSON map into a UserRecord object
  factory UserRecord.fromJson(Map<String, dynamic> json) {
    return UserRecord(
      id: json['id'] ?? 0,
      fullname: json['fullname'] ?? '',
      image: json['image'] ?? '',
    );
  }

  // Convert a UserRecord object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullname': fullname,
      'image': image,
    };
  }
}

class UserResponse {
  final bool error;
  final String message;
  final List<UserRecord> data;

  UserResponse({required this.error, required this.message, required this.data});

  // Convert a JSON map into a UserResponse object
  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      error: json['error'] ?? false,
      message: json['message'] ?? '',
      data: (json['data'] as List)
          .map((record) => UserRecord.fromJson(record))
          .toList(),
    );
  }

  // Convert a UserResponse object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'message': message,
      'data': data.map((record) => record.toJson()).toList(),
    };
  }
}