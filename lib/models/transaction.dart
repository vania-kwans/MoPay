import 'package:flutter/material.dart';
import 'package:mopay_ewallet/models/user.dart';

enum TransactionType {
  topup,
  transfer,
  payment,
  receive,
  pending,
  all,
  expense
}

class TransactionTypeUtil {
  static const Map<String, TransactionType> _stringToType = {
    "topup": TransactionType.topup,
    "transfer": TransactionType.transfer,
    "payment": TransactionType.payment,
    "receive": TransactionType.receive,
    "pending": TransactionType.pending,
    "expense": TransactionType.expense,
    "all": TransactionType.all,
  };

  static TransactionType fromString(String type) {
    return _stringToType[type]!;
  }

  static String fromType(TransactionType type) {
    return type.toString().split('.').last;
  }

  static String fromTypeToHumanReadable(TransactionType type) {
    switch (type) {
      case TransactionType.expense:
        return "Expense";
      case TransactionType.topup:
        return "Top Up";
      case TransactionType.transfer:
        return "Transfer";
      case TransactionType.payment:
        return "Payment";
      case TransactionType.receive:
        return "Receive";
      case TransactionType.pending:
        return "Pending";
      case TransactionType.all:
        return "All";
    }
  }

  static Color fromTypeToColor(TransactionType type) {
    if (type == TransactionType.topup || type == TransactionType.receive) {
      return const Color(0xFF00C853);
    } else if (type == TransactionType.transfer ||
        type == TransactionType.payment) {
      return const Color(0xFFD32F2F);
    } else if (type == TransactionType.pending) {
      return Colors.amber.shade500;
    } else {
      return const Color(0xFF000000);
    }
  }

  static String? toQuery(TransactionType type) {
    switch (type) {
      case TransactionType.expense:
        return "expense";
      case TransactionType.topup:
        return "topup";
      case TransactionType.transfer:
        return "transfer";
      case TransactionType.payment:
        return "payment";
      case TransactionType.receive:
        return "receive";
      case TransactionType.pending:
        return "pending";
      case TransactionType.all:
        return null;
    }
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
