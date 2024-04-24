import 'package:flutter/material.dart';
import 'package:mopay_ewallet/chris/forgotpass.dart';
import 'package:mopay_ewallet/chris/login.dart';
import 'package:mopay_ewallet/chris/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MOPay',
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {
        '/login':(context) => Login(),
        '/register':(context) => Register(),
        '/forgotpass':(context) => forgotpass()
        },
    );
    
  }
}

