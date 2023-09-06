import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../domain/usecases/sign_in_usecase.dart';
import '../../domain/usecases/sign_up_usecase.dart';
import '../../infrastructure/remote/firebase_auth_impl.dart';
import '../customer/customer.screen.dart';
import 'controllers/login.controller.dart';
import 'formz_models/password.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({Key? key}) : super(key: key);
  final LoginController _controller = Get.put(LoginController(
      SignupWithEmailAndPasswordUseCase(FirebaseAuthImpl()),
      SignInUseCase(FirebaseAuthImpl())));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/svg/welcome_page.svg',
                  height: 24.0.h,
                ),
                SizedBox(
                  height: 4.0.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 100.w,
                    child: Text(
                      'Se connecter',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
                Text(
                    "Un monde d'organisation vous attend. Connectez-vous pour le découvrir.",
                    style: Theme.of(context).textTheme.bodyLarge),
                SizedBox(
                  height: 6.0.h,
                ),
                TextFormField(
                  controller: _controller.emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 2.0.h,
                ),
                Obx(() {
                  return TextFormField(
                      controller: _controller.passwordController,
                      decoration: InputDecoration(
                        labelText: 'Mot de passe',
                        border: OutlineInputBorder(),
                        errorText: _controller.password.value.isValid
                            ? null
                            : 'Mot de passe invalide',
                      ),
                      onChanged: (value) {
                        _controller.password.value = Password.dirty(value);
                      });
                }),
                SizedBox(
                  height: 2.0.h,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          _controller.signInWithEmailAndPassword(
                              _controller.emailController.text,
                              _controller.passwordController.text);
                        },
                        child: const Text('Se connecter'))),
                TextButton(
                    onPressed: () {},
                    child: const Text('Mot de passe oublié ?')),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () {
                        Get.to(() => CustomerScreen());
                      },
                      child: const Text('Créer un client')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
