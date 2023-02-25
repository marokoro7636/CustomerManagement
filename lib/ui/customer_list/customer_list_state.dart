import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:customer_management/model/entity/customer.dart';

part 'customer_list_state.freezed.dart';

enum SearchType {
  name("名前"),
  accountId("アカウントID"),
  accountName("アカウント名"),
  address("住所");

  final String display;

  const SearchType(this.display);
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