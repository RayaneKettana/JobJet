import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jobjet/domain/usecases/customer/create_customer_usecase.dart';
import 'package:jobjet/domain/usecases/customer/get_all_customers_usercase.dart';
import 'package:jobjet/infrastructure/repositories/customer_repository_impl.dart';

import '../../../../presentation/customer/controllers/customer.controller.dart';

class CustomerControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerController>(
      () => CustomerController(
        CreateCustomerUseCase(
            CustomerRepositoryImpl(FirebaseFirestore.instance)),
        GetAllCustomersUseCase(
            CustomerRepositoryImpl(FirebaseFirestore.instance)),
      ),
    );
  }
}
