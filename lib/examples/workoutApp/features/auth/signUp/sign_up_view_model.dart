import 'package:example_ui/examples/workoutApp/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

// TODO: use firebase for auth

class SignUpViewModel extends ChangeNotifier {
  String? _email;

  String? get email => _email;

  String? _name;

  String? get name => _name;

  void setEmail(String email) {
    _email = email.trim();
    debugPrint("from $this.setEmail: $_email");
    notifyListeners();
  }

  void setName(String name) {
    _name = name.trim();
    debugPrint("from $this.setName: $_name");
    notifyListeners();
  }

  void setTempUser() {
    var authServer = AuthService.instance();

    authServer.setTempUserEmail(email!);

    authServer.setTempUserName(name!);
  }
}
