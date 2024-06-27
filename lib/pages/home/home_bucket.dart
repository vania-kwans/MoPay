import 'package:flutter/material.dart';
import 'package:mopay_ewallet/pages/history/history.dart';
import 'package:mopay_ewallet/pages/home/home_page.dart';
import 'package:mopay_ewallet/pages/transfer/transfer_page.dart';
import 'package:mopay_ewallet/utama/profile.dart';

class HomeBucket extends StatefulWidget {
  const HomeBucket({super.key});

  @override
  State<HomeBucket> createState() => _HomeBucketState();
}

class _HomeBucketState extends State<HomeBucket> {
  int currentTab = 0;

  final List<Widget> screens = const [
    HomePage(),
    HistoryPage(),
    TransferPage(),
    Profile(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: screens[currentTab]),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(color: Colors.white, width: 3.0),
        ),
        child: FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(),
          backgroundColor: const Color(0xff850000),
          foregroundColor: Colors.white,
          child: Icon(
            Icons.qr_code_2,
            size: MediaQuery.of(context).size.width / 4 * 0.5,
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
                          // currentScreen = const PilihanMetodeTopUpPage();
                          currentTab = 0;
                        });
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 4 - 20,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.home,
                              color: currentTab == 0
                                  ? const Color(0xff850000)
                                  : Colors.grey,
                              size:
                                  MediaQuery.of(context).size.width / 4 * 0.25,
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                color: currentTab == 0
                                    ? const Color(0xff850000)
                                    : Colors.grey,
                                fontSize: MediaQuery.of(context).size.width /
                                    4 *
                                    0.125,
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
                          // currentScreen = const PilihanMetodeTopUpPage();
                          currentTab = 1;
                        });
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 4 - 20,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.history,
                              color: currentTab == 1
                                  ? const Color(0xff850000)
                                  : Colors.grey,
                              size:
                                  MediaQuery.of(context).size.width / 4 * 0.25,
                            ),
                            Text(
                              'History',
                              style: TextStyle(
                                color: currentTab == 1
                                    ? const Color(0xff850000)
                                    : Colors.grey,
                                fontSize: MediaQuery.of(context).size.width /
                                    4 *
                                    0.125,
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
                    // currentScreen = const PilihanMetodeTopUpPage();
                    currentTab = 2;
                  });
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 4 - 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.notifications,
                        color: currentTab == 2
                            ? const Color(0xff850000)
                            : Colors.grey,
                        size: MediaQuery.of(context).size.width / 4 * 0.25,
                      ),
                      Text(
                        'Notification',
                        style: TextStyle(
                          color: currentTab == 2
                              ? const Color(0xff850000)
                              : Colors.grey,
                          fontSize:
                              MediaQuery.of(context).size.width / 4 * 0.125,
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
                    // currentScreen = const PilihanMetodeTopUpPage();
                    currentTab = 3;
                  });
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 4 - 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_circle,
                        color: currentTab == 3
                            ? const Color(0xff850000)
                            : Colors.grey,
                        size: MediaQuery.of(context).size.width / 4 * 0.25,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                          color: currentTab == 3
                              ? const Color(0xff850000)
                              : Colors.grey,
                          fontSize:
                              MediaQuery.of(context).size.width / 4 * 0.125,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
