import 'package:example_ui/examples/workoutApp/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignInEmailViewModel extends ChangeNotifier {
  String? _email;

  String? get email => _email;

  void setEmail(String email) {
    _email = email.trim();
    debugPrint("from $this.setEmail: $email");
    notifyListeners();
  }

  void setTempUser() {
    var authService = AuthService.instance();

    authService.setTempUserEmail(email!);
  }
}
