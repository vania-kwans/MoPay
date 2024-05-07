import 'package:flutter/material.dart';
import 'package:mopay_ewallet/data/data_history_transaksi.dart';
import 'package:mopay_ewallet/format/currency.dart';
import 'package:mopay_ewallet/format/datetime.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  bool signChecker(String tipe) {
    if (tipe == 'Transfer Keluar') {
      return false;
    }
    return true;
  }

  DateTime currentDate = DateTime.now();

  String lastIndexMonth = '';
  bool monthChecker(String currentMonth) {
    if (currentMonth != lastIndexMonth) {
      lastIndexMonth = currentMonth;
      return true;
    }
    return false;
  }

  String definedTitleName(DataTransaksi data) {
    if (data is DataTransferMasuk) {
      return 'Transfer Dari ${data.namaPengirim}';
    } else if (data is DataTransferKeluar) {
      return 'Transfer Ke ${data.namaPenerima}';
    } else if (data is DataTopUp) {
      return 'Top Up Dari ${data.topUpDari}';
    } else {
      return 'Not Defined';
    }
  }

  String selectedFilter = '';

  @override
  Widget build(BuildContext context) {
    List<DataTransaksi> dataHistory =
        Provider.of<DataHistoryProvider>(context).dataHistory;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transaction History',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 195, 44, 33),
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.grey.withOpacity(0.1),
        child: Column(
          children: [
            Positioned(
              child: Row(
                children: [
                  Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                              builder: (BuildContext context, setState) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Filter Berdasarkan',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Icon(Icons.close),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      const Divider(color: Colors.black12),
                                      RadioListTile(
                                        value: '7 Hari Terakhir',
                                        groupValue: selectedFilter,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedFilter = value!;
                                          });
                                          Navigator.of(context).pop();
                                        },
                                        title: const Text('7 Hari Terakhir'),
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                        activeColor: Colors.red,
                                      ),
                                      RadioListTile(
                                        value: '1 Bulan Terakhir',
                                        groupValue: selectedFilter,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedFilter = value!;
                                          });
                                          Navigator.of(context).pop();
                                        },
                                        title: const Text('1 Bulan Terakhir'),
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                        activeColor: Colors.red,
                                      ),
                                      RadioListTile(
                                        value: '1 Tahun Terakhir',
                                        groupValue: selectedFilter,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedFilter = value!;
                                          });
                                          Navigator.of(context).pop();
                                        },
                                        title: const Text('1 Tahun Terakhir'),
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                        activeColor: Colors.red,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      splashColor: Colors.grey[100],
                      highlightColor: Colors.grey[100],
                      child: Container(
                        padding: const EdgeInsets.all(18.0),
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: const BoxDecoration(
                          border: Border(
                              right:
                                  BorderSide(color: Colors.black12, width: 0.5),
                              bottom: BorderSide(
                                  color: Colors.black12, width: 0.5)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              selectedFilter == "" ? "Filter" : selectedFilter,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {},
                      splashColor: Colors.grey[100],
                      highlightColor: Colors.grey[200],
                      child: Container(
                        padding: const EdgeInsets.all(18.0),
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: const BoxDecoration(
                          border: Border(
                              right:
                                  BorderSide(color: Colors.black12, width: 0.5),
                              bottom: BorderSide(
                                  color: Colors.black12, width: 0.5)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Urutkan',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500)),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            showHistory(dataHistory),
          ],
        ),
      ),
    );
  }

  Expanded showHistory(List<DataTransaksi> dataHistory) {
    return Expanded(
      child: ListView.builder(
          itemCount: dataHistory.length,
          itemBuilder: (context, index) {
            String currentMonth = getMonthName(dataHistory[index].tanggal);
            int currentYear = getYear(dataHistory[index].tanggal);
            String judul = definedTitleName(dataHistory[index]);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                monthChecker(currentMonth)
                    ? Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 15),
                        height: 40,
                        child: Text(
                          '$currentMonth $currentYear',
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : const SizedBox(height: 0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    ),
                  ),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    title: Text(
                      judul,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        dataHistory[index].tipeTransaksi,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ),
                    trailing: Text(
                      signChecker(dataHistory[index].tipeTransaksi)
                          ? '+ Rp${formatToIndonesianCurrency(dataHistory[index].nominal)}'
                          : '- Rp${formatToIndonesianCurrency(dataHistory[index].nominal)}',
                      style: TextStyle(
                        fontSize: 16,
                        color: signChecker(dataHistory[index].tipeTransaksi)
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
