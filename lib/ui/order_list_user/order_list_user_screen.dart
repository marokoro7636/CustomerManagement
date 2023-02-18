import 'package:customer_management/ui/order_list_user/order_list_user_viewmodel.dart';
import 'package:customer_management/util/ext.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderListUserScreen extends HookConsumerWidget {
  const OrderListUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderListUserProvider);
    final viewModel = ref.watch(orderListUserProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('${state.customer.name}さんの注文一覧'),
      ),
      body: _OrderListUserPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.navigateOrderEditScreen(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _OrderListUserPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderListUserProvider);
    final viewModel = ref.watch(orderListUserProvider.notifier);

    return ListView.builder(
      itemCount: state.orders.length,
      itemBuilder: (BuildContext context, int index) {
        var order = state.orders[index];
        return Card(
          child: ListTile(
            title: Text(order.goodsName),
            subtitle: Text('注文日:${order.orderDate!.toFormattedString()}'),
            trailing: Text('￥${order.goodsPrice} x ${order.goodsAmount}'),
            onTap: () => viewModel.navigateOrderInfoScreen(context, index),
          ),
        );
      },
    );
  }
}