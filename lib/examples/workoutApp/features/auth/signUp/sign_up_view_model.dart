import 'package:example_ui/examples/workoutApp/features/shared/services/services.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends ChangeNotifier {
  String? _email;

  String? get email => _email;

  String? _name;

  String? get name => _name;

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
    authService.setTempUserEmail(email!);

    authService.setTempUserName(name!);
  }
}
