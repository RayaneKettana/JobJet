import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entity/customer.dart';
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
      return firestore.collection('customers').get().then((snapshot) => snapshot
          .docs
          .map((doc) => Customer.fromJson(doc.id, doc.data()))
          .toList());
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteCustomer(id) async {
    try {
      return firestore.collection('customers').doc(id).delete();
    } catch (e) {
      throw Exception(e);
    }
  }
}
