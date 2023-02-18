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
    search();
  }

  void setSearchType(SearchType searchType) {
    state = state.copyWith(searchType: searchType);
    search();
  }

  void setKeyword(String keyword) {
    state = state.copyWith(keyword: keyword);
    search();
  }

  void search() {
    if (state.keyword.isEmpty) {
      state = state.copyWith(customers: state.allCustomers);
    } else {
      switch (state.searchType) {
        case SearchType.name:
          state = state.copyWith(
              customers: state.allCustomers
                  .where(
                      (element) => element.name.contains(RegExp(state.keyword)))
                  .toList());
          break;
        case SearchType.accountId:
          state = state.copyWith(
              customers: state.allCustomers
                  .where((element) =>
                      element.accountId.contains(RegExp(state.keyword)))
                  .toList());
          break;
        case SearchType.accountName:
          state = state.copyWith(
              customers: state.allCustomers
                  .where((element) =>
                      element.accountName.contains(RegExp(state.keyword)))
                  .toList());
          break;
        case SearchType.address:
          state = state.copyWith(
              customers: state.allCustomers
                  .where((element) =>
                      element.address.contains(RegExp(state.keyword)))
                  .toList());
          break;
      }
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
  }
}
