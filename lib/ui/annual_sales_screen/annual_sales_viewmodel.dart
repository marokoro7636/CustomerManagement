import 'package:customer_management/model/repository/order_repository.dart';
import 'package:customer_management/ui/annual_sales_screen/annual_sales_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/model/db/app_database.dart';

final annualSalesProvider =
    StateNotifierProvider<AnnualSalesViewModel, AnnualSalesState>(
        (ref) => AnnualSalesViewModel());

class AnnualSalesViewModel extends StateNotifier<AnnualSalesState> {
  AnnualSalesViewModel() : super(const AnnualSalesState()) {
    state = state.copyWith(year: DateTime.now().year);
    loadGoodsSummary();
  }

  final orderRepository = OrderRepository(AppDatabase());

  void loadGoodsSummary() async {
    state = state.copyWith(
        summaryList: await orderRepository.groupOrderByName(state.year));
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
