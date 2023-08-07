// Contract for user repository
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User?> signupWithEmailAndPassword(String email, String password);
  Future<User?> loginWithEmailAndPassword(String email, String password);
}
