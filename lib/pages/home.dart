import 'package:flutter/material.dart';
import 'package:mopay_ewallet/format/currency.dart';
import 'package:mopay_ewallet/pages/top_up.dart';
import 'package:mopay_ewallet/pages/transfer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int saldo = 100000;

  @override
  Widget build(BuildContext context) {
    String formattedSaldo = CurrencyFormat().indonesianFormat(saldo);

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
                Provider.of<SaldoProvider>(context, listen: false)
                    .updateSaldo(saldo);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TopUpPage(),
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<SaldoProvider>(context, listen: false)
                    .updateSaldo(saldo);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TransferPage(),
                  ),
                );
              },
              child: const Icon(Icons.arrow_circle_up),
            ),
          ],
        ),
      ),
    );
  }
}
