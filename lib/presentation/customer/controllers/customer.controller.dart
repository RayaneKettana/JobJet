import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:jobjet/domain/usecases/customer/create_customer_usecase.dart';

import '../../../domain/entity/customer.dart';
import '../../../domain/usecases/customer/delete_customer_usecase.dart';
import '../../../domain/usecases/customer/get_all_customers_usercase.dart';

class CustomerController extends GetxController {
  // Use case
  final CreateCustomerUseCase _createCustomerUseCase;
  final GetAllCustomersUseCase _getAllCustomersUseCase;
  final DeleteCustomerUseCase _deleteCustomerUseCase;

  // Controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  // Variables
  RxList<Customer> customers = RxList<Customer>();

  CustomerController(this._createCustomerUseCase, this._getAllCustomersUseCase,
      this._deleteCustomerUseCase);

  @override
  onInit() {
    super.onInit();
    getAllCustomers();
    if (kDebugMode) {
      print(customers);
    }
  }

  createCustomer() async {
    try {
      Customer mockCustomer = Customer(
        firstName: firstNameController.text.trim(), // Trim whitespace
        lastName: lastNameController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
        address: addressController.text.trim(),
      );
      await _createCustomerUseCase.call(mockCustomer);
      customers.add(mockCustomer);

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

  deleteCustomer(Customer customer) async {
    try {
      // Appeler le use case pour supprimer le client basé sur son ID
      await _deleteCustomerUseCase.call(customer.id!);

      // Supprimer le client de la liste locale
      customers.remove(customer);

      // Afficher une notification à l'utilisateur indiquant que le client a été supprimé avec succès
      Get.snackbar(
        "Suppression réussie",
        "Le client ${customer.firstName} a été supprimé avec succès",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      // En cas d'erreur, afficher une notification à l'utilisateur avec le message d'erreur
      Get.snackbar(
        "Erreur de suppression",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
