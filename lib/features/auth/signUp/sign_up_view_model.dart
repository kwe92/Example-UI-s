import 'package:example_ui/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends ChangeNotifier {
  final AuthService _authService;

  String? _email;

  String? _name;

  String? get email => _email;

  String? get name => _name;

  SignUpViewModel(this._authService);

  void setEmail(String email) {
    _email = email.trim();
    debugPrint("signup - email: $_email");
    notifyListeners();
  }

  void setName(String name) {
    _name = name.trim();
    debugPrint("signup - username: $_name");
    notifyListeners();
  }

  void setTempUser() {
    _authService.setTempUserEmail(email!);

    _authService.setTempUserName(name!);
  }
}
