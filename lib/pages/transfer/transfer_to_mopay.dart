import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mopay_ewallet/data/data_saldo.dart';
import 'package:mopay_ewallet/data/data_user_mopay.dart';
import 'package:mopay_ewallet/pages/transfer/transfer_confirmation.dart';
import 'package:provider/provider.dart';
import 'package:mopay_ewallet/format/currency.dart';

class TransferToMopay extends StatefulWidget {
  const TransferToMopay({super.key});

  @override
  State<TransferToMopay> createState() => _TransferToMopayState();
}

class _TransferToMopayState extends State<TransferToMopay> {
  final TextEditingController _noTelp = TextEditingController();
  final TextEditingController _nominal = TextEditingController();
  final TextEditingController _pesan = TextEditingController();

  bool _isNoTelpValid = true;
  bool _isNominalValid = true;

  String _errorTextNoTelp = '';
  String _errorTextNominal = '';

  @override
  Widget build(BuildContext context) {
    int saldo = Provider.of<MopayUserDataProvider>(context).currentUser.saldo;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 50.0),
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
                        Text('Saldo: Rp${formatToIndonesianCurrency(saldo)}'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50.0),
              TextFormField(
                controller: _noTelp,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone),
                  prefixIconColor: Colors.black87,
                  hintText: 'Masukkan nomor ponsel',
                  hintStyle: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w400),
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
                  errorText: _isNoTelpValid ? null : _errorTextNoTelp,
                ),
                keyboardType: TextInputType.phone,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                onChanged: (value) {
                  setState(() {
                    if (value.length < 9 || value.length > 13) {
                      _isNoTelpValid = false;
                      _errorTextNoTelp = 'Nomor telepon tidak sesuai';
                    } else {
                      _isNoTelpValid = true;
                    }
                  });
                },
              ),
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
                          errorText: _isNominalValid ? null : _errorTextNominal,
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
                        onChanged: (value) {
                          final intValue = int.tryParse(value);
                          setState(() {
                            if (intValue != null) {
                              if (intValue < 10000) {
                                _isNominalValid = false;
                                _errorTextNominal = 'Minimal transfer Rp10.000';
                              } else if (intValue > saldo) {
                                _isNominalValid = false;
                                _errorTextNominal = 'Saldo tidak mencukupi';
                              } else {
                                _isNominalValid = true;
                              }
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              TextFormField(
                controller: _pesan,
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
                child: (_noTelp.text.isNotEmpty &&
                        _nominal.text.isNotEmpty &&
                        _isNoTelpValid &&
                        _isNominalValid)
                    ? ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => ConfirmationDialog(
                                  tujuanTransfer: 'MoPay',
                                  nomor: _noTelp.text,
                                  nominal: int.tryParse(_nominal.text) ?? 0,
                                  pesan:
                                      _pesan.text.isEmpty ? "-" : _pesan.text),
                            );
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[900],
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          'TRANSFER',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    : const ElevatedButton(
                        onPressed: null,
                        child: Text(
                          'TRANSFER',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
