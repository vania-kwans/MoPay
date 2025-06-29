import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class kebijakanprivasi extends StatefulWidget {
  const kebijakanprivasi({super.key});

  @override
  State<kebijakanprivasi> createState() => _kebijakanprivasiState();
}

class _kebijakanprivasiState extends State<kebijakanprivasi> {
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
            child: Text('Kebijakan Privasi',
            style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          color: Color(0xffEEEEEE),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: [
              Text('Pemberitahuan Privasi!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 10),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pemberitahuan Privasi ini menjelaskan mengenai Pemrosesan Data Pribadi Anda yang diberlakukan oleh Kami untuk melindungi Data Pribadi Anda yang digunakan dan dikelola oleh Kami. Secara khusus, Pemberitahuan Privasi ini memuat ketentuan berikut ini:'),
                    SizedBox(height: 10),
                    ListTile(
                      title: Text('1. Definisi;'),
                    ),
                    ListTile(
                      title: Text('2. Perolehan dan pengumpulan Data Pribadi;'),
                    ),
                    ListTile(
                      title: Text('3. Tujuan Pemrosesan Data Pribad;'),
                    ),
                    ListTile(
                      title: Text('4. Pengungkapan Data Pribad;'),
                    ),
                    ListTile(
                      title: Text('5. Pengumpulan Data Pribadi dari Pihak Ketiga;'),
                    ),
                    ListTile(
                      title: Text('6. Pengumpulan informasi pihak lain;'),
                    ),
                    ListTile(
                      title: Text('7. Keamanan Data Pribadi;'),
                    ),
                    ListTile(
                      title: Text('8. Akses, koreksi, dan pemutakhiran Data Pribadi;'),
                    ),
                    ListTile(
                      title: Text('9. Persetujuan;'),
                    ),
                    ListTile(
                      title: Text('10. Penghapusan/Pemusnahan Data Pribadi dan pencabutan persetujuan;'),
                    ),
                    SizedBox(height: 10),
                    Text('Pemberitahuan Privasi ini berlaku bagi Anda yang menggunakan layanan atau fasilitas yang Kami sediakan dalam Aplikasi dan website Kami; bagi Anda yang telah terdaftar sebagai Pengguna; bagi Anda yang sedang melakukan pembuatan akun keanggotaan layanan Kami (sign up/account creation) untuk menjadi Pengguna; bagi Anda yang telah terdaftar sebagai MoPay Merchant; dan bagi Anda yang sedang melakukan pendaftaran untuk menjadi MoPay Merchant.')
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
