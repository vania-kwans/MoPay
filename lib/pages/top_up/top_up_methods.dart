import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mopay_ewallet/data/data_metode_top_up.dart';
import 'package:provider/provider.dart';

class MetodeTopUpPage extends StatelessWidget {
  const MetodeTopUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<TopUpBank> metodeBank = Provider.of<TopUpBankProvider>(context).data;

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
              height: MediaQuery.of(context).size.height,
              color: Colors.grey.withOpacity(0.1),
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 20.0),
                  color: Colors.white,
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
                          // ElevatedButton(
                          //   onPressed: () {},
                          //   child: const Row(
                          //     children: [
                          //       Text('Cek semua'),
                          //       Icon(Icons.keyboard_double_arrow_right)
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          circleContainer(
                              metodeBank[0].linkGambar, metodeBank[0].namaBank),
                          const SizedBox(width: 10),
                          circleContainer(
                              metodeBank[1].linkGambar, metodeBank[1].namaBank),
                          const SizedBox(width: 10),
                          circleContainer(
                              metodeBank[2].linkGambar, metodeBank[2].namaBank),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          circleContainer(
                              metodeBank[3].linkGambar, metodeBank[3].namaBank),
                          const SizedBox(width: 10),
                          circleContainer(
                              metodeBank[4].linkGambar, metodeBank[4].namaBank),
                          const SizedBox(width: 10),
                          circleContainer(
                              metodeBank[5].linkGambar, metodeBank[5].namaBank),
                        ],
                      ),
                    ],
                  ),
                )
              ])),
        ));
  }

  Widget circleContainer(String linkGambar, String nama) {
    return GestureDetector(
      onTap: () {},
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
                linkGambar,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            nama,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
