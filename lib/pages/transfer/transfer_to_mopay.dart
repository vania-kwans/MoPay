import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mopay_ewallet/bloc/user/user_bloc.dart';
import 'package:mopay_ewallet/bloc/user/user_state.dart';
import 'package:mopay_ewallet/pages/transfer/transfer_confirmation.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class TransferToMopay extends StatefulWidget {
  const TransferToMopay({super.key});

  @override
  State<TransferToMopay> createState() => _TransferToMopayState();
}

class _TransferToMopayState extends State<TransferToMopay> {
  final TextEditingController _noTelp = TextEditingController();
  final TextEditingController _nominal = TextEditingController();
  final TextEditingController _pesan = TextEditingController();

  final _noTelpSearch = BehaviorSubject<String>.seeded("");

  final bool _isNoTelpValid = true;
  final bool _isNominalValid = true;

  final String _errorTextNoTelp = '';
  final String _errorTextNominal = '';

  late UserBloc bloc;
  final validityStream = BehaviorSubject<bool>.seeded(false);

  @override
  void initState() {
    bloc = Provider.of<UserBloc>(context, listen: false);

    bloc.resetProfileController();
    _noTelpSearch.debounceTime(const Duration(seconds: 1)).listen((event) {
      if (event.length >= 8) {
        bloc.getPublicProfile("0$event");
      }
    });

    bloc.getBalance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ke Sesama MoPay',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color.fromARGB(255, 195, 44, 33),
      ),
      body: StreamBuilder<UserState>(
          stream: bloc.state,
          builder: (context, snapshot) {
            bool isLoading =
                snapshot.data?.isLoading ?? false || !snapshot.hasData;

            if (isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            UserState state = snapshot.data!;

            if (state.hasError) {
              return const Center(
                child: Text('Terjadi kesalahan'),
              );
            }

            int currentBalances = state.user?.balance ?? 0;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 35.0, vertical: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sumber Dana",
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(height: 5.0),
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/logo-mopay/logo2.png',
                              width: 50,
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'MOPAY Cash',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Text('Saldo: ${NumberFormat.currency(
                                  locale: 'id',
                                  decimalDigits: 0,
                                  symbol: 'Rp',
                                ).format(currentBalances)}'),
                              ],
                            ),
                          ],
                        )),
                    const SizedBox(height: 50.0),
                    StreamBuilder<UserState>(
                        stream: bloc.publicProfileController,
                        builder: (context, snapshot) {
                          bool isLoading = snapshot.data?.isLoading ??
                              false || !snapshot.hasData;
                          bool hasError = snapshot.data?.hasError ?? false;
                          bool hasUser = snapshot.data?.user != null;
                          bool isTheUserTheirself =
                              snapshot.data?.user?.phoneNumber ==
                                  state.user?.phoneNumber;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(left: 40),
                                  child: Text(snapshot.data?.user?.name ?? "")),
                              TextFormField(
                                controller: _noTelp,
                                autovalidateMode: AutovalidateMode.always,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                validator: (value) {
                                  validityStream.add(false);
                                  if (value!.isEmpty) {
                                    return 'Nomor telepon tidak boleh kosong';
                                  }
                                  if (value.length < 9 || value.length > 13) {
                                    return 'Nomor telepon tidak sesuai';
                                  }
                                  if (hasError) {
                                    return 'Nomor telepon tidak ditemukan';
                                  }
                                  if (isTheUserTheirself) {
                                    return 'Tidak bisa transfer ke diri sendiri';
                                  }
                                  validityStream.add(true);
                                  return null;
                                },
                                onChanged: (value) => _noTelpSearch.add(value),
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.phone),
                                  prefixIconColor: Colors.black87,
                                  hintText: 'Masukkan nomor ponsel',
                                  hintStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black87,
                                    ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  prefixText: '+62 ',
                                  errorText:
                                      _isNoTelpValid ? null : _errorTextNoTelp,
                                  suffixIcon: isLoading
                                      ? Lottie.asset(
                                          'assets/lottie/loadingLottie.json',
                                          width: 20)
                                      : hasError || isTheUserTheirself
                                          ? const Icon(
                                              Icons.close_rounded,
                                              color: Colors.redAccent,
                                            )
                                          : hasUser
                                              ? const Icon(Icons.check_rounded)
                                              : null,
                                ),
                                keyboardType: TextInputType.phone,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          );
                        }),
                    const SizedBox(height: 30.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Nominal Transfer'),
                            TextFormField(
                              controller: _nominal,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                validityStream.add(false);
                                if (value!.isEmpty) {
                                  return 'Nominal tidak boleh kosong';
                                }
                                if (int.tryParse(value) == null) {
                                  return 'Nominal tidak valid';
                                }
                                if (int.tryParse(value)! < 10000) {
                                  return 'Nominal minimal Rp 10.000';
                                }
                                if (int.tryParse(value)! > currentBalances) {
                                  return 'Saldo tidak mencukupi';
                                }

                                validityStream.add(true);
                                return null;
                              },
                              decoration: InputDecoration(
                                prefixText: "Rp",
                                prefixStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 25,
                                ),
                                hintStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 25,
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                errorText:
                                    _isNominalValid ? null : _errorTextNominal,
                                errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                focusedErrorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    TextFormField(
                      controller: _pesan,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        label: Text('Pesan(opsional)'),
                        hintText: 'Masukkan pesan',
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w400),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black87,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      minLines: 1,
                      maxLength: 50,
                      maxLines: null,
                    ),
                    const SizedBox(height: 50.0),
                    SizedBox(
                        width: double.infinity,
                        child: StreamBuilder<bool>(
                            stream: validityStream,
                            builder: (context, snapshot) {
                              bool isValid = snapshot.data ?? false;
                              return ElevatedButton(
                                onPressed: !isValid
                                    ? null
                                    : () {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (context) =>
                                              ConfirmationDialog(
                                                  tujuanTransfer: 'MoPay',
                                                  nomor: "0${_noTelp.text}",
                                                  nominal: int.tryParse(
                                                          _nominal.text) ??
                                                      0,
                                                  pesan: _pesan.text.isEmpty
                                                      ? null
                                                      : _pesan.text),
                                        );
                                      },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red[900],
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text(
                                  'TRANSFER',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              );
                            })),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
