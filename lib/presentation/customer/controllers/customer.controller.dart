import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/entity/customer.dart';
import '../../../domain/usecases/customer/create_customer_usecase.dart';
import '../../../domain/usecases/customer/delete_customer_usecase.dart';
import '../../../domain/usecases/customer/get_all_customers_usercase.dart';
import '../widget/edit_customer.screen.dart';

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
  RxList<Customer> customers = <Customer>[].obs;
  RxBool isLoading = false.obs;

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
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
        address: addressController.text.trim(),
      );
      await _createCustomerUseCase.call(mockCustomer);
      getAllCustomers();
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
      isLoading.value = true; // Display the spinner
      await Future.delayed(Duration(seconds: 1)); // Simulate 2 seconds delay
      var result = await _getAllCustomersUseCase.call();
      customers.assignAll(result);
    } catch (e) {
      Get.snackbar(
        "Erreur de récupération",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false; // Hide the spinner whether successful or not
      update(); // Update the UI
    }
  }

  deleteCustomer(Customer customer) async {
    try {
      await _deleteCustomerUseCase.call(customer.id!);

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

  editCustomer(Customer customer) async {
    Get.to(() => EditCustomerScreen(customer: customer));
  }

  callCustomer(String phoneNumber) async {
    Uri uri = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Impossible de lancer $uri';
    }
  }

  sendMessage(String phoneNumber) async {
    Uri uri = Uri.parse('sms:$phoneNumber');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Impossible de lancer $uri';
    }
  }

  void launchWaze(String address) async {
    var encodedAddress = Uri.encodeComponent(address);
    var url = Uri.parse('waze://?q=$encodedAddress&navigate=yes');
    var fallbackUrl =
        Uri.parse('https://waze.com/ul?q=$encodedAddress&navigate=yes');

    try {
      bool launched = await launchUrl(url);
      if (!launched) {
        await launchUrl(fallbackUrl);
      }
    } catch (e) {
      await launchUrl(fallbackUrl);
    }
  }
}
