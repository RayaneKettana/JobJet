import 'package:firebase_auth/firebase_auth.dart';

// Contract for user repository

abstract class AuthRepository {
  Future<User?> signupWithEmailAndPassword(String email, String password);
  Future<User?> loginWithEmailAndPassword(String email, String password);
}
