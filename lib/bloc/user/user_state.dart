import 'package:mopay_ewallet/data/data_user_mopay.dart';

class UserState {
  final bool isLoading;
  final bool hasError;
  final MopayUserData? mopayUserData;

  UserState(
      {this.isLoading = false, this.hasError = false, this.mopayUserData});
}
