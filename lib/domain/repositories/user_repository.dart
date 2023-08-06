// Contract for user repository
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  Future<User?> signupWithEmailAndPassword(String email, String password);
}
