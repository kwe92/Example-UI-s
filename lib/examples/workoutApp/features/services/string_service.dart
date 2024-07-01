import 'package:email_validator/email_validator.dart';

class StringService {
  static String? emailValidator(String? email) {
    if (isEmpty(email)) {
      return "email can't be empty.";
    }
    if (!EmailValidator.validate(email ?? "")) {
      return "enter a valid email.";
    }
    return null;
  }

  static String? passwordValidator(String? password) {
    if (isEmpty(password)) {
      return "password can't be empty.";
    } else if (!containsUppercase(password)) {
      return "password must contain a uppercase letter.";
    } else if (!containsLowercase(password)) {
      return "password must contain a lowecase letter.";
    } else if (!containsNumber(password)) {
      return "password must contain a number.";
    } else if (!containsSpecialCharacter(password)) {
      return "password must contain a special character.";
    } else if (!contains8Characters(password)) {
      return "password must be at least 8 characters.";
    } else {
      return null;
    }
  }

  static bool containsUppercase(String? value) => RegExp(r"(?=.*[A-Z])").hasMatch(value ?? "");

  static bool containsLowercase(String? value) => RegExp(r"(?=.*[a-z])").hasMatch(value ?? "");

  static bool containsNumber(String? value) => RegExp(r"(?=.*?[0-9])").hasMatch(value ?? "");

  static bool containsSpecialCharacter(String? value) => RegExp("[^a-zA-Z0-9d]").hasMatch(value ?? "");

  static bool contains8Characters(String? value) => (value ?? "").length >= 8;

  static bool isEmpty(String? value) => (value == null || value.isEmpty);
}
