
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider_prac/model/user.dart';

class UserNotifier extends ChangeNotifier {
  List<User> usersList = [];

  UnmodifiableListView<User> get userList => UnmodifiableListView(usersList);

  addUser(User user) {
    usersList.add(user);
    notifyListeners();
  }

  removeUser(index) {
    usersList.removeWhere((user) => user.name == userList[index].name);
    notifyListeners();
  }
}