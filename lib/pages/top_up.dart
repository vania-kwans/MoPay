import 'package:flutter/material.dart';
import 'package:mopay_ewallet/format/currency.dart';
import 'package:mopay_ewallet/template/list_tile_top_up.dart';
import 'package:provider/provider.dart';

class SaldoProvider extends ChangeNotifier {
  int saldo;

  SaldoProvider({this.saldo = 0});

  void updateSaldo(int amount) {
    saldo = amount;
    notifyListeners();
  }

  // void topUp(int amount) {
  //   saldo += amount;
  //   notifyListeners();
  // }
}

class TopUpPage extends StatefulWidget {
  const TopUpPage({super.key});

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            Expanded(
              flex: 1,
              child: jumlahSaldo(context),
            ),
            Expanded(
              flex: 9,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: const Text(
                        'Pilih Metode',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: listMetode(),
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

  Container jumlahSaldo(BuildContext context) {
    int saldo = Provider.of<SaldoProvider>(context).saldo;
    String formattedSaldo = CurrencyFormat().indonesianFormat(saldo);

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 8,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, Colors.blue.withOpacity(0.1)],
        ),
      ),
      child: Center(
        child: RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
            children: <TextSpan>[
              const TextSpan(text: 'Saldo MoPay Anda: '),
              TextSpan(
                text: formattedSaldo,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

ListView listMetode() {
  return ListView(
    children: const [
      ListTileLeadingPic(
        leadingPic:
            'https://1.bp.blogspot.com/-hg2Q7RJB540/X3L1-vg-yNI/AAAAAAAAAdI/Nsb-hcTRKcgECx4E4u4sLnvnJeDhuDQdgCLcBGAsYHQ/s2916/Logo%2BBank%2BBCA.png',
        methodName: 'BCA OneKlik',
      ),
      ListTileLeadingPic(
        leadingPic:
            'https://tse3.mm.bing.net/th?id=OIP.3kVFM7G_yENAlnoHBmjh0wHaEl&pid=Api&P=0&h=180',
        methodName: 'Indomaret',
      ),
      ListTileLeadingPic(
        leadingPic:
            'https://tse3.mm.bing.net/th?id=OIP.QcR1aLdIltkqiy7uj8_QEwHaCw&pid=Api&P=0&h=180',
        methodName: 'Alfamart',
      ),
      ListTileLeadingPic(
        leadingPic:
            'https://1.bp.blogspot.com/-hg2Q7RJB540/X3L1-vg-yNI/AAAAAAAAAdI/Nsb-hcTRKcgECx4E4u4sLnvnJeDhuDQdgCLcBGAsYHQ/s2916/Logo%2BBank%2BBCA.png',
        methodName: 'Debit Visa / Mastercard',
      ),
      ListTileLeadingPic(
        leadingPic:
            'https://1.bp.blogspot.com/-hg2Q7RJB540/X3L1-vg-yNI/AAAAAAAAAdI/Nsb-hcTRKcgECx4E4u4sLnvnJeDhuDQdgCLcBGAsYHQ/s2916/Logo%2BBank%2BBCA.png',
        methodName: 'ATM',
      ),
      ListTileLeadingPic(
        leadingPic:
            'https://1.bp.blogspot.com/-hg2Q7RJB540/X3L1-vg-yNI/AAAAAAAAAdI/Nsb-hcTRKcgECx4E4u4sLnvnJeDhuDQdgCLcBGAsYHQ/s2916/Logo%2BBank%2BBCA.png',
        methodName: 'Internet / Mobile Banking',
      ),
    ],
  );
}
