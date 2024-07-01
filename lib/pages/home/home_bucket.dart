import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mopay_ewallet/bloc/auth/auth_bloc.dart';
import 'package:mopay_ewallet/bloc/store.dart';
import 'package:mopay_ewallet/pages/history/history.dart';
import 'package:mopay_ewallet/pages/home/home_page.dart';
import 'package:mopay_ewallet/pages/pin_code/insert_pin.dart';
import 'package:mopay_ewallet/pages/transaction/pending_payment_page.dart';
import 'package:mopay_ewallet/utama/profile.dart';
import 'package:provider/provider.dart';

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
    PendingPaymentPage(),
    Profile(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  late AuthBloc bloc;

  @override
  void initState() {
    bloc = context.read<AuthBloc>();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      DateTime lastPinEnter = await Store.getLastPinEnter();
      // Jika user sudah 5 menit tidak memasukkan pin, maka user harus memasukkan pin
      if (lastPinEnter
          .isBefore(DateTime.now().subtract(const Duration(minutes: 5)))) {
        await Store.removeLastPinEnter();
        bloc.resetPinStream();
        if (!mounted) return;
        bool? isPinValid = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const InsertPin(),
          ),
        );

        if (isPinValid == null || !isPinValid) {
          if (!mounted) return;
          Navigator.pushNamedAndRemoveUntil(
              context, '/login', (route) => false);
        }
        return;
      }
    });
    super.initState();
  }

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BottomAppBar(
              elevation: 0,
              padding: EdgeInsets.zero,
              color: Colors.transparent,
              shape: const CircularNotchedRectangle(),
              notchMargin: 15.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Bagian kiri
                  _bottomNavbarButton(Icons.home, "Home", 0),

                  _bottomNavbarButton(Icons.history, "History", 1),

                  const Flexible(
                    flex: 2,
                    child: SizedBox(),
                  ),
                  // Bagian kanan
                  _bottomNavbarButton(Icons.notifications, "Notification", 2),
                  _bottomNavbarButton(Icons.account_circle, "Profile", 3)
                ],
              )),
        ));
  }

  Widget _bottomNavbarButton(IconData icon, String text, int index) {
    return Flexible(
      flex: 2,
      child: GestureDetector(
        onTap: () {
          setState(() {
            // currentScreen = const PilihanMetodeTopUpPage();
            currentTab = index;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color:
                  currentTab == index ? const Color(0xff850000) : Colors.grey,
            ),
            Text(
              text,
              style: TextStyle(
                color:
                    currentTab == index ? const Color(0xff850000) : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
