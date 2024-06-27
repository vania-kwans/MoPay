import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:mopay_ewallet/bloc/interceptors.dart';
import 'package:mopay_ewallet/bloc/store.dart';
import 'package:mopay_ewallet/bloc/auth/auth_state.dart';
import 'package:mopay_ewallet/utils/app_error.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc {
  final dio = Dio(BaseOptions(baseUrl: dotenv.env["BASE_URL"]!));

  final controller = BehaviorSubject<AuthState>.seeded(AuthState.initial());
  final pinController = BehaviorSubject<AuthState>.seeded(AuthState.initial());

  AuthBloc() {
    dio.interceptors.add(TokenInterceptors());
  }

  void _updateStream(AuthState state) {
    if (controller.isClosed) {
      return;
    }
    controller.add(state);
  }

  void _updatePinStream(AuthState state) {
    if (pinController.isClosed) {
      return;
    }
    pinController.add(state);
  }

  AppError _updateError([Object? err]) {
    AppError error = AppError.fromObjectErr(err);
    _updateStream(AuthState.hasError(error));
    return error;
  }

  Future<AppError?> login(String phoneNumber, String password) async {
    try {
      _updateStream(AuthState.isLoading());

      var response = await dio.post('/login', data: {
        "fcmToken": "123",
        "phoneNumber": phoneNumber,
        "password": password
      });

      var token = response.data['token'];
      await Store.setToken(token);
      _updateStream(AuthState.isAuthenticated());
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
      return _updateError(err);
    }
    return null;
  }

  Future<AppError?> checkLogin() async {
    try {
      _updateStream(AuthState.isLoading());

      var token = await Store.getToken();

      if (token == null) {
        _updateStream(AuthState.initial());
        return null;
      }

      Map<String, dynamic> decoded = Jwt.parseJwt(token);
      DateTime expiredAt =
          DateTime.fromMillisecondsSinceEpoch(decoded['exp'] * 1000);
      print(expiredAt);

      if (DateTime.now().isAfter(expiredAt)) {
        _updateStream(AuthState.initial());
        return null;
      }

      _updateStream(AuthState.isAuthenticated());
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
      return _updateError(err);
    }
    return null;
  }

  Future<AppError?> register({
    required String phoneNumber,
    required String password,
    required String name,
    required String email,
  }) async {
    _updateStream(AuthState.isLoading());
    try {
      var response = await dio.post('/register', data: {
        "phoneNumber": phoneNumber,
        "password": password,
        "name": name,
        "email": email
      });

      if (response.statusCode == 201) {
        _updateStream(AuthState.isAuthenticated());
        return null;
      }

      return _updateError();
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
      return _updateError(err);
    }
  }

  Future logout() async {
    await Store.removeToken();
    _updateStream(AuthState.initial());
  }

  Future<AppError?> verifyPin(String? pin) async {
    _updatePinStream(AuthState.isLoading());
    try {
      var response = await dio.post('/pin/verify', data: {"pin": pin});

      if (response.statusCode == 201) {
        return null;
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
      AppError error = AppError.fromObjectErr(err);
      _updateStream(AuthState.hasError(error));
      return error;
    }
    return null;
  }

  Future<AppError?> registerPin(String? pin) async {
    _updatePinStream(AuthState.isLoading());
    try {
      var response = await dio.post('/pin', data: {"pin": pin});

      if (response.statusCode == 201) {
        return null;
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
      AppError error = AppError.fromObjectErr(err);
      _updateStream(AuthState.hasError(error));
      return error;
    }
    return null;
  }

  Future<AppError?> updatePin(String? oldPin, String? newPin) async {
    _updatePinStream(AuthState.isLoading());
    try {
      var response =
          await dio.put('/pin', data: {"oldPin": oldPin, "newPin": newPin});

      if (response.statusCode == 201) {
        return null;
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
      AppError error = AppError.fromObjectErr(err);
      _updateStream(AuthState.hasError(error));
      return error;
    }
    return null;
  }

  /// FLOW -> VERIFY EMAIL AND PHONE NUMBER, IF 201, THEN REGISTER NEW PIN
  Future<AppError?> forgotPinVerify(String? email, String? phoneNumber) async {
    _updatePinStream(AuthState.isLoading());
    try {
      var response = await dio.post('/pin/forgot/verify',
          data: {"email": email, "phoneNumber": phoneNumber});

      if (response.statusCode == 201) {
        return null;
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
      AppError error = AppError.fromObjectErr(err);
      _updateStream(AuthState.hasError(error));
      return error;
    }
    return null;
  }
}