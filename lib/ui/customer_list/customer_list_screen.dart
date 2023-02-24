import 'package:customer_management/ui/customer_list/customer_list_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/ui/customer_list/customer_list_viewmodel.dart';

class CustomerListScreen extends HookConsumerWidget {
  const CustomerListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(customerListProvider);
    final viewModel = ref.watch(customerListProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('顧客一覧'),
        actions: [
          // 顧客の検索方法を選択
          DropdownButton(
            value: state.searchType,
            onChanged: (searchType) => viewModel.setSearchType(searchType!),
            items: const [
              DropdownMenuItem(
                value: SearchType.name,
                child: Text('名前'),
              ),
              DropdownMenuItem(
                value: SearchType.accountId,
                child: Text('アカウントID'),
              ),
              DropdownMenuItem(
                value: SearchType.accountName,
                child: Text('アカウント名'),
              ),
              DropdownMenuItem(
                value: SearchType.address,
                child: Text('住所'),
              ),
            ],
          ),
        ],
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
              onChanged: (value) => viewModel.setKeyword(value),
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
            title: Text(
              customer.name,
              style: !customer.isSend
                  ? const TextStyle(
                      color: Colors.red,
                    )
                  : null,
            ),
            subtitle: Text(customer.address),
            trailing: Text('${customer.accountName} @${customer.accountId}'),
            onTap: () => viewModel.navigateCustomerInfoScreen(context, index),
          ),
        );
      },
    );
  }
}
