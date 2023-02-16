import 'package:customer_management/ui/order_info/order_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderInfoScreen extends HookConsumerWidget {
  const OrderInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderInfoProvider);
    final viewModel = ref.watch(orderInfoProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('注文の詳細'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text('注文者 : ${state.customer.name}'),
            const SizedBox(height: 20),
            Text('商品名 : ${state.order.goodsName}'),
            const SizedBox(height: 20),
            Text('単価 : ${state.order.goodsPrice}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => viewModel.navigateOrderEditScreen(context),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('注文の編集'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await viewModel
                    .delete()
                    .then((_) => Navigator.pop(context));
                // TODO 削除ダイアログを出す
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('注文の削除'),
            )
          ],
        ),
      ),
    );
  }
}
