import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mopay_ewallet/bloc/transaction/transaction_bloc.dart';
import 'package:mopay_ewallet/bloc/transaction/transaction_state.dart';
import 'package:mopay_ewallet/components/my_error_component.dart';
import 'package:mopay_ewallet/models/transaction.dart';
import 'package:mopay_ewallet/format/currency.dart';
import 'package:mopay_ewallet/format/datetime.dart';
import 'package:rxdart/rxdart.dart';

enum DateRange { last7Days, last30Days, last365Days, all }

class DateRangeUtil {
  static const Map<String, DateRange> _stringToType = {
    '7 Hari Terakhir': DateRange.last7Days,
    '1 Bulan Terakhir': DateRange.last30Days,
    '1 Tahun Terakhir': DateRange.last365Days,
    "Semua Transaksi": DateRange.all,
  };

  static String textOf(DateRange range) {
    return _stringToType.keys.firstWhere(
      (key) => _stringToType[key] == range,
      orElse: () => '',
    );
  }

  static List<DateTime>? getRange(DateRange range) {
    DateTime now = DateTime.now();
    switch (range) {
      case DateRange.last7Days:
        return [now.subtract(const Duration(days: 7)), now];
      case DateRange.last30Days:
        return [now.subtract(const Duration(days: 30)), now];
      case DateRange.last365Days:
        return [now.subtract(const Duration(days: 365)), now];
      default:
        return null;
    }
  }
}

class TransactionFilterData {
  final TransactionType type;
  final DateRange dateRange;

  TransactionFilterData(
      {this.type = TransactionType.all, this.dateRange = DateRange.all});

  String getQuery() {
    List<String> query = [];
    if (type != TransactionType.all) {
      query.add('type=${TransactionTypeUtil.toQuery(type)}');
    }
    if (dateRange != DateRange.all) {
      List<DateTime>? range = DateRangeUtil.getRange(dateRange);
      if (range != null) {
        DateTime startDate = range[0];
        DateTime endDate = range[1];
        query.add('start=${startDate.toUtc().toIso8601String()}');
        query.add("end=${endDate.toUtc().toIso8601String()}");
      }
    }
    return query.isEmpty ? "" : query.join('&');
  }
}

class HistoryPage extends StatefulWidget {
  final TransactionFilterData? entryFilter;
  const HistoryPage({super.key, this.entryFilter});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final _filterData =
      BehaviorSubject<TransactionFilterData>.seeded(TransactionFilterData());
  // String selectedFilter = '';
  // String selectedType = '';

  // DateTime currentDate = DateTime.now();

  // List<DataTransaksi> filterHistoryDate(List<DataTransaksi> dataHistory) {
  //   if (selectedFilter == "7 Hari Terakhir") {
  //     DateTime sevenDaysAgo = DateTime.now().subtract(const Duration(days: 7));
  //     List<DataTransaksi> filteredData = dataHistory.where((data) {
  //       DateTime date = formatDate(data.tanggal);
  //       return date.isAfter(sevenDaysAgo);
  //     }).toList();
  //     return filteredData;
  //   } else if (selectedFilter == "1 Bulan Terakhir") {
  //     DateTime oneMonthAgo = DateTime.now().subtract(const Duration(days: 30));
  //     List<DataTransaksi> filteredData = dataHistory.where((data) {
  //       DateTime date = formatDate(data.tanggal);
  //       return date.isAfter(oneMonthAgo);
  //     }).toList();
  //     return filteredData;
  //   } else if (selectedFilter == "1 Tahun Terakhir") {
  //     DateTime oneYearAgo = DateTime.now().subtract(const Duration(days: 365));
  //     List<DataTransaksi> filteredData = dataHistory.where((data) {
  //       DateTime date = formatDate(data.tanggal);
  //       return date.isAfter(oneYearAgo);
  //     }).toList();
  //     return filteredData;
  //   } else {
  //     return dataHistory;
  //   }
  // }

  // List<DataTransaksi> filterHistoryType(List<DataTransaksi> dataHistory) {
  //   if (selectedType == 'Transfer Masuk') {
  //     List<DataTransaksi> filteredData = dataHistory.where((data) {
  //       return data.tipeTransaksi == 'Transfer Masuk';
  //     }).toList();
  //     return filteredData;
  //   } else if (selectedType == 'Transfer Keluar') {
  //     List<DataTransaksi> filteredData = dataHistory.where((data) {
  //       return data.tipeTransaksi == 'Transfer Keluar';
  //     }).toList();
  //     return filteredData;
  //   } else if (selectedType == 'Top Up') {
  //     List<DataTransaksi> filteredData = dataHistory.where((data) {
  //       return data.tipeTransaksi == 'Top Up';
  //     }).toList();
  //     return filteredData;
  //   } else {
  //     return dataHistory;
  //   }
  // }

  String lastIndexMonth = '';
  bool monthChecker(String currentMonth) {
    if (currentMonth != lastIndexMonth) {
      lastIndexMonth = currentMonth;
      return true;
    }
    return false;
  }

  bool signFormatter(TransactionType type) {
    if (type == TransactionType.transfer ||
        type == TransactionType.payment ||
        type == TransactionType.pending) {
      return false;
    } else {
      return true;
    }
  }

