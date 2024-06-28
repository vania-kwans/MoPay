import 'package:flutter/material.dart';
import 'package:mopay_ewallet/pages/home/home_bucket.dart';
import 'package:mopay_ewallet/utils/app_error.dart';

class TransferFailedPage extends StatelessWidget {
  final AppError? error;
  const TransferFailedPage({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            MediaQuery.of(context).padding.top - AppBar().preferredSize.height),
        child: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.redAccent[700],
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(
                        Icons.clear,
                        color: Colors.white,
                        size: 70,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Tidak Berhasil',
                      style: TextStyle(
                        color: Colors.redAccent[700],
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(error?.errorMessage ?? "410 - Gone",
                        style: TextStyle(
                          color: Colors.redAccent[700],
                          fontSize: 16,
                        )),
                  ],
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                        'Transaksi ini tidak dapat diproses, silakan coba kembali'),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.help_outline,
                            color: Colors.blue[900],
                          ),
                          const Text(
                            'Butuh Bantuan?',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const HomeBucket()),
                                (route) => false);
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.red.shade900),
                            foregroundColor: Colors.red[900],
                          ),
                          child: const Text(
                            'Coba Lagi',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
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
