import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer.freezed.dart';
part 'customer.g.dart';

@freezed
class Customer with _$Customer{
  const factory Customer({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String nameKana,
    @Default('') String postCode,
    @Default('') String address,
    @Default('') String accountName,
    @Default('') String accountId,
    @Default('') String notes,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json)
    => _$CustomerFromJson(json);
}