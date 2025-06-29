import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mopay_ewallet/bloc/transaction/transaction_bloc.dart';
import 'package:mopay_ewallet/bloc/transaction/transaction_state.dart';
import 'package:mopay_ewallet/components/my_error_component.dart';
import 'package:mopay_ewallet/components/my_no_data_component.dart';
import 'package:mopay_ewallet/format/currency.dart';
import 'package:mopay_ewallet/models/transaction.dart';
import 'package:mopay_ewallet/pages/transaction/payment/travellingo_payment_detail.dart';
import 'package:mopay_ewallet/utils/transition.dart';

class PendingPaymentPage extends StatefulWidget {
  const PendingPaymentPage({super.key});

  @override
  State<PendingPaymentPage> createState() => _PendingPaymentPageState();
}

class _PendingPaymentPageState extends State<PendingPaymentPage> {
  final bloc = TransactionBloc();

  @override
  void initState() {
    bloc.getPendingPayment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifikasi"),
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
                onRefresh: () async {
                  await bloc.getPendingPayment();
                },
              );
            }

            if (state.transactionData!.isEmpty) {
              return MyNoDataComponent(
                onRefresh: () async {
                  await bloc.getPendingPayment();
                },
              );
            }

            return ListView.builder(
              itemCount: state.transactionData!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var pendingPayment =
                    state.transactionData![index] as PendingPayment;

                String expiredDate =
                    DateFormat("dd MMM yyyy").format(pendingPayment.expiredAt);
                String expiredTime =
                    DateFormat("HH:mm:ss").format(pendingPayment.expiredAt);

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        slideInFromBottom(
                          TravellingoPaymentDetail(
                              transactionId: pendingPayment.id),
                        ));
                  },
                  child: Card(
                    surfaceTintColor: Colors.transparent,
                    color: Colors.white,
                    child: ListTile(
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/logo/logo-travellingo.png",
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )),
                      title: Text(
                        "Rp ${formatToIndonesianCurrency(pendingPayment.amount)}",
                      ),
                      subtitle: Text('Expired at: $expiredDate $expiredTime'),
                      trailing: Lottie.asset(
                          'assets/lottie/timeTickingLottie.json',
                          height: 30,
                          frameRate: const FrameRate(24)),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
