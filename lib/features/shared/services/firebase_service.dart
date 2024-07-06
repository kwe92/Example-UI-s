import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth authInstance;

  static final _singleton = FirebaseService._internal(authInstance: FirebaseAuth.instance);

  FirebaseService._internal({required this.authInstance});

  factory FirebaseService() => _singleton;
}
