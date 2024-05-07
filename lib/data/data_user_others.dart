import 'package:flutter/material.dart';

class OtherUserPhoneNumber {
  String nama;
  String noTelp;

  OtherUserPhoneNumber({
    required this.nama,
    required this.noTelp,
  });
}

class OtherUserBankAccount {
  String nama;
  String noRekening;
  String namaBank;

  OtherUserBankAccount({
    required this.nama,
    required this.noRekening,
    required this.namaBank,
  });
}

class OtherUserBankAccountProvider extends ChangeNotifier {
  List<OtherUserBankAccount> data = [
    OtherUserBankAccount(
      nama: "",
      noRekening: '',
      namaBank: "",
    ),
    OtherUserBankAccount(
      nama: "",
      noRekening: '',
      namaBank: "",
    ),
    OtherUserBankAccount(
      nama: "",
      noRekening: '',
      namaBank: "",
    ),
  ];
}
