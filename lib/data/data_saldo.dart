import 'package:flutter/material.dart';

class SaldoProvider extends ChangeNotifier {
  int saldo;

  SaldoProvider({this.saldo = 200000});

  void addSaldo(int amount) {
    saldo += amount;
    notifyListeners();
  }

  void subtractSaldo(int amount) {
    saldo -= amount;
    notifyListeners();
  }
}
