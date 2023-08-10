import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:heroicons/heroicons.dart';
import 'package:sizer/sizer.dart';

import '../controllers/customer.controller.dart';

class CreateCustomerScreen extends GetView<CustomerController> {
  CreateCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un client',
            style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              controller.createCustomer();
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.firstNameController,
                decoration: const InputDecoration(
                  icon: HeroIcon(
                    HeroIcons.user,
                    style: HeroIconStyle.solid,
                  ),
                  hintText: 'Prénom',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 2.h),
              TextFormField(
                controller: controller.lastNameController,
                decoration: const InputDecoration(
                  icon: HeroIcon(
                    HeroIcons.user,
                    style: HeroIconStyle.outline,
                  ),
                  hintText: 'Nom',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 2.h),
              TextFormField(
                controller: controller.phoneNumberController,
                decoration: const InputDecoration(
                  icon: HeroIcon(HeroIcons.phone, style: HeroIconStyle.outline),
                  hintText: 'Numéro de téléphone',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 2.h),
              TextFormField(
                controller: controller.addressController,
                decoration: const InputDecoration(
                  icon: HeroIcon(
                    HeroIcons.home,
                    style: HeroIconStyle.outline,
                  ),
                  hintText: 'Adresse',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}
