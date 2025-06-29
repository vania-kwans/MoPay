import 'package:flutter/material.dart';
import 'package:mopay_ewallet/utils/app_error.dart';

class MyErrorComponent extends StatelessWidget {
  final Function() onRefresh;
  final AppError? error;
  const MyErrorComponent({super.key, required this.onRefresh, this.error});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        GestureDetector(
          onTap: onRefresh,
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.refresh),
                const SizedBox(
                  height: 20,
                ),
                Text(error?.errorMessage ?? "Terjadi kesalahan."),
              ],
            ),
          ),
        )
      ],
    );
  }
}
