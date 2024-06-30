import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:mopay_ewallet/bloc/transaction/transaction_bloc.dart';
import 'package:mopay_ewallet/bloc/transaction/transaction_state.dart';
import 'package:mopay_ewallet/components/my_error_component.dart';
import 'package:mopay_ewallet/format/currency.dart';
import 'package:mopay_ewallet/models/transaction.dart';
import 'package:mopay_ewallet/pages/transfer/transfer_success.dart';
import 'package:mopay_ewallet/utils/app_error.dart';
import 'package:mopay_ewallet/utils/transition.dart';
import 'package:rxdart/rxdart.dart';

class TravellingoPaymentDetail extends StatefulWidget {
  final String transactionId;
  const TravellingoPaymentDetail({super.key, required this.transactionId});

  @override
  State<TravellingoPaymentDetail> createState() =>
      _TravellingoPaymentDetailState();
}

class _TravellingoPaymentDetailState extends State<TravellingoPaymentDetail> {
  TransactionBloc bloc = TransactionBloc();

  final _durationLeft = BehaviorSubject<int>.seeded(0);

  @override
  void initState() {
    bloc.getPendingPayment(widget.transactionId);

    bloc.state.listen((event) {
      if (event.transactionData != null) {
        PendingPayment transactionData =
            event.transactionData![0] as PendingPayment;
        _durationLeft.add(transactionData.durationLeft.inSeconds);

        if (transactionData.durationLeft.inSeconds <= 0) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            Navigator.pop(context);
          });
          return;
        }

        Timer.periodic(const Duration(seconds: 1), (timer) {
          int currentDuration = _durationLeft.value;
          if (currentDuration <= 0) {
            timer.cancel();
            return;
          }

          _durationLeft.add(currentDuration - 1);
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pembayaran"),
      ),
      body: StreamBuilder<TransactionState>(
          stream: bloc.state,
          builder: (context, snapshot) {
            bool isLoading =
                snapshot.data?.isLoading ?? false || !snapshot.hasData;

            if (isLoading) {
              return Center(
                child: Lottie.asset('assets/lottie/mopayLottie.json'),
              );
            }

            TransactionState state = snapshot.data!;

            if (state.hasError) {
              return MyErrorComponent(
                onRefresh: () {
                  bloc.getPendingPayment(widget.transactionId);
                },
              );
            }

            if (state.transactionData == null ||
                state.transactionData!.isEmpty) {
              return MyErrorComponent(
                onRefresh: () {
                  bloc.getTransactionDetail(widget.transactionId);
                },
                error: AppError(message: 'Data not found', code: '404'),
              );
            }

            PendingPayment transactionData =
                state.transactionData![0] as PendingPayment;

            return Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'assets/images/logo/logo-travellingo.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    // TRAVELLINGO PAYMENT DETAIL
                    const Text(
                      "Pembayaran kepada Travellingo",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                        "Rp ${formatToIndonesianCurrency(transactionData.amount)}",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(),
                    _transactionDetail("Kode Transaksi", transactionData.id),
                    StreamBuilder<int>(
                        stream: _durationLeft,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Icon(Icons.timer_off);
                          }

                          int duration = snapshot.data!;

                          int inHour = duration ~/ 3600;
                          int inMinute = (duration % 3600) ~/ 60;
                          int inSecond = duration % 60;
                          String content =
                              "$inHour jam $inMinute menit $inSecond detik";
                          return _transactionDetail(
                              "Sisa durasi pembayaran", content);
                        }),
                    _transactionDetail(
                        "Description", transactionData.description),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red,
                            elevation: 5,
                            padding: const EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () async {
                            var response = await bloc
                                .makeTravellingoPayment(transactionData.id);

                            if (!context.mounted) return;

                            if (response is AppError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(response.message),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Pembayaran berhasil"),
                                backgroundColor: Colors.green,
                              ),
                            );

                            if (response is Transaction) {
                              Navigator.pushReplacement(
                                  context,
                                  slideInFromBottom(TransferSuccessPage(
                                      transactionReceipt: response,
                                      biayaTransaksi: 0)));
                            }
                          },
                          child: const Text("Bayar sekarang")),
                    ),
                    const SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _transactionDetail(String label, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label : ",
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 18),
        ),
        Text(
          content,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
