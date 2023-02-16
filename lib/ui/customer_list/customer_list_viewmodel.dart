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
        (ref) => CustomerListViewModel());

class CustomerListViewModel extends StateNotifier<CustomerListState> {
  CustomerListViewModel() : super(const CustomerListState()) {
    loadAllCustomer();
  }

  final customerRepository = CustomerRepository(AppDatabase());

  Future loadAllCustomer() async {
    final allCustomer = await customerRepository.loadAllCustomer();
    state = state.copyWith(
      allCustomers: allCustomer,
      customers: allCustomer,
    );
  }

  void search(String keyword) {
    if (state.keyword != keyword) {
      state = state.copyWith(keyword: keyword);
    }
    if (keyword.isEmpty) {
      state = state.copyWith(customers: state.allCustomers);
    } else {
      state = state.copyWith(
        customers: state.allCustomers.where((element) {
          return element.name.contains(RegExp(keyword));
        }).toList(),
      );
    }
  }

  void navigateCustomerInfoScreen(BuildContext context, int index) async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return ProviderScope(overrides: [
        customerInfoProvider.overrideWith(
            (ref) => CustomerInfoViewModel(state.customers[index])),
      ], child: const CustomerInfoScreen());
    }));
    await loadAllCustomer();
    search(state.keyword);
  }

  void navigateCustomerEditScreen(BuildContext context) async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return ProviderScope(
        overrides: [
          customerEditProvider.overrideWith((ref) => CustomerEditViewModel(
                const CustomerEditState(
                  customer: Customer(),
                  addMode: true,
                ),
              )),
        ],
        child: CustomerEditScreen(),
      );
    }));
    await loadAllCustomer();
    search(state.keyword);
  }
}
