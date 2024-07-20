import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _authInstance;

  FirebaseAuth get authInstance => _authInstance;

  static FirebaseService? _singleton;

  FirebaseService._internal(this._authInstance);

  factory FirebaseService(FirebaseAuth authInstance) {
    _singleton ??= FirebaseService._internal(authInstance);

    return _singleton!;
  }
}
