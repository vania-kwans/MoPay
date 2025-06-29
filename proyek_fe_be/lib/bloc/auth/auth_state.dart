import 'package:mopay_ewallet/utils/app_error.dart';

class AuthState {
  final bool isAuthenticated;
  final bool isLoading;
  final bool hasError;
  final AppError? error;

  AuthState({
    this.isLoading = false,
    this.hasError = false,
    this.isAuthenticated = false,
    this.error,
  });

  factory AuthState.isAuthenticated() {
    return AuthState(isAuthenticated: true);
  }

  factory AuthState.isLoading() {
    return AuthState(isLoading: true);
  }

  factory AuthState.hasError([AppError? error]) {
    return AuthState(hasError: true, error: error);
  }

  factory AuthState.initial() {
    return AuthState();
  }
}
