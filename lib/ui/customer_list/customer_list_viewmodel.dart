import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/model/repository/customer_repository.dart';
import 'package:customer_management/model/db/app_database.dart';
import 'package:customer_management/ui/customer_list/customer_list_state.dart';
import 'package:customer_management/model/entity/customer.dart';

final customerListProvider =
StateNotifierProvider<CustomerListViewModel, CustomerListState>(
        (ref) => CustomerListViewModel(
            CustomerRepository(AppDatabase())
        ));

class CustomerListViewModel extends StateNotifier<CustomerListState> {
  CustomerListViewModel(this._repository) : super(const CustomerListState()) {
    loadAllCustomer();
  }

  final CustomerRepository _repository;

  void loadAllCustomer() async {
    state = state.copyWith(
      customers: await _repository.loadAllCustomer(),
    );
    print('loaded');
  }

  void delete(Customer customer) async {
    await _repository.delete(customer);
  }
}