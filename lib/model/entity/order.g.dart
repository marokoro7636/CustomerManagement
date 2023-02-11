// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      id: json['id'] as int,
      customerId: json['customerId'] as int,
      goodsName: json['goodsName'] as String,
      goodsPrice: json['goodsPrice'] as int,
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'goodsName': instance.goodsName,
      'goodsPrice': instance.goodsPrice,
    };
