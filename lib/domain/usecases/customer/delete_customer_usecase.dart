import '../../repositories/customer_repository.dart';

class DeleteCustomerUseCase {
  final CustomerRepository _customerRepository;

  DeleteCustomerUseCase(this._customerRepository);

  Future<void> call(String customerId) async {
    return await _customerRepository.deleteCustomer(customerId);
  }
}
