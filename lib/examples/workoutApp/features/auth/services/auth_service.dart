// ignore_for_file: prefer_final_fields

import 'package:example_ui/examples/workoutApp/features/services/firebase_service.dart';
import 'package:example_ui/examples/workoutApp/features/shared/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  UserModel _tempUser = UserModel(id: "", fullName: "", email: "", password: "");

  User? _firebaseUser;

  UserModel get tempUser => _tempUser;

  User? get firebaseUser => _firebaseUser;

  bool _loggedIn = false;

  bool get loggedIn => _loggedIn;

  static final _firebaseAuth = FirebaseService.instance().authInstance;

  static final AuthService _singleton = AuthService._internal();

  factory AuthService.instance() => _singleton;

  AuthService._internal();

  void setTempUserEmail(String email) {
    _tempUser.email = email;

    notifyListeners();
  }

  void setTempUserName(String name) {
    _tempUser.fullName = name;

    notifyListeners();
  }

  void setTempUserPassword(String password) {
    _tempUser.password = password;

    notifyListeners();
  }

  void setLoggedIn(bool isLoggedIn) {
    _loggedIn = isLoggedIn;
    notifyListeners();
  }

  Future<void> createUserWithEmailAndPassword() async {
    debugPrint("createUserWithEmailAndPassword:  _tempUser: $_tempUser");
    UserCredential firebaseUserCredentials =
        await _firebaseAuth.createUserWithEmailAndPassword(email: _tempUser.email!, password: _tempUser.password!);

    _firebaseUser = firebaseUserCredentials.user;

    debugPrint("New user created successfully: $_firebaseUser");

    notifyListeners();
  }

  Future<void> signInWithEmailAndPassword() async {
    var userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: _tempUser.email!, password: _tempUser.password!);

    _firebaseUser = userCredential.user;

    debugPrint("current user: $_firebaseUser");

    notifyListeners();
  }

  Future<void> deleteUser() async {
    await _firebaseUser?.delete();
  }

  void resetResources() {
    _tempUser = UserModel(id: "", fullName: "", email: "", password: "");
    notifyListeners();
  }
}
