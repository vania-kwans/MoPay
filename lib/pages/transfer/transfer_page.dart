import 'package:flutter/material.dart';
import 'package:mopay_ewallet/data/data_transfer.dart';
import 'package:mopay_ewallet/pages/transfer/transfer_to_bank.dart';
import 'package:mopay_ewallet/pages/transfer/transfer_to_mopay.dart';
import 'package:provider/provider.dart';
import 'package:mopay_ewallet/template/list_tile_top_up.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  @override
  Widget build(BuildContext context) {
    final List<DataTransfer> dataTransfer =
        Provider.of<DataTransferProvider>(context).dataTransfer;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transfer',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        // iconTheme: const IconThemeData(color: Colors.white),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 195, 44, 33),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey.withOpacity(0.1),
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TransferToMopay(),
                    ));
                  },
                  child: const ListTileLeadingIcon(
                    leadingIcon: Icon(Icons.compare_arrows),
                    methodName: 'Ke Sesama MoPay',
                  ),
                ),
                const SizedBox(height: 5.0),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TransferToBank(),
                    ));
                  },
                  child: const ListTileLeadingIcon(
                    leadingIcon: Icon(Icons.add),
                    methodName: 'Ke Rekening Bank',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 20.0, left: 20.0, right: 20.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Transaksi Terakhir',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final currentData = dataTransfer[index];

                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(color: Colors.grey.withOpacity(0.5)),
                          ),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.red[900],
                            foregroundColor: Colors.white,
                            child: const Icon(Icons.person_2_outlined),
                          ),
                          title: Text(
                            '${currentData.nama} '.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                            '${currentData.transferKe} - ${currentData.noPenerima}',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[600],
                            ),
                          ),
                          // trailing: GestureDetector(
                          //   onTap: () {
                          //     currentData.isFavorite = !currentData.isFavorite;
                          //   },
                          //   child: currentData.isFavorite == false
                          //       ? Icon(
                          //           Icons.favorite_outline_rounded,
                          //           color: Colors.grey.withOpacity(0.7),
                          //         )
                          //       : const Icon(
                          //           Icons.favorite_rounded,
                          //           color: Colors.red,
                          //         ),
                          // ),
                        ),
                      );
                    },
                    childCount: dataTransfer.length,
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
