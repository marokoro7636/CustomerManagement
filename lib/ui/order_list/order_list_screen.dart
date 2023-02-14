import 'package:customer_management/ui/order_info/order_info_state.dart';
import 'package:customer_management/ui/order_list/order_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderListScreen extends HookConsumerWidget {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('注文一覧'),
      ),
      body: _OrderListPage(),
    );
  }
}

class _OrderListPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderListProvider);
    final viewModel = ref.watch(orderListProvider.notifier);

    return ListView.builder(
      itemCount: state.orders.length,
      itemBuilder: (BuildContext context, int index) {
        var order = state.orders[index];
        return Card(
          child: ListTile(
            title: Text(order.goodsName),
            onTap: () async {
              viewModel.navigateOrderInfoScreen(
                  context,
                  OrderInfoState(
                    customer:
                        await viewModel.loadCustomerById(order.customerId),
                    order: order,
                  ));
            },
          ),
        );
      },
    );
  }
}
