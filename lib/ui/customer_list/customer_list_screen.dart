import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/ui/customer_list/customer_list_viewmodel.dart';

class CustomerListScreen extends HookConsumerWidget {
  const CustomerListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(customerListProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('顧客一覧'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: ' 検索',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) => viewModel.search(value),
            ),
            Expanded(
              child: _CustomerListPage(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.navigateCustomerEditScreen(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _CustomerListPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(customerListProvider);
    final viewModel = ref.watch(customerListProvider.notifier);

    return ListView.builder(
      itemCount: state.customers.length,
      itemBuilder: (BuildContext context, int index) {
        var customer = state.customers[index];
        return Card(
          child: ListTile(
            title: Text(customer.name),
            onTap: () => viewModel.navigateCustomerInfoScreen(context, index),
          ),
        );
      },
    );
  }
}
