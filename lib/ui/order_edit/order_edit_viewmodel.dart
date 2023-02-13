import 'package:customer_management/model/repository/order_repository.dart';
import 'package:customer_management/ui/order_edit/order_edit_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/model/db/app_database.dart';

final orderEditProvider =
StateNotifierProvider<OrderEditViewModel, OrderEditState>(
        (ref) => throw UnimplementedError());

class OrderEditViewModel extends StateNotifier<OrderEditState> {
  OrderEditViewModel(OrderEditState orderEditState) : super(orderEditState);

  final _repository = OrderRepository(AppDatabase());

  void setGoodsName(String name) {
    state = state.copyWith(order: state.order.copyWith(goodsName: name));
  }

  void setGoodsPrice(String price) {
    state = state.copyWith(order: state.order.copyWith(goodsPrice: int.parse(price)));
  }

  void save(BuildContext context) async {
    if (state.addMode) {
      await _repository.insert(state.order);
    } else {
      await _repository
          .update(state.order)
          .then((_) => Navigator.pop(context, state.order));
    }
  }
}
