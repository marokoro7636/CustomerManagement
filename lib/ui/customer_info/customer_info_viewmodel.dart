import 'package:customer_management/model/db/app_database.dart';
import 'package:customer_management/model/repository/order_repository.dart';
import 'package:customer_management/ui/customer_edit/customer_edit_screen.dart';
import 'package:customer_management/ui/customer_edit/customer_edit_state.dart';
import 'package:customer_management/ui/customer_edit/customer_edit_viewmodel.dart';
import 'package:customer_management/ui/route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/model/repository/customer_repository.dart';
import 'package:customer_management/model/entity/customer.dart';

final customerInfoProvider =
    StateNotifierProvider<CustomerInfoViewModel, Customer>(
        (ref) => throw UnimplementedError());

class CustomerInfoViewModel extends StateNotifier<Customer> {
  CustomerInfoViewModel(Customer customer) : super(customer);

  final customerRepository = CustomerRepository(AppDatabase());
  final orderRepository = OrderRepository(AppDatabase());

  Future<bool> delete() async {
    // 顧客の注文履歴がある場合削除しない
    // 削除できた場合trueを返す
    final order = await orderRepository.loadOrder(state);
    if (order.isEmpty) {
      await customerRepository.delete(state);
      return true;
    } else {
      return false;
    }
  }

  void navigateCustomerEditScreen(BuildContext context) async {
    final editedCustomer = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return ProviderScope(
            overrides: [
              customerEditProvider.overrideWith(
                (ref) => CustomerEditViewModel(
                  CustomerEditState(
                    customer: state,
                    addMode: false,
                  ),
                ),
              ),
            ],
            child: CustomerEditScreen(),
          );
        },
      ),
    );
    state = editedCustomer ?? state;
  }

  void navigateOrderListUserScreen(BuildContext context) {
    context.push(orderListUserPath, extra: state);
  }
}
