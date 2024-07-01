import 'package:example_ui/examples/workoutApp/features/auth/services/auth_service.dart';
import 'package:example_ui/examples/workoutApp/features/services/toast_service.dart';
import 'package:example_ui/examples/workoutApp/features/shared/mixins/extended_change_notifier.dart';
import 'package:flutter/material.dart';

// TODO: use firebase for auth

// TODO: set busy state handling | to be honest you should implement an extended change notifier class

final AuthService _authServer = AuthService.instance();

class SetPasswordViewModel extends ExtendedChangeNotifier {
  String? _password;

  String? _confirmedPassword;

  bool _isObscured = true;

  String? get password => _password;

  String? get confirmedPassword => _confirmedPassword;

  bool get isObscured => _isObscured;

  bool get isMatchingPassword => _password?.trim() == confirmedPassword?.trim();

  bool get successfulLogin => _authServer.loggedIn;

  void setPassword(String password) {
    _password = password.trim();
    debugPrint("from $this.setPassword: $_password");
    notifyListeners();
  }

  void setConfirmedPassword(String confirmedPassword) {
    _confirmedPassword = confirmedPassword.trim();
    debugPrint("from $this.setConfirmedPassword: $_confirmedPassword");
    notifyListeners();
  }

  void setObscure(bool obscure) {
    _isObscured = obscure;
    notifyListeners();
  }

  void setTempUser() {
    _authServer.setTempUserPassword(password!);
  }

  Future<void> createUser() async {
    try {
      setBusy(true);
      await _authServer.createUserWithEmailAndPassword();
      setBusy(false);

      _authServer.setLoggedIn(true);
    } catch (err, _) {
      setBusy(false);

      debugPrint("Error - SetPasswordViewModel: createUser: $err");

      if (err.toString().toLowerCase().contains("in use")) {
        toastService.showSnackBar("email in use.", Colors.red);
      } else if (err.toString().toLowerCase().contains("network error")) {
        toastService.showSnackBar("please check your network connection.", Colors.red);
      } else {
        toastService.showSnackBar("an error has occured please try again.", Colors.red);
      }
    }
  }
}
