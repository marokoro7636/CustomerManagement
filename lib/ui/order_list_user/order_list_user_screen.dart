
import 'package:customer_management/ui/order_list_user/order_list_user_viewmodel.dart';
import 'package:customer_management/ui/theme/color.dart';
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
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.centerLeft,
            height: 96,
            child: Wrap(
              spacing: 10,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                FilterChip(
                  label: const Text('未発送のみ'),
                  selected: state.onlyNotSend,
                  onSelected: (value) {
                    viewModel.changeSwitch(value);
                  },
                ),
              ],
            ),
          ),
          Expanded(child: _OrderList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.navigateOrderAddScreen(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _OrderList extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderListUserProvider);
    final viewModel = ref.watch(orderListUserProvider.notifier);

    final colorScheme = Theme.of(context).colorScheme;

    return ListView.builder(
      itemCount: state.orders.length,
      itemBuilder: (BuildContext context, int index) {
        var order = state.orders[index];
        var isSend = order.sendDate != null;
        var orderDate = order.orderDate!.toFormattedString();
        var sendDate = isSend ? order.sendDate!.toFormattedString() : '';

        return GestureDetector(
          onTap: () => viewModel.navigateOrderInfoScreen(context, index),
          child: Card(
            color: isSend ? colorScheme.surface : red80,
            clipBehavior: Clip.hardEdge,
            child: Column(
              children: [
                ListTile(
                  visualDensity: const VisualDensity(
                    vertical: VisualDensity.minimumDensity,
                  ),
                  title: Text(
                    order.goodsName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isSend ? colorScheme.onSurface : red20,
                    ),
                  ),
                  subtitle: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.currency_yen, size: 20),
                          Text(
                            '${order.goodsPrice}円',
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(width: 40),
                          const Icon(Icons.shopping_cart, size: 20),
                          Text(
                            '${order.goodsAmount}個',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today, size: 14),
                          const SizedBox(width: 8),
                          Text(
                            '注文:$orderDate',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today, size: 14),
                          const SizedBox(width: 8),
                          Text(
                            '発送:$sendDate',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => [],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
