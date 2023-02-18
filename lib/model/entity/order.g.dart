// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      id: json['id'] as int? ?? 0,
      customerId: json['customerId'] as int? ?? 0,
      goodsName: json['goodsName'] as String? ?? '',
      goodsPrice: json['goodsPrice'] as int? ?? 0,
      goodsAmount: json['goodsAmount'] as int? ?? 0,
      orderDate: _$JsonConverterFromJson<String, DateTime>(
          json['orderDate'], const DateTimeConverter().fromJson),
      sendDate: _$JsonConverterFromJson<String, DateTime>(
          json['sendDate'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'goodsName': instance.goodsName,
      'goodsPrice': instance.goodsPrice,
      'goodsAmount': instance.goodsAmount,
      'orderDate': _$JsonConverterToJson<String, DateTime>(
          instance.orderDate, const DateTimeConverter().toJson),
      'sendDate': _$JsonConverterToJson<String, DateTime>(
          instance.sendDate, const DateTimeConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
