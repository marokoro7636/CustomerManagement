import 'package:freezed_annotation/freezed_annotation.dart';

part 'goods_summary.freezed.dart';
part 'goods_summary.g.dart';

@freezed
class GoodsSummary with _$GoodsSummary{
  const factory GoodsSummary({
    @Default('') String goodsName,
    @Default(0) int totalGoodsPrice,
    @Default(0) int totalGoodsAmount,
  }) = _GoodsSummary;

  factory GoodsSummary.fromJson(Map<String, dynamic> json)
  => _$GoodsSummaryFromJson(json);
}