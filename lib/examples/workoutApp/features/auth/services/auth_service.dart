// ignore_for_file: prefer_final_fields

import 'package:example_ui/examples/workoutApp/features/services/firebase_service.dart';
import 'package:example_ui/examples/workoutApp/features/shared/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// TODO: review thought process
class AuthService extends ChangeNotifier {
  UserModel _tempUser = UserModel(id: "", fullName: "", email: "", password: "");

  User? _firebaseUser;

  UserModel get tempUser => _tempUser;

  User? get firebaseUser => _firebaseUser;

  static final _firebaseAuth = FirebaseService.instance().authInstance;

  static final AuthService _singleton = AuthService._internal();

  AuthService._internal();

  factory AuthService.instance() => _singleton;

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

  Future<void> createUserWithEmailAndPassword() async {
    // TODO: add try catch?
    UserCredential firebaseUserCredentials =
        await _firebaseAuth.createUserWithEmailAndPassword(email: _tempUser.email!, password: _tempUser.password!);

    _firebaseUser = firebaseUserCredentials.user;

    // TODO: set UID in firebase | atm the uid is the users email which may not be unique

    _tempUser.id = _firebaseUser?.uid ?? "";

    debugPrint("New user created successfully: $_firebaseUser");

    notifyListeners();
  }

  Future<void> signInWithEmailAndPassword() async {
    // TODO: add try catch?

    var userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: _tempUser.email!, password: _tempUser.password!);

    _firebaseUser = userCredential.user;

    debugPrint("current user: $_firebaseUser");

    notifyListeners();
  }
}
