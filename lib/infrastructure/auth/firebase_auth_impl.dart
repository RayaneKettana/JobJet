import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/user_repository.dart';

class FirebaseUserRepository implements UserRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User?> signupWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredential
        .user; // Notez que ceci retournera un `User?` (User nullable)
  }
}
