import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../domain/usecases/customer/create_customer_usecase.dart';
import '../../../../domain/usecases/customer/delete_customer_usecase.dart';
import '../../../../domain/usecases/customer/get_all_customers_usercase.dart';
import '../../../../presentation/customer/controllers/customer.controller.dart';
import '../../../repositories/customer_repository_impl.dart';

class CustomerControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerController>(
      () => CustomerController(
        CreateCustomerUseCase(
            CustomerRepositoryImpl(FirebaseFirestore.instance)),
        GetAllCustomersUseCase(
            CustomerRepositoryImpl(FirebaseFirestore.instance)),
        DeleteCustomerUseCase(
            CustomerRepositoryImpl(FirebaseFirestore.instance)),
      ),
    );
  }
}
