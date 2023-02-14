import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:customer_management/model/entity/order.dart';

part 'order_list_state.freezed.dart';

@freezed
class OrderListState with _$OrderListState {
  const factory OrderListState({
    @Default([]) List<Order> orders,
  }) = _OrderListState;
}