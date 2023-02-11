import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:customer_management/model/entity/customer.dart';

part 'customer_edit_state.freezed.dart';

@freezed
class CustomerEditState with _$CustomerEditState {
  const factory CustomerEditState({
    required Customer customer,
    required bool addMode,
  }) = _CustomerEditState;
}