import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
              const Text('JobJet ! ', style: TextStyle(fontSize: 36)),
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
              const Text(
                textAlign: TextAlign.center,
                "Gérez vos rendez-vous, clients et plus encore, en toute simplicité.",
                style: TextStyle(fontSize: 18),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Align the buttons to opposite sides
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: Text("S'inscrire"),
                  ),
                  ElevatedButton(onPressed: () {}, child: Text("Se connecter")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
