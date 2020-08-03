
import 'package:firebase_auth/firebase_auth.dart';

import 'user_repository.dart';

class FirebaseUserRepository implements UserRepository {
  final FirebaseAuth _firebaseAuth;

  FirebaseUserRepository({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<bool> isAuthenticated() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  Future<void> authenticate() => _firebaseAuth.signInAnonymously();

  Future<String> getUserId() async => (await _firebaseAuth.currentUser()).uid;

}
