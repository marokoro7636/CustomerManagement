import 'package:customer_management/model/db/app_database.dart';
import 'package:customer_management/model/repository/order_repository.dart';
import 'package:customer_management/ui/order_edit/order_edit_screen.dart';
import 'package:customer_management/ui/order_edit/order_edit_state.dart';
import 'package:customer_management/ui/order_edit/order_edit_viewmodel.dart';
import 'package:customer_management/ui/order_info/order_info_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final orderInfoProvider =
    StateNotifierProvider<OrderInfoViewModel, OrderInfoState>(
        (ref) => throw UnimplementedError());

class OrderInfoViewModel extends StateNotifier<OrderInfoState> {
  OrderInfoViewModel(OrderInfoState orderInfoState) : super(orderInfoState);

  final orderRepository = OrderRepository(AppDatabase());

  Future delete() async {
    await orderRepository.delete(state.order);
  }

  void navigateOrderEditScreen(BuildContext context) async {
    final editedOrder = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return ProviderScope(
            overrides: [
              orderEditProvider.overrideWith(
                (ref) => OrderEditViewModel(
                  OrderEditState(
                    customer: state.customer,
                    order: state.order,
                    addMode: false,
                  ),
                ),
              ),
            ],
            child: OrderEditScreen(),
          );
        },
      ),
    );
    if (editedOrder != null) {
      state = state.copyWith(order: editedOrder);
    }
  }
}
