import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mopay_ewallet/data/data_saldo.dart';
import 'package:mopay_ewallet/data/data_user_mopay.dart';
import 'package:mopay_ewallet/pages/transfer/data_bank.dart';
import 'package:mopay_ewallet/pages/history/data_history_transaksi.dart';
import 'package:mopay_ewallet/pages/top_up/data_metode_top_up.dart';
import 'package:mopay_ewallet/pages/home/data_tips.dart';
import 'package:mopay_ewallet/data/data_transfer.dart';
import 'package:mopay_ewallet/pages/authentication/forget_password.dart';
import 'package:mopay_ewallet/pages/authentication/login.dart';
import 'package:mopay_ewallet/pages/authentication/register.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (context) => SaldoProvider()),
        ChangeNotifierProvider(create: (context) => TopUpBankProvider()),
        ChangeNotifierProvider(create: (context) => TopUpTunaiProvider()),
        ChangeNotifierProvider(create: (context) => DataTransferProvider()),
        ChangeNotifierProvider(create: (context) => DataBankProvider()),
        ChangeNotifierProvider(create: (context) => DataHistoryProvider()),
        ChangeNotifierProvider(create: (context) => DataTipsSliderProvider()),
        ChangeNotifierProvider(create: (context) => MopayUserDataProvider()),
        ChangeNotifierProvider(create: (context) => BalancesProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginPage(),
        routes: {
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/forgotpass': (context) => const ForgetPasswordPage(),
        },
      ),
    );
  }
}
