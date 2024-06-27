import 'package:dio/dio.dart';
import 'package:mopay_ewallet/bloc/store.dart';

class TokenInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = await Store.getToken();
    options.headers.addAll({'Authorization': 'Bearer $token'});
    super.onRequest(options, handler);
  }
}
