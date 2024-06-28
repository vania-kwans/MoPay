import 'package:mopay_ewallet/models/user.dart';
import 'package:mopay_ewallet/utils/app_error.dart';

class UserState {
  final User? user;
  final bool isLoading;
  final bool hasError;
  final AppError? error;

  UserState({
    this.user,
    this.isLoading = false,
    this.hasError = false,
    this.error,
  });

  UserState copyWith({
    User? user,
    bool? isLoading,
    bool? hasError,
    AppError? error,
  }) {
    return UserState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      error: error ?? this.error,
    );
  }

  factory UserState.initial() {
    return UserState();
  }

  factory UserState.loading() {
    return UserState(isLoading: true);
  }

  factory UserState.error(AppError error) {
    return UserState(hasError: true, error: error);
  }

  factory UserState.success(User user) {
    return UserState(user: user);
  }
}
