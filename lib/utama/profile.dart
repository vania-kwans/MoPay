import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mopay_ewallet/bloc/auth/auth_bloc.dart';
import 'package:mopay_ewallet/bloc/transaction/transaction_bloc.dart';
import 'package:mopay_ewallet/bloc/transaction/transaction_state.dart';
import 'package:mopay_ewallet/bloc/user/user_bloc.dart';
import 'package:mopay_ewallet/bloc/user/user_state.dart';
import 'package:mopay_ewallet/components/my_error_component.dart';
import 'package:mopay_ewallet/models/transaction.dart';
import 'package:mopay_ewallet/models/user.dart';
import 'package:mopay_ewallet/pages/authentication/login.dart';
import 'package:mopay_ewallet/pages/change_profile/change_profile.dart';
import 'package:mopay_ewallet/pages/history/history.dart';
import 'package:mopay_ewallet/pages/pin_code/update_pin/insert_old_pin.dart';
import 'package:mopay_ewallet/utama/setconnect.dart';
import 'package:mopay_ewallet/utama/smartpay.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  final bool isRerouted;
  const Profile({super.key, this.isRerouted = false});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isFingerprintOn = false;
  late UserBloc userBloc;
  late TransactionBloc transactionBloc;

  @override
  void initState() {
    userBloc = context.read<UserBloc>();
    transactionBloc = TransactionBloc();

    userBloc.getProfile();
    transactionBloc.getMonthlyTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBody(),
          Positioned(
            top: 30,
            left: 5,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: widget.isRerouted
                  ? const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )
                  : const SizedBox(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBody() {
    return StreamBuilder<UserState>(
        stream: userBloc.state,
        builder: (context, snapshot) {
          bool isLoading =
              snapshot.data?.isLoading ?? false || !snapshot.hasData;

          if (isLoading) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Center(child: CircularProgressIndicator())],
            );
          }

          UserState state = snapshot.data!;

          if (state.hasError) {
            return MyErrorComponent(onRefresh: () {
              userBloc.getProfile();
            });
          }

          User currentUser = state.user!;
          return RefreshIndicator(
            onRefresh: () async {
              userBloc.getProfile();
              transactionBloc.getMonthlyTransaction();
            },
            child: SingleChildScrollView(
              child: Container(
                color: Colors.grey[100],
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xff850000),
                                Color(0xff450000),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff850000),
                                    fixedSize: const Size.fromWidth(150),
                                  ),
                                  child: const Text(
                                    "Personal",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0x0ff10200),
                                    fixedSize: const Size.fromWidth(150),
                                  ),
                                  child: const Text(
                                    'Bisnis',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 40,
                                  child: Icon(
                                    Icons.person,
                                    size: 50,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        currentUser.name,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        currentUser.phoneNumber,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      OutlinedButton(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(
                                          side: const BorderSide(
                                              color: Colors.white),
                                        ),
                                        child: const Row(
                                          children: [
                                            Icon(
                                              Icons.qr_code_scanner,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              'Tampilkan Qr',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      )
                                    ]),
                              ],
                            ),
                          ],
                        )),

                    // FITUR SALDO DLL -----------------------------------------------
                    Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Column(
                                  children: [
                                    Icon(
                                      Icons.wallet,
                                      color: Color(0xff102C57),
                                      size: 40,
                                    ),
                                    Text(
                                      "Saldo",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      'NaN',
                                      style: TextStyle(color: Colors.blue),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.ballot_outlined,
                                      color: Colors.red[200],
                                      size: 40,
                                    ),
                                    const Text("Mo Goals",
                                        style: TextStyle(color: Colors.black)),
                                    const Text("Buat Impian",
                                        style: TextStyle(color: Colors.blue))
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Icon(Icons.family_restroom_outlined,
                                        color: Colors.orange, size: 40),
                                    Text("Rek.Keluarga",
                                        style: TextStyle(color: Colors.black)),
                                    Text("Aktivasi Yuk!",
                                        style: TextStyle(color: Colors.blue))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.monetization_on_outlined,
                                      color: Color(0xffFFC94A),
                                      size: 40,
                                    ),
                                    Text("MoMAS",
                                        style: TextStyle(color: Colors.black)),
                                    Text("Mulai Inves Yuk",
                                        style: TextStyle(color: Colors.blue))
                                  ],
                                )
                              ],
                            )
                          ],
                        )),

                    // SALDO MASUK DAN KELUAR ----------------------------------------
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 25,
                        right: 20,
                        bottom: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Transaksi bulan ini',
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 10),
                          StreamBuilder<TransactionState>(
                              stream: transactionBloc.state,
                              builder: (context, snapshot) {
                                bool isLoading = snapshot.data?.isLoading ??
                                    false || !snapshot.hasData;

                                List<Transaction> dataHistory =
                                    snapshot.data?.transactionData ?? [];

                                int expense =
                                    getTotalNominal(dataHistory, false);
                                int income = getTotalNominal(dataHistory, true);

                                return IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) => HistoryPage(
                                                entryFilter:
                                                    TransactionFilterData(
                                                        type: TransactionType
                                                            .receive),
                                              ),
                                            ));
                                          },
                                          child: Row(
                                            children: [
                                              const CircleAvatar(
                                                backgroundColor:
                                                    Color(0xff4CCD99),
                                                child: Icon(
                                                  Icons.arrow_downward,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "Saldo Masuk",
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                    isLoading
                                                        ? const LinearProgressIndicator()
                                                        : Text(NumberFormat
                                                                .currency(
                                                                    locale:
                                                                        'id',
                                                                    decimalDigits:
                                                                        0,
                                                                    symbol:
                                                                        'Rp')
                                                            .format(income)),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const VerticalDivider(),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) => HistoryPage(
                                                entryFilter:
                                                    TransactionFilterData(
                                                        type: TransactionType
                                                            .expense),
                                              ),
                                            ));
                                          },
                                          child: Row(
                                            children: [
                                              const CircleAvatar(
                                                backgroundColor:
                                                    Color(0xffE72929),
                                                child: Icon(
                                                  Icons.arrow_upward,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "Saldo Keluar",
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                    isLoading
                                                        ? const LinearProgressIndicator()
                                                        : Text(NumberFormat
                                                                .currency(
                                                                    locale:
                                                                        'id',
                                                                    decimalDigits:
                                                                        0,
                                                                    symbol:
                                                                        'Rp')
                                                            .format(expense)),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),

                    // ACCOUNT -------------------------------------------------------
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.only(
                          top: 20, left: 20, right: 20, bottom: 10),
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Akun",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 15),
                          ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: const Text(
                              "Profil Saya",
                              style: TextStyle(color: Colors.black),
                            ),
                            leading: const Icon(
                              Icons.person,
                              color: Colors.blueAccent,
                              size: 30,
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const ChangeProfile(),
                                ));
                              },
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Divider(color: Colors.grey[200]),
                          ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: const Text(
                              "Aplikasi Terhubung",
                              style: TextStyle(color: Colors.black),
                            ),
                            leading: const Icon(Icons.link_outlined,
                                color: Colors.blueAccent, size: 30),
                            trailing: GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Divider(color: Colors.grey[200]),
                          ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: const Text(
                              "Verifikasi",
                              style: TextStyle(color: Colors.black),
                            ),
                            leading: const Icon(Icons.verified_user,
                                color: Colors.blueAccent, size: 30),
                            trailing: GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Divider(color: Colors.grey[200]),
                          ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: const Text(
                              "SmartPay",
                              style: TextStyle(color: Colors.black),
                            ),
                            leading: const Icon(Icons.payments_outlined,
                                color: Colors.blueAccent, size: 30),
                            trailing: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const SmartPay(),
                                ));
                              },
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //SECURITY -------------------------------------------------------
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.only(
                          top: 20, left: 20, right: 20, bottom: 10),
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Keamanan",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 15),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SecuritySetting(),
                              ));
                            },
                            child: const ListTile(
                              contentPadding: EdgeInsets.all(0),
                              title: Text(
                                "Perbarui Password",
                                style: TextStyle(color: Colors.black),
                              ),
                              leading: Icon(Icons.password,
                                  color: Colors.blueAccent, size: 30),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Divider(color: Colors.grey[200]),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const InsertOldPinPage(),
                              ));
                            },
                            child: const ListTile(
                              contentPadding: EdgeInsets.all(0),
                              title: Text(
                                "Perbarui PIN",
                                style: TextStyle(color: Colors.black),
                              ),
                              leading: Icon(Icons.lock,
                                  color: Colors.blueAccent, size: 30),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Divider(color: Colors.grey[200]),
                          ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: const Text(
                              "Fingerprint",
                              style: TextStyle(color: Colors.black),
                            ),
                            leading: const Icon(Icons.fingerprint,
                                color: Colors.blueAccent, size: 30),
                            trailing: Transform.scale(
                              scale: 0.8,
                              child: Switch(
                                value: _isFingerprintOn,
                                activeColor: Colors.red[900],
                                onChanged: (value) {
                                  setState(() {
                                    _isFingerprintOn = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //ABOUT ----------------------------------------------------------
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.only(
                          top: 20, left: 20, right: 20, bottom: 10),
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Tentang",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 15),
                          ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: const Text(
                              "Pusat Bantuan",
                              style: TextStyle(color: Colors.black),
                            ),
                            leading: const Icon(Icons.question_mark_rounded,
                                color: Colors.blueAccent, size: 30),
                            trailing: GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Divider(color: Colors.grey[200]),
                          ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: const Text(
                              "Syarat dan Ketentuan",
                              style: TextStyle(color: Colors.black),
                            ),
                            leading: const Icon(
                              Icons.book_rounded,
                              color: Colors.blueAccent,
                              size: 30,
                            ),
                            trailing: GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Divider(color: Colors.grey[200]),
                          ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: const Text(
                              "Kebijakan Privasi",
                              style: TextStyle(color: Colors.black),
                            ),
                            leading: const Icon(Icons.info,
                                color: Colors.blueAccent, size: 30),
                            trailing: GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Divider(color: Colors.grey[200]),
                          ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: const Text(
                              "About Us",
                              style: TextStyle(color: Colors.black),
                            ),
                            leading: const Icon(Icons.people_rounded,
                                color: Colors.blueAccent, size: 30),
                            trailing: GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Divider(color: Colors.grey[200]),
                          ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: const Text(
                              "Pengaturan Umum",
                              style: TextStyle(color: Colors.black),
                            ),
                            leading: const Icon(Icons.settings,
                                color: Colors.blueAccent, size: 30),
                            trailing: GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // VERSI PROJEK --------------------------------------------------
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Version 2.55.0",
                              style: TextStyle(color: Colors.grey)),
                          Text(
                            "#PakeMopayaja",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),

                    // BUTTON LOG-OUT ------------------------------------------------
                    const SizedBox(height: 20),
                    OutlinedButton(
                      onPressed: () {
                        context.read<AuthBloc>().logout();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                            (route) => false);
                      },
                      style: OutlinedButton.styleFrom(
                          fixedSize: const Size(250, 50),
                          backgroundColor: const Color(0xff850000)),
                      child: const Text(
                        "Log Out",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

int getTotalNominal(List<Transaction> transactionList, bool isIncome) {
  if (isIncome) {
    return transactionList.fold(
        0,
        (previous, current) => current.type == TransactionType.receive ||
                current.type == TransactionType.topup
            ? previous + current.amount
            : previous);
  } else {
    return transactionList.fold(
        0,
        (previous, current) => current.type == TransactionType.payment ||
                current.type == TransactionType.transfer
            ? previous + current.amount
            : previous);
  }
}
