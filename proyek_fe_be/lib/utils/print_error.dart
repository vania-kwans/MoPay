import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

void printError(Object error) {
  if (kDebugMode) {
    if (error is DioException) {
      print("Error: ${error.response?.data}");
      print("Code: ${error.response?.statusCode}");
    } else {
      print("Error: $error");
    }
  }
}
