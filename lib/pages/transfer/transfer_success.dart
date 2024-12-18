import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mopay_ewallet/format/currency.dart';
import 'package:mopay_ewallet/models/transaction.dart';
import 'package:mopay_ewallet/pages/home/home_bucket.dart';

class TransferSuccessPage extends StatelessWidget {
  final Transaction transactionReceipt;
  final int biayaTransaksi;
  const TransferSuccessPage(
      {super.key,
      required this.transactionReceipt,
      required this.biayaTransaksi});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const HomeBucket(),
          ),
        );
      },
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Lottie.asset('assets/lottie/success.json',
                        height: 100, width: 100, fit: BoxFit.cover),
                    const SizedBox(height: 20),
                    Text(
                      'Transaksi Berhasil',
                      style: TextStyle(
                        color: Colors.greenAccent[700],
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Rp${formatToIndonesianCurrency(transactionReceipt.amount - biayaTransaksi)}',
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 25.0),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Center(
                            child: Text(
                              'Penerima',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              transactionReceipt.targetUser?.name ?? "-",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(height: 20),
                          RincianTransaksi(
                            keterangan: 'Nominal Transfer',
                            nilai:
                                'Rp${formatToIndonesianCurrency(transactionReceipt.amount)}',
                            color: Colors.black87,
                          ),
                          const SizedBox(height: 5),
                          const Divider(color: Colors.black12),
                          const Text(
                            'Pesan',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            transactionReceipt.description,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 25.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Detail Transaksi',
                              style: TextStyle(
                                color: Colors.red[900],
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            RincianTransaksi(
                              keterangan: 'MoPay Cash Terpakai',
                              nilai:
                                  'Rp${formatToIndonesianCurrency(transactionReceipt.amount)}',
                            ),
                            const SizedBox(height: 7.0),
                            RincianTransaksi(
                              keterangan: 'Tanggal',
                              nilai: DateFormat.yMEd()
                                  .format(transactionReceipt.createdAt),
                            ),
                            const SizedBox(height: 7.0),
                            RincianTransaksi(
                              keterangan: 'Waktu',
                              nilai: DateFormat.Hms()
                                  .format(transactionReceipt.createdAt),
                            ),
                            const SizedBox(height: 7.0),
                            RincianTransaksi(
                              keterangan: 'No. Transaksi',
                              nilai: transactionReceipt.id.hashCode.toString(),
                            ),
                            const SizedBox(height: 7.0),
                            const Divider(color: Colors.black12),
                            const SizedBox(height: 7.0),
                            RincianTransaksi(
                              keterangan: 'Nominal Transaksi',
                              nilai:
                                  'Rp${formatToIndonesianCurrency(transactionReceipt.amount - biayaTransaksi)}',
                            ),
                            const SizedBox(height: 7.0),
                            RincianTransaksi(
                              keterangan: 'Biaya Transaksi',
                              nilai:
                                  'Rp${formatToIndonesianCurrency(biayaTransaksi)}',
                            ),
                            const SizedBox(height: 7.0),
                            const Divider(color: Colors.black26),
                            const SizedBox(height: 7.0),
                            RincianTransaksi(
                              keterangan: 'Total',
                              nilai:
                                  'Rp${formatToIndonesianCurrency(transactionReceipt.amount)}',
                              color: Colors.red.shade900,
                              isBold: true,
                            ),
                            const SizedBox(height: 15.0),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 35),
                        leading: Icon(
                          Icons.help_outline,
                          color: Colors.blue[900],
                        ),
                        title: const Text('Butuh Bantuan?',
                            style: TextStyle(color: Colors.black87)),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 90,
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(3, 0),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 35,
                      height: 45,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.share),
                        label: const Text('Bagikan'),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.red.shade900),
                          foregroundColor: Colors.red[900],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 35,
                      height: 45,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const HomeBucket()),
                          );
                        },
                        icon: const Icon(Icons.close),
                        label: const Text('Tutup'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[900],
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RincianTransaksi extends StatelessWidget {
  final String keterangan;
  final String nilai;
  final Color color;
  final bool isBold;
  const RincianTransaksi({
    super.key,
    required this.keterangan,
    required this.nilai,
    this.color = Colors.black,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          keterangan,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          nilai,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
