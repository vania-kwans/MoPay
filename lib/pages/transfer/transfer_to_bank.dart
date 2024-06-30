import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mopay_ewallet/bloc/user/user_bloc.dart';
import 'package:mopay_ewallet/bloc/user/user_state.dart';
import 'package:mopay_ewallet/pages/transfer/data_bank.dart';
import 'package:mopay_ewallet/format/currency.dart';
import 'package:mopay_ewallet/pages/transfer/transfer_confirmation.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

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

  final bool _isNominalValid = true;
  final bool _isNoRekeningValid = true;

  final String _errorTextNoRekening = '';
  final String _errorTextNominal = '';

  late UserBloc bloc;

  final validator = BehaviorSubject<bool>.seeded(false);

  final _selectedBank = BehaviorSubject<String>();

  @override
  void initState() {
    bloc = Provider.of<UserBloc>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<DataBank> dataBank = Provider.of<DataBankProvider>(context).dataBank;

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
      body: StreamBuilder<UserState>(
          stream: bloc.state,
          builder: (context, snapshot) {
            int currentBalances = snapshot.data?.user?.balance ?? 0;
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
                              Text(
                                  'Saldo: Rp${formatToIndonesianCurrency(currentBalances)}'),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    StreamBuilder<String>(
                        stream: _selectedBank,
                        builder: (context, snapshot) {
                          bool isBankSelected =
                              snapshot.hasData && snapshot.data!.isNotEmpty;
                          return DropdownButtonFormField(
                            items: dataBank
                                .map((e) => DropdownMenuItem(
                                      value: e.nama,
                                      child: Text(e.nama),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              _selectedBank.add(value.toString());
                            },
                            value: snapshot.data,
                            decoration: InputDecoration(
                              hintText: 'Pilih Bank',
                              errorText: isBankSelected
                                  ? null
                                  : 'Pilih salah satu bank',
                            ),
                          );
                        }),
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
                        errorText:
                            _isNoRekeningValid ? null : _errorTextNoRekening,
                      ),
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        validator.add(false);
                        int? currentBankDigit = dataBank
                            .firstWhereOrNull((data) =>
                                data.nama == _selectedBank.valueOrNull)
                            ?.jlhDigitNoRek;
                        if (currentBankDigit == null) {
                          return null;
                        }
                        if (value!.length > currentBankDigit ||
                            value.length < currentBankDigit) {
                          return 'Nomor rekening tidak sesuai';
                        }
                        validator.add(true);
                        return null;
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
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                validator.add(false);
                                int value = int.tryParse(_nominal.text) ?? 0;
                                if (value < 10000) {
                                  return 'Minimal transfer Rp10.000';
                                } else if (value > currentBalances) {
                                  return 'Saldo tidak mencukupi';
                                } else if (value >
                                    currentBalances - biayaTransaksi) {
                                  return 'Maks. Transfer Rp${formatToIndonesianCurrency(currentBalances - biayaTransaksi)} (Biaya Transaksi Rp${formatToIndonesianCurrency(biayaTransaksi)})';
                                }
                                validator.add(true);
                                return null;
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
                    StreamBuilder<bool>(
                        stream: validator,
                        builder: (context, snapshot) {
                          bool isValid = snapshot.data ?? false;
                          return SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: !isValid
                                    ? null
                                    : () {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (context) =>
                                              ConfirmationDialog(
                                                  tujuanTransfer: _selectedBank
                                                      .valueOrNull!,
                                                  nomor: _noRekening.text,
                                                  nominal: int.tryParse(
                                                          _nominal.text) ??
                                                      0,
                                                  pesan: _pesan.text),
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
                              ));
                        }),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
