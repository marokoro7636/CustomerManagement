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
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              TextField(
                onChanged: viewModel.setKeyword,
                controller: viewModel.searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  hintText: '検索',
                  contentPadding: const EdgeInsets.all(10),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 72,
                child: Wrap(
                  spacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    InputChip(
                      label: Text(state.searchDate != null
                          ? '${state.searchDate!.year}年${state.searchDate!.month}月'
                          : '注文した年月'),
                      onDeleted: state.searchDate != null
                          ? () => viewModel.deleteSearchDate()
                          : null,
                      selected: state.searchDate != null,
                      showCheckmark: false,
                      onSelected: (value) => viewModel.setSearchDate(context),
                    ),
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
              const Expanded(child: _OrderList()),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => viewModel.navigateOrderAddScreen(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _OrderList extends HookConsumerWidget {
  const _OrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderListUserProvider);
    final viewModel = ref.watch(orderListUserProvider.notifier);

    final colorScheme = Theme.of(context).colorScheme;

    return ListView.builder(
      itemCount: state.orders.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == state.orders.length) {
          return const SizedBox(height: 100);
        }

        final order = state.orders[index];
        final isSend = order.sendDate != null;
        final orderDate = order.orderDate!.toFormattedString();
        final sendDate = isSend ? order.sendDate!.toFormattedString() : '';

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Card(
            color: isSend ? colorScheme.surface : red80,
            clipBehavior: Clip.hardEdge,
            child: Column(
              children: [
                ListTile(
                  visualDensity: const VisualDensity(
                    vertical: VisualDensity.minimumDensity,
                  ),
                  textColor: isSend ? null : gray10,
                  iconColor: isSend ? null : gray10,
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
                    onSelected: (value) async {
                      switch (value) {
                        case 0:
                          viewModel.navigateOrderEditScreen(index);
                          break;
                        case 1:
                          await showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('注文の削除'),
                              content:
                                  Text('注文を削除しますか？\n商品名:${order.goodsName}'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    viewModel.deleteOrder(index);
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                          break;
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 0,
                        child: Text('編集'),
                      ),
                      const PopupMenuItem(
                        value: 1,
                        child: Text('削除'),
                      ),
                    ],
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
