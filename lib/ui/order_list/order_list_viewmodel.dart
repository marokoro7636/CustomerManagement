import 'package:customer_management/model/entity/customer.dart';
import 'package:customer_management/model/repository/customer_repository.dart';
import 'package:customer_management/model/repository/order_repository.dart';
import 'package:customer_management/ui/order_info/order_info_screen.dart';
import 'package:customer_management/ui/order_info/order_info_state.dart';
import 'package:customer_management/ui/order_info/order_info_viewmodel.dart';
import 'package:customer_management/ui/order_list/order_list_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/model/db/app_database.dart';

final orderListProvider =
StateNotifierProvider<OrderListViewModel, OrderListState>(
        (ref) => OrderListViewModel());

class OrderListViewModel extends StateNotifier<OrderListState> {
  OrderListViewModel() : super(const OrderListState()) {
    loadAllOrder();
  }

  final orderRepository = OrderRepository(AppDatabase());
  final customerRepository = CustomerRepository(AppDatabase());

  Future loadAllOrder() async {
    state = state.copyWith(
      orders: await orderRepository.loadAllOrder(),
    );
  }

  Future<Customer> loadCustomerById(int customerId) async {
    // 顧客IDからCustomerクラスを取得
    return await customerRepository.loadCustomerById(customerId);
  }

  void navigateOrderInfoScreen(BuildContext context, OrderInfoState orderInfoState) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ProviderScope(
            overrides: [
              orderInfoProvider
                  .overrideWith((ref) => OrderInfoViewModel(orderInfoState))
            ],
            child: const OrderInfoScreen(),
          );
        },
      ),
    );
    await loadAllOrder();
  }
}
