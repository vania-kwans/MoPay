import 'package:flutter/material.dart';

class DataTransfer {
  int index;
  // String noTransaksi;
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
    required this.index,
    // required this.noTransaksi,
    required this.nama,
    required this.tanggal,
    required this.waktu,
    required this.transferKe,
    required this.noPenerima,
    required this.nominal,
    this.transferDari = "MoPay",
    required this.pesan,
    this.isFavorite = false,
  });
}

class DataTransferProvider extends ChangeNotifier {
  List<DataTransfer> dataTransfer = [
    DataTransfer(
      index: 1,
      nama: "Vania",
      tanggal: "31 Mar 2024",
      waktu: "18:44",
      transferKe: "OVO",
      noPenerima: "085123456789",
      nominal: 100000,
      pesan: '-',
      isFavorite: false,
    ),
    DataTransfer(
      index: 0,
      nama: "PT Tirta Investama",
      tanggal: "30 Mar 2024",
      waktu: "12:04",
      transferKe: "BCA",
      noPenerima: "151171717",
      nominal: 500000,
      pesan: 'Uang galon',
      isFavorite: false,
    ),
  ];

  void tambahData(String nama, String tanggal, String waktu, String transferKe,
      String noPenerima, int nominal, String pesan) {
    dataTransfer.insert(
      0,
      DataTransfer(
        index: dataTransfer.length,
        nama: nama,
        tanggal: tanggal,
        waktu: waktu,
        transferKe: transferKe,
        noPenerima: noPenerima,
        nominal: nominal,
        pesan: pesan,
      ),
    );
    notifyListeners();
  }
}
