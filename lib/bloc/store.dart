import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Store {
  static Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  static Future<void> saveLoginPreferences(
      bool rememberMe, String phoneNumber, String password) async {
    final prefs = await SharedPreferences.getInstance();
    if (!rememberMe) {
      prefs.remove('loginPreferences');
      return;
    }
    Map<String, dynamic> loginPreferences = {
      'rememberPassword': rememberMe,
      'phoneNumber': phoneNumber,
      'password': password,
    };
    prefs.setString('loginPreferences', jsonEncode(loginPreferences));
  }

  static Future<Map<String, dynamic>> getLoginPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    String? loginPreferences = prefs.getString('loginPreferences');
    if (loginPreferences == null) return {};
    Map<String, dynamic> loginPreferencesMap = jsonDecode(loginPreferences);
    return loginPreferencesMap;
  }

  static Future<void> removeLoginPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('loginPreferences');
  }

  static Future<void> setLastAdsShown(DateTime dateTime) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('lastAdsShown', dateTime.millisecondsSinceEpoch);
  }

  static Future<DateTime> getLastAdsShown() async {
    final prefs = await SharedPreferences.getInstance();
    int lastAdsShown = prefs.getInt('lastAdsShown') ?? 0;
    return DateTime.fromMillisecondsSinceEpoch(lastAdsShown);
  }

  static Future<void> removeLastAdsShown() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('lastAdsShown');
  }

  static Future<void> setLastPinEnter(DateTime dateTime) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('lastPinEnter', dateTime.millisecondsSinceEpoch);
  }

  static Future<DateTime> getLastPinEnter() async {
    final prefs = await SharedPreferences.getInstance();
    int lastPinEnter = prefs.getInt('lastPinEnter') ?? 0;
    return DateTime.fromMillisecondsSinceEpoch(lastPinEnter);
  }

  static Future<void> removeLastPinEnter() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('lastPinEnter');
  }
}
