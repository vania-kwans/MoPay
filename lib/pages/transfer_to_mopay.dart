import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mopay_ewallet/pages/top_up.dart';
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

  String _errorText = "";

  bool _isTransferPossible = true;
  bool _isNominalValid = true;

  @override
  Widget build(BuildContext context) {
    int saldo = Provider.of<SaldoProvider>(context).saldo;
    String formattedSaldo = CurrencyFormat().indonesianFormat(saldo);

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
                    Image.network(
                      'https://1.bp.blogspot.com/-hg2Q7RJB540/X3L1-vg-yNI/AAAAAAAAAdI/Nsb-hcTRKcgECx4E4u4sLnvnJeDhuDQdgCLcBGAsYHQ/s2916/Logo%2BBank%2BBCA.png',
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
              TextFormField(
                controller: _noTelp,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  prefixIconColor: Colors.black87,
                  hintText: 'Masukkan nomor ponsel',
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w400),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black87,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                ),
                keyboardType: TextInputType.phone,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
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
                          errorText: _isNominalValid ? null : _errorText,
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
                                _errorText = 'Minimal transfer Rp10.000';
                              } else {
                                _isNominalValid = true;
                                _nominal.text =
                                    CurrencyFormat().indonesianFormat(intValue);
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
                      color: Colors.red,
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
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_nominal.text.isEmpty) {
                        _isNominalValid =
                            false; // Set to true to show error text
                        _errorText = 'Nominal transfer tidak boleh kosong';
                      } else if (_isNominalValid == true) {
                        showConfirmationPage(
                            context, _noTelp.text, _nominal.text, _pesan.text);
                      }
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showConfirmationPage(
        BuildContext context, String noTelp, String nominal, String pesan) =>
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 25.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Konfirmasi Transfer',
                  style: TextStyle(
                    color: Colors.red[900],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15.0),
                const Text(
                  'Penerima',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const CircleAvatar(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                    child: Icon(Icons.person_2_outlined),
                  ),
                  title: Text(
                    'Vania'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    'Mopay - $noTelp',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                const Text(
                  'Sumber Dana',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
                const Text(
                  'MOPAY Cash',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 15.0),
                const Text(
                  'Pesan',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
                Text(
                  pesan.isNotEmpty ? pesan : "-",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Detail',
                  style: TextStyle(
                    color: Colors.red[900],
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Nominal Transfer',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      nominal.isNotEmpty ? 'Rp$nominal' : "Rp0",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Biaya Transaksi',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'Rp0',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        color: Colors.red[900],
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Rp100.000',
                      style: TextStyle(
                        color: Colors.red[900],
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow[50],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const ListTile(
                    leading: Icon(Icons.warning),
                    iconColor: Colors.orange,
                    subtitle: Text(
                        'Pastikan akun tujuan benar.\nSaldomu nantinya tidak bisa dikembalikan.'),
                  ),
                ),
                const SizedBox(height: 15.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[900],
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'TRANSFER',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red[900],
                    ),
                    child: const Text(
                      'BATALKAN',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
