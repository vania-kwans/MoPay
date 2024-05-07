import 'package:flutter/material.dart';
import 'package:mopay_ewallet/pages/top_up/data_metode_top_up.dart';
import 'package:mopay_ewallet/pages/top_up/top_up_instruction_tunai.dart';
import 'package:mopay_ewallet/pages/top_up/top_up_services_bank.dart';
import 'package:provider/provider.dart';

class MetodeTopUpPage extends StatefulWidget {
  final String metode;
  const MetodeTopUpPage({super.key, required this.metode});

  @override
  State<MetodeTopUpPage> createState() => _MetodeTopUpPageState();
}

class _MetodeTopUpPageState extends State<MetodeTopUpPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<TopUpBank> topUpBank = Provider.of<TopUpBankProvider>(context).data;
    List<TopUpTunai> topUpTunai = Provider.of<TopUpTunaiProvider>(context).data;

    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Top Up', style: TextStyle(fontWeight: FontWeight.w600)),
      ),
      body: Container(
        color: Colors.grey.withOpacity(0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Expanded(
            //   flex: 1,
            //   child: jumlahSaldo(context),
            // ),
            Expanded(
              flex: 9,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: ListView.builder(
                        itemCount: topUpBank.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(
                                widget.metode == "tunai"
                                    ? topUpTunai[index].linkGambar
                                    : topUpBank[index].linkGambar,
                              ),
                            ),
                            title: Text(
                              widget.metode == "tunai"
                                  ? topUpTunai[index].nama
                                  : topUpBank[index].namaBank,
                              style: const TextStyle(fontSize: 17),
                            ),
                            onTap: () {
                              widget.metode == "tunai"
                                  ? Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            InstruksiTopUpTunaiPage(idx: index),
                                      ),
                                    )
                                  : Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            LayananTopUpBank(idxBank: index),
                                      ),
                                    );
                            },
                          );
                        },
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
//   Container jumlahSaldo(BuildContext context) {
//     int saldo = Provider.of<SaldoProvider>(context).saldo;
//     String formattedSaldo = formatToIndonesianCurrency(saldo);

//     return Container(
//       width: double.infinity,
//       height: MediaQuery.of(context).size.height / 8,
//       padding: const EdgeInsets.all(20.0),
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/images/bg1.png'),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Center(
//         child: RichText(
//           text: TextSpan(
//             style: const TextStyle(
//               fontSize: 20.0,
//               color: Colors.black,
//               fontWeight: FontWeight.w300,
//             ),
//             children: <TextSpan>[
//               const TextSpan(text: 'Saldo MoPay Anda: '),
//               TextSpan(
//                 text: formattedSaldo,
//                 style: const TextStyle(fontWeight: FontWeight.w500),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
