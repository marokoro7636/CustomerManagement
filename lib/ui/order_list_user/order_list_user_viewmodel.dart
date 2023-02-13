import 'package:customer_management/model/entity/order.dart';
import 'package:customer_management/model/repository/order_repository.dart';
import 'package:customer_management/ui/order_edit/order_edit_screen.dart';
import 'package:customer_management/ui/order_edit/order_edit_state.dart';
import 'package:customer_management/ui/order_edit/order_edit_viewmodel.dart';
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

  final _repository = OrderRepository(AppDatabase());

  Future loadOrder() async {
    state = state.copyWith(
      orders: await _repository.loadOrder(state.customer),
    );
  }

  void navigateOrderInfoScreen(BuildContext context, Order order) async {
    // TODO 注文詳細画面を作る
  }

  void navigateOrderEditScreen(
      BuildContext context, OrderEditState orderEditState) async {
    // Navigate.push
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ProviderScope(
            overrides: [
              orderEditProvider
                  .overrideWith((ref) => OrderEditViewModel(orderEditState))
            ],
            child: OrderEditScreen(),
          );
        },
      ),
    );
    await loadOrder();
  }
}
