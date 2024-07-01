import 'package:example_ui/examples/workoutApp/features/auth/services/auth_service.dart';
import 'package:example_ui/examples/workoutApp/features/shared/mixins/extended_change_notifier.dart';
import 'package:flutter/material.dart';

final AuthService _authServer = AuthService.instance();

class SignInPasswordViewModel extends ExtendedChangeNotifier {
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

  void setTempUser() {
    _authServer.setTempUserPassword(password!);
  }

  Future<void> signInWithEmailAndPassword() async {
    setBusy(true);
    await _authServer.signInWithEmailAndPassword();
    setBusy(false);
  }
}
