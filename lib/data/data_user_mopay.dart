import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mopay_ewallet/data/data_saldo.dart';

class MopayUserData {
  int userID;
  String nama;
  String noTelp;
  String email;
  dynamic profilePic;
  String password;
  String nomorPin;
  DateTime createdAt;
  DateTime updatedAt;

  MopayUserData({
    required this.userID,
    required this.nama,
    required this.noTelp,
    required this.email,
    required this.profilePic,
    required this.password,
    required this.nomorPin,
    required this.createdAt,
    required this.updatedAt,
  });
}

class MopayUserDataProvider extends ChangeNotifier {
  late MopayUserData currentUser;

  List<MopayUserData> data = [
    MopayUserData(
      userID: 1,
      nama: "Christine",
      noTelp: '083100000000',
      email: 'christine@gmail.com',
      profilePic: "",
      password: '123',
      nomorPin: "123456",
      createdAt: DateTime(2023, 6, 20, 10, 0, 0),
      updatedAt: DateTime(2023, 6, 21, 15, 30, 0),
    ),
    MopayUserData(
      userID: 2,
      nama: "Elly",
      noTelp: '082100000000',
      email: 'elly@gmail.com',
      profilePic: "123456",
      password: '456',
      nomorPin: "",
      createdAt: DateTime(2023, 6, 25, 10, 0, 0),
      updatedAt: DateTime(2023, 6, 26, 15, 30, 0),
    ),
    MopayUserData(
      userID: 3,
      nama: "Vania",
      noTelp: '085100000000',
      email: 'vania@gmail.com',
      profilePic:
          "https://tse4.mm.bing.net/th?id=OIP.xdrpi_ndIOseoDvJJ097qAHaE8&pid=Api&P=0&h=180",
      password: '789',
      nomorPin: "123456",
      createdAt: DateTime(2023, 6, 27, 10, 0, 0),
      updatedAt: DateTime(2023, 6, 28, 15, 30, 0),
    ),
    MopayUserData(
      userID: 4,
      nama: "Aldo",
      noTelp: '081200000000',
      email: 'aldo@gmail.com',
      profilePic:
          "https://tse4.mm.bing.net/th?id=OIP.xdrpi_ndIOseoDvJJ097qAHaE8&pid=Api&P=0&h=180",
      password: 'abc',
      nomorPin: "654321",
      createdAt: DateTime(2023, 7, 1, 10, 0, 0),
      updatedAt: DateTime(2023, 7, 2, 15, 30, 0),
    ),
    MopayUserData(
      userID: 5,
      nama: "Bella",
      noTelp: '084500000000',
      email: 'bella@gmail.com',
      profilePic: "",
      password: 'def',
      nomorPin: "111222",
      createdAt: DateTime(2023, 7, 3, 10, 0, 0),
      updatedAt: DateTime(2023, 7, 4, 15, 30, 0),
    ),
    MopayUserData(
      userID: 6,
      nama: "Carlos",
      noTelp: '086700000000',
      email: 'carlos@gmail.com',
      profilePic:
          "https://tse4.mm.bing.net/th?id=OIP.xdrpi_ndIOseoDvJJ097qAHaE8&pid=Api&P=0&h=180",
      password: 'ghi',
      nomorPin: "333444",
      createdAt: DateTime(2023, 7, 5, 10, 0, 0),
      updatedAt: DateTime(2023, 7, 6, 15, 30, 0),
    ),
    MopayUserData(
      userID: 7,
      nama: "Diana",
      noTelp: '087800000000',
      email: 'diana@gmail.com',
      profilePic: "",
      password: 'jkl',
      nomorPin: "555666",
      createdAt: DateTime(2023, 7, 7, 10, 0, 0),
      updatedAt: DateTime(2023, 7, 8, 15, 30, 0),
    ),
    MopayUserData(
      userID: 8,
      nama: "Ethan",
      noTelp: '088900000000',
      email: 'ethan@gmail.com',
      profilePic:
          "https://tse4.mm.bing.net/th?id=OIP.xdrpi_ndIOseoDvJJ097qAHaE8&pid=Api&P=0&h=180",
      password: 'mno',
      nomorPin: "777888",
      createdAt: DateTime(2023, 7, 9, 10, 0, 0),
      updatedAt: DateTime(2023, 7, 10, 15, 30, 0),
    ),
    MopayUserData(
      userID: 9,
      nama: "Fiona",
      noTelp: '089900000000',
      email: 'fiona@gmail.com',
      profilePic: "",
      password: 'pqr',
      nomorPin: "999000",
      createdAt: DateTime(2023, 7, 11, 10, 0, 0),
      updatedAt: DateTime(2023, 7, 12, 15, 30, 0),
    ),
    MopayUserData(
      userID: 10,
      nama: "George",
      noTelp: '080000000000',
      email: 'george@gmail.com',
      profilePic:
          "https://tse4.mm.bing.net/th?id=OIP.xdrpi_ndIOseoDvJJ097qAHaE8&pid=Api&P=0&h=180",
      password: 'stu',
      nomorPin: "222333",
      createdAt: DateTime(2023, 7, 13, 10, 0, 0),
      updatedAt: DateTime(2023, 7, 14, 15, 30, 0),
    ),
    MopayUserData(
      userID: 11,
      nama: "Hannah",
      noTelp: '081100000000',
      email: 'hannah@gmail.com',
      profilePic: "",
      password: 'vwx',
      nomorPin: "444555",
      createdAt: DateTime(2023, 7, 15, 10, 0, 0),
      updatedAt: DateTime(2023, 7, 16, 15, 30, 0),
    ),
    MopayUserData(
      userID: 12,
      nama: "Ian",
      noTelp: '082200000000',
      email: 'ian@gmail.com',
      profilePic:
          "https://tse4.mm.bing.net/th?id=OIP.xdrpi_ndIOseoDvJJ097qAHaE8&pid=Api&P=0&h=180",
      password: 'yz0',
      nomorPin: "666777",
      createdAt: DateTime(2023, 7, 17, 10, 0, 0),
      updatedAt: DateTime(2023, 7, 18, 15, 30, 0),
    ),
    MopayUserData(
      userID: 13,
      nama: "Jenny",
      noTelp: '083300000000',
      email: 'jenny@gmail.com',
      profilePic: "",
      password: 'abc1',
      nomorPin: "888999",
      createdAt: DateTime(2023, 7, 19, 10, 0, 0),
      updatedAt: DateTime(2023, 7, 20, 15, 30, 0),
    ),
    MopayUserData(
      userID: 14,
      nama: "Kevin",
      noTelp: '084400000000',
      email: 'kevin@gmail.com',
      profilePic:
          "https://tse4.mm.bing.net/th?id=OIP.xdrpi_ndIOseoDvJJ097qAHaE8&pid=Api&P=0&h=180",
      password: 'def2',
      nomorPin: "000111",
      createdAt: DateTime(2023, 7, 21, 10, 0, 0),
      updatedAt: DateTime(2023, 7, 22, 15, 30, 0),
    ),
    MopayUserData(
      userID: 15,
      nama: "Laura",
      noTelp: '085500000000',
      email: 'laura@gmail.com',
      profilePic: "",
      password: 'ghi3',
      nomorPin: "222333",
      createdAt: DateTime(2023, 7, 23, 10, 0, 0),
      updatedAt: DateTime(2023, 7, 24, 15, 30, 0),
    ),
  ];

