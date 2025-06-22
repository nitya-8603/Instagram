import 'package:flutter/material.dart';
import 'package:insta_clone/models/user.dart';
import 'package:insta_clone/resources/auth_methods.dart';

class UserProviders with ChangeNotifier {
  final AuthMethods _authMethods = AuthMethods();
  User? _user;

  User? get getUserOrNull => _user; // ✅ Safe getter

  User get getUser {
    if (_user == null) {
      throw Exception("User not yet loaded");
    }
    return _user!;
  }

  Future<void> refreshUser() async {
    print("Refreshing user...");
    try {
      User user = await _authMethods.getCurrentUserDetails();
      print("User fetched: ${user.username}");
      _user = user;
      notifyListeners();
    } catch (e) {
      print("Error in refreshUser: $e");
    }
  }
}
