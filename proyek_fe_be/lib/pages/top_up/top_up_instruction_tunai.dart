import 'package:flutter/material.dart';
import 'package:mopay_ewallet/pages/top_up/data_metode_top_up.dart';
import 'package:provider/provider.dart';

class InstruksiTopUpTunaiPage extends StatelessWidget {
  final int idx;
  const InstruksiTopUpTunaiPage({super.key, required this.idx});

  @override
  Widget build(BuildContext context) {
    TopUpTunai topUpTunai = Provider.of<TopUpTunaiProvider>(context).data[idx];

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
                  border: Border.all(color: Colors.black12),
                  image: DecorationImage(
                    image: AssetImage(topUpTunai.linkGambar),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(topUpTunai.nama,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500)),
                  Text(
                    topUpTunai.nama,
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
                  itemCount: topUpTunai.instruksi.length,
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
                        child: Text(topUpTunai.instruksi[index]),
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
