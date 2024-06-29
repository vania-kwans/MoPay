import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mopay_ewallet/bloc/transaction/transaction_bloc.dart';
import 'package:mopay_ewallet/bloc/transaction/transaction_state.dart';
import 'package:mopay_ewallet/bloc/user/user_bloc.dart';
import 'package:mopay_ewallet/models/user.dart';
import 'package:mopay_ewallet/pages/pin_code/insert_pin.dart';
import 'package:mopay_ewallet/pages/transfer/transfer_failed.dart';
import 'package:mopay_ewallet/pages/transfer/transfer_success.dart';
import 'package:mopay_ewallet/utils/app_error.dart';
import 'package:provider/provider.dart';
import 'package:mopay_ewallet/format/currency.dart';

class ConfirmationDialog extends StatefulWidget {
  final String tujuanTransfer;
  final String nomor;
  final int nominal;
  final String? pesan;

  const ConfirmationDialog({
    super.key,
    required this.tujuanTransfer,
    required this.nomor,
    required this.nominal,
    this.pesan,
  });

  @override
  State<ConfirmationDialog> createState() => _ConfirmationDialogState();
}

class _ConfirmationDialogState extends State<ConfirmationDialog> {
  late int biayaTransaksi;

  late TransactionBloc transactionBloc;
  late UserBloc userBloc;

  late User currentUser;
  late User targetUser;

  @override
  void initState() {
    userBloc = context.read<UserBloc>();
    transactionBloc = TransactionBloc();
    currentUser = userBloc.controller.valueOrNull!.user!;
    if (widget.tujuanTransfer == 'MoPay') {
      targetUser = userBloc.controller.valueOrNull!.user!;
      biayaTransaksi = 0;
    } else {
      targetUser = User(
        email: '',
        balance: 0,
        name: "Bank ${widget.tujuanTransfer}",
        phoneNumber: '',
        id: '',
      );
      biayaTransaksi = 2500;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 25.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: StreamBuilder<TransactionState>(
          stream: transactionBloc.state,
          builder: (context, snapshot) {
            bool isLoading =
                snapshot.data?.isLoading ?? false || !snapshot.hasData;

            if (isLoading) {
              return Lottie.asset('assets/lottie/mopayLottie.json');
            }
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Konfirmasi Transfer',
                      style: TextStyle(
                        color: Colors.red[900],
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    const Text(
                      'Penerima',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const CircleAvatar(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                        child: Icon(Icons.person_2_outlined),
                      ),
                      title: Text(
                        targetUser.name.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        '${widget.tujuanTransfer} - ${widget.nomor}',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    const Text(
                      'Sumber Dana',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                    const Text(
                      'MoPay Cash',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    const Text(
                      'Pesan',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      widget.pesan ?? "Tidak ada pesan",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'Detail',
                      style: TextStyle(
                        color: Colors.red[900],
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Nominal Transfer',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          formatToIndonesianCurrency(widget.nominal),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Biaya Transaksi',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          widget.tujuanTransfer == 'MOPAY'
                              ? 'Rp0'
                              : 'Rp${formatToIndonesianCurrency(biayaTransaksi)}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            color: Colors.red[900],
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.tujuanTransfer == 'MOPAY'
                              ? 'Rp${formatToIndonesianCurrency(widget.nominal)}'
                              : 'Rp${formatToIndonesianCurrency(widget.nominal + biayaTransaksi)}',
                          style: TextStyle(
                            color: Colors.red[900],
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow[50],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const ListTile(
                        leading: Icon(Icons.warning),
                        iconColor: Colors.orange,
                        subtitle: Text(
                            'Pastikan akun tujuan benar.\nSaldomu nantinya tidak bisa dikembalikan.'),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          bool? isPinValid = await Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const InsertPin()));
                          if (!(isPinValid ?? false)) return;

                          if (widget.tujuanTransfer == 'MoPay') {
                            var response =
                                await transactionBloc.transferToPhoneNumber(
                                    phoneNumber: widget.nomor,
                                    nominal: widget.nominal,
                                    description: widget.pesan);
                            if (!context.mounted) return;
                            if (response is AppError) {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TransferFailedPage(
                                  error: response,
                                ),
                              ));
                            } else {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TransferSuccessPage(
                                  transactionReceipt: response,
                                  biayaTransaksi: biayaTransaksi,
                                ),
                              ));
                            }
                            return;
                          }

                          // TRANSFER KE BANK
                          var response = await transactionBloc.makeTransfer(
                              accountNumber: widget.nomor,
                              nominal: widget.nominal,
                              description: widget.pesan);
                          if (!context.mounted) return;
                          if (response is AppError) {
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TransferFailedPage(
                                error: response,
                              ),
                            ));
                          } else {
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TransferSuccessPage(
                                transactionReceipt: response,
                                biayaTransaksi: biayaTransaksi,
                              ),
                            ));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[900],
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          'TRANSFER',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.red[900],
                        ),
                        child: const Text(
                          'BATALKAN',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
