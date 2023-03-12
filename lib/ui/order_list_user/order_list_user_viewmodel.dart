import 'package:customer_management/model/entity/order.dart';
import 'package:customer_management/model/repository/order_repository.dart';
import 'package:customer_management/ui/order_edit/order_edit_state.dart';
import 'package:customer_management/ui/order_list_user/order_list_user_state.dart';
import 'package:customer_management/ui/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/model/db/app_database.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

final orderListUserProvider =
    StateNotifierProvider<OrderListUserViewModel, OrderListUserState>(
        (ref) => throw UnimplementedError());

class OrderListUserViewModel extends StateNotifier<OrderListUserState> {
  OrderListUserViewModel(OrderListUserState orderListUserState)
      : super(orderListUserState) {
    loadOrder();
  }

  final orderRepository = OrderRepository(AppDatabase());
  final searchController = TextEditingController();

  Future loadOrder() async {
    final allOrders = await orderRepository.loadOrder(state.customer);
    state = state.copyWith(
      allOrders: allOrders,
      orders: allOrders,
    );
    search();
  }

  void changeSwitch(bool value) {
    state = state.copyWith(onlyNotSend: value);
    search();
  }

  void setSearchDate(BuildContext context) async {
    final searchDate = await showMonthPicker(
      context: context,
      initialDate: state.searchDate ?? DateTime.now(),
    );
    state = state.copyWith(searchDate: searchDate);
    search();
  }

  void deleteSearchDate() {
    state = state.copyWith(searchDate: null);
    search();
  }

  void deleteOrder(int index) async {
    await orderRepository.delete(state.orders[index]);
    await loadOrder();
  }

  void setKeyword(String keyword) {
    state = state.copyWith(keyword: keyword);
    search();
  }

  void search() {
    final List<Order> orders;
    List<Order> ordersTmp;

    // 未発送のみを絞り込み
    if (state.onlyNotSend) {
      ordersTmp = state.allOrders.where((e) => e.sendDate == null).toList();
    } else {
      ordersTmp = state.allOrders;
    }

    // 年月で絞り込み
    if (state.searchDate != null) {
      ordersTmp = ordersTmp
          .where((e) =>
              e.orderDate!.year == state.searchDate!.year &&
              e.orderDate!.month == state.searchDate!.month)
          .toList();
    }

    // 検索キーワードで絞り込み
    if (state.keyword.isNotEmpty) {
      orders = ordersTmp
          .where((e) => e.goodsName.contains(RegExp(state.keyword)))
          .toList();
    } else {
      orders = ordersTmp;
    }

    state = state.copyWith(orders: orders);
  }

  Future<void> navigateOrderAddScreen() async {
    await Get.toNamed(
      orderAddPath,
      arguments: OrderEditState(
        customer: state.customer,
        order: Order(customerId: state.customer.id),
        addMode: true,
      ),
    );
    loadOrder();
  }

  Future<void> navigateOrderEditScreen(int index) async {
    await Get.toNamed(
      orderAddPath,
      arguments: OrderEditState(
        customer: state.customer,
        order: state.orders[index],
        addMode: false,
      ),
    );
    loadOrder();
  }
}
