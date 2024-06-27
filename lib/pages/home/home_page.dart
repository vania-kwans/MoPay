import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mopay_ewallet/data/data_user_mopay.dart';
import 'package:mopay_ewallet/pages/home/home_menu.dart';
import 'package:mopay_ewallet/pages/home/home_recommendation.dart';
import 'package:mopay_ewallet/pages/home/home_tips.dart';
import 'package:mopay_ewallet/pages/home/home_upper.dart';
import 'package:mopay_ewallet/utama/profile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final theFitur = Provider.of<FiturButton>(context).theFitur;

  @override
  // POP UP AWAL -------------------------------------------------------------------------------------------
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.transparent,
              title:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                CircleAvatar(
                  backgroundColor: const Color(0xff850000),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      )),
                ),
              ]),
              content: Container(
                padding: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
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
                            style: TextStyle(
                                color: Color(0xff450000), fontSize: 15),
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
              ));
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    MopayUserData currentUser =
        Provider.of<MopayUserDataProvider>(context).currentUser!;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/logo-mopay/logo2.png',
                    width: 100,
                  ),
                  Row(
                    children: [
                      Text(
                        "Hi, ${currentUser.nama}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Profile(),
                            ));
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[350],
                            radius: 20,
                            backgroundImage: currentUser.profilePic is File
                                ? FileImage(currentUser.profilePic)
                                    as ImageProvider<Object>
                                : currentUser.profilePic.isNotEmpty
                                    ? AssetImage(currentUser.profilePic)
                                    : null,
                            child: currentUser.profilePic == "" &&
                                    currentUser.profilePic.isEmpty
                                ? const Icon(
                                    Icons.person,
                                    size: 45,
                                    color: Colors.black,
                                  )
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: const Hero(
                tag: "mopay",
                child: Column(
                  children: [
                    SizedBox(height: 20),

                    //CARD ----------------------------------------------------------------------------------------------------------------------------
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HomeUpper(), // Ada di file home_upper.dart
                        SizedBox(height: 10),
                        HomeMenu(), // Ada di file home_menu.dart
                        SizedBox(height: 20),
                        HomeRecommendation(),
                        SizedBox(height: 20),
                        HomeTips(),
                        SizedBox(height: 50),
                        // // FITUR SEARCH --------------------------------------------------------------------------------------------------------------------
                        // OutlinedButton.icon(
                        //   onPressed: () {},
                        //   icon: const Icon(
                        //     Icons.search,
                        //     color: Color(0xff00224D),
                        //   ),
                        //   label: const Text(
                        //     "Cari Fitur",
                        //     style: TextStyle(
                        //         color: Color(0xff00224D),
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        //   style: OutlinedButton.styleFrom(
                        //     fixedSize:
                        //         Size.fromWidth(MediaQuery.of(context).size.width),
                        //     backgroundColor: const Color(0xffEEEEEE),
                        //     alignment: Alignment.centerLeft,
                        //     padding: const EdgeInsets.all(20),
                        //   ),
                        // ),
                        // const SizedBox(height: 10),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
