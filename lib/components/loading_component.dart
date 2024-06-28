import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mopay_ewallet/main.dart';

void showLoadingDialog() {
  showDialog(
    context: navigatorKey.currentContext!,
    builder: (context) => PopScope(
      canPop: false,
      child: Dialog(
        child: Lottie.asset("assets/lottie/mopayLottie.json"),
      ),
    ),
  );
}
