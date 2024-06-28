import 'package:flutter/material.dart';

class MyErrorComponent extends StatelessWidget {
  final Function() onRefresh;
  const MyErrorComponent({super.key, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        GestureDetector(
          onTap: onRefresh,
          child: Container(
            color: Colors.transparent,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.refresh),
                SizedBox(
                  height: 20,
                ),
                Text("Terjadi kesalahan."),
              ],
            ),
          ),
        )
      ],
    );
  }
}
