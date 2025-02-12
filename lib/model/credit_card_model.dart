class CreditCard {
  final bool error;
  final String message;
  final List<CardData> data;

  CreditCard({
    required this.error,
    required this.message,
    required this.data,
  });

  factory CreditCard.fromJson(Map<String, dynamic> json) {
    return CreditCard(
      error: json['error'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>).map((e) => CardData.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'message': message,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class CardData {
  final int id;
  final String cardNumber;
  final String cardType;
  final double balance;
  final String name;
  final String bankName;
  final String expiryDate;

  CardData({
    required this.id,
    required this.cardNumber,
    required this.cardType,
    required this.balance,
    required this.name,
    required this.bankName,
    required this.expiryDate,
  });

  factory CardData.fromJson(Map<String, dynamic> json) {
    return CardData(
      id: json['id'] as int,
      cardNumber: json['card_number'] as String,
      cardType: json['card_type'] as String,
      balance: (json['balance'] as num).toDouble(),
      name: json['name'] as String,
      bankName: json['bank_name'] as String,
      expiryDate: json['expiry_date'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'card_number': cardNumber,
      'card_type': cardType,
      'balance': balance,
      'name': name,
      'bank_name': bankName,
      'expiry_date': expiryDate,
    };
  }
}
