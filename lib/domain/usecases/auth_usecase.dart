import 'package:firebase_auth/firebase_auth.dart';

import '../repositories/user_repository.dart';

class SignupWithEmailAndPasswordUseCase {
  final UserRepository repository;

  SignupWithEmailAndPasswordUseCase(this.repository);

  Future<User?> call(String email, String password) {
    return repository.signupWithEmailAndPassword(email, password);
  }
}
