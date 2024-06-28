import 'package:dio/dio.dart';

class AppError {
  final String message;
  final String? code;

  AppError({required this.message, this.code});

  factory AppError.fromObjectErr(Object? err) {
    if (err is DioException) {
      return AppError(
          message: err.response?.data,
          code: err.response?.statusCode.toString());
    } else {
      return AppError(message: 'Something went wrong');
    }
  }

  String get errorMessage => "$code - $message";
}
