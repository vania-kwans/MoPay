import 'package:flutter/material.dart';

class ContohCheckBox extends StatefulWidget {
  const ContohCheckBox({super.key});

  @override
  State<ContohCheckBox> createState() => _ContohCheckBoxState();
}

class _ContohCheckBoxState extends State<ContohCheckBox> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contoh Checkbox'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Contoh Textbox'),
            Checkbox(
              value: _isClicked,
              activeColor: Colors.red,
              checkColor: Colors.yellow,
              side: const BorderSide(color: Colors.black),
              onChanged: (bool? value) {
                setState(() {
                  _isClicked = !_isClicked;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
