import 'package:flutter/material.dart';

class DataTipsSlider {
  String judul;
  String gambar;
  String subJudul;
  List<String> subGambar;
  List<String> judulKeterangan;
  List<String> keterangan;

  DataTipsSlider({
    required this.judul,
    required this.gambar,
    required this.subJudul,
    required this.subGambar,
    required this.judulKeterangan,
    required this.keterangan,
  });
}

class DataTipsSliderProvider extends ChangeNotifier {
  List<DataTipsSlider> data = [
    DataTipsSlider(
      judul: "Cara Top Up MoPay Cash Cara Top Up MoPay Cash Cara Top Up",
      gambar:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkGC4qrqMw1tPG-CF9FtejlI5HJS6d4cAm8hhdhDmlDIxwlfRfd0xetPQbDxx7YR01LIc&usqp=CAU",
      subJudul: "Isi saldo MoPay No Ribet, yuk cari tahu caranya!",
      subGambar: [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkGC4qrqMw1tPG-CF9FtejlI5HJS6d4cAm8hhdhDmlDIxwlfRfd0xetPQbDxx7YR01LIc&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRecvUXhvRHLG42O1C_JHu52IyNisObUXn9u608TZJs6b4d1ErY5Lu8ntT-cbd9lYETSFQ&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfD9UyXfy3Wz6MneiUfEYrYy95vnftANoKjHiQnpNI3dyFLe9Y7EfUqJFiXp03sCTRVKo&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfD9UyXfy3Wz6MneiUfEYrYy95vnftANoKjHiQnpNI3dyFLe9Y7EfUqJFiXp03sCTRVKo&usqp=CAU"
      ],
      judulKeterangan: [
        "Easy & Fast",
        "Saldo lebih Banyak!",
        "Top Up dimana lagi ?",
        "Bebas Biaya Admin"
      ],
      keterangan: [
        "Jadi MoPay Premium Yuk , Bisa Simpan Saldo MoPay Hingga Rp20.000.000",
        "Kamu Bisa Isi Saldo MoPay lewat agen terdekat",
        "Kamu Bisa Isi Saldo MoPay lewat agen terdekat",
        "Isi Saldo MoPay dengan transfer bank tanpa biaya"
      ],
    ),
    DataTipsSlider(
      judul: "Cara Mengaktifkan Fitur Pengingat Tagihan",
      gambar:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1MqoxebWi_2oYtgx386QfPm30VkcdzLk3HAEELqNVOkuKPSpWzyAoaF6aOznGE-x6FOA&usqp=CAU",
      subJudul: "Cara Mudah Agar Tidak Lupa Dengan Tagihan",
      subGambar: [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKjWatMK--pZSq0yFTpBJkq3DLYfkRIk2ELxd7edFSUSx_ujT0zurqi3VfdVsmIbBj4Uc&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB9Sxp67wl9X-N75NL0kG3qhxe2v9jvAXhzXfFzNZQdXX3m9_EQmY-1UBwuoppTDGw9DE&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqmQLKDhfrSj5d0tRxFwrXi2pdXRA1OOYR1KnHaIblxcCN2B4OnkE-8Z08A_-dXpa0Oxg&usqp=CAU"
      ],
      judulKeterangan: [
        "Cara Terbaik Bayar Tagihan",
        "Tambah Tagihan Ke Pengigat",
        "Tambahkan Tagihan Ke Langganan",
      ],
      keterangan: [
        "Kamu Bisa Lacak dan Bayar Semua Tagihanmu di MoPay loh . Cari Tahu Yuk!",
        "Pengigat Membantumu Ingat Tanggal Bayar Tagihan",
        "Tagihan Langganan Dibayar Otomatis Tiap Tanggal Pembayaran . Cuman perlu Isi Saldo!"
      ],
    ),
  ];
}
