import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class langkah_tf extends StatefulWidget {
  const langkah_tf({super.key});

  @override
  State<langkah_tf> createState() => _langkah_tfState();
}

class _langkah_tfState extends State<langkah_tf> {
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
            ),),
            child: Center(
              child: Text(
                "Transfer",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )),
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              color: Color(0xffEEEEEE),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text('Transfer dari MoPay ke MoPay', 
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      ),),                  
                            SizedBox(height: 20,),
                            SingleChildScrollView(
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                  Text('Untuk bisa transfer sesama MoPay, akun anda harus sudah MoPay Premier. Bebas biaya transfer',
                style: TextStyle(
                  fontStyle: FontStyle.italic
                ),),
                SizedBox(height: 20),
                Text('Transfer dari MoPay ke manapun, termasuk salah transfer akibat kesalahan pribadi, adalah tanggung jawab pemilik akun. Jika kelalaian terjadi:'),  
                SizedBox(height: 10,),
               ListTile(
                title:  Text('1. Hubungi nomor HP yang annda salah transfer secepatnya. Atau,'),
               ),
               ListTile(
                title: Text('2. buat Surat Pernyataan bermaterai dari anda untuk kami jika ingin MoPay yang teruskan info kesalahan transfer tersebut ke nomor penerima'),
               ),
                
                SizedBox(height: 20),
                Text('Cara Transfer',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
                ListTile(
                  title: Text('1. Di laman utama MoPay, klik TRANSFER'),
                ),
                ListTile(
                  title: Text('2. Pilih ke sesama MoPay'),
                ),
                ListTile(
                  title: Text('3. Isi nominal detail tujuan transfer dan nominal transfer (minimal Rp10.000), lalu klik lanjutkan'),
                ),
                ListTile(
                  title: Text('4. Nomor HP tujuan transfer dan detail nama penerima harus sudah benar, lalu klik transfer'),
                ),
                ListTile(
                  title: Text('5. Transfer ke sesama MoPay berhasil.'),
                ),
                SizedBox(height: 20,),
                Text('Transfer dari MoPay ke Bank', 
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      ),), 
                      SizedBox(height: 20),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Akun harus MoPay premier untuk bisa transfer dari MoPay ke bank. Biaya transfer Rp2.000 per transaksi',
                              style: TextStyle(
                                fontStyle: FontStyle.italic
                                ),),
                                SizedBox(height: 20),
                Text('Transfer dari MoPay ke manapun, termasuk salah transfer akibat kesalahan pribadi, adalah tanggung jawab pemilik akun. Jika kelalaian terjadi:'),  
                SizedBox(height: 10,),
               ListTile(
                title:  Text('1. Hubungi nomor HP yang annda salah transfer secepatnya. Atau,'),
               ),
               ListTile(
                title: Text('2. buat Surat Pernyataan bermaterai dari anda untuk kami jika ingin MoPay yang teruskan info kesalahan transfer tersebut ke nomor penerima'),
               ),
               SizedBox(height: 20),
                Text('Cara Transfer',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
                ListTile(
                  title: Text('1. Di laman utama MoPay, klik TRANSFER'),
                ),
                ListTile(
                  title: Text('2. Pilih ke Rekning Bank'),
                ),
                ListTile(
                  title: Text('3. Pilih Bank tujuan'),
                ),
                ListTile(
                  title: Text('4. Masukkan nomor rekening tujuan dan nominal'),
                ),
                ListTile(
                  title: Text('5. Klik lanjutkan dan klik transfer.'),
                ),
                ListTile(
                  title: Text('6. Transfer berhasil'),
                )
                          ],
                        ),
                      )
              ],),
              
              
                ),
                          ],
                        ),
            ),
          ),
      );
  }
}