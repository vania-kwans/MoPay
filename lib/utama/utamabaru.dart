import 'package:flutter/material.dart';
import 'package:mopay_ewallet/utama/profile.dart';
import 'package:mopay_ewallet/utama/reload.dart';

class Utama2 extends StatefulWidget {
  const Utama2({super.key});

  @override
  State<Utama2> createState() => _Utama2State();
}

class _Utama2State extends State<Utama2> {
  // final theFitur = Provider.of<FiturButton>(context).theFitur;
  bool isObscured = false;
  String sensitiveText = "ᴿᴾ 900.000";
  String obscuredText(String text) {
    return "*" * text.length;
  }

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
            title: const Text("Welcome Back",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            actions: [
              const Text(
                "Hi Jennie",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              Container(
                  padding: const EdgeInsets.all(5),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[350],
                    radius: 25,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              Profile(sensitiveText: sensitiveText),
                        ));
                      },
                      icon: const Icon(Icons.person),
                    ),
                  ))
            ]),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Hero(
              tag: "mopay",
              child: SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(height: 20),

                  //CARD ----------------------------------------------------------------------------------------------------------------------------
                  Column(children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                                margin: const EdgeInsets.all(20),
                                width: 350,
                                height: 200,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      colors: ([
                                        Color(0xff496989),
                                        Color(0xff00224D)
                                      ]),
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter),
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            Container(
                              padding: const EdgeInsets.all(20),
                              width: 350,
                              height: 200,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      colors: ([
                                        Color(0xff0F0E0E),
                                        Color(0xff850000)
                                      ]),
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Mopay",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 30),
                                      ),
                                      const SizedBox(width: 30),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(40)),
                                        padding: const EdgeInsets.all(10),
                                        child: const Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  Color(0xff0E0548),
                                              child: Icon(
                                                Icons.currency_bitcoin,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Text('Mopay Point'),
                                            Icon(Icons.arrow_forward_ios_sharp)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  const Text("Total Balance",
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                  Row(
                                    children: [
                                      Text(
                                          isObscured
                                              ? obscuredText(sensitiveText)
                                              : sensitiveText,
                                          style: const TextStyle(
                                              fontSize: 25,
                                              color: Colors.white)),
                                      const SizedBox(width: 5),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isObscured = !isObscured;
                                            });
                                          },
                                          icon: Icon(
                                            isObscured
                                                ? Icons.visibility_off_rounded
                                                : Icons.remove_red_eye_rounded,
                                            color: Colors.white,
                                          )),
                                      const SizedBox(width: 20),
                                      const Text(
                                        "0222 0990 2233",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),

                        //FITUR TOP-UP DLL -------------------------------------------------------------------------------------------------------------------
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add,
                                        color: Colors.white),
                                    style: IconButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xff0F0E0E),
                                        fixedSize: const Size(50, 50))),
                                const Text(
                                  "Top Up",
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.arrow_upward,
                                        color: Colors.white),
                                    style: IconButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xff0F0E0E),
                                        fixedSize: const Size(50, 50))),
                                const Text(
                                  "Transfer",
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.attach_money_sharp,
                                        color: Colors.white),
                                    style: IconButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xff0F0E0E),
                                        fixedSize: const Size(50, 50))),
                                const Text('Cash',
                                    style: TextStyle(color: Colors.grey))
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.history,
                                        color: Colors.white),
                                    style: IconButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xff0F0E0E),
                                        fixedSize: const Size(50, 50))),
                                const Text('History',
                                    style: TextStyle(color: Colors.grey))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // FITUR SEARCH --------------------------------------------------------------------------------------------------------------------
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Color(0xff00224D),
                      ),
                      label: const Text(
                        "Cari Fitur",
                        style: TextStyle(
                            color: Color(0xff00224D),
                            fontWeight: FontWeight.bold),
                      ),
                      style: OutlinedButton.styleFrom(
                        fixedSize:
                            Size.fromWidth(MediaQuery.of(context).size.width),
                        backgroundColor: const Color(0xffEEEEEE),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(20),
                      ),
                    ),
                    const SizedBox(height: 10),

                    //FITUR TAMBAHAN LAINNYA --------------------------------------------------------------------------------------------------------------------
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xffEEEEEE),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Reload()));
                                      },
                                      icon: const Icon(
                                        Icons.local_hospital_outlined,
                                        color: Color(0xff00224D),
                                      ),
                                      style: IconButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          fixedSize: const Size(25, 25))),
                                  const Text(
                                    'Health',
                                    style: TextStyle(color: Color(0xff31363F)),
                                  ),
                                  const Text("")
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Reload()));
                                      },
                                      icon: const Icon(
                                        Icons.credit_card_outlined,
                                        color: Color(0xff00224D),
                                      ),
                                      style: IconButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          fixedSize: const Size(25, 25))),
                                  const Text('Credit Card'),
                                  const Text('')
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Reload()));
                                      },
                                      icon: const Icon(
                                        Icons.school,
                                        color: Color(0xff00224D),
                                      ),
                                      style: IconButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          fixedSize: const Size(25, 25))),
                                  const Text("Education"),
                                  const Text("")
                                ],
                              ),
                              Column(children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Reload()));
                                    },
                                    icon: const Icon(
                                      Icons.electric_bolt,
                                      color: Color(0xff00224D),
                                    ),
                                    style: IconButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        fixedSize: const Size(25, 25))),
                                const Text('Electricity'),
                                const Text('')
                              ])
                            ]),
                        const SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Reload()));
                                    },
                                    icon: const Icon(
                                      Icons.water_drop_outlined,
                                      color: Color(0xff00224D),
                                    ),
                                    style: IconButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        fixedSize: const Size(25, 25))),
                                const Text("Tap"),
                                const Text("Water")
                              ]),
                              Column(children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Reload()));
                                    },
                                    icon: const Icon(
                                      Icons.my_library_books,
                                      color: Color(0xff00224D),
                                    ),
                                    style: IconButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        fixedSize: const Size(25, 25))),
                                const Text('PBB'),
                                const Text('Tax')
                              ]),
                              Column(children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Reload()));
                                    },
                                    icon: const Icon(
                                      Icons.smartphone,
                                      color: Color(0xff00224D),
                                    ),
                                    style: IconButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        fixedSize: const Size(25, 25))),
                                const Text("Credit &"),
                                const Text("Packages")
                              ]),
                              Column(children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Reload()));
                                    },
                                    icon: const Icon(
                                      Icons.videogame_asset_sharp,
                                      color: Color(0xff00224D),
                                    ),
                                    style: IconButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        fixedSize: const Size(25, 25))),
                                const Text('Game'),
                                const Text('Voucher')
                              ])
                            ])
                      ]),
                    ),
                    const SizedBox(height: 20),

                    //POSTER IKLAN PROMOSI -----------------------------------------------------------------------------------------------------------------------
                    const Row(
                      children: [
                        Text("Rekomendasi Pilihan",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        Column(children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: const Image(
                                image: NetworkImage(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUQodO_JeFso-IDITnQon6fEa_YubHL9dQ0A&s"),
                                fit: BoxFit.contain,
                              )),
                          const Text("E-Commerce",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10)),
                          const Text(
                            "Belanja 100.000 cuman bayar 50.000!",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          const Text(
                            "discount akhir tahun dari MoPay",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          const Text("MoPay",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10))
                        ]),
                        const SizedBox(width: 20),
                        Column(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: const Image(
                              image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTs0qzATuRYhLH_llTQ97CDIMwSks262vFzm49s8miebu6kjR3HKJZAE1YOVqnpn3pMpZg&usqp=CAU"),
                              fit: BoxFit.contain,
                            ),
                          ),
                          const Text("GoFat",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10)),
                          const Text("Ga Mau ribet Bayar GoFat?",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15)),
                          const Text("Dari MoPay Aja",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15)),
                          const Text("MoPay",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10))
                        ]),
                        const SizedBox(width: 20),
                        Column(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: const Image(
                              image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT69Qth7J8UIWwiEZYOWg5GihFgI5eTNXtajrwoyNoIpUFhajqO26IwPLCWmIykX4heME8&usqp=CAU"),
                              fit: BoxFit.contain,
                            ),
                          ),
                          const Text("E-Commerce",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10)),
                          const Text("Casback Hingga 100.000",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15)),
                          const Text("NO Ribet MoPay Aja",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15)),
                          const Text("MoPay",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10))
                        ]),
                        const SizedBox(width: 20),
                        Column(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: const Image(
                              image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTas22xEror7zXmnZYSTVlGgGa2cc-E0W6Tmg&s"),
                              fit: BoxFit.contain,
                            ),
                          ),
                          const Text("E-Commerce",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10)),
                          const Text(
                            "MoPrize sampai 150Juta ",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          const Text(
                            "Ikutin MoPrize hanya di MoPay",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          const Text("MoPay",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10))
                        ])
                      ]),
                    ),
                    const SizedBox(height: 20),

                    //
                    // TIPS PENGGUNAAN MOPAY ---------------------------------------------------------------------------------------------------------------------------------------------
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Text(
                            "Kenali MoPay Lebih Dekat",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ]),
                        Text(
                          "Biar Makin Akrab, Yuk Cek Tips Berikut!",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),

                    // ISI POP UP DARI TIPS -----------------------------------------------------------------------------------------------------------------------------------------------------------
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                      title: const Text(
                                                        "Isi Saldo Mopay No Ribet , Yuk Cari Tau Caranya!",
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      content: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(20),
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        height: 300,
                                                        child:
                                                            const SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      CircleAvatar(
                                                                        backgroundImage:
                                                                            NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkGC4qrqMw1tPG-CF9FtejlI5HJS6d4cAm8hhdhDmlDIxwlfRfd0xetPQbDxx7YR01LIc&usqp=CAU"),
                                                                        radius:
                                                                            80,
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              10),
                                                                      Text(
                                                                          "Easy & Fast"),
                                                                      SizedBox(
                                                                          height:
                                                                              10),
                                                                      Text(
                                                                        "Simpan kartu debit bisa",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey,
                                                                            fontSize: 15),
                                                                      ),
                                                                      Text(
                                                                        "langsung top up saldo MoPay",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey,
                                                                            fontSize: 15),
                                                                      )
                                                                    ]),
                                                                SizedBox(
                                                                    width: 50),
                                                                Column(
                                                                    children: [
                                                                      CircleAvatar(
                                                                        backgroundImage:
                                                                            NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRecvUXhvRHLG42O1C_JHu52IyNisObUXn9u608TZJs6b4d1ErY5Lu8ntT-cbd9lYETSFQ&usqp=CAU"),
                                                                        radius:
                                                                            85,
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              10),
                                                                      Text(
                                                                          "Saldo lebih Banyak!"),
                                                                      SizedBox(
                                                                          height:
                                                                              10),
                                                                      Text(
                                                                        "Jadi MoPay Premium Yuk , Bisa Simpan ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey,
                                                                            fontSize: 15),
                                                                      ),
                                                                      Text(
                                                                        "Saldo MoPay Hingga Rp.20.000.000",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey,
                                                                            fontSize: 15),
                                                                      )
                                                                    ]),
                                                                SizedBox(
                                                                    width: 50),
                                                                Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      CircleAvatar(
                                                                        backgroundImage:
                                                                            NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfD9UyXfy3Wz6MneiUfEYrYy95vnftANoKjHiQnpNI3dyFLe9Y7EfUqJFiXp03sCTRVKo&usqp=CAU"),
                                                                        radius:
                                                                            80,
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              10),
                                                                      Text(
                                                                          "Top Up dimana lagi ?"),
                                                                      SizedBox(
                                                                          height:
                                                                              10),
                                                                      Text(
                                                                        "Kamu Bisa Isi Saldo MoPay ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey,
                                                                            fontSize: 15),
                                                                      ),
                                                                      Text(
                                                                        "lewat agen terdekat",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey,
                                                                            fontSize: 15),
                                                                      ),
                                                                    ]),
                                                                SizedBox(
                                                                    width: 50),
                                                                Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      CircleAvatar(
                                                                        backgroundImage:
                                                                            NetworkImage("data:image/jpeg;base64,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"),
                                                                        radius:
                                                                            80,
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              10),
                                                                      Text(
                                                                          "Bebas Biaya Admin"),
                                                                      SizedBox(
                                                                          height:
                                                                              10),
                                                                      Text(
                                                                        "Isi Saldo MoPay dengan",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey,
                                                                            fontSize: 15),
                                                                      ),
                                                                      Text(
                                                                        "transfer bank tanpa biaya",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey,
                                                                            fontSize: 15),
                                                                      )
                                                                    ])
                                                              ]),
                                                        ),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop(); // Close dialog
                                                          },
                                                          child: const Text(
                                                              'Close'),
                                                        ),
                                                      ]);
                                                },
                                              );
                                            },
                                            // TAMPILAN DEPAN SEBELUM POP UP TIPS -----------------------------------------------------------------------------------------------------------------------------------------------
                                            child: const Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Image(
                                                    image: NetworkImage(
                                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJn4Dm6YeToAREwex3_hrZ3fh6gDeb6qnyzfwTNr6yCz6psBZxzHvwn3lLOL3zbZevbpw&usqp=CAU"),
                                                    fit: BoxFit.contain,
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    "Cara Top Up MoPay Cash",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 15),
                                                  ),
                                                ])),
                                      ),
                                    ]),
                                    const SizedBox(width: 20),

                                    // ISI POP UP TIPS --------------------------------------------------------------------------------------------------------------------------------------
                                    Column(children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                      "Cara Mudah Agar Tidak Lupa Dengan Tagihan",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    content: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20),
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 300,
                                                      child:
                                                          const SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Column(children: [
                                                                CircleAvatar(
                                                                  backgroundImage:
                                                                      NetworkImage(
                                                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKjWatMK--pZSq0yFTpBJkq3DLYfkRIk2ELxd7edFSUSx_ujT0zurqi3VfdVsmIbBj4Uc&usqp=CAU"),
                                                                  radius: 85,
                                                                ),
                                                                SizedBox(
                                                                    height: 10),
                                                                Text(
                                                                    "Cara Terbaik Bayar Tagihan"),
                                                                SizedBox(
                                                                    height: 10),
                                                                Text(
                                                                  "Kamu Bisa Lacak dan Bayar Semua ",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          15),
                                                                ),
                                                                Text(
                                                                  "Tagihanmu di MoPay loh . Cari Tahu Yuk!",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          15),
                                                                )
                                                              ]),
                                                              SizedBox(
                                                                  width: 50),
                                                              Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    CircleAvatar(
                                                                      backgroundImage:
                                                                          NetworkImage(
                                                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB9Sxp67wl9X-N75NL0kG3qhxe2v9jvAXhzXfFzNZQdXX3m9_EQmY-1UBwuoppTDGw9DE&usqp=CAU"),
                                                                      radius:
                                                                          80,
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            10),
                                                                    Text(
                                                                        "Tambah Tagihan Ke Pengigat"),
                                                                    SizedBox(
                                                                        height:
                                                                            10),
                                                                    Text(
                                                                      "Pengigat Membantumu Ingat",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey,
                                                                          fontSize:
                                                                              15),
                                                                    ),
                                                                    Text(
                                                                      "Tanggal Bayar Tagihan ",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey,
                                                                          fontSize:
                                                                              15),
                                                                    )
                                                                  ]),
                                                              SizedBox(
                                                                  width: 50),
                                                              Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    CircleAvatar(
                                                                      backgroundImage:
                                                                          NetworkImage(
                                                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqmQLKDhfrSj5d0tRxFwrXi2pdXRA1OOYR1KnHaIblxcCN2B4OnkE-8Z08A_-dXpa0Oxg&usqp=CAU"),
                                                                      radius:
                                                                          80,
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            10),
                                                                    Text(
                                                                        "Tambahkan Tagihan Ke Langganan"),
                                                                    SizedBox(
                                                                        height:
                                                                            10),
                                                                    Text(
                                                                      "Tagihan Langganan Dibayar Otomatis Tiap",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey,
                                                                          fontSize:
                                                                              15),
                                                                    ),
                                                                    Text(
                                                                      "Tanggal Pembayaran . Cuman perlu Isi Saldo!",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey,
                                                                          fontSize:
                                                                              15),
                                                                    ),
                                                                  ]),
                                                            ]),
                                                      ),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop(); // Close dialog
                                                        },
                                                        child:
                                                            const Text('Close'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },

                                            // TAMPILAN DEPAN SEBELUM POP UP TIPS ------------------------------------------------------------------------------------------------------------------------------------------------------
                                            child: const Column(
                                                // mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Image(
                                                    image: NetworkImage(
                                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1MqoxebWi_2oYtgx386QfPm30VkcdzLk3HAEELqNVOkuKPSpWzyAoaF6aOznGE-x6FOA&usqp=CAU"),
                                                    fit: BoxFit.contain,
                                                  ),
                                                  Text(
                                                    "Cara Mengaktifkan Fitur",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 15),
                                                  ),
                                                  Text(
                                                    "Pengingat Tagihan ",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 15),
                                                  ),
                                                ])),
                                      ),
                                    ]),
                                  ]),
                            ])),
                  ])
                ]),
              )),
        ),

        // BOTTOM NAVBAR -----------------------------------------------------------------------------------------------------------------------------------------------------------
        bottomNavigationBar: SingleChildScrollView(
          child: Container(
            // width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Column(
                        children: [
                          Icon(Icons.home, color: Color(0xff450000)),
                          Text(
                            "Home",
                            style: TextStyle(
                              color: Color(0xff450000),
                            ),
                          )
                        ],
                      )),
                  TextButton(
                      onPressed: () {},
                      child: const Column(
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
                    icon: const Icon(Icons.qr_code_sharp,
                        color: Color(0xff450000)),
                    style: IconButton.styleFrom(
                        fixedSize: const Size(60, 60),
                        side: const BorderSide(
                            color: Color(0xff450000), width: 2)),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Column(
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
                      child: const Column(
                        children: [
                          Icon(Icons.perm_identity, color: Colors.grey),
                          Text(
                            "Akun",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )),
                ]),
          ),
        ));
  }
}
