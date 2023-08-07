import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jobjet/presentation/login/login.screen.dart';
import 'package:sizer/sizer.dart';

import 'controllers/splash.controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 6.0.h,
              ),
              Text('JobJet ! ',
                  style: Theme.of(context).textTheme.headlineLarge),
              SizedBox(
                height: 2.0.h,
              ),
              SvgPicture.asset(
                'assets/svg/sign_up.svg',
                height: 24.0.h,
              ),
              SizedBox(
                height: 2.0.h,
              ),
              Text(
                textAlign: TextAlign.center,
                "Gérez vos rendez-vous, clients et plus encore, en toute simplicité.",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Align the buttons to opposite sides
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text("S'inscrire"),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.off(LoginScreen());
                      },
                      child: const Text("Se connecter")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
