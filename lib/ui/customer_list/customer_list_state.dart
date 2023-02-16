import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:customer_management/model/entity/customer.dart';

part 'customer_list_state.freezed.dart';

@freezed
class CustomerListState with _$CustomerListState {
  const factory CustomerListState({
    @Default('') String keyword,
    @Default([]) List<Customer> allCustomers,
    @Default([]) List<Customer> customers,
  }) = _CustomerListState;
}