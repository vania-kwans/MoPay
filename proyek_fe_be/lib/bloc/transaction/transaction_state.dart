import 'package:mopay_ewallet/models/transaction.dart';
import 'package:mopay_ewallet/utils/app_error.dart';

class TransactionState {
  final List<Transaction>? transactionData;
  final bool isLoading;
  final bool hasError;
  final AppError? error;

  TransactionState({
    this.transactionData,
    this.isLoading = false,
    this.hasError = false,
    this.error,
  });

  TransactionState copyWith({
    List<Transaction>? transactionData,
    bool? isLoading,
    bool? hasError,
    AppError? error,
  }) {
    return TransactionState(
      transactionData: transactionData ?? this.transactionData,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      error: error ?? this.error,
    );
  }

  factory TransactionState.initial() {
    return TransactionState();
  }

  factory TransactionState.loading() {
    return TransactionState(isLoading: true);
  }

  factory TransactionState.error(AppError error) {
    return TransactionState(hasError: true, error: error);
  }

  factory TransactionState.success() {
    return TransactionState();
  }

  factory TransactionState.achieveData(List<Transaction>? transactionData) {
    return TransactionState(transactionData: transactionData);
  }
}
