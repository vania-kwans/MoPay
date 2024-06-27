import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mopay_ewallet/data/data_saldo.dart';
import 'package:mopay_ewallet/pages/transfer/data_bank.dart';
import 'package:mopay_ewallet/format/currency.dart';
import 'package:mopay_ewallet/pages/transfer/transfer_confirmation.dart';
import 'package:provider/provider.dart';

class TransferToBank extends StatefulWidget {
  const TransferToBank({super.key});

  @override
  State<TransferToBank> createState() => _TransferToBankState();
}

class _TransferToBankState extends State<TransferToBank> {
  final TextEditingController _noRekening = TextEditingController();
  final TextEditingController _nominal = TextEditingController();
  final TextEditingController _pesan = TextEditingController();
  int biayaTransaksi = 2500;

  String _selectedBank = "";
  bool _isBankSelected = true;
  bool _isNominalValid = true;
  bool _isNoRekeningValid = true;

  String _errorTextPilihBank = '';
  String _errorTextNoRekening = '';
  String _errorTextNominal = '';

  @override
  Widget build(BuildContext context) {
    Balances? currentBalances =
        Provider.of<BalancesProvider>(context).currentBalance;
    String formattedSaldo = formatToIndonesianCurrency(currentBalances!.saldo);
    List dataBank = Provider.of<DataBankProvider>(context).dataBank;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ke Rekening',
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
                  border: Border.all(color: Colors.black38),
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
                        Text('Saldo: Rp$formattedSaldo'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50.0),
              DropdownButtonFormField(
                items: dataBank
                    .map((e) => DropdownMenuItem(
                          value: e.nama,
                          child: Text(e.nama),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedBank = value.toString();
                    if (_selectedBank == '') {
                      _isBankSelected = false;
                      _errorTextPilihBank = 'Harus pilih bank tujuan';
                    }
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Pilih Bank',
                  errorText: _isBankSelected ? null : _errorTextPilihBank,
                ),
              ),
              const SizedBox(height: 30.0),
              TextFormField(
                controller: _noRekening,
                decoration: InputDecoration(
                  label: const Text('Nomor Rekening'),
                  hintText: 'Nomor Rekening',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
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
                  errorText: _isNoRekeningValid ? null : _errorTextNoRekening,
                ),
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                onChanged: (value) {
                  setState(() {
                    int jlhDigitNoRek = dataBank
                        .firstWhere((data) => data.nama == _selectedBank)
                        .jlhDigitNoRek;
                    if (value.length > jlhDigitNoRek ||
                        value.length < jlhDigitNoRek) {
                      _isNoRekeningValid = false;
                      _errorTextNoRekening = 'Nomor rekening tidak sesuai';
                    } else {
                      _isNoRekeningValid = true;
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
                          final nominalInt = int.tryParse(value);
                          setState(() {
                            if (nominalInt != null) {
                              if (nominalInt < 10000) {
                                _isNominalValid = false;
                                _errorTextNominal = 'Minimal transfer Rp10.000';
                              } else if (nominalInt > currentBalances.saldo) {
                                _isNominalValid = false;
                                _errorTextNominal = 'Saldo tidak mencukupi';
                              } else if (nominalInt >
                                  currentBalances.saldo - biayaTransaksi) {
                                _isNominalValid = false;
                                _errorTextNominal =
                                    'Maks. Transfer Rp${formatToIndonesianCurrency(currentBalances.saldo - biayaTransaksi)} (Biaya Transaksi Rp${formatToIndonesianCurrency(biayaTransaksi)})';
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
                child: (_noRekening.text.isNotEmpty &&
                        _nominal.text.isNotEmpty &&
                        _isBankSelected &&
                        _isNoRekeningValid &&
                        _isNominalValid)
                    ? ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => ConfirmationDialog(
                                  tujuanTransfer: _selectedBank,
                                  nomor: _noRekening.text,
                                  nominal: int.tryParse(_nominal.text) ?? 0,
                                  pesan: _pesan.text),
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
