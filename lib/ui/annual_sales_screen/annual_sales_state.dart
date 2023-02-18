import 'package:customer_management/model/entity/goods_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'annual_sales_state.freezed.dart';
part 'annual_sales_state.g.dart';

@freezed
class AnnualSalesState with _$AnnualSalesState{
  const factory AnnualSalesState({
    @Default([]) List<GoodsSummary> summaryList,
    @Default(0) int year,
  }) = _AnnualSalesState;

  factory AnnualSalesState.fromJson(Map<String, dynamic> json)
  => _$AnnualSalesStateFromJson(json);
}