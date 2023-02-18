// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annual_sales_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnnualSalesState _$$_AnnualSalesStateFromJson(Map<String, dynamic> json) =>
    _$_AnnualSalesState(
      summaryList: (json['summaryList'] as List<dynamic>?)
              ?.map((e) => GoodsSummary.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      year: json['year'] as int? ?? 0,
    );

Map<String, dynamic> _$$_AnnualSalesStateToJson(_$_AnnualSalesState instance) =>
    <String, dynamic>{
      'summaryList': instance.summaryList,
      'year': instance.year,
    };
