import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../domain/usecases/customer/create_customer_usecase.dart';
import '../../domain/usecases/customer/delete_customer_usecase.dart';
import '../../domain/usecases/customer/get_all_customers_usercase.dart';
import '../../infrastructure/repositories/customer_repository_impl.dart';
import 'controllers/customer.controller.dart';
import 'widget/create_customer.screen.dart';

class CustomerScreen extends GetView<CustomerController> {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CustomerController controller = Get.put(CustomerController(
      CreateCustomerUseCase(CustomerRepositoryImpl(FirebaseFirestore.instance)),
      GetAllCustomersUseCase(
          CustomerRepositoryImpl(FirebaseFirestore.instance)),
      DeleteCustomerUseCase(CustomerRepositoryImpl(FirebaseFirestore.instance)),
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
          if (controller.customers.isNotEmpty)
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
          Expanded(
            child: Obx(
              () {
                if (controller.isLoading.value) {
                  return Center(
                    child:
                        CircularProgressIndicator(), // Display the loading spinner
                  );
                } else if (controller.customers.isEmpty) {
                  return const Center(
                    child: Text("Pas encore de client"),
                  );
                }
                return ListView.builder(
                  itemCount: controller.customers.length,
                  itemBuilder: (context, index) {
                    final customer = controller.customers[index];
                    return ListTile(
                      onTap: () {
                        controller.editCustomer(customer);
                      },
                      title: Text(
                        '${customer.firstName} ${customer.lastName}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      subtitle: Text(customer.phoneNumber),
                      trailing: IconButton(
                        onPressed: () {
                          controller.deleteCustomer(customer);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
