import 'package:flutter/material.dart';

class Reload extends StatelessWidget {
  const Reload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Halaman belum bisa direload")],
          ),
        ));
  }
}
