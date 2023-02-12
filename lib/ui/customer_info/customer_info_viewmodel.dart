import 'package:customer_management/ui/customer_edit/customer_edit_screen.dart';
import 'package:customer_management/ui/customer_edit/customer_edit_state.dart';
import 'package:customer_management/ui/customer_edit/customer_edit_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/model/repository/customer_repository.dart';
import 'package:customer_management/model/db/app_database.dart';
import 'package:customer_management/model/entity/customer.dart';

final customerInfoProviderFamily =
    StateNotifierProvider.family<CustomerInfoViewModel, Customer, Customer>(
        (ref, customer) =>
            CustomerInfoViewModel(CustomerRepository(AppDatabase()), customer));

final customerInfoProvider =
    StateNotifierProvider<CustomerInfoViewModel, Customer>(
        (ref) => throw UnimplementedError());

class CustomerInfoViewModel extends StateNotifier<Customer> {
  CustomerInfoViewModel(this._repository, Customer customer) : super(customer);

  final CustomerRepository _repository;

  Future delete() async {
    await _repository.delete(state);
  }

  MaterialPageRoute<CustomerEditScreen> navigateCustomerEditScreen(CustomerEditState customer) {
    return MaterialPageRoute(builder: (BuildContext context) {
      return ProviderScope(overrides: [
        customerEditProvider
            .overrideWithProvider(customerEditProviderFamily(customer)),
      ], child: const CustomerEditScreen());
    });
  }
}
