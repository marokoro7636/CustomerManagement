import 'package:customer_management/ui/customer_edit/customer_edit_screen.dart';
import 'package:customer_management/ui/customer_edit/customer_edit_state.dart';
import 'package:customer_management/ui/customer_edit/customer_edit_viewmodel.dart';
import 'package:customer_management/ui/customer_info/customer_info_screen.dart';
import 'package:customer_management/ui/customer_info/customer_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/model/repository/customer_repository.dart';
import 'package:customer_management/model/db/app_database.dart';
import 'package:customer_management/ui/customer_list/customer_list_state.dart';
import 'package:customer_management/model/entity/customer.dart';

final customerListProvider =
    StateNotifierProvider<CustomerListViewModel, CustomerListState>(
        (ref) => CustomerListViewModel(CustomerRepository(AppDatabase())));

class CustomerListViewModel extends StateNotifier<CustomerListState> {
  CustomerListViewModel(this._repository) : super(const CustomerListState()) {
    loadAllCustomer();
  }

  final CustomerRepository _repository;

  Future loadAllCustomer() async {
    state = state.copyWith(
      customers: await _repository.loadAllCustomer(),
    );
  }

  void navigateCustomerInfoScreen(BuildContext context, Customer customer) async {
    await Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) {
          return ProviderScope(overrides: [
            customerInfoProvider
                .overrideWith((ref) => CustomerInfoViewModel(_repository, customer)),
          ], child: const CustomerInfoScreen());
        })
    );
    await loadAllCustomer();
  }

  void navigateCustomerEditScreen(BuildContext context, CustomerEditState customer) async {
    await Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) {
          return ProviderScope(overrides: [
            customerEditProvider
                .overrideWith((ref) => CustomerEditViewModel(customer)),
          ], child: CustomerEditScreen());
        })
    );
    await loadAllCustomer();
  }
}
