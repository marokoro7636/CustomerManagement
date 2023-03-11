import 'package:customer_management/ui/annual_sales_screen/annual_sales_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnnualSalesScreen extends HookConsumerWidget {
  const AnnualSalesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(annualSalesProvider);
    final viewModel = ref.watch(annualSalesProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('年間売上'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => viewModel.downYear(),
                  child: const Text('<'),
                ),
                Text(
                  '${state.year}年',
                  style: const TextStyle(fontSize: 20),
                ),
                TextButton(
                  onPressed: () => viewModel.upYear(),
                  child: const Text('>'),
                ),
              ],
            ),
            Expanded(
              child: _AnnualSalesListView(),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnnualSalesListView extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(annualSalesProvider);

    return ListView.builder(
      itemCount: state.summaryList.length,
      itemBuilder: (BuildContext context, int index) {
        var summary = state.summaryList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Card(
            child: ListTile(
              title: Text(
                summary.goodsName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.currency_yen, size: 20),
                      Text('${summary.totalGoodsPrice}円'),
                      const SizedBox(width: 40),
                      const Icon(Icons.shopping_cart, size: 20),
                      Text('${summary.totalGoodsAmount}個'),
                    ],
                  ),
                ],
              ),
              subtitleTextStyle: const TextStyle(fontSize: 20),
            ),
          ),
        );
      },
    );
  }
}
