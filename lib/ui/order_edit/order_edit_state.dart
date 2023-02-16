import 'package:customer_management/model/entity/customer.dart';
import 'package:customer_management/model/entity/order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_edit_state.freezed.dart';

@freezed
class OrderEditState with _$OrderEditState {
  const factory OrderEditState({
    required Customer customer,
    @Default(Order()) Order order,
    required bool addMode,
  }) = _OrderEditState;
}