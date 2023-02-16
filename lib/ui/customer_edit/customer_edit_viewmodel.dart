import 'package:customer_management/ui/customer_edit/customer_edit_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/model/repository/customer_repository.dart';
import 'package:customer_management/model/db/app_database.dart';

final customerEditProvider =
    StateNotifierProvider<CustomerEditViewModel, CustomerEditState>(
        (ref) => throw UnimplementedError());

class CustomerEditViewModel extends StateNotifier<CustomerEditState> {
  CustomerEditViewModel(CustomerEditState customer) : super(customer);

  final customerRepository = CustomerRepository(AppDatabase());

  void setName(String name) {
    state = state.copyWith(customer: state.customer.copyWith(name: name));
  }

  void setAddress(String address) {
    state = state.copyWith(customer: state.customer.copyWith(address: address));
  }

  void save(BuildContext context) async {
    if (state.addMode) {
      await customerRepository.insert(state.customer);
    } else {
      await customerRepository
          .update(state.customer)
          .then((_) => Navigator.pop(context, state.customer));
    }
  }
}
