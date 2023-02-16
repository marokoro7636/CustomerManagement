import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order{
  const factory Order({
    @Default(0) int id,
    @Default(0) int customerId,
    @Default('') String goodsName,
    @Default(0) int goodsPrice,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json)
    => _$OrderFromJson(json);
}