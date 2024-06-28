import 'package:flutter/material.dart';

class SignInPasswordViewModel extends ChangeNotifier {
  String? _password;

  bool _isObscured = true;

  String? get password => _password;

  bool get isObscured => _isObscured;

  void setPassword(String password) {
    _password = password.trim();
    debugPrint("from $this.setPassword: $password");
    notifyListeners();
  }

  void setObscure(bool obscure) {
    _isObscured = obscure;
    notifyListeners();
  }
}
