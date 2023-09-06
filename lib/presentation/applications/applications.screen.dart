import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'controllers/applications.controller.dart';
import 'widgets/features_list/features_list.screen.dart';

class ApplicationsScreen extends GetView<ApplicationsController> {
  const ApplicationsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 2.h),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome Méli ! 👋',
                    style: TextStyle(fontSize: 20),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/margot.jpeg'),
                  )
                ],
              ),
              SizedBox(height: 4.h),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: FeaturesListScreen(),
              ),
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Activités',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}
