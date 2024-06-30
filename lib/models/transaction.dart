import 'package:flutter/material.dart';
import 'package:mopay_ewallet/models/user.dart';

enum TransactionType {
  expense,
  income,
  topup,
  transfer,
  payment,
  receive,
  pending,
  all,
}

class TransactionTypeUtil {
  static const Map<String, TransactionType> _stringToType = {
    "topup": TransactionType.topup,
    "transfer": TransactionType.transfer,
    "payment": TransactionType.payment,
    "receive": TransactionType.receive,
    "pending": TransactionType.pending,
    "expense": TransactionType.expense,
    "income": TransactionType.income,
    "all": TransactionType.all,
  };

  static TransactionType fromString(String type) {
    return _stringToType[type]!;
  }

  static String fromType(TransactionType type) {
    return _stringToType.keys.firstWhere(
      (k) => _stringToType[k] == type,
      orElse: () => "",
    );
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
      case TransactionType.income:
        return "Income";
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
    this.description = "",
    required this.createdAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['_id'],
      targetUser:
          json['targetUser'] == null ? null : User.fromJson(json['targetUser']),
      type: TransactionTypeUtil.fromString(json['type']),
      amount: json['amount'],
      description: json['description'] ?? "",
      createdAt: DateTime.parse(json['createdAt']).toLocal(),
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

class PendingPayment extends Transaction {
  final DateTime expiredAt;
  final Duration durationLeft;

  PendingPayment({
    required super.id,
    required super.targetUser,
    required super.type,
    required super.amount,
    required super.description,
    required super.createdAt,
    required this.expiredAt,
    required this.durationLeft,
  });

  factory PendingPayment.fromJson(Map<String, dynamic> json) {
    return PendingPayment(
      id: json['_id'],
      targetUser:
          json['targetUser'] == null ? null : User.fromJson(json['targetUser']),
      type: TransactionType.pending,
      amount: json['amount'],
      description: json['description'] ?? "Pembayaran kepada Travellingo",
      createdAt: DateTime.parse(json['createdAt']).toLocal(),
      expiredAt: DateTime.parse(json['expiredAt']).toLocal(),
      durationLeft:
          findDurationLeft(DateTime.parse(json['expiredAt']).toLocal()),
    );
  }

  static Duration findDurationLeft(DateTime expiredAt) {
    var now = DateTime.now();
    var duration = expiredAt.difference(now);
    return duration;
  }
}
