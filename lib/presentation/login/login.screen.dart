import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jobjet/domain/usecases/sign_in_usecase.dart';
import 'package:jobjet/domain/usecases/sign_up_usecase.dart';
import 'package:sizer/sizer.dart';

import '../../infrastructure/auth/firebase_auth_impl.dart';
import 'controllers/login.controller.dart';

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
          padding: const EdgeInsets.all(18.0),
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
                controller: _controller.email,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 2.0.h,
              ),
              TextFormField(
                controller: _controller.password,
                decoration: const InputDecoration(
                  labelText: 'Mot de passe',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 2.0.h,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        _controller.signInWithEmailAndPassword(
                            _controller.email.text, _controller.password.text);
                      },
                      child: const Text('Se connecter'))),
              TextButton(
                  onPressed: () {}, child: const Text('Mot de passe oublié ?')),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {}, child: const Text('Créer un compte')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
