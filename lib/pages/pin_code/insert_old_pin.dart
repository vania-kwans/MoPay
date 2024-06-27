import 'package:flutter/material.dart';
import 'package:mopay_ewallet/data/data_user_mopay.dart';
import 'package:mopay_ewallet/pages/pin_code/insert_new_pin.dart';
import 'package:provider/provider.dart';

class InsertOldPinPage extends StatefulWidget {
  const InsertOldPinPage({super.key});

  @override
  State<InsertOldPinPage> createState() => _InsertOldPinPageState();
}

class _InsertOldPinPageState extends State<InsertOldPinPage> {
  String enteredPin = "";
  bool isPinVisible = false;
  bool isPinValid = false;

  Widget keyboardNumber(int number) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: TextButton(
        onPressed: () {
          setState(() {
            if (enteredPin.length < 6) {
              enteredPin += number.toString();
            }
            if (enteredPin.length == 6) {
              isPinValid =
                  Provider.of<MopayUserDataProvider>(context, listen: false)
                      .validatePin(enteredPin);

              if (isPinValid) {
                setState(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const InsertNewPinPage(),
                    ),
                  );
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('PIN tidak sesuai. Silakan coba lagi.'),
                    backgroundColor: Colors.red[700],
                    behavior: SnackBarBehavior.floating, // Floating behavior
                    elevation: 10,
                  ),
                );
                enteredPin = "";
              }
            }
          });
        },
        child: Text(
          number.toString(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('PIN MoPay Kamu'),
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
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Masukkan PIN Kamu',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "Demi keamanan, mohon masukkan PIN Anda.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ),
            const Center(
              child: Text(
                "Lupa PIN?",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                ),
              ),
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
                    color: index < enteredPin.length
                        ? isPinVisible
                            ? const Color.fromARGB(255, 195, 44, 33)
                            : const Color.fromARGB(255, 195, 44, 33)
                        : Colors.grey.withOpacity(0.1),
                  ),
                  child: isPinVisible && index < enteredPin.length
                      ? Center(
                          child: Text(
                            enteredPin[index],
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : null,
                );
              }),
            ),
            const SizedBox(height: 10),
            // Button untuk lihat dan sembunyikan PIN
            TextButton(
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
            // Keyboard area
            for (var i = 0; i < 3; i++)
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        enteredPin = "";
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Text(
                        'Reset',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
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
                    child: const Padding(
                      padding: EdgeInsets.only(left: 15, top: 40),
                      child: Icon(
                        Icons.backspace,
                        color: Colors.black,
                        size: 24,
                      ),
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
}
