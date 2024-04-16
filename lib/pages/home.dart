import 'package:flutter/material.dart';
import 'package:mopay_ewallet/format/currency.dart';
import 'package:mopay_ewallet/pages/history.dart';
import 'package:mopay_ewallet/pages/top_up/top_up_methods.dart';
import 'package:mopay_ewallet/pages/top_up/top_up_page.dart';
import 'package:mopay_ewallet/pages/transfer/transfer_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int saldo = Provider.of<SaldoProvider>(context).saldo;
    String formattedSaldo = formatToIndonesianCurrency(saldo);

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ini adalah home, saldo Anda sekarang $formattedSaldo'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MetodeTopUpPage(),
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TransferPage(),
                  ),
                );
              },
              child: const Icon(Icons.arrow_circle_up),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HistoryPage(),
                  ),
                );
              },
              child: const Icon(Icons.history),
            ),
          ],
        ),
      ),
    );
  }
}
