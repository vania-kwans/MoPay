import 'package:flutter/material.dart';

class SmartPay extends StatefulWidget {
  const SmartPay({super.key});

  @override
  State<SmartPay> createState() => _SmartPayState();
}

class _SmartPayState extends State<SmartPay> {
  bool onOff = false;
  bool onOff2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: ([Color(0xffFEA1A1), Color(0xff850000)]),
              )),
              child: const Center(
                child: Text(
                  "SmartPay",
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ),
        body: Container(
            color: Colors.grey[300],
            child: SingleChildScrollView(
                child: Column(children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: ([Color(0xffFEA1A1), Color(0xff850000)]))),
                  child: Column(children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                left: 120, right: 100, top: 30),
                            padding: const EdgeInsets.all(10),
                            height: 300,
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: const Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoo3Rbb1Irb3D-j_Z5fCqzFd4QkZyNGWgbGQ&s"),
                                ),
                                Text(
                                  "Sistem Pembayaran",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text("Otomatis",
                                    style: TextStyle(fontSize: 20)),
                                SizedBox(height: 10),
                                Text("Kami akan memberikan rekomendasi ",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey)),
                                Text("metode pembayaran jika Saldo MoPay",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey)),
                                Text("tidak cukup disemua transaksi",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey))
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                right: 120, left: 100, top: 30),
                            padding: const EdgeInsets.all(10),
                            height: 300,
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: const Column(
                              children: [
                                CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnYZUZwKrjB0TFlcSeqhIzlrl34Q4PRuPLgGKaNrpVw3-s-hRSs0AkNvpyHn4qBb2z9EA&usqp=CAU")),
                                SizedBox(height: 20),
                                Text(
                                  "Verifikasi dengan PIN",
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(height: 10),
                                Text("Keamanan berlapis disetiap transaksi",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey)),
                                Text("dengan menggunakan PIN",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 2,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(width: 5),
                        CircleAvatar(
                          radius: 2,
                          backgroundColor: Colors.white,
                        )
                      ],
                    )
                  ])),
              const SizedBox(height: 10),
              Container(
                  margin: const EdgeInsets.all(30),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(children: [
                    SwitchListTile(
                      value: onOff,
                      onChanged: (bool val) {
                        setState(() {
                          onOff = val;
                        });
                      },
                      title: const Text('Sistem Pembayaran Otomatis'),
                      subtitle: const Text(
                          "Kami akan memeberikan rekomendasi metode pembayaran anda"),
                      secondary: const Icon(Icons.payments_outlined),
                      activeTrackColor: const Color(0xff850000),
                      activeColor: Colors.white,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 1,
                      color: Colors.grey[200],
                    ),
                    const SizedBox(height: 20),
                    SwitchListTile(
                      value: onOff2,
                      onChanged: (bool val) {
                        setState(() {
                          onOff2 = val;
                        });
                      },
                      title: const Text("Verifikasi Dengan PIN"),
                      subtitle: const Text("Keamanan Berlapis Dengan PIN"),
                      secondary: const Icon(Icons.lock_outline_rounded),
                      activeTrackColor: const Color(0xff850000),
                      activeColor: Colors.white,
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "MOPAY PROTECTION",
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 10,
                        )
                      ],
                    )
                  ]))
            ]))));
  }
}
