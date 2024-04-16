import 'package:flutter/material.dart';
import 'package:mopay_ewallet/data/data_metode_top_up.dart';
import 'package:provider/provider.dart';

class InstruksiTopUpPage extends StatelessWidget {
  final int idxBank;
  final int idxTipe;
  const InstruksiTopUpPage(
      {super.key, required this.idxBank, required this.idxTipe});

  @override
  Widget build(BuildContext context) {
    TopUpBank topUpBank = Provider.of<TopUpBankProvider>(context).data[idxBank];
    TipeLayananBank tipeLayanan = Provider.of<TopUpBankProvider>(context)
        .data[idxBank]
        .tipeLayanan[idxTipe];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height + 10),
        child: AppBar(
          surfaceTintColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              const SizedBox(width: 5),
              Container(
                width: AppBar().preferredSize.height,
                height: AppBar().preferredSize.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black12),
                  image: DecorationImage(
                    image: NetworkImage(topUpBank.linkGambar),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(topUpBank.namaBank,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500)),
                  Text(
                    tipeLayanan.nama,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              )
            ],
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.close),
            ),
            const SizedBox(width: 15),
          ],
        ),
      ),
      body: Container(
        color: Colors.grey.withOpacity(0.1),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Cara isi MoPay: ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 15),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('• Biaya Admin Rp1.000'),
                      Text('• Minimum Top-up Rp10.000'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Divider(color: Colors.grey[200]),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                color: Colors.white,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: tipeLayanan.instruksi.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 15,
                        backgroundColor: const Color.fromARGB(255, 195, 44, 33),
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(tipeLayanan.instruksi[index]),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
