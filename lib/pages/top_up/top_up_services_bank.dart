import 'package:flutter/material.dart';
import 'package:mopay_ewallet/pages/top_up/top_up_instruction_bank.dart';
import 'package:provider/provider.dart';
import 'package:mopay_ewallet/pages/top_up/data_metode_top_up.dart';

class LayananTopUpBank extends StatefulWidget {
  final int idxBank;
  const LayananTopUpBank({super.key, required this.idxBank});

  @override
  State<LayananTopUpBank> createState() => _LayananTopUpBankState();
}

class _LayananTopUpBankState extends State<LayananTopUpBank> {
  @override
  Widget build(BuildContext context) {
    TopUpBank topUpBank =
        Provider.of<TopUpBankProvider>(context).data[widget.idxBank];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size(double.infinity, AppBar().preferredSize.height + 10),
        child: AppBar(
          title: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade100)),
                child: CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    topUpBank.linkGambar,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              const Text(
                'Pilih Layanan',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 195, 44, 33),
          foregroundColor: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: topUpBank.tipeLayanan.length,
        itemBuilder: (context, index) {
          List<TipeLayananBank> layananBank = topUpBank.tipeLayanan;

          return Container(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black12)),
            ),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              title: Text(layananBank[index].nama),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => InstruksiTopUpBankPage(
                          idxBank: widget.idxBank, idxTipe: index)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
