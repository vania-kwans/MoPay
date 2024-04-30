import 'package:flutter/material.dart';
import 'package:mopay_ewallet/data/data_metode_top_up.dart';
import 'package:mopay_ewallet/pages/top_up/top_up_each_method.dart';
import 'package:mopay_ewallet/pages/top_up/top_up_services_bank.dart';
import 'package:mopay_ewallet/pages/top_up/top_up_instruction_tunai.dart';
import 'package:provider/provider.dart';

class PilihanMetodeTopUpPage extends StatelessWidget {
  const PilihanMetodeTopUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Top up',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        // iconTheme: const IconThemeData(color: Colors.white),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 195, 44, 33),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height -
              MediaQuery.of(context).padding.top,
          color: Colors.grey.withOpacity(0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 15.0,
                  left: 15.0,
                  right: 15.0,
                  bottom: 5.0,
                ),
                child: Text(
                  'Pilih Metode',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10.0,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Top up pakai uang tunai',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MetodeTopUpPage(
                                metode: "tunai",
                              ),
                            ));
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.blue[800],
                          ),
                          child: const Row(
                            children: [
                              Text(
                                'Cek semua',
                                style: TextStyle(fontSize: 15),
                              ),
                              Icon(Icons.keyboard_arrow_right)
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        circleContainerTunai(context, idxTunai: 0),
                        const SizedBox(width: 10),
                        circleContainerTunai(context, idxTunai: 1),
                        const SizedBox(width: 10),
                        circleContainerTunai(context, idxTunai: 2),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        circleContainerTunai(context, idxTunai: 3),
                        const SizedBox(width: 10),
                        circleContainerTunai(context, idxTunai: 4),
                        const SizedBox(width: 10),
                        circleContainerTunai(context, idxTunai: 5),
                      ],
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10.0,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Top up lewat Bank',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MetodeTopUpPage(
                                metode: "bank",
                              ),
                            ));
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.blue[800],
                          ),
                          child: const Row(
                            children: [
                              Text(
                                'Cek semua',
                                style: TextStyle(fontSize: 15),
                              ),
                              Icon(Icons.keyboard_arrow_right)
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        circleContainerBank(context, idxBank: 0),
                        const SizedBox(width: 10),
                        circleContainerBank(context, idxBank: 1),
                        const SizedBox(width: 10),
                        circleContainerBank(context, idxBank: 2),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        circleContainerBank(context, idxBank: 3),
                        const SizedBox(width: 10),
                        circleContainerBank(context, idxBank: 4),
                        const SizedBox(width: 10),
                        circleContainerBank(context, idxBank: 5),
                      ],
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget circleContainerTunai(BuildContext context, {required int idxTunai}) {
  List<TopUpTunai> metodeTunai = Provider.of<TopUpTunaiProvider>(context).data;

  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => InstruksiTopUpTunaiPage(idx: idxTunai),
      ));
    },
    child: Column(
      children: [
        Container(
          width: 60.0,
          height: 60.0,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // Circle background color
            border: Border.all(
              color: Colors.grey.withOpacity(0.3),
            ), // Grey border
          ),
          child: ClipOval(
            child: Image.asset(
              metodeTunai[idxTunai].linkGambar,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Text(
          metodeTunai[idxTunai].nama,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

Widget circleContainerBank(BuildContext context, {required int idxBank}) {
  List<TopUpBank> metodeBank = Provider.of<TopUpBankProvider>(context).data;

  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LayananTopUpBank(idxBank: idxBank),
      ));
    },
    child: Column(
      children: [
        Container(
          width: 60.0,
          height: 60.0,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // Circle background color
            border: Border.all(
              color: Colors.grey.withOpacity(0.3),
            ), // Grey border
          ),
          child: ClipOval(
            child: Image.asset(
              metodeBank[idxBank].linkGambar,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Text(
          metodeBank[idxBank].namaBank,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}
