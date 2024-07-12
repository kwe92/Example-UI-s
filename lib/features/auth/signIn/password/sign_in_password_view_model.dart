import 'package:example_ui/features/auth/services/auth_service.dart';
import 'package:example_ui/features/shared/services/toast_service.dart';
import 'package:example_ui/features/shared/utility/extended_change_notifier.dart';
import 'package:flutter/material.dart';

class SignInPasswordViewModel extends ExtendedChangeNotifier {
  String? _password;

  bool _isObscured = true;

  final AuthService _authService;

  final ToastService _toastService;

  String? get password => _password;

  bool get isObscured => _isObscured;

  bool get successfulLogin => _authService.loggedIn;

  SignInPasswordViewModel(this._authService, this._toastService);

  void setPassword(String password) {
    _password = password.trim();
    debugPrint("from $this.setPassword: $password");
    notifyListeners();
  }

  void setObscure(bool obscure) {
    _isObscured = obscure;
    notifyListeners();
  }

  void setTempUser() => _authService.setTempUserPassword(password!);

  Future<void> signInWithEmailAndPassword() async {
    try {
      setBusy(true);
      await _authService.signInWithEmailAndPassword();
      setBusy(false);
      _authService.setLoggedIn(true);
    } catch (err) {
      setBusy(false);

      debugPrint("Error - signInWithEmailAndPassword: ${err.toString()}");

      final errStr = err.toString().toLowerCase();

      if (errStr.contains("invalid-credential")) {
        _toastService.showSnackBar("incorrect email or password.", Colors.red);
      } else if (errStr.contains("network error")) {
        _toastService.showSnackBar("please check your network connection.", Colors.red);
      } else {
        _toastService.showSnackBar("an error has occured please try again.", Colors.red);
      }
    }
  }

  Future<void> resetpassword() async {
    final bool userRequestedPasswordReset = await _toastService.forgotPasswordModal();

    await sendResetPasswordEmail(userRequestedPasswordReset);
  }

  Future<void> sendResetPasswordEmail(bool userRequestedPasswordReset) async {
    try {
      if (userRequestedPasswordReset) {
        setBusy(true);
        await _authService.resetpassword();
        setBusy(false);
        _toastService.showSnackBar("password reset email sent to: ${_authService.tempUser.email}");
      }
    } catch (err, _) {
      setBusy(false);
      debugPrint("Error - sendResetPasswordEmail: ${err.toString()}");
      final parsedError = err.toString().toLowerCase().split("]").last;

      if (parsedError.contains("network error")) {
        _toastService.showSnackBar(parsedError, Colors.red);
        return;
      }

      _toastService.showSnackBar(err.toString().toLowerCase(), Colors.red);
    }
  }
}
