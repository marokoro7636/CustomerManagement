// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GoodsSummary _$$_GoodsSummaryFromJson(Map<String, dynamic> json) =>
    _$_GoodsSummary(
      goodsName: json['goodsName'] as String? ?? '',
      totalGoodsPrice: json['totalGoodsPrice'] as int? ?? 0,
      totalGoodsAmount: json['totalGoodsAmount'] as int? ?? 0,
    );

Map<String, dynamic> _$$_GoodsSummaryToJson(_$_GoodsSummary instance) =>
    <String, dynamic>{
      'goodsName': instance.goodsName,
      'totalGoodsPrice': instance.totalGoodsPrice,
      'totalGoodsAmount': instance.totalGoodsAmount,
    };
