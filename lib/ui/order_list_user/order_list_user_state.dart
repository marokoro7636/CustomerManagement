import 'package:customer_management/model/entity/customer.dart';
import 'package:customer_management/model/entity/order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_list_user_state.freezed.dart';

@freezed
class OrderListUserState with _$OrderListUserState {
  const factory OrderListUserState({
    required Customer customer,
    @Default([]) List<Order> allOrders,
    @Default([]) List<Order> orders,
    @Default(false) bool onlyNotSend,
  }) = _OrderListUserState;
}