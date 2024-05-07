import 'package:flutter/material.dart';

class DataBank {
  String nama;
  int jlhDigitNoRek;

  DataBank({
    required this.nama,
    required this.jlhDigitNoRek,
  });
}

class DataBankProvider extends ChangeNotifier {
  List<DataBank> dataBank = [
    DataBank(nama: "BCA", jlhDigitNoRek: 10),
    DataBank(nama: "Bank Mandiri", jlhDigitNoRek: 13),
    DataBank(nama: "BNI", jlhDigitNoRek: 10),
    DataBank(nama: "BRI", jlhDigitNoRek: 15),
    DataBank(nama: "BSI", jlhDigitNoRek: 10),
    DataBank(nama: "CIMB Niaga", jlhDigitNoRek: 14),
    DataBank(nama: "Bank Danamon", jlhDigitNoRek: 10),
    DataBank(nama: "Maybank", jlhDigitNoRek: 10),
    DataBank(nama: "OCBC NISP", jlhDigitNoRek: 12),
    DataBank(nama: "Bank Bukopin", jlhDigitNoRek: 10),
  ];
}
