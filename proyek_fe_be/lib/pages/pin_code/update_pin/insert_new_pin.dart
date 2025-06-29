import 'package:flutter/material.dart';
import 'package:mopay_ewallet/pages/pin_code/update_pin/insert_new_pin_confirmation.dart';
import 'package:mopay_ewallet/pages/pin_code/widget/keyboard_number.dart';

class InsertNewPinPage extends StatefulWidget {
  final String? oldPin;
  const InsertNewPinPage({super.key, this.oldPin});

  @override
  State<InsertNewPinPage> createState() => _InsertNewPinPageState();
}

class _InsertNewPinPageState extends State<InsertNewPinPage> {
  String enteredPin = "";
  bool isPinVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Perbarui PIN'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        height: MediaQuery.of(context).size.height -
            AppBar().preferredSize.height -
            MediaQuery.of(context).padding.top,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 20),
            const Text(
              "Masukkan 6 digit PIN baru kamu.\nPIN adalah password rahasian yang akan digunakan untuk verifikasi sebelum aktivitas dan/atau transaksi penting diproses.",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            // Area kode PIN
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(6, (index) {
                return Container(
                  width: isPinVisible
                      ? (MediaQuery.of(context).size.width - 20) / 8
                      : (MediaQuery.of(context).size.width - 20) / 20,
                  height: isPinVisible
                      ? (MediaQuery.of(context).size.width - 20) / 8
                      : (MediaQuery.of(context).size.width - 20) / 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: isPinVisible
                        ? Colors.transparent
                        : index >= enteredPin.length
                            ? Colors.grey.withOpacity(0.1)
                            : Colors.grey.shade500,
                  ),
                  child: isPinVisible && index < enteredPin.length
                      ? Center(
                          child: Text(
                            enteredPin[index],
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        )
                      : null,
                );
              }),
            ),
            const SizedBox(height: 10),
            // Button untuk lihat dan sembunyikan PIN
            Center(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    isPinVisible = !isPinVisible;
                  });
                },
                child: Text(
                  isPinVisible ? 'Hide password' : 'See password',
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Keyboard area
            for (var i = 0; i < 3; i++) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    3,
                    (index) => keyboardNumber(1 + 3 * i + index),
                  ).toList(),
                ),
              ),
              const SizedBox(height: 50)
            ],
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        enteredPin = "";
                      });
                    },
                    child: const Text(
                      'Reset',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  keyboardNumber(0),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        if (enteredPin.isNotEmpty) {
                          enteredPin =
                              enteredPin.substring(0, enteredPin.length - 1);
                        }
                      });
                    },
                    child: const Icon(
                      Icons.backspace,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget keyboardNumber(int number) {
    return KeyboardNumber(
        onPressed: () async {
          if (enteredPin.length < 5) {
            enteredPin += number.toString();
            setState(() {});
            return;
          }
          enteredPin += number.toString();
          setState(() {});

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => InsertNewPinConfirmation(
                  // OLD PIN KOSONG BERARTI REGISTER PIN BARU
                  oldPin: widget.oldPin,
                  newPin: enteredPin),
            ),
          );
        },
        number: number);
  }
}
