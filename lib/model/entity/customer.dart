import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer.freezed.dart';
part 'customer.g.dart';

@freezed
class Customer with _$Customer{
  const factory Customer({
    required int id,
    required String name,
    required String address,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json)
    => _$CustomerFromJson(json);
}