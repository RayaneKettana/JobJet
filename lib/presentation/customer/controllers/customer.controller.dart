import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jobjet/domain/usecases/customer/create_customer_usecase.dart';

import '../../../domain/entity/customer.dart';
import '../../../domain/usecases/customer/get_all_customers_usercase.dart';

class CustomerController extends GetxController {
  // Use case
  final CreateCustomerUseCase _createCustomerUseCase;
  final GetAllCustomersUseCase _getAllCustomersUseCase;

  // Controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  // Variables
  List<Customer> customers = [];

  CustomerController(this._createCustomerUseCase, this._getAllCustomersUseCase);

  @override
  onInit() {
    super.onInit();
    getAllCustomers();
  }

  createCustomer() async {
    try {
      Customer mockCustomer = Customer(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phoneNumber: phoneNumberController.text,
        address: addressController.text,
      );
      await _createCustomerUseCase.call(mockCustomer);
      Get.snackbar(
        "Création réussie",
        "Le client a été créé avec succès",
        snackPosition: SnackPosition.BOTTOM,
      );
      Navigator.pop(Get.context!);
    } catch (e) {
      Get.snackbar(
        "Erreur de création",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  getAllCustomers() async {
    try {
      var result = await _getAllCustomersUseCase.call();
      customers.assignAll(result);
      update();
    } catch (e) {
      Get.snackbar(
        "Erreur de récupération",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
