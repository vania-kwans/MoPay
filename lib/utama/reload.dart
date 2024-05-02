import 'package:flutter/material.dart';

class Reload extends StatelessWidget {
  const Reload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage("assert/sketsa.jpg"), width: 150,),
          Text("Opss halaman belum bisa kamu akses")
        ],
      ),
      )
    );
  }
}
