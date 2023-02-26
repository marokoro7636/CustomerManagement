import 'package:customer_management/ui/annual_sales_screen/annual_sales_screen.dart';
import 'package:customer_management/ui/annual_sales_screen/annual_sales_viewmodel.dart';
import 'package:customer_management/ui/customer_list/customer_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/ui/customer_list//customer_list_screen.dart';

final baseStateProvider = StateProvider<PageType>((ref) => PageType.customer);

enum PageType { customer, sales }

class BaseScreen extends HookConsumerWidget {
  BaseScreen({Key? key}) : super(key: key);

  final screens = [
    const CustomerListScreen(),
    const AnnualSalesScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageType = ref.watch(baseStateProvider);
    final viewModel = ref.watch(baseStateProvider.notifier);
    final customerListViewModel = ref.watch(customerListProvider.notifier);
    final annualSalesViewModel = ref.watch(annualSalesProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: screens[pageType.index],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: pageType.index,
        onDestinationSelected: (index) async {
          if (index == 0) {
            await customerListViewModel.loadAllCustomer();
          } else {
            annualSalesViewModel.loadGoodsSummary();
          }
          viewModel.state = PageType.values[index];
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: '顧客一覧'),
          NavigationDestination(icon: Icon(Icons.info), label: '年間売上'),
        ],
      ),
    );
  }
}
