import 'package:flutter/material.dart';
import 'package:mopay_ewallet/pages/pusatbantuan/pembayaran_pb.dart';
import 'package:mopay_ewallet/pages/pusatbantuan/tf_pb.dart';
import 'package:mopay_ewallet/pages/pusatbantuan/topup_pb.dart';
class PusatBantuan extends StatefulWidget {
  const PusatBantuan({super.key});

  @override
  State<PusatBantuan> createState() => _PusatBantuanState();
}

class _PusatBantuanState extends State<PusatBantuan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xffFEA1A1),
                Color(0xff850000),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: Center(
              child: Text(
                "Pusat Bantuan",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xffEEEEEE),
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(children: [
                  TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const langkah_tf(),
                          ));
                      },
                      icon: Icon(
                        Icons.attach_money_sharp,
                        color: Colors.grey,
                        size: 30,
                      ),
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Transfer",
                            style: TextStyle(color: Colors.black),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey[350],
                          )
                        ],
                      )),
                  SizedBox(height: 20),
                  Container(
                    height: 1,
                    color: Colors.grey[200],
                  ),
                  SizedBox(height: 20),
                  TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const langkah_pembayaran(),
                          ));
                      },
                      icon: Icon(
                        Icons.payment,
                        color: Colors.grey,
                        size: 30,
                      ),
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Pembayaran",
                              style: TextStyle(color: Colors.black)),
                              Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey[350],
                          )
                        ],
                      )),
                  SizedBox(height: 20),
                  Container(
                    height: 1,
                    color: Colors.grey[200],
                  ),
                  SizedBox(height: 20),
                  TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const langkah_topup(),
                          ));
                      },
                      icon: Icon(Icons.payments_outlined, color: Colors.grey, size: 30),
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Top Up",
                              style: TextStyle(color: Colors.black)),
                              Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey[350],
                          )
                        ],
                      )),

                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class Snk extends StatefulWidget {
//   const Snk({super.key});

//   @override
//   State<Snk> createState() => _SnkState();
// }

// class _SnkState extends State<Snk> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           iconTheme: IconThemeData(color: Colors.white),
//           flexibleSpace: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//               colors: [
//                 Color(0xffFEA1A1),
//                 Color(0xff850000),
//               ],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             )),
//             child: Center(
//               child: Text(
//                 "Syarat dan Ketentuan",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           )),
//           body: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             child: SingleChildScrollView(
//               child: Text('Selamat datang di aplikasi MoPay'),
//             ),
//           ),
//     );
//   }
// }