import 'package:intl/intl.dart';

String formatToIndonesianCurrency(int amount) {
  return NumberFormat("#,##0", "id_ID").format(amount);
}
