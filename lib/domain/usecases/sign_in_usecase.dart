import '../repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<void> call(String email, String password) {
    return repository.loginWithEmailAndPassword(email, password);
  }
}
