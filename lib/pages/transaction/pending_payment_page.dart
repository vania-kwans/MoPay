import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mopay_ewallet/bloc/transaction/transaction_bloc.dart';
import 'package:mopay_ewallet/bloc/transaction/transaction_state.dart';
import 'package:mopay_ewallet/components/my_error_component.dart';
import 'package:mopay_ewallet/models/transaction.dart';

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
              return const Center(
                child: Text('No pending payment'),
              );
            }

            return ListView.builder(
              itemCount: state.transactionData!.length,
              itemBuilder: (context, index) {
                var pendingPayment =
                    state.transactionData![index] as PendingPayment;

                String expiredDate =
                    DateFormat("dd MMM yyyy").format(pendingPayment.expiredAt);
                String expiredTime =
                    DateFormat("HH:mm:ss").format(pendingPayment.expiredAt);

                return GestureDetector(
                  onTap: () {},
                  child: ListTile(
                    leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/logo/logo-travellingo.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )),
                    title: Text(pendingPayment.amount.toString()),
                    subtitle: Text('Expired at: $expiredDate $expiredTime'),
                  ),
                );
              },
            );
          }),
    );
  }
}
