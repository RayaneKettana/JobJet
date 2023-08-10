import 'package:jobjet/domain/entity/customer.dart';

import '../../repositories/customer_repository.dart';

class GetAllCustomersUseCase {
  final CustomerRepository _customerRepository;

  GetAllCustomersUseCase(this._customerRepository);

  Future<List<Customer>> call() {
    return _customerRepository.getAllCustomers();
  }
}
