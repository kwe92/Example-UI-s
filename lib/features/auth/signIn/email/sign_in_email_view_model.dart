import 'package:example_ui/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignInEmailViewModel extends ChangeNotifier {
  String? _email;

  final AuthService _authService;

  String? get email => _email;

  SignInEmailViewModel(this._authService);

  void setEmail(String email) {
    _email = email.trim();
    debugPrint("signin - email: $email");
    notifyListeners();
  }

  void setTempUser() => _authService.setTempUserEmail(email!);
}
