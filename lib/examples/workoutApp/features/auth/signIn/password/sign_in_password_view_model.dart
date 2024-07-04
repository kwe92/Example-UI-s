import 'package:example_ui/examples/workoutApp/features/shared/utility/extended_change_notifier.dart';
import 'package:example_ui/examples/workoutApp/features/shared/services/services.dart';
import 'package:flutter/material.dart';

class SignInPasswordViewModel extends ExtendedChangeNotifier {
  String? _password;

  bool _isObscured = true;

  String? get password => _password;

  bool get isObscured => _isObscured;

  bool get successfulLogin => authService.loggedIn;

  void setPassword(String password) {
    _password = password.trim();
    debugPrint("from $this.setPassword: $password");
    notifyListeners();
  }

  void setObscure(bool obscure) {
    _isObscured = obscure;
    notifyListeners();
  }

  void setTempUser() => authService.setTempUserPassword(password!);

  Future<void> signInWithEmailAndPassword() async {
    try {
      setBusy(true);
      await authService.signInWithEmailAndPassword();
      setBusy(false);
      authService.setLoggedIn(true);
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

  Future<void> resetpassword() async {
    final bool userRequestedPasswordReset = await toastService.forgotPasswordModal();

    await sendResetPasswordEmail(userRequestedPasswordReset);
  }

  Future<void> sendResetPasswordEmail(bool userRequestedPasswordReset) async {
    try {
      if (userRequestedPasswordReset) {
        setBusy(true);
        await authService.resetpassword();
        setBusy(false);
        toastService.showSnackBar("password reset email sent to: ${authService.tempUser.email}");
      }
    } catch (err, _) {
      setBusy(false);
      debugPrint("Error - sendResetPasswordEmail: ${err.toString()}");
      final parsedError = err.toString().toLowerCase().split("]").last;

      if (parsedError.contains("network error")) {
        toastService.showSnackBar(parsedError, Colors.red);
        return;
      }

      toastService.showSnackBar(err.toString().toLowerCase(), Colors.red);
    }
  }
}
