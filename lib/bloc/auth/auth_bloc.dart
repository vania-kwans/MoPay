import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:mopay_ewallet/bloc/interceptors.dart';
import 'package:mopay_ewallet/bloc/store.dart';
import 'package:mopay_ewallet/bloc/auth/auth_state.dart';
import 'package:mopay_ewallet/utils/app_error.dart';
import 'package:mopay_ewallet/utils/print_error.dart';
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

  void resetPinStream() {
    _updatePinStream(AuthState.initial());
  }

  void resetStream() {
    _updateStream(AuthState.initial());
  }

  void dispose() {
    controller.close();
    pinController.close();
  }

  Future<AppError?> login(String phoneNumber, String password) async {
    try {
      _updateStream(AuthState.isLoading());

      String firebaseMessagingToken =
          await Store.getFirebaseMessagingToken() ?? "123";

      var response = await dio.post('/login', data: {
        "fcmToken": firebaseMessagingToken,
        "phoneNumber": phoneNumber,
        "password": password
      });

      var token = response.data['token'];
      await Store.setToken(token);

      await Store.setFirebaseTokenState(true);

      _updateStream(AuthState.isAuthenticated());
    } catch (err) {
      printError(err);
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
        await Store.clearCache();
        return null;
      }

      Map<String, dynamic> decoded = Jwt.parseJwt(token);
      DateTime expiredAt =
          DateTime.fromMillisecondsSinceEpoch(decoded['exp'] * 1000);

      if (DateTime.now().isAfter(expiredAt)) {
        _updateStream(AuthState.initial());
        await Store.clearCache();
        return null;
      }

      var hasLoggedInWithFirebaseToken =
          await Store.isLoggedInWithFirebaseToken();

      if (!hasLoggedInWithFirebaseToken) {
        _updateStream(AuthState.initial());
        await Store.clearCache();
        return null;
      }

      String fcmToken = await Store.getFirebaseMessagingToken() ?? "";

      try {
        await dio.post('/login/fcm', data: {"fcmToken": fcmToken});
      } catch (err) {
        printError(err);
      }

      _updateStream(AuthState.isAuthenticated());
    } catch (err) {
      printError(err);

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

  Future<AppError?> logout() async {
    try {
      try {
        await dio.post('/logout');
      } catch (err) {
        printError(err);
      }
      await Store.clearCache();
      _updateStream(AuthState.initial());
      // Error saat logout tidak perlu dihandle
      return null;
    } catch (err) {
      printError(err);
      return _updateError();
    }
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
      _updatePinStream(AuthState.hasError(error));
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
      printError(err);
      AppError error = AppError.fromObjectErr(err);
      _updatePinStream(AuthState.hasError(error));
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
