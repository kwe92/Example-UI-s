import 'package:flutter/material.dart';

// TODO: use firebase for auth

class SignInEmailViewModel extends ChangeNotifier {
  String? _email;

  String? get email => _email;

  void setEmail(String email) {
    _email = email.trim();
    debugPrint("from $this.setEmail: $email");
    notifyListeners();
  }
}
