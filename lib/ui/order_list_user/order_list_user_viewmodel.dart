import 'package:customer_management/model/entity/order.dart';
import 'package:customer_management/model/repository/order_repository.dart';
import 'package:customer_management/ui/order_list_user/order_list_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/model/db/app_database.dart';

final orderListUserProvider =
StateNotifierProvider<OrderListUserViewModel, OrderListUserState>(
        (ref) => throw UnimplementedError());

class OrderListUserViewModel extends StateNotifier<OrderListUserState> {
  OrderListUserViewModel(OrderListUserState orderListUserState) : super(orderListUserState);

  final _repository = OrderRepository(AppDatabase());

  Future loadOrder() async {
    state = state.copyWith(
      orders: await _repository.loadOrder(state.customer),
    );
  }

  void navigateOrderInfoScreen(BuildContext context, Order order) async {
    // Navigate.push
  }

  void navigateOrderEditScreen(BuildContext context) async {
    // Navigate.push
    await loadOrder();
  }
}
