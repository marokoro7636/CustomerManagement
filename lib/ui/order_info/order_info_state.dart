import 'package:customer_management/model/entity/customer.dart';
import 'package:customer_management/model/entity/order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_info_state.freezed.dart';

@freezed
class OrderInfoState with _$OrderInfoState {
  const factory OrderInfoState({
    required Customer customer,
    required Order order,
  }) = _OrderInfoState;
}