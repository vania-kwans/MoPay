import 'package:flutter/material.dart';

class MopayUserData {
  String nama;
  String noTelp;
  String email;
  String password;
  int saldo;

  MopayUserData({
    required this.nama,
    required this.email,
    required this.noTelp,
    required this.password,
    this.saldo = 0,
  });
}

class MopayUserDataProvider extends ChangeNotifier {
  MopayUserData currentUser =
      MopayUserData(nama: "", email: "", noTelp: "", password: "");

  List<MopayUserData> data = [
    MopayUserData(
      nama: "Christine",
      email: 'christine@gmail.com',
      noTelp: '083100000000',
      password: '123',
      saldo: 5000000,
    ),
    MopayUserData(
      nama: "Elly",
      email: 'elly@gmail.com',
      noTelp: '082100000000',
      password: '456',
      saldo: 5000000,
    ),
    MopayUserData(
      nama: "Vania",
      email: 'vania@gmail.com',
      noTelp: '085100000000',
      password: '789',
      saldo: 5000000,
    ),
  ];

  void setCurrentUser(int index) {
    currentUser = data[index];
  }

  void addSaldoforCurrentUser(int nominal) {
    currentUser.saldo = currentUser.saldo + nominal;
  }

  void subtractSaldoforCurrentUser(int nominal) {
    currentUser.saldo = currentUser.saldo - nominal;
  }

  void addUser(
      {required nama, required email, required noTelp, required password}) {
    data.add(MopayUserData(
      nama: nama,
      email: email,
      noTelp: noTelp,
      password: password,
    ));
  }
}
