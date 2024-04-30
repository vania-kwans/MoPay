import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mopay_ewallet/utama/setconnect.dart';
import 'package:mopay_ewallet/utama/smartpay.dart';

class Profile extends StatelessWidget {
  final String sensitiveText;
  Profile({super.key, required this.sensitiveText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //APPBAR ----------------------------------------------------------------------
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            flexibleSpace: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                colors: [
                  Color(0xffFEA1A1),
                  Color(0xff850000),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Personal",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff850000),
                        fixedSize: Size.fromWidth(150)),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Bisnis',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff10200),
                        fixedSize: Size.fromWidth(150)),
                  )
                ],
              ),
            )),
        body: SingleChildScrollView(
            child:

                //IDENTITAS PENGGUNA -------------------------------------------------------
                Column(
          children: [
            Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xff850000), Color(0xff450000)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                      radius: 40,
                    ),
                    SizedBox(width: 10),
                    Column(children: [
                      Text(
                        'Jennie',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text('08768940982',
                          style: TextStyle(color: Colors.white)),
                      OutlinedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.qr_code_scanner,
                              color: Colors.white,
                            ),
                            // SizedBox(width: 10),
                            Text('Tampilkan Qr',
                                style: TextStyle(color: Colors.white)),
                            // SizedBox(width: 10),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            )
                          ],
                        ),
                        style: OutlinedButton.styleFrom(
                            fixedSize: Size.fromWidth(200),
                            side: BorderSide(color: Colors.white)),
                      )
                    ]),
                  ],
                )),

            // FITUR SALDO DLL -------------------------------------------------------
            Container(
                margin:
                    EdgeInsets.only(right: 30, left: 30, bottom: 5, top: 30),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
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
                              sensitiveText,
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
                            Text("Mo Goals",
                                style: TextStyle(color: Colors.black)),
                            Text("Buat Impian",
                                style: TextStyle(color: Colors.blue))
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
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

            // UANG MASUK DAN KELUAR ---------------------------------------------------------------------
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xff4CCD99),
                    child: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Uang Masuk",
                        style: TextStyle(color: Colors.grey[300]),
                      ),
                      Text(sensitiveText)
                    ],
                  ),
                  Container(
                    width: 2,
                    height: 50,
                    color: Colors.grey[350],
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0xffE72929),
                    child: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text(
                        "Uang Keluar",
                        style: TextStyle(color: Colors.grey[300]),
                      ),
                      Text(sensitiveText)
                    ],
                  )
                ],
              ),
            ),

            // ACCOUNT ------------------------------------------------------------
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Account", style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProfileSetting(),
                          ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.blueAccent,
                              size: 30,
                            ),
                            Text(
                              "Profil Settings",
                              style: TextStyle(color: Colors.black),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                            )
                          ],
                        )),
                    SizedBox(height: 10),
                    Container(
                      height: 1,
                      color: Colors.grey[200],
                    ),
                    SizedBox(height: 10),
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.link_outlined,
                                color: Colors.blueAccent, size: 30),
                            Text("Connected Account",
                                style: TextStyle(color: Colors.black)),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                            )
                          ],
                        )),
                    SizedBox(height: 10),
                    Container(
                      height: 1,
                      color: Colors.grey[200],
                    ),
                    SizedBox(height: 10),
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.verified_user,
                                color: Colors.blueAccent, size: 30),
                            Text("Verification",
                                style: TextStyle(color: Colors.black)),
                            Icon(Icons.arrow_forward_ios, color: Colors.grey)
                          ],
                        )),
                    SizedBox(height: 10),
                    Container(
                      height: 1,
                      color: Colors.grey[200],
                    ),
                    SizedBox(height: 10),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SmartPay(),
                          ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.payments_outlined,
                                color: Colors.blueAccent, size: 30),
                            Text("SmartPay",
                                style: TextStyle(color: Colors.black)),
                            Icon(Icons.arrow_forward_ios, color: Colors.grey)
                          ],
                        ))
                  ]),
            ),

            //SECURITY ---------------------------------------------------------------------------------------------------
            Container(
              margin: EdgeInsets.only(right: 30, left: 30, top: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Security",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SecuritySetting(),
                        ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.lock_outline_rounded,
                              color: Colors.blueAccent, size: 30),
                          Text("Security Settings",
                              style: TextStyle(color: Colors.black)),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          )
                        ],
                      )),
                  SizedBox(height: 10),
                  Container(
                    height: 1,
                    color: Colors.grey[200],
                  ),
                  SizedBox(height: 10),
                  TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.fingerprint,
                              color: Colors.blueAccent, size: 30),
                          Text("Fingerprint",
                              style: TextStyle(color: Colors.black)),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          )
                        ],
                      ))
                ],
              ),
            ),

            //ABOUT --------------------------------------------------------------------------------
            Container(
              margin: EdgeInsets.only(right: 30, left: 30, top: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("About", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.question_mark_rounded,
                              color: Colors.blueAccent, size: 30),
                          Text("Help Center",
                              style: TextStyle(color: Colors.black)),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          )
                        ],
                      )),
                  SizedBox(height: 10),
                  Container(
                    height: 1,
                    color: Colors.grey[200],
                  ),
                  SizedBox(height: 10),
                  TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.book_rounded,
                            color: Colors.blueAccent,
                            size: 30,
                          ),
                          Text("Term & Conditions",
                              style: TextStyle(color: Colors.black)),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          )
                        ],
                      )),
                  SizedBox(height: 10),
                  Container(
                    height: 1,
                    color: Colors.grey[200],
                  ),
                  SizedBox(height: 10),
                  TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.info, color: Colors.blueAccent, size: 30),
                          Text("Privacy Policy",
                              style: TextStyle(color: Colors.black)),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          )
                        ],
                      ))
                ],
              ),
            ),

            // VERSI PROJEK ---------------------------------------------------------------------------
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(right: 30, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Version 2.55.0", style: TextStyle(color: Colors.grey)),
                  Text(
                    "#PakeMopayaja",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),

            // BUTTON LOG-OUT ----------------------------------------------------------------
            SizedBox(height: 10),
            OutlinedButton(
                onPressed: () {},
                child: Text(
                  "Log Out",
                  style: TextStyle(color: Colors.white),
                ),
                style: OutlinedButton.styleFrom(
                    fixedSize: Size(250, 50),
                    backgroundColor: Color(0xff850000))),
            SizedBox(height: 20),
          ],
        )),

        //BOTTOM NAVBAR -----------------------------------------------------------------------
        bottomNavigationBar: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Icon(Icons.home, color: Colors.grey),
                          Text(
                            "Home",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Icon(Icons.my_library_books_outlined,
                              color: Colors.grey),
                          Text(
                            "Mutasi",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )),
                  IconButton.outlined(
                    onPressed: () {},
                    icon: Icon(Icons.qr_code_sharp, color: Color(0xff450000)),
                    style: IconButton.styleFrom(
                        fixedSize: Size(60, 60),
                        side: BorderSide(color: Color(0xff450000), width: 2)),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Icon(Icons.email, color: Colors.grey),
                          Text(
                            "Aktivitas",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Icon(Icons.perm_identity, color: Color(0xff450000)),
                          Text(
                            "Akun",
                            style: TextStyle(color: Color(0xff450000)),
                          ),
                        ],
                      )),
                ]),
          ),
        ));
  }
}
