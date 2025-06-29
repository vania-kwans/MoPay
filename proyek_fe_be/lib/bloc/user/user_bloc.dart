import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mopay_ewallet/bloc/auth/auth_bloc.dart';
import 'package:mopay_ewallet/bloc/interceptors.dart';
import 'package:mopay_ewallet/bloc/user/user_state.dart';
import 'package:mopay_ewallet/models/user.dart';
import 'package:mopay_ewallet/utils/app_error.dart';
import 'package:mopay_ewallet/utils/picture_type_util.dart';
import 'package:mopay_ewallet/utils/print_error.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {
  final dio = Dio(BaseOptions(baseUrl: dotenv.env["BASE_URL"]!));

  final controller = BehaviorSubject<UserState>.seeded(UserState.initial());

  final publicProfileController =
      BehaviorSubject<UserState>.seeded(UserState.initial());

  final AuthBloc authBloc;

  UserBloc(this.authBloc) {
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
    if (kDebugMode) {
      print("update stream user");
    }
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
        User user = User.fromJson(response.data);
        _updateStream(UserState.success(user));
        // currentUserProvider.setCurrentUser(user);
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

  Future<void> updateProfilePicture(
      String newPictureLink, PictureType newPictureType) async {
    _updateStream(UserState.loading());
    try {
      var response = await dio.patch("/profile/picture", data: {
        'pictureLink': newPictureLink,
        'pictureType': PictureTypeUtil.textOf(newPictureType),
      });
      if (response.statusCode == 200) {
        User? user = controller.valueOrNull?.user?.copyWith(
          pictureLink: newPictureLink,
          pictureType: newPictureType,
        );
        if (user == null) {
          throw Exception("User is null");
        }
        _updateStream(UserState.success(user));
      } else {
        _updateError(response);
      }
    } catch (err) {
      printError(err);
      _updateError(err);
    }
  }

  Future<void> updateUserName(String newName) async {
    _updateStream(UserState.loading());
    try {
      var response = await dio.patch("/profile", data: {
        'name': newName,
      });
      if (response.statusCode == 200) {
        User? user = controller.valueOrNull?.user?.copyWith(
          name: newName,
        );
        if (user == null) {
          throw Exception("User is null");
        }
        _updateStream(UserState.success(user));
      } else {
        _updateError(response);
      }
    } catch (err) {
      printError(err);
      _updateError(err);
    }
  }
}
