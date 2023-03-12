import 'package:customer_management/model/repository/order_repository.dart';
import 'package:customer_management/ui/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/model/repository/customer_repository.dart';
import 'package:customer_management/model/db/app_database.dart';
import 'package:customer_management/ui/customer_list/customer_list_state.dart';
import 'package:customer_management/model/entity/customer.dart';

final customerListProvider =
    StateNotifierProvider<CustomerListViewModel, CustomerListState>(
        (ref) => CustomerListViewModel());

class CustomerListViewModel extends StateNotifier<CustomerListState> {
  CustomerListViewModel() : super(const CustomerListState());

  final customerRepository = CustomerRepository(AppDatabase());
  final orderRepository = OrderRepository(AppDatabase());
  final searchController = TextEditingController();

  void loadAllCustomer() async {
    // 検索ワードをフォームに表示
    searchController.text = state.keyword;

    // 顧客ごとに未発送の商品の存在確認
    var allCustomer = await customerRepository.loadAllCustomer();
    allCustomer = await Future.wait(allCustomer.map((customer) async {
      final orders = await orderRepository.loadOrder(customer);
      final isSend = orders.every((order) => order.sendDate != null);
      return customer.copyWith(isSend: isSend);
    }));

    // 全ての顧客と表示用の顧客リストをstateに保存
    state = state.copyWith(
      allCustomers: allCustomer,
      customers: allCustomer,
    );

    // 検索キーワードから表示用の顧客リストを更新
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
    final List<Customer> customers;
    if (state.onlyNotSend) {
      // 未発送の顧客のみを抜き出す
      customers = state.allCustomers.where((e) => !e.isSend).toList();
    } else {
      customers = state.allCustomers;
    }

    if (state.keyword.isEmpty) {
      state = state.copyWith(customers: customers);
    } else {
      switch (state.searchType) {
        case SearchType.name:
          state = state.copyWith(
              customers: customers
                  .where((e) =>
                      e.name.contains(RegExp(state.keyword)) ||
                      e.nameKana.contains(RegExp(state.keyword)))
                  .toList());
          break;
        case SearchType.accountId:
          state = state.copyWith(
              customers: customers
                  .where((e) => e.accountId.contains(RegExp(state.keyword)))
                  .toList());
          break;
        case SearchType.accountName:
          state = state.copyWith(
              customers: customers
                  .where((e) => e.accountName.contains(RegExp(state.keyword)))
                  .toList());
          break;
        case SearchType.address:
          state = state.copyWith(
              customers: customers
                  .where((e) => e.address.contains(RegExp(state.keyword)))
                  .toList());
          break;
      }
    }
  }

  Future<void> navigateCustomerInfoScreen(int index) async {
    await Get.toNamed(customerInfoPath, arguments: state.customers[index]);
    loadAllCustomer();
  }

  Future<void> navigateCustomerAddScreen() async {
    await Get.toNamed(customerAddPath);
    loadAllCustomer();
  }
}
