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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () => viewModel.downYear(),
                  child: const Text('<'),
                ),
                Text('${state.year}年'),
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
        return Card(
          child: ListTile(
            title: Text(summary.goodsName),
            subtitle: Text('${summary.totalGoodsAmount}個'),
            trailing: Text('計￥${summary.totalGoodsPrice}'),
          ),
        );
      },
    );
  }
}

