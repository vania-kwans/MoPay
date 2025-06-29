import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mopay_ewallet/bloc/auth/auth_bloc.dart';
import 'package:mopay_ewallet/bloc/auth/auth_state.dart';
import 'package:mopay_ewallet/bloc/store.dart';
import 'package:mopay_ewallet/pages/authentication/login.dart';
import 'package:mopay_ewallet/pages/pin_code/update_pin/forgot_pin.dart';
import 'package:mopay_ewallet/pages/pin_code/widget/keyboard_number.dart';
import 'package:mopay_ewallet/utils/app_error.dart';
import 'package:provider/provider.dart';

class InsertPin extends StatefulWidget {
  const InsertPin({super.key});

  @override
  State<InsertPin> createState() => _InsertPinState();
}

class _InsertPinState extends State<InsertPin> {
  String enteredPin = "";
  bool isPinVisible = false;
  bool isPinValid = false;
  int totalTry = 0;

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
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ForgotPin()),
                  );
                },
                child: const Text(
                  "Lupa PIN?",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Area kode PIN
            StreamBuilder<AuthState>(
                stream: bloc.pinController,
                builder: (context, snapshot) {
                  bool hasError = snapshot.data?.hasError ?? false;
                  return Row(
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
                              ? const Color.fromARGB(255, 195, 44, 33)
                              : index >= enteredPin.length
                                  ? Colors.grey.withOpacity(0.1)
                                  : hasError
                                      ? const Color.fromARGB(255, 195, 44, 33)
                                      : const Color.fromARGB(255, 195, 44, 33),
                        ),
                        child: isPinVisible && index < enteredPin.length
                            ? Center(
                                child: Text(
                                  enteredPin[index],
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: hasError
                                        ? const Color.fromARGB(255, 195, 44, 33)
                                        : Colors.white,
                                  ),
                                ),
                              )
                            : null,
                      );
                    }),
                  );
                }),
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
                          bloc.resetPinStream();
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
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () async {
                  await bloc.logout();
                  if (!context.mounted) return;
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                      (route) => false);
                },
                child: const Text("Keluar dari akun",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red)))
          ],
        ),
      ),
    );
  }

  Widget keyboardNumber(int number) {
    return KeyboardNumber(
        onPressed: () async {
          if (enteredPin.length + 1 < 6) {
            setState(() => enteredPin += number.toString());
            bloc.resetPinStream();
            return;
          }

          setState(() {
            enteredPin += number.toString();
          });

          showDialog(
              context: context,
              builder: (context) => PopScope(
                    canPop: false,
                    child: Dialog(
                      child: Lottie.asset('assets/lottie/mopayLottie.json'),
                    ),
                  ));

          AppError? error = await bloc.verifyPin(enteredPin);

          // POP LOADING DIALOG
          if (!mounted) return;
          Navigator.pop(context);

          if (error != null) {
            totalTry++;
            setState(() => enteredPin = "");
            bloc.resetPinStream();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    "PIN yang Anda masukkan salah. Silakan coba lagi \n Total percobaan tersisa: ${5 - totalTry}"),
                backgroundColor: Colors.red,
              ),
            );

            if (totalTry >= 5) {
              await bloc.logout();
              return;
            }
            return;
          }

          await Store.setLastPinEnter(DateTime.now());
          if (!mounted) return;
          Navigator.pop(context, true);
        },
        number: number);
  }
}
