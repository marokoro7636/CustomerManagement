import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/model/repository/customer_repository.dart';
import 'package:customer_management/model/db/app_database.dart';
import 'package:customer_management/model/entity/customer.dart';

final customerInfoProvider =
StateNotifierProvider.family<CustomerInfoViewModel, Customer, Customer>(
        (ref, customer) => CustomerInfoViewModel(
        CustomerRepository(AppDatabase()),
          customer
    ));

class CustomerInfoViewModel extends StateNotifier<Customer> {
  CustomerInfoViewModel(this._repository, Customer customer) : super(customer);

  final CustomerRepository _repository;

  void delete() async {
    await _repository.delete(state);
  }
}