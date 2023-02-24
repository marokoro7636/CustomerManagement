import 'package:customer_management/model/repository/order_repository.dart';
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
  final orderRepository = OrderRepository(AppDatabase());

  Future loadAllCustomer() async {
    var allCustomer = await customerRepository.loadAllCustomer();
    allCustomer = await Future.wait(allCustomer.map((customer) async {
      final orders = await orderRepository.loadOrder(customer);
      final isSend = orders.every((order) => order.sendDate != null);
      return customer.copyWith(isSend: isSend);
    }));
    // print(allCustomer);
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

  void changeSwitch(bool value) {
    state = state.copyWith(onlyNotSend: value);
    search();
  }

  void search() {
    final List<Customer> allCustomers;
    if (state.onlyNotSend) {
      // 未発送の顧客のみを抜き出す
      allCustomers = state.allCustomers.where((e) => !e.isSend).toList();
    } else {
      allCustomers = state.allCustomers;
    }

    if (state.keyword.isEmpty) {
      state = state.copyWith(customers: allCustomers);
    } else {
      switch (state.searchType) {
        case SearchType.name:
          state = state.copyWith(
              customers: allCustomers
                  .where((e) => e.name.contains(RegExp(state.keyword)))
                  .toList());
          break;
        case SearchType.accountId:
          state = state.copyWith(
              customers: allCustomers
                  .where((e) => e.accountId.contains(RegExp(state.keyword)))
                  .toList());
          break;
        case SearchType.accountName:
          state = state.copyWith(
              customers: allCustomers
                  .where((e) => e.accountName.contains(RegExp(state.keyword)))
                  .toList());
          break;
        case SearchType.address:
          state = state.copyWith(
              customers: allCustomers
                  .where((e) => e.address.contains(RegExp(state.keyword)))
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
