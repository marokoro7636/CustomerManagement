import 'package:freezed_annotation/freezed_annotation.dart';
part 'customer.freezed.dart';

@freezed
class Customer with _$Customer{
  const factory Customer({
    required String id,
    required String name,
    required String address,
  }) = _Customer;
}