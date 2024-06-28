import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mopay_ewallet/bloc/auth/auth_bloc.dart';
import 'package:mopay_ewallet/bloc/interceptors.dart';
import 'package:mopay_ewallet/bloc/user/user_state.dart';
import 'package:mopay_ewallet/main.dart';
import 'package:mopay_ewallet/models/user.dart';
import 'package:mopay_ewallet/utils/app_error.dart';
import 'package:mopay_ewallet/utils/print_error.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {
  final dio = Dio(BaseOptions(baseUrl: dotenv.env["BASE_URL"]!));

  final controller = BehaviorSubject<UserState>.seeded(UserState.initial());

  final publicProfileController =
      BehaviorSubject<UserState>.seeded(UserState.initial());

  final AuthBloc authBloc;

  UserBloc(
    this.authBloc,
  ) {
    dio.interceptors.add(TokenInterceptors());
  }

  Stream<UserState> get state => controller.stream;

  void _updateStream(UserState state) {
    if (controller.isClosed) {
      if (kDebugMode) {
        print("Controller is closed");
      }
      return;
    }
    print("update stream user");
    controller.add(state);
  }

  void resetProfileController() {
    publicProfileController.add(UserState.initial());
  }

  AppError _updateError(Object error) {
    AppError appError = AppError.fromObjectErr(error);
    _updateStream(UserState.error(appError));
    return appError;
  }

  Future<void> getProfile() async {
    _updateStream(UserState.loading());
    try {
      var response = await dio.get("/profile");
      if (response.statusCode == 201) {
        _updateStream(UserState.success(User.fromJson(response.data)));
      } else {
        _updateError(response);
      }
    } catch (err) {
      printError(err);
      _updateError(err);
    }
  }

  Future<void> getBalance() async {
    _updateStream(controller.valueOrNull?.copyWith(isLoading: true) ??
        UserState.loading());
    try {
      var response = await dio.get("/balance");
      int data = response.data['balance'];

      User? user = controller.valueOrNull?.user?.copyWith(balance: data);
      if (user == null) {
        throw Exception("User is null");
      }
      _updateStream(UserState.success(user));
    } catch (err) {
      printError(err);
      _updateError(err);
    }
  }

  Future<void> getPublicProfile(String? phoneNumber) async {
    publicProfileController.add(UserState.loading());
    try {
      var response = await dio.get("/profile/public?phoneNumber=$phoneNumber");
      publicProfileController
          .add(UserState.success(User.fromJson(response.data)));
    } catch (err) {
      printError(err);
      AppError error = AppError.fromObjectErr(err);
      publicProfileController.add(UserState.error(error));
    }
  }
}
