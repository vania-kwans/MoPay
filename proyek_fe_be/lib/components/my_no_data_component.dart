import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyNoDataComponent extends StatelessWidget {
  final Future Function() onRefresh;
  const MyNoDataComponent({super.key, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onRefresh,
      child: Container(
        color: Colors.transparent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie/emptyLottie.json', height: 100),
              const SizedBox(
                height: 20,
              ),
              const Text("Data tidak ditemukan."),
              const SizedBox(
                height: 10,
              ),
              const Text("Klik untuk refresh."),
            ],
          ),
        ),
      ),
    );
  }
}
