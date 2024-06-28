import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mopay_ewallet/bloc/interceptors.dart';
import 'package:mopay_ewallet/bloc/transaction/transaction_state.dart';
import 'package:mopay_ewallet/models/pending_payment.dart';
import 'package:mopay_ewallet/models/transaction.dart';
import 'package:mopay_ewallet/utils/app_error.dart';
import 'package:mopay_ewallet/utils/print_error.dart';
import 'package:rxdart/rxdart.dart';

class TransactionBloc {
  final dio = Dio(BaseOptions(baseUrl: dotenv.env["BASE_URL"]!));

  final controller =
      BehaviorSubject<TransactionState>.seeded(TransactionState.initial());

  TransactionBloc() {
    dio.interceptors.add(TokenInterceptors());
  }

  Stream<TransactionState> get state => controller.stream;

  void _updateStream(TransactionState state) {
    if (controller.isClosed) {
      return;
    }
    controller.add(state);
  }

  AppError _updateError(Object error) {
    AppError appError = AppError.fromObjectErr(error);
    _updateStream(TransactionState.error(appError));
    return appError;
  }

  void dispose() {
    controller.close();
  }

  Future<void> getTransaction() async {
    controller.add(TransactionState.loading());
    try {
      var response = await dio.get("/transaction");
      var data = response.data as Map<String, dynamic>;

      var completedTransaction = data['completedTransaction'] as List<dynamic>;
      var pendingPayment = data['pendingPayment'] as List<dynamic>;

      List<Transaction> transactionData = [];
      completedTransaction
          .map((e) => transactionData.add(Transaction.fromJson(e)))
          .toList();

      List<PendingPayment> pendingPaymentData = [];
      pendingPayment
          .map((e) => pendingPaymentData.add(PendingPayment.fromJson(e)))
          .toList();

      _updateStream(
          TransactionState.achieveData(transactionData, pendingPaymentData));
    } catch (err) {
      printError(err);
      _updateError(err);
    }
  }

  Future<void> getMonthlyTransaction() async {
    controller.add(TransactionState.loading());
    try {
      var startDate = DateTime(DateTime.now().year, DateTime.now().month, 1);
      var endDate = DateTime(DateTime.now().year, DateTime.now().month + 1, 0);

      String query =
          "?startDate=${startDate.toUtc().toIso8601String()}&endDate=${endDate.toUtc().toIso8601String()}";
      var response = await dio.get("/transaction/metrics$query");
      var data = response.data as Map<String, dynamic>;

      var completedTransaction = data['completedTransaction'] as List<dynamic>;
      var pendingPayment = data['pendingPayment'] as List<dynamic>;

      List<Transaction> transactionData = [];
      completedTransaction
          .map((e) => transactionData.add(Transaction.fromJson(e)))
          .toList();

      List<PendingPayment> pendingPaymentData = [];
      pendingPayment
          .map((e) => pendingPaymentData.add(PendingPayment.fromJson(e)))
          .toList();

      _updateStream(
          TransactionState.achieveData(transactionData, pendingPaymentData));
    } catch (err) {
      printError(err);
      _updateError(err);
    }
  }

  Future transfer({
    required String phoneNumber,
    required int nominal,
    String? description,
  }) async {
    _updateStream(TransactionState.loading());
    try {
      var response = await dio.post("/transaction/transfer/mobile", data: {
        "phoneNumber": phoneNumber,
        "amount": nominal,
        if (description != null) "description": description,
      });

      var data = response.data as Map<String, dynamic>;

      Transaction transaction = Transaction.fromJson(data);

      _updateStream(TransactionState.success());

      return transaction;
    } catch (err) {
      printError(err);
      return _updateError(err);
    }
  }

  Future<AppError?> makePayment(
      {required int nominal, String? description}) async {
    _updateStream(TransactionState.loading());
    try {
      await dio.post("/transaction/payment", data: {
        "amount": nominal,
        if (description != null) "description": description,
      });

      _updateStream(TransactionState.success());
      return null;
    } catch (err) {
      return _updateError(err);
    }
  }

  Future<AppError?> topUp({required int nominal}) async {
    _updateStream(TransactionState.loading());
    try {
      await dio.post("/balance/topup", data: {
        "amount": nominal,
      });

      _updateStream(TransactionState.success());
      return null;
    } catch (err) {
      return _updateError(err);
    }
  }

  Future<AppError?> makeTravellingoPayment(String? pendingPaymentId) async {
    _updateStream(TransactionState.loading());
    try {
      await dio.post("/transaction/payment/travellingo/transaction", data: {
        "pendingPaymentId": pendingPaymentId,
      });

      _updateStream(TransactionState.success());
      return null;
    } catch (err) {
      return _updateError(err);
    }
  }
}
