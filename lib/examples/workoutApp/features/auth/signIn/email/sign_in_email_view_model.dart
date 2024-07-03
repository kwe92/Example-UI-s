import 'package:example_ui/examples/workoutApp/features/shared/services/services.dart';
import 'package:flutter/material.dart';

class SignInEmailViewModel extends ChangeNotifier {
  String? _email;

  String? get email => _email;

  void setEmail(String email) {
    _email = email.trim();
    debugPrint("signin - email: $email");
    notifyListeners();
  }

  void setTempUser() => authService.setTempUserEmail(email!);
}
