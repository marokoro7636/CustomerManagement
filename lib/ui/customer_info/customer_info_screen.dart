import 'package:customer_management/model/entity/customer.dart';
import 'package:customer_management/ui/customer_edit/customer_edit_screen.dart';
import 'package:customer_management/ui/customer_info/customer_info_viewmodel.dart';
import 'package:customer_management/ui/customer_list/customer_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomerInfoScreen extends HookConsumerWidget {
  const CustomerInfoScreen({Key? key, required this.customer})
      : super(key: key);
  final Customer customer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(customerInfoProvider(customer).notifier);
    final state = ref.watch(customerInfoProvider(customer));

    return Scaffold(
      appBar: AppBar(
        title: const Text('顧客の詳細'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text('氏名 : ${state.name}'),
            const SizedBox(height: 20),
            Text('住所 : ${state.address}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CustomerEditScreen(customer: customer);
                }));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('顧客の編集'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                viewModel.delete();
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
