import 'package:flutter/material.dart';

class Balances {
  int userID;
  int saldo;

  Balances({
    required this.userID,
    this.saldo = 0,
  });
}

class BalancesProvider extends ChangeNotifier {
  Balances? currentBalance;

  List<Balances> data = [
    Balances(
      userID: 1,
      saldo: 5000000,
    ),
    Balances(
      userID: 2,
      saldo: 5000000,
    ),
    Balances(
      userID: 3,
      saldo: 5000000,
    ),
    Balances(
      userID: 4,
      saldo: 5000000,
    ),
    Balances(
      userID: 5,
      saldo: 5000000,
    ),
    Balances(
      userID: 6,
      saldo: 5000000,
    ),
    Balances(
      userID: 7,
      saldo: 5000000,
    ),
    Balances(
      userID: 8,
      saldo: 5000000,
    ),
    Balances(
      userID: 9,
      saldo: 5000000,
    ),
    Balances(
      userID: 10,
      saldo: 5000000,
    ),
    Balances(
      userID: 11,
      saldo: 5000000,
    ),
    Balances(
      userID: 12,
      saldo: 5000000,
    ),
    Balances(
      userID: 13,
      saldo: 5000000,
    ),
    Balances(
      userID: 14,
      saldo: 5000000,
    ),
    Balances(
      userID: 15,
      saldo: 5000000,
    ),
  ];

  void setCurrentUserBalance(int userID) {
    Balances? balance = data.firstWhere((balance) => balance.userID == userID);
    currentBalance = balance;
    notifyListeners();
  }

  void addBalance(int amount) {
    currentBalance!.saldo += amount;
    notifyListeners();
  }

  void subtractBalance(int amount) {
    currentBalance!.saldo -= amount;
    notifyListeners();
  }
}
