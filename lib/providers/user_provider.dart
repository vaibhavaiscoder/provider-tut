import 'package:flutter/material.dart';
import 'package:provider_tut/models/user_model.dart';
import 'package:provider_tut/repository/user_repo.dart';

class UserProvider extends ChangeNotifier {
  String userName;
  int number;
  UserData? userData;

  UserProvider({this.userName = "Mapp", this.number = 0});

  void changeUserName({
    required String newUserName,
  }) async {
    userName = newUserName;
    notifyListeners();
  }

  void incrementNumber() {
    number++;
    notifyListeners();
  }

  void decrementNumber() {
    number--;
    notifyListeners();
  }

  Future<void> getUserDetails() async {
    userData = await UserApi.getUserData();
    notifyListeners();
  }
}
