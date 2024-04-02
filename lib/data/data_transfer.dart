import 'package:flutter/material.dart';

class DataTransfer {
  String nama;
  int nominal;
  String transferDari;
  String transferKe;
  String noPenerima;
  String tanggal;
  String waktu;
  String pesan;
  bool isFavorite;

  DataTransfer({
    required this.nama,
    required this.tanggal,
    required this.waktu,
    required this.transferKe,
    required this.noPenerima,
    this.nominal = 0,
    this.transferDari = "OVO",
    this.pesan = "-",
    this.isFavorite = false,
  });
}

class DataTransferProvider extends ChangeNotifier {
  List<DataTransfer> dataTransfer = [
    DataTransfer(
      nama: "Vania",
      tanggal: "31 Mar 2024",
      waktu: "18:44",
      transferKe: "OVO",
      noPenerima: "085123456789",
      nominal: 100000,
      isFavorite: false,
    ),
    DataTransfer(
      nama: "PT Tirta Investama",
      tanggal: "30 Mar 2024",
      waktu: "12:04",
      transferKe: "BCA",
      noPenerima: "151171717",
      nominal: 500000,
      isFavorite: false,
    ),
  ];
}
