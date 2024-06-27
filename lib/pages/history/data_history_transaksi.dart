import 'package:flutter/material.dart';

class DataTransaksi {
  String tipeTransaksi;
  String noTransaksi;
  int nominal;
  String tanggal;
  String waktu;

  DataTransaksi({
    required this.tipeTransaksi,
    required this.noTransaksi,
    required this.nominal,
    required this.tanggal,
    required this.waktu,
  });
}

class DataTransferKeluar extends DataTransaksi {
  String transferDari;
  String transferKe;
  String namaPenerima;
  String noPenerima;
  String pesan;

  DataTransferKeluar({
    super.tipeTransaksi = 'Transfer Keluar',
    required super.noTransaksi,
    required super.nominal,
    required super.tanggal,
    required super.waktu,
    this.transferDari = "OVO",
    required this.transferKe,
    required this.namaPenerima,
    required this.noPenerima,
    required this.pesan,
  });
}

class DataTransferMasuk extends DataTransaksi {
  String transferDari;
  String namaPengirim;
  String noPenerima;
  String pesan;

  DataTransferMasuk({
    super.tipeTransaksi = 'Transfer Masuk',
    required super.noTransaksi,
    required super.nominal,
    required super.tanggal,
    required super.waktu,
    required this.transferDari,
    required this.namaPengirim,
    required this.noPenerima,
    required this.pesan,
  });
}

class DataTopUp extends DataTransaksi {
  String topUpDari;

  DataTopUp({
    super.tipeTransaksi = 'Top Up',
    required super.noTransaksi,
    required super.nominal,
    required super.tanggal,
    required super.waktu,
    required this.topUpDari,
  });
}

// Saldo di Home harusnya Rp547.500
class DataHistoryProvider extends ChangeNotifier {
  List<DataTransaksi> dataHistory = [
    DataTransferKeluar(
      noTransaksi: 'MTO3003202411',
      namaPenerima: "PT Tirta Investama",
      tanggal: "13 May 2024",
      waktu: "12:04",
      transferKe: "BCA",
      noPenerima: "151171717",
      nominal: 202500,
      pesan: 'Uang galon',
    ),
    DataTransferMasuk(
      noTransaksi: 'MTI3003202411',
      nominal: 500000,
      tanggal: "12 May 2024",
      waktu: "17.12",
      transferDari: "Maybank",
      namaPengirim: "Ibu Juni",
      noPenerima: "1234567890",
      pesan: 'Uang kue kemarin ya',
    ),
    DataTransferMasuk(
      noTransaksi: 'MTI3003202411',
      nominal: 500000,
      tanggal: "7 May 2024",
      waktu: "17.12",
      transferDari: "Maybank",
      namaPengirim: "Ibu Juni",
      noPenerima: "1234567890",
      pesan: 'Uang kue kemarin ya',
    ),
    DataTransferMasuk(
      noTransaksi: 'MTI3003202411',
      nominal: 500000,
      tanggal: "3 May 2024",
      waktu: "17.12",
      transferDari: "Maybank",
      namaPengirim: "Ibu Juni",
      noPenerima: "1234567890",
      pesan: 'Uang kue kemarin ya',
    ),
    DataTransferKeluar(
      noTransaksi: 'MTO3103202412',
      namaPenerima: "Vania",
      tanggal: "31 Mar 2024",
      waktu: "18:44",
      transferKe: "OVO",
      noPenerima: "085123456789",
      nominal: 50000,
      pesan: '-',
    ),
    DataTransferKeluar(
      noTransaksi: 'MTO3003202411',
      namaPenerima: "PT Tirta Investama",
      tanggal: "30 Mar 2024",
      waktu: "12:04",
      transferKe: "BCA",
      noPenerima: "151171717",
      nominal: 202500,
      pesan: 'Uang galon',
    ),
    DataTopUp(
      noTransaksi: 'MTU1902109876',
      nominal: 300000,
      tanggal: "02 Feb 2023",
      waktu: "12.48",
      topUpDari: "ATM BCA",
    ),
    DataTopUp(
      noTransaksi: 'MTU1902109876',
      nominal: 300000,
      tanggal: "02 Feb 2023",
      waktu: "12.48",
      topUpDari: "ATM BCA",
    ),
  ];

  void tambahDataTransferKeluar(
      String noTransaksi,
      String nama,
      int nominal,
      String tanggal,
      String waktu,
      String transferKe,
      String noPenerima,
      String pesan) {
    dataHistory.insert(
      0,
      DataTransferKeluar(
        noTransaksi: noTransaksi,
        namaPenerima: nama,
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

  void tambahDataTopUp(
    String noTransaksi,
    int nominal,
    String tanggal,
    String waktu,
    String topUpDari,
  ) {
    dataHistory.insert(
      0,
      DataTopUp(
          noTransaksi: noTransaksi,
          nominal: nominal,
          tanggal: tanggal,
          waktu: waktu,
          topUpDari: topUpDari),
    );
    notifyListeners();
  }
}
