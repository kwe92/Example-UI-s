import 'package:example_ui/examples/workoutApp/features/auth/services/auth_service.dart';
import 'package:example_ui/examples/workoutApp/features/services/toast_service.dart';
import 'package:example_ui/examples/workoutApp/features/shared/mixins/extended_change_notifier.dart';
import 'package:flutter/material.dart';

final AuthService _authServer = AuthService.instance();

class SignInPasswordViewModel extends ExtendedChangeNotifier {
  String? _password;

  bool _isObscured = true;

  String? get password => _password;

  bool get isObscured => _isObscured;

  bool get successfulLogin => _authServer.loggedIn;

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
    try {
      setBusy(true);
      await _authServer.signInWithEmailAndPassword();
      setBusy(false);
      _authServer.setLoggedIn(true);
    } catch (err) {
      setBusy(false);

      debugPrint("Error - signInWithEmailAndPassword: ${err.toString()}");

      final errStr = err.toString().toLowerCase();

      if (errStr.contains("invalid-credential")) {
        toastService.showSnackBar("incorrect email or password.", Colors.red);
      } else if (errStr.contains("network error")) {
        toastService.showSnackBar("please check your network connection.", Colors.red);
      } else {
        toastService.showSnackBar("an error has occured please try again.", Colors.red);
      }
    }
  }
}
