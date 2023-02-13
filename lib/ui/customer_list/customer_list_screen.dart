import 'package:customer_management/ui/customer_edit/customer_edit_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/ui/customer_list/customer_list_viewmodel.dart';
import 'package:customer_management/model/entity/customer.dart';

class CustomerListScreen extends HookConsumerWidget {
  const CustomerListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(customerListProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('顧客一覧'),
      ),
      body: _CustomerListPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            viewModel.navigateCustomerEditScreen(
              const CustomerEditState(
                customer: Customer(),
                addMode: true,
              ),
            ),
          );
          await viewModel.loadAllCustomer(); // 戻ってくる度にDBから読み込み
        },
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
            onTap: () async {
              await Navigator.push(
                context,
                viewModel.navigateCustomerInfoScreen(customer),
              );
              await viewModel.loadAllCustomer();
            },
          ),
        );
      },
    );
  }
}
