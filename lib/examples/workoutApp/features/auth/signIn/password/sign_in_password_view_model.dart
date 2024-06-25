import 'package:flutter/material.dart';

class SignInPasswordViewModel extends ChangeNotifier {
  String? _password;

  String? get password => _password;

  void setPassword(String password) {
    _password = password;
    debugPrint("from $this.setPassword: $password");
    notifyListeners();
  }
}
