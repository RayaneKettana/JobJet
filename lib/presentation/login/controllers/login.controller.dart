import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jobjet/domain/usecases/sign_in_usecase.dart';
import 'package:jobjet/presentation/home/home.screen.dart';

import '../../../domain/usecases/sign_up_usecase.dart';

class LoginController extends GetxController {
  final SignupWithEmailAndPasswordUseCase _signupWithEmailAndPasswordUseCase;
  final SignInUseCase _signInUseCase;
  final email = TextEditingController();
  final password = TextEditingController();

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
      Get.to(const HomeScreen());
    } catch (e) {
      Get.snackbar(
        "Erreur d'authentification",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
