import 'package:shared_preferences/shared_preferences.dart';

class Store {
  static void setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  static void getToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getString('token');
  }

  static void removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }
}
