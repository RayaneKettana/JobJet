import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jobjet/domain/usecases/sign_in_usecase.dart';
import 'package:jobjet/presentation/navigation_bar/navigation_bar.dart';

import '../../../domain/usecases/sign_up_usecase.dart';
import '../formz_models/password.dart';

class LoginController extends GetxController {
  final SignupWithEmailAndPasswordUseCase _signupWithEmailAndPasswordUseCase;
  final SignInUseCase _signInUseCase;

  final password = Password.pure().obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginController(this._signupWithEmailAndPasswordUseCase, this._signInUseCase);

  Future<void> signupWithEmailAndPassword(String email, String password) async {
    try {
      await _signupWithEmailAndPasswordUseCase(email, password);
    } catch (e) {
      Get.snackbar(
        "Erreur d'authentification",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _signInUseCase(email, password);
      Get.off(() => NavigationBarScreen());
    } catch (e) {
      Get.snackbar(
        "Erreur d'authentification",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
