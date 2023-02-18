import 'package:customer_management/model/repository/order_repository.dart';
import 'package:customer_management/ui/order_edit/order_edit_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/model/db/app_database.dart';
import 'package:intl/intl.dart';

final orderEditProvider =
    StateNotifierProvider<OrderEditViewModel, OrderEditState>(
        (ref) => throw UnimplementedError());

class OrderEditViewModel extends StateNotifier<OrderEditState> {
  OrderEditViewModel(OrderEditState orderEditState) : super(orderEditState) {
    if (state.order.orderDate != null) {
      orderDateController.text = formatter.format(state.order.orderDate!);
    }
    if (state.order.sendDate != null) {
      sendDateController.text = formatter.format(state.order.sendDate!);
    }
  }

  final orderRepository = OrderRepository(AppDatabase());
  final orderDateController = TextEditingController();
  final sendDateController = TextEditingController();
  final formatter = DateFormat('yyyy/MM/dd');
  final initDate = DateTime.now();

  void setGoodsName(String value) {
    state = state.copyWith(order: state.order.copyWith(goodsName: value));
  }

  void setGoodsPrice(String value) {
    state = state.copyWith(
        order: state.order.copyWith(goodsPrice: int.parse(value)));
  }

  void setGoodsAmount(String value) {
    state = state.copyWith(
        order: state.order.copyWith(goodsAmount: int.parse(value)));
  }

  void setOrderDate(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initDate,
      firstDate: DateTime(initDate.year - 3),
      lastDate: DateTime(initDate.year + 3),
    );
    if (pickedDate != null) {
      orderDateController.text = formatter.format(pickedDate);
      state = state.copyWith(order: state.order.copyWith(orderDate: pickedDate));
    }
  }

  void deleteOrderDate() {
    orderDateController.clear();
    state = state.copyWith(order: state.order.copyWith(orderDate: null));
  }

  void setSendDate(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initDate,
      firstDate: DateTime(initDate.year - 3),
      lastDate: DateTime(initDate.year + 3),
    );
    if (pickedDate != null) {
      sendDateController.text = formatter.format(pickedDate);
      state = state.copyWith(order: state.order.copyWith(sendDate: pickedDate));
    }
  }

  void deleteSendDate() {
    sendDateController.clear();
    state = state.copyWith(order: state.order.copyWith(sendDate: null));
  }

  void save(BuildContext context) async {
    if (state.addMode) {
      await orderRepository.insert(state.order);
    } else {
      await orderRepository
          .update(state.order)
          .then((_) => Navigator.pop(context, state.order));
    }
  }
}
