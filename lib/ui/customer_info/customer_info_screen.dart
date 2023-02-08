import 'package:customer_management/model/entity/customer.dart';
import 'package:customer_management/ui/customer_list/customer_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomerInfoScreen extends HookConsumerWidget {
  const CustomerInfoScreen({Key? key, required this.customer}) : super(key: key);
  final Customer customer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(customerListProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('顧客の詳細'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text('氏名 : ${customer.name}'),
            const SizedBox(height: 20),
            Text('住所 : ${customer.address}'),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  viewModel.delete(customer);
                  // TODO 削除ダイアログを出す
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('顧客の削除'),
            )
          ],
        ),
      ),
    );
  }
}