import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:customer_management/model/entity/customer.dart';

part 'customer_list_state.freezed.dart';

enum SearchType {
  name,
  accountId,
  accountName,
  address,
}

@freezed
class CustomerListState with _$CustomerListState {
  const factory CustomerListState({
    @Default('') String keyword,
    @Default(SearchType.name) SearchType searchType,
    @Default([]) List<Customer> allCustomers,
    @Default([]) List<Customer> customers,
    @Default(false) bool onlyNotSend,
  }) = _CustomerListState;
}