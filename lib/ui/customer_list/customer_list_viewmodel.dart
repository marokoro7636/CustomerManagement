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
    StateNotifierProvider.autoDispose<CustomerListViewModel, CustomerListState>(
        (ref) => CustomerListViewModel(CustomerRepository(AppDatabase())));

class CustomerListViewModel extends StateNotifier<CustomerListState> with RouteAware {
  CustomerListViewModel(this._repository) : super(const CustomerListState()) {
    loadAllCustomer();
  }

  final CustomerRepository _repository;

  Future loadAllCustomer() async {
    state = state.copyWith(
      customers: await _repository.loadAllCustomer(),
    );
    print('loaded');
  }

  MaterialPageRoute<CustomerInfoScreen> navigateCustomerInfoScreen(Customer customer) {
    return MaterialPageRoute(builder: (BuildContext context) {
      return ProviderScope(overrides: [
        customerInfoProvider
            .overrideWithProvider(customerInfoProviderFamily(customer)),
      ], child: const CustomerInfoScreen());
    });
  }

  MaterialPageRoute<CustomerEditScreen> navigateCustomerEditScreen(CustomerEditState customer) {
    return MaterialPageRoute(builder: (BuildContext context) {
      return ProviderScope(overrides: [
        customerEditProvider
            .overrideWithProvider(customerEditProviderFamily(customer)),
      ], child: const CustomerEditScreen());
    });
  }

  @override
  void didPopNext() {
    // TODO: implement didPopNext
    super.didPopNext();
  }
}
