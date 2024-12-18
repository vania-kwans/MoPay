import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mopay_ewallet/bloc/auth/auth_bloc.dart';
import 'package:mopay_ewallet/bloc/auth/auth_state.dart';
import 'package:mopay_ewallet/bloc/user/user_bloc.dart';
import 'package:mopay_ewallet/data/data_saldo.dart';
import 'package:mopay_ewallet/data/data_user_mopay.dart';
import 'package:mopay_ewallet/pages/home/home_bucket.dart';
import 'package:mopay_ewallet/pages/splash_page.dart';
import 'package:mopay_ewallet/pages/transfer/data_bank.dart';
import 'package:mopay_ewallet/pages/history/data_history_transaksi.dart';
import 'package:mopay_ewallet/pages/top_up/data_metode_top_up.dart';
import 'package:mopay_ewallet/pages/home/data_tips.dart';
import 'package:mopay_ewallet/data/data_transfer.dart';
import 'package:mopay_ewallet/pages/authentication/forget_password.dart';
import 'package:mopay_ewallet/pages/authentication/login.dart';
import 'package:mopay_ewallet/pages/authentication/register.dart';
import 'package:mopay_ewallet/utils/my_firebase.dart';
import 'package:provider/provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load();
  if (kDebugMode) {
    print("BASE_URL: ${dotenv.env['BASE_URL']}");
  }

  await MyFirebase.initialize();

  final authBloc = AuthBloc();

  await authBloc.checkLogin();

  final userBloc = UserBloc(authBloc);

  Widget app = MultiProvider(
    providers: [
      Provider<AuthBloc>.value(value: authBloc),
      Provider<UserBloc>.value(
        value: userBloc,
      )
    ],
    child: const MyApp(),
  );

  FlutterNativeSplash.remove();
  runApp(app);
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
        navigatorKey: navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xff850000)),
            useMaterial3: true,
            indicatorColor: const Color(0xff850000)),
        home: StreamBuilder<AuthState>(
            stream: context.read<AuthBloc>().controller,
            builder: (context, snapshot) {
              if (snapshot.data?.isLoading ?? false || !snapshot.hasData) {
                return const SplashPage();
              }
              if (snapshot.data?.isAuthenticated ?? false) {
                return const HomeBucket();
              }
              return const LoginPage();
            }),
        routes: {
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/forgotpass': (context) => const ForgetPasswordPage(),
        },
      ),
    );
  }
}
