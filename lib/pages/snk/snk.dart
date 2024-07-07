import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class snk extends StatefulWidget {
  const snk({super.key});

  @override
  State<snk> createState() => _snkState();
}

class _snkState extends State<snk> {
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
            child: Text('Syarat dan Ketentuan',
            style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xffEEEEEE),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: [
              Text('Selamat datang di Aplikasi MoPay!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 10),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Terima kasih telah mengunduh Aplikasi MoPay.'),
                    SizedBox(height: 10),
                    Text('Syarat dan ketentuan ini mengatur ketentuan-ketentuan mengenai; pendaftaran untuk menjadi pengguna layanan Kami, penyediaan layanan uang elektronik Kami, dan hal-hal lainnya yang berkaitan dengan Aplikasi Mopay. Untuk kejelasan dan kepastian, Syarat dan Ketentuan ini berlaku sebagai perjanjian antara Anda dan Kami ("Syarat dan Ketentuan").'),
                    SizedBox(height: 10),
                    Text('PERSETUJUAN',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 10),
                    Text('Dengan mengunduh, mengakses, melakukan pendaftaran untuk menjadi pengguna layanan Kami, menggunakan Aplikasi MoPay, atau menggunakan layanan-layanan Kami berarti Anda menyatakan dan mengakui bahwa Anda telah membaca, mempelajari, memahami, dan menyetujui seluruh ketentuan-ketentuan yang diatur dalam Syarat dan Ketentuan ini. Syarat dan Ketentuan ini juga berlaku atas penggunaan layanan-layanan uang elektronik Kami melalui website dan/atau aplikasi pihak ketiga.')
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