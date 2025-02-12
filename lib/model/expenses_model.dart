class ExpenseRecord {
  final String month;
  final int amountSpent;

  ExpenseRecord({required this.month, required this.amountSpent});

  // Convert a JSON map into an ExpenseRecord object
  factory ExpenseRecord.fromJson(Map<String, dynamic> json) {
    return ExpenseRecord(
      month: json['month'] ?? '',
      amountSpent: json['amount_spent'] ?? 0,
    );
  }

  // Convert an ExpenseRecord object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'month': month,
      'amount_spent': amountSpent,
    };
  }
}

class Expenses {
  final bool error;
  final String message;
  final List<ExpenseRecord> data;

  Expenses({required this.error, required this.message, required this.data});

  // Convert a JSON map into an Expenses object
  factory Expenses.fromJson(Map<String, dynamic> json) {
    return Expenses(
      error: json['error'] ?? false,
      message: json['message'],
      data: (json['data'] as List)
          .map((record) => ExpenseRecord.fromJson(record))
          .toList(),
    );
  }

  // Convert an Expenses object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'message': message,
      'data': data.map((record) => record.toJson()).toList(),
    };
  }
}