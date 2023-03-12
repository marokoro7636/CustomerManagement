import 'package:customer_management/model/repository/order_repository.dart';
import 'package:customer_management/ui/annual_sales_screen/annual_sales_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/model/db/app_database.dart';

final annualSalesProvider =
    StateNotifierProvider<AnnualSalesViewModel, AnnualSalesState>(
        (ref) => AnnualSalesViewModel());

class AnnualSalesViewModel extends StateNotifier<AnnualSalesState> {
  AnnualSalesViewModel() : super(const AnnualSalesState()) {
    state = state.copyWith(year: DateTime.now().year);
  }

  final orderRepository = OrderRepository(AppDatabase());
  final searchController = TextEditingController();

  void loadGoodsSummary() async {
    searchController.text = state.keyword;
    final allSummaryList = await orderRepository.groupOrderByName(state.year);
    state = state.copyWith(
      allSummaryList: allSummaryList,
      summaryList: allSummaryList,
    );
    search();
  }

  void setKeyword(String keyword) {
    state = state.copyWith(keyword: keyword);
    search();
  }

  void search() {
    if (state.keyword.isEmpty) {
      state = state.copyWith(summaryList: state.allSummaryList);
    } else {
      state = state.copyWith(
          summaryList: state.allSummaryList
              .where((e) => e.goodsName.contains(RegExp(state.keyword)))
              .toList());
    }
  }

  void upYear() {
    state = state.copyWith(year: state.year + 1);
    loadGoodsSummary();
  }

  void downYear() {
    state = state.copyWith(year: state.year - 1);
    loadGoodsSummary();
  }
}