  // String definedTitleName(DataTransaksi data) {
  //   if (data is DataTransferMasuk) {
  //     return 'Transfer Dari ${data.namaPengirim}';
  //   } else if (data is DataTransferKeluar) {
  //     return 'Transfer Ke ${data.namaPenerima}';
  //   } else if (data is DataTopUp) {
  //     return 'Top Up Dari ${data.topUpDari}';
  //   } else {
  //     return 'Not Defined';
  //   }
  // }

  late TransactionBloc bloc;

  @override
  void initState() {
    bloc = TransactionBloc();

    if (widget.entryFilter != null) {
      _filterData.add(widget.entryFilter!);
    }

    _filterData.debounceTime(const Duration(milliseconds: 500)).listen((event) {
      bloc.getTransaction(event);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // List<DataTransaksi> dataHistory =
    //     Provider.of<DataHistoryProvider>(context).dataHistory;

    // List<DataTransaksi> filteredByDate = filterHistoryDate(dataHistory);

    // List<DataTransaksi> filteredByType = filterHistoryType(filteredByDate);

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
            StreamBuilder<TransactionFilterData>(
                stream: _filterData,
                builder: (context, snapshot) {
                  TransactionFilterData filterData =
                      snapshot.data ?? TransactionFilterData();
                  return Row(
                    children: [
                      Material(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            showModalBottomForFilter(context, filterData);
                          },
                          splashColor: Colors.grey[100],
                          highlightColor: Colors.grey[100],
                          child: Container(
                            padding: const EdgeInsets.all(18.0),
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                    color: Colors.black12, width: 0.5),
                                bottom: BorderSide(
                                    color: Colors.black12, width: 0.5),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  filterData.dateRange == DateRange.all
                                      ? "Semua Transaksi"
                                      : DateRangeUtil.textOf(
                                          filterData.dateRange),
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
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
                              isScrollControlled: true,
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
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                        ...TransactionType.values.map((e) =>
                                            RadioListTile<TransactionType>(
                                              value: e,
                                              groupValue: filterData.type,
                                              onChanged: (value) {
                                                _filterData.add(
                                                  TransactionFilterData(
                                                    type: value!,
                                                    dateRange:
                                                        filterData.dateRange,
                                                  ),
                                                );
                                                Navigator.of(context).pop();
                                              },
                                              title: Text(
                                                TransactionTypeUtil
                                                    .fromTypeToHumanReadable(e),
                                              ),
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                              activeColor: Colors.red,
                                            )),
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
                                right: BorderSide(
                                    color: Colors.black12, width: 0.5),
                                bottom: BorderSide(
                                    color: Colors.black12, width: 0.5),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  filterData.type == TransactionType.all
                                      ? "Semua Tipe"
                                      : TransactionTypeUtil
                                          .fromTypeToHumanReadable(
                                              filterData.type),
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
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
                  );
                }),
            showHistory(),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showModalBottomForFilter(
      BuildContext context, TransactionFilterData filterData) {
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
                  ...DateRange.values.map((e) => RadioListTile<DateRange>(
                        value: e,
                        groupValue: filterData.dateRange,
                        onChanged: (value) {
                          _filterData.add(
                            TransactionFilterData(
                              type: filterData.type,
                              dateRange: value!,
                            ),
                          );
                          Navigator.of(context).pop();
                        },
                        title: Text(
                          DateRangeUtil.textOf(e),
                        ),
                        controlAffinity: ListTileControlAffinity.trailing,
                        activeColor: Colors.red,
                      )),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Expanded showHistory() {
    return Expanded(
      child: StreamBuilder<TransactionState>(
          stream: bloc.state,
          builder: (context, snapshot) {
            bool isLoading =
                snapshot.data?.isLoading ?? false || !snapshot.hasData;

            if (isLoading) {
              return Center(
                child: Lottie.asset("assets/lottie/mopayLottie.json",
                    width: 200, height: 200, fit: BoxFit.cover),
              );
            }
            TransactionState state = snapshot.data!;
            if (state.hasError) {
              return MyErrorComponent(
                  error: state.error,
                  onRefresh: () {
                    bloc.getTransaction(_filterData.valueOrNull);
                  });
            }

            List<Transaction> data = snapshot.data?.transactionData ?? [];

            if (data.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset("assets/lottie/emptyLottie.json",
                        width: 100,
                        height: 100,
                        renderCache: RenderCache.raster),
                    const SizedBox(height: 10),
                    const Text("Tidak ada transaksi"),
                  ],
                ),
              );
            }

            data.sort((a, b) => b.createdAt.compareTo(a.createdAt));
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  DateTime date = data[index].createdAt;
                  String formattedDate = DateFormat('d MMM y').format(date);

                  String currentMonth = getMonthName(formattedDate);
                  int currentYear = getYear(formattedDate);
                  String judul = data[index].description;

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
                            bottom:
                                BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          title: Text(
                            judul,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "${TransactionTypeUtil.fromTypeToHumanReadable(data[index].type)} - $formattedDate",
                              style: const TextStyle(color: Colors.black54),
                            ),
                          ),
                          trailing: Text(
                            signFormatter(data[index].type)
                                ? '+${formatToIndonesianCurrency(data[index].amount)}'
                                : '-${formatToIndonesianCurrency(data[index].amount)}',
                            style: TextStyle(
                              fontSize: 16,
                              color: TransactionTypeUtil.fromTypeToColor(
                                  data[index].type),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                });
          }),
    );
  }
}
