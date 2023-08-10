import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobjet/domain/entity/customer.dart';

import '../../domain/repositories/customer_repository.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final FirebaseFirestore firestore;
  CustomerRepositoryImpl(this.firestore);

  @override
  Future<void> createCustomer(Customer customer) async {
    try {
      await firestore.collection('customers').add(customer.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Customer>> getAllCustomers() {
    try {
      return firestore.collection('customers').get().then((snapshot) =>
          snapshot.docs.map((doc) => Customer.fromJson(doc.data())).toList());
    } catch (e) {
      throw Exception(e);
    }
  }
}