  void addUser({
    required String nama,
    required String email,
    required String noTelp,
    required String password,
  }) {
    data.add(MopayUserData(
      userID: data.length + 1,
      nama: nama,
      noTelp: noTelp,
      email: email,
      profilePic: "",
      password: password,
      nomorPin: "",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ));
    notifyListeners();
  }

  void setCurrentUser(int index) {
    currentUser = data[index];
    BalancesProvider().setCurrentUserBalance(data[index].userID);
    notifyListeners();
  }

  // void addCurrentUserBalance(int nominal) {
  //   if (currentUser != null) {
  //     currentUser!.saldo += nominal;
  //     notifyListeners();
  //   }
  // }

  // void subtractCurrentUserBalance(int nominal) {
  //   if (currentUser != null) {
  //     currentUser!.saldo -= nominal;
  //     notifyListeners();
  //   }
  // }

  void changeName(String newName) {
    if (currentUser != null) {
      currentUser!.nama = newName;
      notifyListeners();
    }
  }

  void changePhoneNumber(String newNumber) {
    if (currentUser != null) {
      currentUser!.noTelp = newNumber;
      notifyListeners();
    }
  }

  void changeEmail(String newEmail) {
    if (currentUser != null) {
      currentUser!.email = newEmail;
      notifyListeners();
    }
  }

  void changeProfilePicture(dynamic newPic) {
    if (currentUser != null) {
      currentUser!.profilePic = newPic;
    } else if (newPic is File) {
      currentUser!.profilePic = newPic.path; // Example: Store file path
    }
    notifyListeners();
  }

  void deleteProfilePicture() {
    currentUser!.profilePic = "";
    notifyListeners();
  }

  void changePassword(String newPwd) {
    if (currentUser != null) {
      currentUser!.password = newPwd;
      notifyListeners();
    }
  }

  void changePin(String newPin) {
    if (currentUser != null) {
      currentUser!.nomorPin = newPin;
      notifyListeners();
    }
  }

  void updateProfile() {
    if (currentUser != null) {
      currentUser!.updatedAt = DateTime.now();
      notifyListeners();
    }
  }
}
