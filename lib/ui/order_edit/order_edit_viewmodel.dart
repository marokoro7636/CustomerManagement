import 'package:customer_management/model/entity/order.dart';
import 'package:customer_management/model/repository/order_repository.dart';
import 'package:customer_management/ui/order_edit/order_edit_state.dart';
import 'package:customer_management/ui/route.dart';
import 'package:customer_management/util/ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/model/db/app_database.dart';

final orderEditProvider =
    StateNotifierProvider<OrderEditViewModel, OrderEditState>(
        (ref) => throw UnimplementedError());

class OrderEditViewModel extends StateNotifier<OrderEditState> {
  OrderEditViewModel(OrderEditState orderEditState) : super(orderEditState) {
    if (state.order.orderDate != null) {
      orderDateController.text = state.order.orderDate!.toFormattedString();
    }
    if (state.order.sendDate != null) {
      sendDateController.text = state.order.sendDate!.toFormattedString();
    }
  }

  final orderRepository = OrderRepository(AppDatabase());
  final orderDateController = TextEditingController();
  final sendDateController = TextEditingController();
  final initDate = DateTime.now();

  final formKey = GlobalKey<FormState>();

  void setGoodsName(String value) {
    state = state.copyWith(order: state.order.copyWith(goodsName: value));
  }

  String? validateGoodsName(String? value) {
    if (value == null || value.isEmpty) {
      return '商品名を入力してください';
    }
    return null;
  }

  void setGoodsPrice(String value) {
    if (value.isEmpty) return;

    state = state.copyWith(
        order: state.order.copyWith(goodsPrice: int.parse(value)));
  }

  String? validateGoodsPrice(String? value) {
    if (value == null || value.isEmpty) {
      return '単価を入力してください';
    }
    return null;
  }

  void setGoodsAmount(String value) {
    if (value.isEmpty) return;

    state = state.copyWith(
        order: state.order.copyWith(goodsAmount: int.parse(value)));
  }

  String? validateGoodsAmount(String? value) {
    if (value == null || value.isEmpty) {
      return '数量を入力してください';
    }
    return null;
  }

  void setOrderDate(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: state.order.orderDate ?? initDate,
      locale: const Locale('ja'),
      firstDate: DateTime(initDate.year - 3),
      lastDate: DateTime(initDate.year + 3),
    );
    if (pickedDate != null) {
      orderDateController.text = pickedDate.toFormattedString();
      state =
          state.copyWith(order: state.order.copyWith(orderDate: pickedDate));
    }
  }

  void deleteOrderDate() {
    orderDateController.clear();
    state = state.copyWith(order: state.order.copyWith(orderDate: null));
  }

  String? validateOrderDate(String? value) {
    if (value == null || value.isEmpty) {
      return '注文日を入力してください';
    }
    return null;
  }

  void setSendDate(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: state.order.sendDate ?? initDate,
      locale: const Locale('ja'),
      firstDate: DateTime(initDate.year - 3),
      lastDate: DateTime(initDate.year + 3),
    );
    if (pickedDate != null) {
      sendDateController.text = pickedDate.toFormattedString();
      state = state.copyWith(order: state.order.copyWith(sendDate: pickedDate));
    }
  }

  void deleteSendDate() {
    sendDateController.clear();
    state = state.copyWith(order: state.order.copyWith(sendDate: null));
  }

  String? validateSendDate(String? value) {
    if (state.order.orderDate == null || state.order.sendDate == null) {
      return null;
    }

    if (state.order.orderDate!.isAfter(state.order.sendDate!)) {
      return '発送日は注文日より後である必要があります';
    }

    return null;
  }

  Future<bool> save(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      if (state.addMode) {
        await orderRepository.insert(state.order).then((value) {
          Get.back();
          Get.toNamed(
            '$orderAddPath/nt',
            arguments: OrderEditState(
              customer: state.customer,
              order: Order(customerId: state.customer.id),
              addMode: true,
            ),
          );
        });
      } else {
        await orderRepository.update(state.order);
        Get.back(result: state.order);
      }
      return true;
    }
    return false;
  }
}
