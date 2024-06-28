import 'package:mopay_ewallet/utils/picture_type_util.dart';

class User {
  final String email;
  final String name;
  final String phoneNumber;
  final String id;
  final int balance;
  final String pictureLink;
  final PictureType pictureType;

  User({
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.id,
    required this.balance,
    this.pictureLink = "",
    this.pictureType = PictureType.none,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      email: json['email'] ?? "",
      name: json['name'] ?? "",
      phoneNumber: json['phoneNumber'] ?? "",
      balance: json['balance'] ?? 0,
      pictureLink: json['pictureLink'] ?? "",
      pictureType: PictureTypeUtil.fromString(json['pictureType']),
    );
  }

  User copyWith({
    String? email,
    String? name,
    String? phoneNumber,
    String? id,
    int? balance,
    String? pictureLink,
    PictureType? pictureType,
  }) {
    return User(
      email: email ?? this.email,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      id: id ?? this.id,
      balance: balance ?? this.balance,
      pictureLink: pictureLink ?? this.pictureLink,
      pictureType: pictureType ?? this.pictureType,
    );
  }
}
