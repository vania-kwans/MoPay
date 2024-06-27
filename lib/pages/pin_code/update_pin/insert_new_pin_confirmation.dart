import 'package:flutter/material.dart';
import 'package:mopay_ewallet/bloc/auth/auth_bloc.dart';
import 'package:mopay_ewallet/pages/pin_code/widget/keyboard_number.dart';
import 'package:mopay_ewallet/utils/app_error.dart';
import 'package:provider/provider.dart';

class InsertNewPinConfirmation extends StatefulWidget {
  final String? oldPin;
  final String newPin;
  const InsertNewPinConfirmation(
      {super.key, required this.newPin, required this.oldPin});

  @override
  State<InsertNewPinConfirmation> createState() =>
      _InsertNewPinConfirmationState();
}

class _InsertNewPinConfirmationState extends State<InsertNewPinConfirmation> {
  String enteredPin = "";
  bool isPinVisible = false;
  late AuthBloc bloc;

  @override
  void initState() {
    bloc = Provider.of<AuthBloc>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Konfirmasi PIN'),
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
                "Masukkan 6 digit PIN baru kamu. PIN adalah password rahasia yang akan digunakan untuk verifikasi sebelum aktivitas dna/atau transaksi penting diproses.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        3,
                        (index) => keyboardNumber(1 + 3 * i + index),
                      ).toList(),
                    ),
                  ],
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

  Widget keyboardNumber(int number) {
    return KeyboardNumber(
        onPressed: () async {
          if (enteredPin.length < 6) {
            setState(() => enteredPin += number.toString());
            return;
          }
          AppError? error;
          if (widget.oldPin != null) {
            error = await bloc.updatePin(widget.newPin, enteredPin);

            if (!mounted) return;
            if (error == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('PIN succesfully changed.'),
                  backgroundColor: Colors.green[700],
                  behavior: SnackBarBehavior.floating, // Floating behavior
                  elevation: 10,
                ),
              );
              Navigator.pop(context);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(error.message),
                  backgroundColor: Colors.red[700],
                  behavior: SnackBarBehavior.floating, // Floating behavior
                  elevation: 10,
                ),
              );
              setState(() => enteredPin = "");
            }
            return;
          }
          // DAFTAR PIN BARU JIKA OLD PIN TIDAK ADA
          error = await bloc.registerPin(enteredPin);
          if (!mounted) return;
          if (error == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('PIN succesfully registered.'),
                backgroundColor: Colors.green[700],
                behavior: SnackBarBehavior.floating, // Floating behavior
                elevation: 10,
              ),
            );
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error.message),
                backgroundColor: Colors.red[700],
                behavior: SnackBarBehavior.floating, // Floating behavior
                elevation: 10,
              ),
            );
            setState(() => enteredPin = "");
          }
        },
        number: number);
  }
}
