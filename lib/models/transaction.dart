import 'package:mopay_ewallet/models/user.dart';

enum TransactionType { topup, transfer, payment, receive }

class TransactionTypeUtil {
  static const Map<String, TransactionType> _stringToType = {
    "topup": TransactionType.topup,
    "transfer": TransactionType.transfer,
    "payment": TransactionType.payment,
    "receive": TransactionType.receive,
  };

  static TransactionType fromString(String type) {
    return _stringToType[type]!;
  }

  static String fromType(TransactionType type) {
    return type.toString().split('.').last;
  }
}

class Transaction {
  final String id;
  final User? targetUser;
  final TransactionType type;
  final int amount;
  final String description;
  final DateTime createdAt;

  Transaction({
    required this.id,
    this.targetUser,
    required this.type,
    required this.amount,
    required this.description,
    required this.createdAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['_id'],
      targetUser:
          json['targetUser'] == null ? null : User.fromJson(json['targetUser']),
      type: TransactionTypeUtil.fromString(json['type']),
      amount: json['amount'],
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Transaction copyWith({
    String? id,
    User? user,
    User? targetUser,
    TransactionType? type,
    int? amount,
    String? description,
    DateTime? createdAt,
  }) {
    return Transaction(
      id: id ?? this.id,
      targetUser: targetUser ?? this.targetUser,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
