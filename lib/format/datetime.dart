import 'package:intl/intl.dart';

DateTime now = DateTime.now();

DateTime formatDate(String date) {
  DateTime formattedDate = DateFormat('dd MMM yyyy').parse(date);
  return formattedDate;
}

String getCurrentDate() {
  String formattedDate = DateFormat('dd MMM yyyy').format(now);
  return formattedDate;
}

String getCurrentTime() {
  String formattedTime = DateFormat('HH:mm').format(now);
  return formattedTime;
}

// Untuk dapatkan bulan dalam bentuk angka
int getMonthOnly(String date) {
  int month = DateFormat('dd MMM yyyy').parse(date).month;
  return month;
}

// Untuk dapatkan tahun dalam bentuk angka
int getYearOnly(String date) {
  int month = DateFormat('dd MMM yyyy').parse(date).month;
  return month;
}

String getMonthName(String date) {
  String monthName =
      DateFormat('MMM').format(DateFormat('dd MMM yyyy').parse(date));
  return monthName;
}

int getYear(String date) {
  String year =
      DateFormat('yyyy').format(DateFormat('dd MMM yyyy').parse(date));
  return int.parse(year);
}
