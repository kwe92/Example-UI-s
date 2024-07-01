import 'package:firebase_auth/firebase_auth.dart';

// TODO: review thought process
class FirebaseService {
  final FirebaseAuth authInstance;

  static final singleton = FirebaseService._internal(authInstance: FirebaseAuth.instance);

  FirebaseService._internal({required this.authInstance});

  factory FirebaseService.instance() => singleton;
}
