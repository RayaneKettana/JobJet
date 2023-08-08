import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/customer.controller.dart';

class CustomerScreen extends GetView<CustomerController> {
  const CustomerScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomerScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CustomerScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
