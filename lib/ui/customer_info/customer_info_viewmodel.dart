import 'package:customer_management/ui/customer_edit/customer_edit_screen.dart';
import 'package:customer_management/ui/customer_edit/customer_edit_state.dart';
import 'package:customer_management/ui/customer_edit/customer_edit_viewmodel.dart';
import 'package:customer_management/ui/order_list_user/order_list_state.dart';
import 'package:customer_management/ui/order_list_user/order_list_user_screen.dart';
import 'package:customer_management/ui/order_list_user/order_list_user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/model/repository/customer_repository.dart';
import 'package:customer_management/model/entity/customer.dart';

final customerInfoProvider =
    StateNotifierProvider<CustomerInfoViewModel, Customer>(
        (ref) => throw UnimplementedError());

class CustomerInfoViewModel extends StateNotifier<Customer> {
  CustomerInfoViewModel(this._repository, Customer customer) : super(customer);

  final CustomerRepository _repository;

  Future delete() async {
    await _repository.delete(state);
  }

  void navigateCustomerEditScreen(
    BuildContext context,
    CustomerEditState customer,
  ) async {
    final editResult = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return ProviderScope(
            overrides: [
              customerEditProvider
                  .overrideWith((ref) => CustomerEditViewModel(customer)),
            ],
            child: CustomerEditScreen(),
          );
        },
      ),
    );
    state = editResult ?? state;
  }

  void navigateOrderListUserScreen(BuildContext context, Customer customer) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return ProviderScope(
            overrides: [
              orderListUserProvider.overrideWith((ref) =>
                  OrderListUserViewModel(
                      OrderListUserState(customer: customer))),
            ],
            child: const OrderListUserScreen(),
          );
        },
      ),
    );
  }
}
