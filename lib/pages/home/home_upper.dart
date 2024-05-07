import 'package:flutter/material.dart';
import 'package:mopay_ewallet/format/currency.dart';
import 'package:provider/provider.dart';
import 'package:mopay_ewallet/data/data_user_mopay.dart';
import 'package:mopay_ewallet/pages/history.dart';
import 'package:mopay_ewallet/pages/top_up/top_up_methods.dart';
import 'package:mopay_ewallet/pages/transfer/transfer_page.dart';

class HomeUpper extends StatefulWidget {
  const HomeUpper({super.key});

  @override
  State<HomeUpper> createState() => _HomeUpperState();
}

class _HomeUpperState extends State<HomeUpper> {
  bool isObscured = false;

  String obscuredText(int number) {
    return "*" * number.toString().length;
  }

  @override
  Widget build(BuildContext context) {
    MopayUserData currentUser =
        Provider.of<MopayUserDataProvider>(context).currentUser;

    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 10,
                top: 10,
                bottom: 20,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2 + 20,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: ([
                    Color(0xff496989),
                    Color.fromARGB(255, 26, 50, 82)
                  ]),
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(right: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: ([Color(0xff0F0E0E), Color(0xff850000)]),
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "MoPay Cash",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Row(
                    children: [
                      const Text(
                        "Total Balance",
                        style: TextStyle(color: Colors.white),
                      ),
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
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isObscured
                            ? 'Rp${obscuredText(currentUser.saldo)}'
                            : 'Rp${formatToIndonesianCurrency(currentUser.saldo)}',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: const Row(
                          children: [
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Color(0xff0E0548),
                              child: Icon(
                                Icons.currency_ruble,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Mopay Points',
                              style: TextStyle(fontSize: 12),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              size: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  //FITUR UTAMA -------------------------------------------------------------------------------------------------------------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      createFitureButton(
                        context: context,
                        namaFitur: 'Top Up',
                        icon: const Icon(
                          Icons.add_circle_outline,
                        ),
                      ),
                      createFitureButton(
                        context: context,
                        namaFitur: 'Transfer',
                        icon: const Icon(Icons.arrow_circle_up_outlined),
                      ),
                      createFitureButton(
                        context: context,
                        namaFitur: 'Tarik Tunai',
                        icon: const Icon(Icons.arrow_circle_down_rounded),
                      ),
                      createFitureButton(
                        context: context,
                        namaFitur: 'History',
                        icon: const Icon(Icons.history),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

Column createFitureButton(
    {required BuildContext context,
    required String namaFitur,
    required Icon icon}) {
  return Column(
    children: [
      IconButton(
        onPressed: () {
          if (namaFitur == "Top Up") {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const PilihanMetodeTopUpPage(),
            ));
          } else if (namaFitur == "Transfer") {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const TransferPage(),
            ));
          } else if (namaFitur == "Tarik Tunai") {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const TransferPage(),
            ));
          } else if (namaFitur == "History") {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HistoryPage(),
            ));
          }
        },
        icon: icon,
        color: Colors.white,
        iconSize: 30,
      ),
      Text(
        namaFitur,
        style: const TextStyle(fontSize: 14, color: Colors.white),
      )
    ],
  );
}
