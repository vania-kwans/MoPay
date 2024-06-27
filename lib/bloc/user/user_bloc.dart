import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mopay_ewallet/bloc/store.dart';
import 'package:mopay_ewallet/bloc/user/user_state.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {
  final dio = Dio(BaseOptions(baseUrl: dotenv.env["BASE_URL"]!));

  final controller = BehaviorSubject<UserState>();

  void _updateStream(UserState state) {
    if (controller.isClosed) {
      return;
    }
    controller.add(state);
  }

  Future login(String phoneNumber, String password) async {
    try {
      _updateStream(UserState(isLoading: true));

      var response = await dio.post('/mopay/login', data: {
        "fcmToken": "123",
        "phoneNumber": phoneNumber,
        "password": password
      });

      var token = response.data;
      Store.setToken(token);
      _updateStream(UserState());
    } catch (err) {
      _updateStream(UserState(hasError: true));
    }
  }

  Future checkLogin() async {
    try {} catch (err) {}
  }
}
