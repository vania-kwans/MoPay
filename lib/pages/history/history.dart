import 'package:flutter/material.dart';
import 'package:mopay_ewallet/pages/history/data_history_transaksi.dart';
import 'package:mopay_ewallet/format/currency.dart';
import 'package:mopay_ewallet/format/datetime.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String selectedFilter = '';
  String selectedType = '';
  bool signChecker(String tipe) {
    if (tipe == 'Transfer Keluar') {
      return false;
    }
    return true;
  }

  DateTime currentDate = DateTime.now();

  List<DataTransaksi> filterHistoryDate(List<DataTransaksi> dataHistory) {
    if (selectedFilter == "7 Hari Terakhir") {
      DateTime sevenDaysAgo = DateTime.now().subtract(const Duration(days: 7));
      List<DataTransaksi> filteredData = dataHistory.where((data) {
        DateTime date = formatDate(data.tanggal);
        return date.isAfter(sevenDaysAgo);
      }).toList();
      return filteredData;
    } else if (selectedFilter == "1 Bulan Terakhir") {
      DateTime oneMonthAgo = DateTime.now().subtract(const Duration(days: 30));
      List<DataTransaksi> filteredData = dataHistory.where((data) {
        DateTime date = formatDate(data.tanggal);
        return date.isAfter(oneMonthAgo);
      }).toList();
      return filteredData;
    } else if (selectedFilter == "1 Tahun Terakhir") {
      DateTime oneYearAgo = DateTime.now().subtract(const Duration(days: 365));
      List<DataTransaksi> filteredData = dataHistory.where((data) {
        DateTime date = formatDate(data.tanggal);
        return date.isAfter(oneYearAgo);
      }).toList();
      return filteredData;
    } else {
      return dataHistory;
    }
  }

  List<DataTransaksi> filterHistoryType(List<DataTransaksi> dataHistory) {
    if (selectedType == 'Transfer Masuk') {
      List<DataTransaksi> filteredData = dataHistory.where((data) {
        return data.tipeTransaksi == 'Transfer Masuk';
      }).toList();
      return filteredData;
    } else if (selectedType == 'Transfer Keluar') {
      List<DataTransaksi> filteredData = dataHistory.where((data) {
        return data.tipeTransaksi == 'Transfer Keluar';
      }).toList();
      return filteredData;
    } else if (selectedType == 'Top Up') {
      List<DataTransaksi> filteredData = dataHistory.where((data) {
        return data.tipeTransaksi == 'Top Up';
      }).toList();
      return filteredData;
    } else {
      return dataHistory;
    }
  }

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

  @override
  Widget build(BuildContext context) {
    List<DataTransaksi> dataHistory =
        Provider.of<DataHistoryProvider>(context).dataHistory;

    List<DataTransaksi> filteredByDate = filterHistoryDate(dataHistory);

    List<DataTransaksi> filteredByType = filterHistoryType(filteredByDate);

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
            Row(
              children: [
                Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      showModalBottomForFilter(context).whenComplete(() {
                        setState(() {});
                      });
                    },
                    splashColor: Colors.grey[100],
                    highlightColor: Colors.grey[100],
                    child: Container(
                      padding: const EdgeInsets.all(18.0),
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(color: Colors.black12, width: 0.5),
                          bottom: BorderSide(color: Colors.black12, width: 0.5),
                        ),
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
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(
                              builder: (BuildContext context, setState) {
                            return Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Wrap(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Pilih Tipe',
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
                                    value: 'Semua Transaksi',
                                    groupValue: selectedType,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedType = value!;
                                        lastIndexMonth = '';
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    title: const Text('Semua Transaksi'),
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    activeColor: Colors.red,
                                  ),
                                  RadioListTile(
                                    value: 'Transfer Masuk',
                                    groupValue: selectedType,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedType = value!;
                                        lastIndexMonth = '';
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    title: const Text('Transfer Masuk'),
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    activeColor: Colors.red,
                                  ),
                                  RadioListTile(
                                    value: 'Transfer Keluar',
                                    groupValue: selectedType,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedType = value!;
                                        lastIndexMonth = '';
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    title: const Text('Transfer Keluar'),
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    activeColor: Colors.red,
                                  ),
                                  RadioListTile(
                                    value: 'Top Up',
                                    groupValue: selectedType,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedType = value!;
                                        lastIndexMonth = '';
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    title: const Text('Top Up'),
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    activeColor: Colors.red,
                                  ),
                                ],
                              ),
                            );
                          });
                        },
                      ).whenComplete(() {
                        setState(() {});
                      });
                    },
                    splashColor: Colors.grey[100],
                    highlightColor: Colors.grey[200],
                    child: Container(
                      padding: const EdgeInsets.all(18.0),
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(color: Colors.black12, width: 0.5),
                          bottom: BorderSide(color: Colors.black12, width: 0.5),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            selectedType == ""
                                ? "Semua Transaksi"
                                : selectedType,
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
              ],
            ),
            showHistory(filteredByType),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showModalBottomForFilter(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Filter Berdasarkan',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
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
                        lastIndexMonth = '';
                      });
                      Navigator.of(context).pop();
                    },
                    title: const Text('7 Hari Terakhir'),
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: Colors.red,
                  ),
                  RadioListTile(
                    value: '1 Bulan Terakhir',
                    groupValue: selectedFilter,
                    onChanged: (value) {
                      setState(() {
                        selectedFilter = value!;
                        lastIndexMonth = '';
                      });
                      Navigator.of(context).pop();
                    },
                    title: const Text('1 Bulan Terakhir'),
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: Colors.red,
                  ),
                  RadioListTile(
                    value: '1 Tahun Terakhir',
                    groupValue: selectedFilter,
                    onChanged: (value) {
                      setState(() {
                        selectedFilter = value!;
                        lastIndexMonth = '';
                      });
                      Navigator.of(context).pop();
                    },
                    title: const Text('1 tahun terakhir'),
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: Colors.red,
                  ),
                  RadioListTile(
                    value: 'Filter',
                    groupValue: selectedFilter,
                    onChanged: (value) {
                      setState(() {
                        selectedFilter = value!;
                        lastIndexMonth = '';
                      });
                      Navigator.of(context).pop();
                    },
                    title: const Text('Tampilkan semua'),
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: Colors.red,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Expanded showHistory(List<DataTransaksi> data) {
    return Expanded(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            String currentMonth = getMonthName(data[index].tanggal);
            int currentYear = getYear(data[index].tanggal);
            String judul = definedTitleName(data[index]);

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
                        data[index].tipeTransaksi,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ),
                    trailing: Text(
                      signChecker(data[index].tipeTransaksi)
                          ? '+ Rp${formatToIndonesianCurrency(data[index].nominal)}'
                          : '- Rp${formatToIndonesianCurrency(data[index].nominal)}',
                      style: TextStyle(
                        fontSize: 16,
                        color: signChecker(data[index].tipeTransaksi)
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
