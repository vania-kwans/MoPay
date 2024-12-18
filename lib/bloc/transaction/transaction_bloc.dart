import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mopay_ewallet/bloc/interceptors.dart';
import 'package:mopay_ewallet/bloc/transaction/transaction_state.dart';
import 'package:mopay_ewallet/models/transaction.dart';
import 'package:mopay_ewallet/pages/history/history.dart';
import 'package:mopay_ewallet/utils/app_error.dart';
import 'package:mopay_ewallet/utils/print_error.dart';
import 'package:rxdart/rxdart.dart';

class TransactionBloc {
  final dio = Dio(BaseOptions(baseUrl: dotenv.env["BASE_URL"]!));

  final controller = BehaviorSubject<TransactionState>();

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

  /// GET ALL TRANSACTION DATA
  Future<void> getTransaction([TransactionFilterData? filterData]) async {
    controller.add(TransactionState.loading());
    try {
      if (filterData?.type == TransactionType.pending) {
        await getPendingPayment();
        return;
      }
      var query = filterData?.getQuery();

      String url =
          "/transaction${query != null && query.isNotEmpty ? '?$query' : ""}";

      if (kDebugMode) {
        print(url);
      }

      var response = await dio.get(url);
      var data = response.data as Map<String, dynamic>;

      var completedTransaction = data['completedTransaction'] as List<dynamic>;
      var pendingPayment = data['pendingPayment'] as List<dynamic>;

      if (kDebugMode) {
        print(data);
      }

      List<Transaction> transactionData = [];
      completedTransaction
          .map((e) => transactionData.add(Transaction.fromJson(e)))
          .toList();

      pendingPayment
          .map((e) => transactionData.add(PendingPayment.fromJson(e)))
          .toList();

      _updateStream(TransactionState.achieveData(transactionData));
    } catch (err) {
      printError(err);
      _updateError(err);
    }
  }

  Future<void> getTransactionDetail(String id) async {
    controller.add(TransactionState.loading());
    try {
      var response = await dio.get("/transaction/id");
      var data = response.data as Map<String, dynamic>;

      if (kDebugMode) print(data);

      var transaction = Transaction.fromJson(data);

      _updateStream(TransactionState.achieveData([transaction]));
    } catch (err) {
      printError(err);
      _updateError(err);
    }
  }

  Future<void> getMonthlyTransaction() async {
    controller.add(TransactionState.loading());
    try {
      var currentDate = DateTime.now().toUtc();

      var startDate = DateTime(currentDate.year, currentDate.month, 1, 0, 0, 0);
      var endDate =
          DateTime(currentDate.year, currentDate.month + 1, 0, 23, 59, 59, 999);

      String url =
          "/transaction?startDate=${startDate.toIso8601String()}&endDate=${endDate.toIso8601String()}";

      var response = await dio.get(url);
      var data = response.data as Map<String, dynamic>;

      if (kDebugMode) {
        print(data);
      }

      var completedTransaction = data['completedTransaction'] as List<dynamic>;
      var pendingPayment = data['pendingPayment'] as List<dynamic>;

      List<Transaction> transactionData = [];
      completedTransaction
          .map((e) => transactionData.add(Transaction.fromJson(e)))
          .toList();

      pendingPayment
          .map((e) => transactionData.add(PendingPayment.fromJson(e)))
          .toList();

      _updateStream(TransactionState.achieveData(transactionData));
    } catch (err) {
      printError(err);
      _updateError(err);
    }
  }

  Future<void> getPendingPayment([String? id]) async {
    controller.add(TransactionState.loading());
    try {
      String url = "/transaction/pending";
      if (id != null) {
        url += "/$id";
      }
      var response = await dio.get(url);
      var data = response.data;

      List<Transaction> pendingPaymentData = [];

      if (kDebugMode) print(data);

      if (data is List) {
        pendingPaymentData =
            data.map((e) => PendingPayment.fromJson(e)).toList();
      }
      //
      else if (data is Map<String, dynamic>) {
        pendingPaymentData.add(PendingPayment.fromJson(data));
      }

      if (data.isEmpty) {
        _updateStream(TransactionState.achieveData([]));
        return;
      }

      if (kDebugMode) {
        print(pendingPaymentData);
      }

      _updateStream(TransactionState.achieveData(pendingPaymentData));
    } catch (err) {
      printError(err);
      _updateError(err);
    }
  }

  Future transferToPhoneNumber({
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

  /// GENERAL USE FOR PAYMENT (GLOBAL)
  Future makePayment({required int nominal, String? description}) async {
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

  /// GENERAL USE FOR TRANSFER (GLOBAL)
  Future makeTransfer(
      {required String accountNumber,
      required int nominal,
      String? description}) async {
    _updateStream(TransactionState.loading());
    try {
      var response = await dio.post("/transaction/transfer", data: {
        "amount": nominal,
        "description": description ?? "Transfer ke rekening $accountNumber",
      });

      var data = response.data as Map<String, dynamic>;

      Transaction transaction = Transaction.fromJson(data);

      _updateStream(TransactionState.success());
      return transaction;
    } catch (err) {
      return _updateError(err);
    }
  }

  // TOPUP
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

  /// ONLY FOR TRAVELLINGO PAYMENT
  Future makeTravellingoPayment(String? pendingPaymentId) async {
    _updateStream(TransactionState.loading());
    try {
      var response =
          await dio.post("/transaction/payment/travellingo/transaction", data: {
        "pendingPaymentId": pendingPaymentId,
      });

      var data = response.data as Map<String, dynamic>;

      Transaction transaction = Transaction.fromJson(data);

      _updateStream(TransactionState.success());
      return transaction;
    } catch (err) {
      return _updateError(err);
    }
  }
}
