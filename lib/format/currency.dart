import 'package:intl/intl.dart';

class CurrencyFormat {
  String indonesianFormat(int amount) {
    return NumberFormat("#,##0", "id_ID").format(amount);
  }
}
