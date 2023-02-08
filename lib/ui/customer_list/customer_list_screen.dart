import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/ui/customer_add/customer_add_screen.dart';
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
            MaterialPageRoute(builder: (context) {
              return const CustomerAddScreen();
            } ),
          );
          viewModel.loadAllCustomer();
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

    return ListView.builder(
      itemCount: state.customers.length,
      itemBuilder: (BuildContext context, int index) {
        var customer = state.customers[index];
        return _buildCustomerListTile(context, customer);
      },
    );
  }

  Widget _buildCustomerListTile(BuildContext context, Customer customer) {
    return Card(
      child: ListTile(
        title: Text(customer.name),
      ),
    );
  }
}