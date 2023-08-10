import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobjet/domain/usecases/customer/create_customer_usecase.dart';
import 'package:jobjet/domain/usecases/customer/get_all_customers_usercase.dart';
import 'package:jobjet/infrastructure/repositories/customer_repository_impl.dart';
import 'package:jobjet/presentation/customer/widget/create_customer.screen.dart';
import 'package:sizer/sizer.dart';

import 'controllers/customer.controller.dart';

class CustomerScreen extends GetView<CustomerController> {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CustomerController controller = Get.put(CustomerController(
      CreateCustomerUseCase(CustomerRepositoryImpl(FirebaseFirestore.instance)),
      GetAllCustomersUseCase(
          CustomerRepositoryImpl(FirebaseFirestore.instance)),
    ));

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => CreateCustomerScreen());
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Fiche clients'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (value) {},
              decoration: const InputDecoration(
                isDense: true,
                labelText: 'Rechercher un client',
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 2.h),
          for (var customer in controller.customers)
            ListTile(
              title: Text(customer.firstName),
              subtitle: Text(customer.lastName),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete),
              ),
            ),
        ],
      ),
    );
  }
}
