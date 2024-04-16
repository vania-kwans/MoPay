import 'package:flutter/material.dart';

class UserData {
  String nama;
  String noTelp;
  String email;
  int saldo;

  UserData({
    required this.nama,
    required this.email,
    required this.noTelp,
    this.saldo = 0,
  });
}

class UserDataProvider extends ChangeNotifier {
  List<UserData> data = [
    UserData(
      nama: "Christine",
      email: 'christine@gmail.com',
      noTelp: '083100000000',
      saldo: 5000000,
    ),
    UserData(
      nama: "Elly",
      email: 'elly@gmail.com',
      noTelp: '082100000000',
      saldo: 5000000,
    ),
    UserData(
      nama: "Vania",
      email: 'vania@gmail.com',
      noTelp: '085100000000',
      saldo: 5000000,
    ),
  ];
}
