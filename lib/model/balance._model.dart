class Balance {
  final bool error;
  final String message;
  final double data;

  Balance({
    required this.error,
    required this.message,
    required this.data,
  });

  factory Balance.fromJson(Map<String, dynamic> json) {
    return Balance(
      error: json['error'] ?? false,
      message: json['message'] ?? "",
      data: (json['data'] ) ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'message': message,
      'data': data,
    };
  }
}
