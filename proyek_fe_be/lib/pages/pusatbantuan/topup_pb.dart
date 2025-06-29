import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class langkah_topup extends StatefulWidget {
  const langkah_topup({super.key});

  @override
  State<langkah_topup> createState() => _langkah_topupState();
}

class _langkah_topupState extends State<langkah_topup> {
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
            child: Text('Top Up',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Top Up MoPay',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 10),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tersedia berbagai langkah mudah yang bisa Anda pilih untuk top up MoPay Cash:'),
                    SizedBox(height: 10),
                    ListTile(
                      title: Text('1. Transfer Bank/ATM/Mobile Banking'),
                    ),
                    ListTile(
                      title: Text('2. Gerai Indomaret'),
                    ),
                    ListTile(
                      title: Text('3. Gerai Alfamart'),
                    ),
                    ListTile(
                      title: Text('4. Berbagai Merchant/Mitra MoPay'),
                    ),
                    SizedBox(height: 10),
                    Text('Cukup pilih menu Top Up pada laman utama aplikasi MoPay untuk lihat detail informasi cara top up saldo.')
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