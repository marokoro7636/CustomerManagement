import 'package:customer_management/ui/annual_sales_screen/annual_sales_viewmodel.dart';
import 'package:customer_management/ui/components/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnnualSalesScreen extends HookConsumerWidget {
  const AnnualSalesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(annualSalesProvider);
    final viewModel = ref.watch(annualSalesProvider.notifier);

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Column(
            children: [
              SearchBar(
                openDrawer: Scaffold.of(context).openDrawer,
                onChanged: viewModel.setKeyword,
                controller: viewModel.searchController,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => viewModel.downYear(),
                    icon: const Icon(Icons.keyboard_arrow_left),
                  ),
                  Text(
                    '${state.year}年',
                    style: const TextStyle(fontSize: 20),
                  ),
                  IconButton(
                    onPressed: () => viewModel.upYear(),
                    icon: const Icon(Icons.keyboard_arrow_right),
                  ),
                ],
              ),
              Expanded(
                child: _AnnualSalesListView(),
              ),
            ],
          ),
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
