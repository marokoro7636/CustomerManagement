import 'package:customer_management/model/db/app_database.dart';
import 'package:customer_management/model/repository/order_repository.dart';
import 'package:customer_management/ui/route.dart';
import 'package:get/get.dart';
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

  Future<void> navigateCustomerEditScreen() async {
    final editedCustomer = await Get.toNamed(
      customerEditPath,
      arguments: state,
    );
    state = editedCustomer ?? state;
  }

  Future<void> navigateOrderListUserScreen() async {
    Get.toNamed(orderListUserPath, arguments: state);
  }
}
