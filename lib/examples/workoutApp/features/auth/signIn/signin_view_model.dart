import 'package:flutter/material.dart';

class SignInViewModel extends ChangeNotifier {
  String? _email;

  String? get email => _email;

  void setEmail(String email) {
    _email = email;
    debugPrint("from $this.setEmail: $email");
    notifyListeners();
  }
}
