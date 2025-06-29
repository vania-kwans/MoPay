import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class langkah_pembayaran extends StatefulWidget {
  const langkah_pembayaran({super.key});

  @override
  State<langkah_pembayaran> createState() => _langkah_pembayaranState();
}

class _langkah_pembayaranState extends State<langkah_pembayaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffFEA1A1),
                Color(0xff850000),
              ],
            begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Text('Pembayaran',
            style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Color(0xffEEEEEE),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Kendala Transaksi di Merchant',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 10),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Batas minimal pembayaran menggunakan MoPay ditentukan oleh masing masing merchant'),
                    SizedBox(height: 10),
                    Text('Metode pembayaran yang tersedia : '),
                    ListTile(
                      title: Text('1. Kode Bayar di Merchant'),
                    ),
                    ListTile(
                      title: Text('2. Pembayaran di aplikasi MoPay itu sendiri'),
                    ),
                    ListTile(
                      title: Text('3. Scan - to - pay : pindai Barcode MoPay ID dan QRIS'),
                    ),
                    ListTile(
                      title: Text('4. Push - to - pay : bayar via EDC, bayar bia aplikasi Merchant'),
                    ),
                    SizedBox(height: 10),
                    Text('Jenis kendala pembayaran MoPay',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 10),
                    Text('Untuk setiap kendala umum pembayaran MoPay, pastikan:'),
                    SizedBox(height: 10),
                    ListTile(
                      title: Text('1. aplikasi MoPay sudah versi terbaru'),
                    ),
                    ListTile(
                      title: Text('2. koneksi internet dalam keadaan stabil'),
                    ),
                    ListTile(
                      title: Text('3. Saldo MoPay cukup untuk pembayaran di merchant tersebut'),
                    ),
                    ListTile(
                      title: Text('pindai QRIS dengan benar dan kode QRIS dalam kondisi baik'),
                    ),
                    SizedBox(height: 10),
                    Text('Jika setelah 1 x 24 jam Anda masih terkendala, Kirim Laporan agar bisa kami bantu.')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}