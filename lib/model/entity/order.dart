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
    @Default(0) int goodsAmount,
    @DateTimeConverter() DateTime? orderDate,
    @DateTimeConverter() DateTime? sendDate,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json)
    => _$OrderFromJson(json);
}

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) {
    return DateTime.parse(json).toLocal();
  }

  @override
  String toJson(DateTime dateTime) {
    return dateTime.toLocal().toString();
  }
}