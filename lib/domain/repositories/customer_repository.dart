import '../entity/customer.dart';

abstract class CustomerRepository {
  Future<void> createCustomer(Customer customer);
  Future<List<Customer>> getAllCustomers();
  Future<void> deleteCustomer(String id);
}
