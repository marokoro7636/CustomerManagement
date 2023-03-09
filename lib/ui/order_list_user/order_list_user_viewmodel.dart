import 'package:customer_management/model/entity/order.dart';
import 'package:customer_management/model/repository/order_repository.dart';
import 'package:customer_management/ui/order_edit/order_edit_screen.dart';
import 'package:customer_management/ui/order_edit/order_edit_state.dart';
import 'package:customer_management/ui/order_edit/order_edit_viewmodel.dart';
import 'package:customer_management/ui/order_info/order_info_screen.dart';
import 'package:customer_management/ui/order_info/order_info_state.dart';
import 'package:customer_management/ui/order_info/order_info_viewmodel.dart';
import 'package:customer_management/ui/order_list_user/order_list_user_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/model/db/app_database.dart';

final orderListUserProvider =
    StateNotifierProvider<OrderListUserViewModel, OrderListUserState>(
        (ref) => throw UnimplementedError());

class OrderListUserViewModel extends StateNotifier<OrderListUserState> {
  OrderListUserViewModel(OrderListUserState orderListUserState)
      : super(orderListUserState) {
    loadOrder();
  }

  final orderRepository = OrderRepository(AppDatabase());

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

  void search() {
    final List<Order> orders;
    if (state.onlyNotSend) {
      orders = state.allOrders.where((e) => e.sendDate == null).toList();
    } else {
      orders = state.allOrders;
    }
    state = state.copyWith(orders: orders);
  }

  void navigateOrderInfoScreen(BuildContext context, int index) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ProviderScope(
            overrides: [
              orderInfoProvider.overrideWith(
                (ref) => OrderInfoViewModel(
                  OrderInfoState(
                    customer: state.customer,
                    order: state.orders[index],
                  ),
                ),
              ),
            ],
            child: const OrderInfoScreen(),
          );
        },
      ),
    );
    await loadOrder();
  }

  void navigateOrderEditScreen(BuildContext context) async {
    // Navigate.push
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ProviderScope(
            overrides: [
              orderEditProvider.overrideWith(
                (ref) => OrderEditViewModel(
                  OrderEditState(
                    customer: state.customer,
                    order: Order(customerId: state.customer.id),
                    addMode: true,
                  ),
                ),
              ),
            ],
            child: const OrderEditScreen(),
          );
        },
      ),
    );
    await loadOrder();
  }
}
