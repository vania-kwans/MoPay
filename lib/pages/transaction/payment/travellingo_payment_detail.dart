import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mopay_ewallet/bloc/transaction/transaction_bloc.dart';
import 'package:mopay_ewallet/bloc/transaction/transaction_state.dart';
import 'package:mopay_ewallet/components/my_error_component.dart';
import 'package:mopay_ewallet/format/currency.dart';
import 'package:mopay_ewallet/models/transaction.dart';
import 'package:mopay_ewallet/utils/app_error.dart';

class TravellingoPaymentDetail extends StatefulWidget {
  final String transactionId;
  const TravellingoPaymentDetail({super.key, required this.transactionId});

  @override
  State<TravellingoPaymentDetail> createState() =>
      _TravellingoPaymentDetailState();
}

class _TravellingoPaymentDetailState extends State<TravellingoPaymentDetail> {
  TransactionBloc bloc = TransactionBloc();

  @override
  void initState() {
    bloc.getTransactionDetail(widget.transactionId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  bloc.getTransactionDetail(widget.transactionId);
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

            return Column(
              children: [
                Image.asset(
                  'assets/images/transaction/travellingo_payment_detail.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),

                // TRAVELLINGO PAYMENT DETAIL
                const Text("Pembayaran kepada Travellingo",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

                Text("Rp ${formatToIndonesianCurrency(transactionData.amount)}",
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),

                ElevatedButton(
                    onPressed: () {
                      bloc.makeTravellingoPayment(transactionData.id);
                    },
                    child: const Text("Bayar sekarang"))
              ],
            );
          }),
    );
  }
}
