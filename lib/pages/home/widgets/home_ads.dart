import 'package:flutter/material.dart';
import 'package:mopay_ewallet/bloc/store.dart';
import 'package:mopay_ewallet/main.dart';

class HomeAds extends StatelessWidget {
  const HomeAds({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    const Text("SMS",
                        style: TextStyle(
                            color: Color(0xff450000),
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    const Text("Sedia MoPay Sekarang",
                        style: TextStyle(
                            color: Color(0xff450000),
                            fontWeight: FontWeight.bold,
                            fontSize: 8)),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Column(
                              children: [
                                Text('Cash',
                                    style: TextStyle(
                                        color: Color(0xff850000),
                                        fontWeight: FontWeight.bold)),
                                Text('back',
                                    style: TextStyle(
                                        color: Color(0xff850000),
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                            const SizedBox(width: 5),
                            const Text("10",
                                style: TextStyle(
                                    color: Color(0xff850000),
                                    fontSize: 80,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(width: 5),
                            CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              child: const Icon(
                                Icons.percent,
                                color: Color(0xff850000),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Text(
                          "Beli paket data",
                          style:
                              TextStyle(color: Color(0xff450000), fontSize: 15),
                        ),
                        Text("pas darurat bisa mulai",
                            style: TextStyle(
                                color: Color(0xff450000), fontSize: 15)),
                        Text('15rb , sereceh itu',
                            style: TextStyle(
                                color: Color(0xff450000), fontSize: 15)),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: Color(0xffF7C566),
                              size: 10,
                            ),
                            Text('Setiap Minggu',
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xffF7C566))),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: const Image(
                          image: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAoucDGF3UETzeXgL0Hp2UtyiN-GEcVn0iSQ&s"),
                        ))
                  ],
                ),
              ),
              Positioned(
                right: 10,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: const Color(0xff850000),
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 15,
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}

void showAdsDialog() {
  Store.setLastAdsShown(DateTime.now());
  showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => const HomeAds());
}
