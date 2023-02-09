import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order{
  const factory Order({
    required int id,
    required int customerId,
    required String goodsName,
    required int goodsPrice,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json)
    => _$OrderFromJson(json);
}