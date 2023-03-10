import 'package:customer_management/ui/order_list_user/order_list_user_viewmodel.dart';
import 'package:customer_management/util/ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderListUserScreen extends HookConsumerWidget {
  const OrderListUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderListUserProvider);
    final viewModel = ref.watch(orderListUserProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;

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
          Divider(
            color: colorScheme.outlineVariant,
            height: 1,
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

    return ListView.separated(
      itemCount: state.orders.length,
      separatorBuilder: (context, index) => Divider(
        color: colorScheme.outlineVariant,
        height: 1,
      ),
      itemBuilder: (BuildContext context, int index) {
        var order = state.orders[index];
        var isSend = order.sendDate != null;
        var orderDate = order.orderDate!.toFormattedString();
        var sendDate = isSend ? order.sendDate!.toFormattedString() : '';

        return Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) =>
                    viewModel.navigateOrderEditScreen(context, index),
                backgroundColor: colorScheme.secondary,
                foregroundColor: colorScheme.onSecondary,
                icon: Icons.edit,
                label: '編集',
              ),
              SlidableAction(
                onPressed: (context) => viewModel.delete(index),
                backgroundColor: colorScheme.error,
                foregroundColor: colorScheme.onError,
                icon: Icons.delete,
                label: '削除',
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              color: isSend ? colorScheme.surface : colorScheme.error,
            ),
            child: ListTile(
              isThreeLine: true,
              title: Text(order.goodsName),
              subtitle: Text('注文日:$orderDate\n発送日:$sendDate'),
              trailing: Text('￥${order.goodsPrice} x ${order.goodsAmount}'),
              textColor: isSend ? colorScheme.onSurface : colorScheme.onError,
              onTap: () => viewModel.navigateOrderInfoScreen(context, index),
            ),
          ),
        );
      },
    );
  }
}
