import 'package:jobjet/domain/entity/customer.dart';

import '../../repositories/customer_repository.dart';

class CreateCustomerUseCase {
  final CustomerRepository _customerRepository;

  CreateCustomerUseCase(this._customerRepository);

  Future<void> call(Customer customer) {
    return _customerRepository.createCustomer(customer);
  }
}
