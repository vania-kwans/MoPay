import 'package:flutter/material.dart';
import 'package:mopay_ewallet/pages/home/home_menu.dart';
import 'package:mopay_ewallet/pages/home/home_recommendation.dart';
import 'package:mopay_ewallet/pages/home/home_tips.dart';
import 'package:mopay_ewallet/pages/home/home_upper.dart';
import 'package:mopay_ewallet/pages/home/test.dart';
import 'package:mopay_ewallet/pages/top_up/top_up_methods.dart';
import 'package:mopay_ewallet/utama/profile.dart';
import 'package:mopay_ewallet/utama/reload.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final theFitur = Provider.of<FiturButton>(context).theFitur;
  int currentTab = 0;
  final List<Widget> screens = const [
    HomePage(),
    PilihanMetodeTopUpPage(),
    PilihanMetodeTopUpPage(),
    PilihanMetodeTopUpPage()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePage();

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
    return Scaffold(
      //APPBAR -----------------------------------------------------------------------------------------------
      appBar: AppBar(
          title: const Text(
            "Welcome Back!",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            const Text(
              "Hi, Jennie",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.all(5),
              child: CircleAvatar(
                backgroundColor: Colors.grey[350],
                radius: 25,
                child: IconButton(
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) =>
                    //       Profile(sensitiveText: totalBalance),
                    // ));
                  },
                  icon: const Icon(Icons.person),
                ),
              ),
            ),
          ]),
      body: Container(
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: const Hero(
          tag: "mopay",
          child: SingleChildScrollView(
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
      ),

      // BOTTOM NAVBAR -----------------------------------------------------------------------------------------------------------------------------------------------------------
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              30.0), // Adjust the value according to your preference
          border: Border.all(color: Colors.white, width: 4.0),
        ),
        child: FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(),
          backgroundColor: const Color(0xff850000),
          foregroundColor: Colors.white,
          child: const Icon(
            Icons.qr_code_2,
            size: 40,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height * 0.07,
        child: BottomAppBar(
          elevation: 0,
          padding: const EdgeInsets.all(0),
          color: Colors.transparent,
          shape: const CircularNotchedRectangle(),
          notchMargin: 15.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Bagian kiri
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: Row(
                  children: [
                    MaterialButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        setState(() {
                          currentScreen = const PilihanMetodeTopUpPage();
                          currentTab = 0;
                        });
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 4 - 20,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.dashboard,
                              color: currentTab == 0
                                  ? const Color(0xff850000)
                                  : Colors.grey,
                            ),
                            Text(
                              'Dashboard',
                              style: TextStyle(
                                color: currentTab == 0
                                    ? const Color(0xff850000)
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    MaterialButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        setState(() {
                          currentScreen = const PilihanMetodeTopUpPage();
                          currentTab = 1;
                        });
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 4 - 20,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.chat,
                              color: currentTab == 1
                                  ? const Color(0xff850000)
                                  : Colors.grey,
                            ),
                            Text(
                              'Chat',
                              style: TextStyle(
                                color: currentTab == 1
                                    ? const Color(0xff850000)
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              // Bagian kanan
              MaterialButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  setState(() {
                    currentScreen = const PilihanMetodeTopUpPage();
                    currentTab = 2;
                  });
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 4 - 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.dashboard,
                        color: currentTab == 2
                            ? const Color(0xff850000)
                            : Colors.grey,
                      ),
                      Text(
                        'Dashboard',
                        style: TextStyle(
                          color: currentTab == 2
                              ? const Color(0xff850000)
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              MaterialButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  setState(() {
                    currentScreen = const PilihanMetodeTopUpPage();
                    currentTab = 3;
                  });
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 4 - 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.chat,
                        color: currentTab == 3
                            ? const Color(0xff850000)
                            : Colors.grey,
                      ),
                      Text(
                        'Chat',
                        style: TextStyle(
                            color: currentTab == 3
                                ? const Color(0xff850000)
                                : Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // bottomNavigationBar: SingleChildScrollView(
      //   child: Container(
      //     // width: MediaQuery.of(context).size.width,
      //     padding: const EdgeInsets.all(5),
      //     decoration: const BoxDecoration(color: Colors.white),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         TextButton(
      //             onPressed: () {},
      //             child: const Column(
      //               children: [
      //                 Icon(Icons.home, color: Color(0xff450000)),
      //                 Text(
      //                   "Home",
      //                   style: TextStyle(
      //                     color: Color(0xff450000),
      //                   ),
      //                 )
      //               ],
      //             )),
      //         TextButton(
      //             onPressed: () {},
      //             child: const Column(
      //               children: [
      //                 Icon(Icons.my_library_books_outlined, color: Colors.grey),
      //                 Text(
      //                   "Mutasi",
      //                   style: TextStyle(color: Colors.grey),
      //                 ),
      //               ],
      //             )),
      //         IconButton.outlined(
      //           onPressed: () {},
      //           icon: const Icon(Icons.qr_code_sharp, color: Color(0xff450000)),
      //           style: IconButton.styleFrom(
      //               fixedSize: const Size(60, 60),
      //               side: const BorderSide(color: Color(0xff450000), width: 2)),
      //         ),
      //         TextButton(
      //             onPressed: () {},
      //             child: const Column(
      //               children: [
      //                 Icon(Icons.email, color: Colors.grey),
      //                 Text(
      //                   "Aktivitas",
      //                   style: TextStyle(color: Colors.grey),
      //                 ),
      //               ],
      //             )),
      //         TextButton(
      //           onPressed: () {},
      //           child: const Column(
      //             children: [
      //               Icon(Icons.perm_identity, color: Colors.grey),
      //               Text(
      //                 "Akun",
      //                 style: TextStyle(color: Colors.grey),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
