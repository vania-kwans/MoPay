import 'package:flutter/material.dart';
import 'package:mopay_ewallet/data/data_metode_top_up.dart';
import 'package:mopay_ewallet/format/currency.dart';
import 'package:mopay_ewallet/pages/top_up/layanan_top_up.dart';
import 'package:provider/provider.dart';

class SaldoProvider extends ChangeNotifier {
  int saldo;

  SaldoProvider({this.saldo = 200000});

  void addSaldo(int amount) {
    saldo += amount;
    notifyListeners();
  }

  void subtractSaldo(int amount) {
    saldo -= amount;
    notifyListeners();
  }
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
    List<TopUpBank> topUpBank = Provider.of<TopUpBankProvider>(context).data;

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
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        'Pilih Metode',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: ListView.builder(
                        itemCount: topUpBank.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            leading: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: Image.network(
                                topUpBank[index].linkGambar,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(topUpBank[index].namaBank),
                            onTap: () {
                              Navigator.of(context).push(
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

  Container jumlahSaldo(BuildContext context) {
    int saldo = Provider.of<SaldoProvider>(context).saldo;
    String formattedSaldo = formatToIndonesianCurrency(saldo);

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 8,
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg1.png'),
          fit: BoxFit.cover,
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
