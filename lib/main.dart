import 'package:flutter/material.dart';
import 'package:mopay_ewallet/data/data_bank.dart';
import 'package:mopay_ewallet/data/data_history_transaksi.dart';
import 'package:mopay_ewallet/data/data_metode_top_up.dart';
import 'package:mopay_ewallet/data/data_saldo.dart';
import 'package:mopay_ewallet/data/data_transfer.dart';
import 'package:mopay_ewallet/pages/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SaldoProvider()),
        ChangeNotifierProvider(create: (context) => TopUpBankProvider()),
        ChangeNotifierProvider(create: (context) => TopUpTunaiProvider()),
        ChangeNotifierProvider(create: (context) => DataTransferProvider()),
        ChangeNotifierProvider(create: (context) => DataBankProvider()),
        ChangeNotifierProvider(create: (context) => DataHistoryProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
