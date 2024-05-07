import 'package:flutter/material.dart';
import 'package:mopay_ewallet/data/data_history_transaksi.dart';
import 'package:mopay_ewallet/data/data_saldo.dart';
import 'package:mopay_ewallet/data/data_transfer.dart';
import 'package:mopay_ewallet/data/data_user_mopay.dart';
import 'package:mopay_ewallet/format/datetime.dart';
import 'package:mopay_ewallet/pages/transfer/transfer_failed.dart';
import 'package:mopay_ewallet/pages/transfer/transfer_success.dart';
import 'package:provider/provider.dart';
import 'package:mopay_ewallet/format/currency.dart';

class ConfirmationDialog extends StatelessWidget {
  final String tujuanTransfer;
  final String nomor;
  final int nominal;
  final String pesan;

  const ConfirmationDialog({
    super.key,
    required this.tujuanTransfer,
    required this.nomor,
    required this.nominal,
    required this.pesan,
  });

  @override
  Widget build(BuildContext context) {
    MopayUserData currentUser =
        Provider.of<MopayUserDataProvider>(context).currentUser;
    int biayaTransaksi = tujuanTransfer == 'MoPay' ? 0 : 2500;

    return Dialog(
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
                  '$tujuanTransfer - $nomor',
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
                'MoPay Cash',
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
                pesan,
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
                    'Rp${formatToIndonesianCurrency(nominal)}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Biaya Transaksi',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    tujuanTransfer == 'MOPAY'
                        ? 'Rp0'
                        : 'Rp${formatToIndonesianCurrency(biayaTransaksi)}',
                    style: const TextStyle(
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
                    tujuanTransfer == 'MOPAY'
                        ? 'Rp${formatToIndonesianCurrency(nominal)}'
                        : 'Rp${formatToIndonesianCurrency(nominal + biayaTransaksi)}',
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
                  onPressed: () {
                    if (currentUser.noTelp != nomor) {
                      Provider.of<MopayUserDataProvider>(context, listen: false)
                          .subtractSaldoforCurrentUser(
                              nominal + biayaTransaksi);
                      Provider.of<DataTransferProvider>(context, listen: false)
                          .tambahData(
                        "Person 1",
                        getCurrentDate(),
                        getCurrentTime(),
                        tujuanTransfer,
                        nomor,
                        nominal,
                        pesan,
                      );
                      Provider.of<DataHistoryProvider>(context, listen: false)
                          .tambahDataTransferKeluar(
                        '404-nanti mau diganti',
                        "Person 1",
                        nominal,
                        getCurrentDate(),
                        getCurrentTime(),
                        tujuanTransfer,
                        nomor,
                        pesan,
                      );
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const TransferSuccessPage(),
                      ));
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const TransferFailedPage(),
                      ));
                    }
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
    );
  }
}

// void showConfirmationPage(
//   BuildContext context,
//   String nomor,
//   String nominal,
//   String pesan,
// ) {
//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (context) => ConfirmationDialog(
//       nomor: nomor,
//       nominal: nominal,
//       pesan: pesan,
//     ),
//   );
// }
